CREATE TABLE [dbo].[Contacts] (
    [ContactId]     INT           IDENTITY (1, 1) NOT NULL,
    [ContactTypeID] INT           NOT NULL,
    [ContactName]   VARCHAR (255) NOT NULL,
    [TelNumber]     VARCHAR (255) NULL,
    [CellNumber]    VARCHAR (255) NULL,
    [FaxNumber]     VARCHAR (255) NULL,
    [EMail]         VARCHAR (255) NULL,
    [EntId]         INT           NULL,
    [IsDeleted]     BIT           NOT NULL,
    [IdentityNr]    VARCHAR (50)  NULL,
    [ModifiedUser]  NVARCHAR (50) NULL,
    [ModifiedDate]  DATETIME      NULL
);


GO

CREATE NONCLUSTERED INDEX [IX_Contacts_ContactId]
    ON [dbo].[Contacts]([ContactId] ASC)
    INCLUDE([EMail]);


GO



CREATE NONCLUSTERED INDEX [IX_Contacts_EntId_ContactTypeID]
    ON [dbo].[Contacts]([EntId] ASC, [ContactTypeID] ASC)
    INCLUDE([ContactId]);


GO



ALTER TABLE [dbo].[Contacts]
    ADD CONSTRAINT [PK__Contacts__5C66259B49F247CE] PRIMARY KEY CLUSTERED ([ContactId] ASC);


GO



