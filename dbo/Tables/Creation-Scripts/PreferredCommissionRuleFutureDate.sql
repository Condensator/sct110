CREATE TABLE [dbo].[PreferredCommissionRuleFutureDate] (
    [Idx]                  INT           IDENTITY (1, 1) NOT NULL,
    [NewPrefCommRuleState] BIT           NOT NULL,
    [ApplyDate]            DATETIME2 (7) NULL,
    [AppliedChange]        BIT           NOT NULL,
    [EntId]                INT           NOT NULL,
    [AccId]                INT           NOT NULL,
    [IsDeleted]            BIT           NOT NULL,
    [ModifiedUser]         NVARCHAR (50) NULL,
    [ModifiedDate]         DATETIME      NULL
);


GO

ALTER TABLE [dbo].[PreferredCommissionRuleFutureDate]
    ADD CONSTRAINT [DF_PreferredCommissionRuleFutureDate_AppliedChange] DEFAULT ((0)) FOR [AppliedChange];


GO



ALTER TABLE [dbo].[PreferredCommissionRuleFutureDate]
    ADD CONSTRAINT [DF_PreferredCommissionRuleFutureDate_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[PreferredCommissionRuleFutureDate]
    ADD CONSTRAINT [DF_Table_1_NewCheckedState] DEFAULT ((0)) FOR [NewPrefCommRuleState];


GO



ALTER TABLE [dbo].[PreferredCommissionRuleFutureDate]
    ADD CONSTRAINT [FK_PreferredCommissionRuleFutureDate_Accounts] FOREIGN KEY ([AccId]) REFERENCES [dbo].[Accounts] ([AccId]);


GO



ALTER TABLE [dbo].[PreferredCommissionRuleFutureDate]
    ADD CONSTRAINT [FK_PreferredCommissionRuleFutureDate_Entity] FOREIGN KEY ([EntId]) REFERENCES [dbo].[Entity] ([EntId]);


GO



ALTER TABLE [dbo].[PreferredCommissionRuleFutureDate]
    ADD CONSTRAINT [PK_PreferredCommissionRuleFutureDate] PRIMARY KEY CLUSTERED ([Idx] ASC);


GO





CREATE TRIGGER [dbo].[utr_PreferredCommissionRuleFutureDate_ChangeTracking] ON [dbo].[PreferredCommissionRuleFutureDate]
FOR INSERT,
 DELETE,
 UPDATE
AS
SET NOCOUNT ON

DECLARE @bit INT,
 @field INT,
 @maxfield INT,
 @char INT,
 @fieldname VARCHAR(128),
 @TableName VARCHAR(128),
 @PKCols VARCHAR(1000),
 @sql VARCHAR(2000),
 @UpdateDate VARCHAR(50),
 @DBUserName VARCHAR(128),
 @Type CHAR(1),
 @PKFieldSelect VARCHAR(1000),
 @PKValueSelect VARCHAR(1000),
 @temp1 VARCHAR(1000),
 @temp2 VARCHAR(1000),
 @ModifiedUser VARCHAR(50),
 @AuditId UNIQUEIDENTIFIER

SELECT @TableName = 'PreferredCommissionRuleFutureDate'

-- date and user
SELECT @DBUserName = system_user

SET @AuditId = NEWID()

-- Action
IF EXISTS (
  SELECT Idx
  FROM inserted
  )
 IF EXISTS (
   SELECT Idx
   FROM deleted
   )
  SELECT @Type = 'U'
 ELSE
  SELECT @Type = 'I'
ELSE
 SELECT @Type = 'D'

-- get list of columns
SELECT [Idx]
      ,[NewPrefCommRuleState]
      ,[ApplyDate]
      ,[AppliedChange]
      ,[EntId]
      ,[AccId]
      ,[IsDeleted]
      ,[ModifiedUser]
      ,[ModifiedDate]
INTO #ins
FROM inserted

SELECT TOP 1 @ModifiedUser = ModifiedUser
FROM #ins

SELECT [Idx]
      ,[NewPrefCommRuleState]
      ,[ApplyDate]
      ,[AppliedChange]
      ,[EntId]
      ,[AccId]
      ,[IsDeleted]
      ,[ModifiedUser]
      ,[ModifiedDate]
INTO #del
FROM deleted

IF (@ModifiedUser IS NULL)
 SELECT TOP 1 @ModifiedUser = ModifiedUser
 FROM #del

-- Get primary key columns for full outer join - d alias will be used later
SELECT @PKCols = coalesce(@PKCols + ' and', ' on') + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk,
 INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
WHERE pk.TABLE_NAME = @TableName
 AND CONSTRAINT_TYPE = 'PRIMARY KEY'
 AND c.TABLE_NAME = pk.TABLE_NAME
 AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

--PRINT '@PKCols'
--PRINT @PKCols
-- Get primary key fields select for insert
--select @PKFieldSelect =  coalesce(@PKFieldSelect,',') + COLUMN_NAME
SELECT @PKFieldSelect = coalesce(@PKFieldSelect + '' + '', '''') + '' + COLUMN_NAME + ''''
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk,
 INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
WHERE pk.TABLE_NAME = @TableName
 AND CONSTRAINT_TYPE = 'PRIMARY KEY'
 AND c.TABLE_NAME = pk.TABLE_NAME
 AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

--PRINT '@PKFieldSelect'
--PRINT @PKFieldSelect
--Get the values        ''
SELECT @temp1 = 'convert(varchar(100), coalesce(i.'

SELECT @temp2 = ',d.'

SELECT @PKValueSelect = @temp1 + COLUMN_NAME + @temp2 + COLUMN_NAME + '))'
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk,
 INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
WHERE pk.TABLE_NAME = @TableName
 AND CONSTRAINT_TYPE = 'PRIMARY KEY'
 AND c.TABLE_NAME = pk.TABLE_NAME
 AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

--PRINT '@PKValueSelect'
--PRINT @PKValueSelect
IF @PKCols IS NULL
BEGIN
 RAISERROR (
   'no PK on table %s',
   16,
   - 1,
   @TableName
   )

 RETURN
END

SELECT @field = 0,
 @maxfield = max(ORDINAL_POSITION)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @TableName

--Test Code must be removed
SELECT @UpdateDate = CONVERT(VARCHAR(24), GETDATE(), 121)

WHILE @field < @maxfield
BEGIN
 SELECT @field = min(ORDINAL_POSITION)
 FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_NAME = @TableName
  AND ORDINAL_POSITION > @field

 SELECT @bit = (@field - 1) % 8 + 1

 SELECT @bit = power(2, @bit - 1)

 SELECT @char = ((@field - 1) / 8) + 1

 -- if substring(COLUMNS_UPDATED(),@char, 1) & @bit > 0 or @Type in ('I','D')
 IF @Type IN (
   'I',
   'D',
   'U'
   )
 BEGIN
  SELECT @fieldname = COLUMN_NAME
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = @TableName
   AND ORDINAL_POSITION = @field
   AND DATA_TYPE <> 'text'
   AND (
    CHARACTER_MAXIMUM_LENGTH IS NULL
    OR CHARACTER_MAXIMUM_LENGTH <= 500
    )

  SELECT @sql = 'insert Audit (Type, TableName,PrimaryKeyField, PrimaryKeyValue, FieldName, OldValue, NewValue, ModifiedDate, DBUserName, ModifiedUser, AuditId )'

  SELECT @sql = @sql + ' select ' + '''' + @Type + ''','

  SELECT @sql = @sql + '''' + @TableName + ''''

  SELECT @sql = @sql + ',' + @PKFieldSelect

  SELECT @sql = @sql + ',' + @PKValueSelect

  SELECT @sql = @sql + ',' + '''' + @fieldname + ''''

  SELECT @sql = @sql + ',convert(varchar(1000),d.' + @fieldname + ')'

  SELECT @sql = @sql + ',convert(varchar(1000),i.' + @fieldname + ')'

  SELECT @sql = @sql + ',' + '''' + @UpdateDate + ''''

  SELECT @sql = @sql + ',' + '''' + @DBUserName + ''''

  SELECT @sql = @sql + ',' + '''' + @ModifiedUser + ''''

  SELECT @sql = @sql + ',' + '''' + convert(NVARCHAR(50), @AuditId) + ''''

  SELECT @sql = @sql + ' from #ins i full outer join #del d '

  SELECT @sql = @sql + @PKCols

  SELECT @sql = @sql + ' where i.' + @fieldname + ' <> d.' + @fieldname

  SELECT @sql = @sql + ' or (i.' + @fieldname + ' is null and d.' + @fieldname + ' is not null)'

  SELECT @sql = @sql + ' or (i.' + @fieldname + ' is not null and d.' + @fieldname + ' is null)'

  --PRINT '-----------sql'
  --PRINT @sql
  EXEC (@sql)
 END
END
GO