-- =============================================  
-- http://weblogs.asp.net/jongalloway/adding-simple-trigger-based-auditing-to-your-sql-server-database  
-- =============================================  
CREATE TRIGGER [dbo].[utr_Contacts_ChangeTracking] ON [dbo].[Contacts]
FOR INSERT, DELETE, UPDATE
AS
     SET NOCOUNT ON;
     DECLARE @bit INT, @field INT, @maxfield INT, @char INT, @fieldname VARCHAR(128), @TableName VARCHAR(128), @PKCols VARCHAR(1000), @sql VARCHAR(2000), @UpdateDate VARCHAR(50), @DBUserName VARCHAR(128), @Type CHAR(1), @PKFieldSelect VARCHAR(1000), @PKValueSelect VARCHAR(1000), @temp1 VARCHAR(1000), @temp2 VARCHAR(1000), @ModifiedUser VARCHAR(50), @AuditId UNIQUEIDENTIFIER;
     SELECT @TableName = 'Contacts';  
  
     -- date and user  
     SELECT @DBUserName = system_user;
     SET @AuditId = NEWID();  
  
     -- Action  
     IF EXISTS
     (
         SELECT ContactId
         FROM inserted
     )
         IF EXISTS
         (
             SELECT ContactId
             FROM deleted
         )
             SELECT @Type = 'U';
         ELSE
         SELECT @Type = 'I';;
     ELSE
     SELECT @Type = 'D';  
  
     -- get list of columns  
     SELECT [ContactId],
            [ContactTypeID],
            [ContactName],
            [TelNumber],
            [CellNumber],
            [FaxNumber],
            [EMail],
            [EntId],
            [IsDeleted],
            [IdentityNr],
            [ModifiedUser],
            [ModifiedDate]
     INTO #ins
     FROM inserted;
     SELECT TOP 1 @ModifiedUser = ModifiedUser
     FROM #ins;
     SELECT [ContactId],
            [ContactTypeID],
            [ContactName],
            [TelNumber],
            [CellNumber],
            [FaxNumber],
            [EMail],
            [EntId],
            [IsDeleted],
            [IdentityNr],
            [ModifiedUser],
            [ModifiedDate]
     INTO #del
     FROM deleted;
     IF(@ModifiedUser IS NULL)
         SELECT TOP 1 @ModifiedUser = ModifiedUser
         FROM #del;  
  
     -- Get primary key columns for full outer join - d alias will be used later  
     SELECT @PKCols = COALESCE(@PKCols+' and', ' on')+' i.'+c.COLUMN_NAME+' = d.'+c.COLUMN_NAME
     FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk,
          INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
     WHERE pk.TABLE_NAME = @TableName
           AND CONSTRAINT_TYPE = 'PRIMARY KEY'
           AND c.TABLE_NAME = pk.TABLE_NAME
           AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME;  
  
     -- Get primary key fields select for insert  
     SELECT @PKFieldSelect = COALESCE(@PKFieldSelect+''+'', '''')+''+COLUMN_NAME+''''
     FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk,
          INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
     WHERE pk.TABLE_NAME = @TableName
           AND CONSTRAINT_TYPE = 'PRIMARY KEY'
           AND c.TABLE_NAME = pk.TABLE_NAME
           AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME;  
  
     --Get the values        ''  
     SELECT @temp1 = 'convert(varchar(100), coalesce(i.';
     SELECT @temp2 = ',d.';
     SELECT @PKValueSelect = @temp1+COLUMN_NAME+@temp2+COLUMN_NAME+'))'
     FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk,
          INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
     WHERE pk.TABLE_NAME = @TableName
           AND CONSTRAINT_TYPE = 'PRIMARY KEY'
           AND c.TABLE_NAME = pk.TABLE_NAME
           AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME;
     IF @PKCols IS NULL
         BEGIN
             RAISERROR('no PK on table %s', 16, -1, @TableName);
             RETURN;
         END;
     SELECT @field = 0,
            @maxfield = MAX(ORDINAL_POSITION)
     FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_NAME = @TableName;  
  
     --Test Code must be removed  
     SELECT @UpdateDate = CONVERT( VARCHAR(24), GETDATE(), 121);
     WHILE @field < @maxfield
         BEGIN
             SELECT @field = MIN(ORDINAL_POSITION)
             FROM INFORMATION_SCHEMA.COLUMNS
             WHERE TABLE_NAME = @TableName
                   AND ORDINAL_POSITION > @field;
             SELECT @bit = (@field - 1) % 8 + 1;
             SELECT @bit = POWER(2, @bit - 1);
             SELECT @char = ((@field - 1) / 8) + 1;
             IF @Type IN('I', 'D', 'U')
                 BEGIN
                     SELECT @fieldname = COLUMN_NAME
                     FROM INFORMATION_SCHEMA.COLUMNS
                     WHERE TABLE_NAME = @TableName
                           AND ORDINAL_POSITION = @field
                           AND DATA_TYPE <> 'text'
                           AND (CHARACTER_MAXIMUM_LENGTH IS NULL
                                OR CHARACTER_MAXIMUM_LENGTH <= 500);
                     SELECT @sql = 'insert Audit (Type, TableName,PrimaryKeyField, PrimaryKeyValue, FieldName, OldValue, NewValue, ModifiedDate, DBUserName, ModifiedUser, AuditId )';
                     SELECT @sql = @sql+' select '+''''+@Type+''',';
                     SELECT @sql = @sql+''''+@TableName+'''';
                     SELECT @sql = @sql+','+@PKFieldSelect;
                     SELECT @sql = @sql+','+@PKValueSelect;
                     SELECT @sql = @sql+','+''''+@fieldname+'''';
                     SELECT @sql = @sql+',convert(varchar(1000),d.'+@fieldname+')';
                     SELECT @sql = @sql+',convert(varchar(1000),i.'+@fieldname+')';
                     SELECT @sql = @sql+','+''''+@UpdateDate+'''';
                     SELECT @sql = @sql+','+''''+@DBUserName+'''';
                     SELECT @sql = @sql+','+''''+@ModifiedUser+'''';
                     SELECT @sql = @sql+','+''''+CONVERT( NVARCHAR(50), @AuditId)+'''';
                     SELECT @sql = @sql+' from #ins i full outer join #del d ';
                     SELECT @sql = @sql + @PKCols;
                     SELECT @sql = @sql+' where i.'+@fieldname+' <> d.'+@fieldname;
                     SELECT @sql = @sql+' or (i.'+@fieldname+' is null and d.'+@fieldname+' is not null)';
                     SELECT @sql = @sql+' or (i.'+@fieldname+' is not null and d.'+@fieldname+' is null)';
                     EXEC (@sql);
                 END;
         END;
GO



