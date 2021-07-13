CREATE TABLE [dbo].[TrxElectricityBin] (
    [Id]            INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [MeterNum]      VARCHAR (50) NOT NULL,
    [Amount]        MONEY        NOT NULL,
    [TrxId]         BIGINT       NOT NULL,
    [TrxTypeId]     INT          NOT NULL,
    [DateIn]        DATETIME     NULL,
    [Used]          BIGINT       NULL,
    [DateOut]       DATETIME     NULL,
    [OriginalTrxId] BIGINT       NULL,
    [ModifiedUser]  VARCHAR (50) NULL,
    [ModifiedDate]  DATETIME     NULL,
    [BinReason]     VARCHAR (50) NULL
);


GO

ALTER TABLE [dbo].[TrxElectricityBin]
    ADD CONSTRAINT [DF__TrxElectr__Origi__7626E8BD] DEFAULT ((0)) FOR [OriginalTrxId];


GO



ALTER TABLE [dbo].[TrxElectricityBin]
    ADD CONSTRAINT [DF_TrxElectricityBin_DateIn] DEFAULT (getdate()) FOR [DateIn];


GO



ALTER TABLE [dbo].[TrxElectricityBin]
    ADD CONSTRAINT [DF_TrxElectricityBin_Used] DEFAULT ((0)) FOR [Used];


GO



ALTER TABLE [dbo].[TrxElectricityBin]
    ADD CONSTRAINT [PK_TrxElectricityBin] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxBinMeter]
    ON [dbo].[TrxElectricityBin]([MeterNum] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxBinTrxId]
    ON [dbo].[TrxElectricityBin]([TrxId] ASC)
    INCLUDE([OriginalTrxId]) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxElecBinOrigTrx]
    ON [dbo].[TrxElectricityBin]([OriginalTrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO




 

 

CREATE TRIGGER [dbo].[utr_TrxElectricityBin_ChangeTracking] ON [dbo].[TrxElectricityBin]

 

FOR INSERT, DELETE, UPDATE

 

AS

 

      SET NOCOUNT ON;

 

 

IF EXISTS(SELECT TOP 1 ModifiedUser FROM  inserted i WHERE ModifiedUser IS NOT NULL) OR

    EXISTS(SELECT TOP 1 ModifiedUser FROM  deleted d WHERE ModifiedUser IS NOT NULL)

   BEGIN

      DECLARE @bit INT, @field INT, @maxfield INT, @char INT, @fieldname VARCHAR(128), @TableName VARCHAR(128),

          @PKCols VARCHAR(1000), @sql VARCHAR(2000), @UpdateDate VARCHAR(50), @DBUserName VARCHAR(128), @Type CHAR(1),

          @PKFieldSelect VARCHAR(1000), @PKValueSelect VARCHAR(1000), @temp1 VARCHAR(1000), @temp2 VARCHAR(1000),

          @ModifiedUser VARCHAR(50), @AuditId UNIQUEIDENTIFIER;

 


 

      SELECT @TableName = 'TrxElectricityBin';

 


 

      -- date and user

 

      SELECT @DBUserName = system_user;

 


 

      SET @AuditId = NEWID();

 


 

      -- Action

 

      IF EXISTS

 

      (

 

            SELECT Id

 

            FROM inserted

 

      )

 

            IF EXISTS

 

            (

 

                  SELECT Id

 

                  FROM deleted

 

            )

 

                  SELECT @Type = 'U';

 

            ELSE

 

            SELECT @Type = 'I';;

 

      ELSE

 

      SELECT @Type = 'D';

 


 

      -- get list of columns

 

      SELECT [Id],

 

                  [MeterNum],

 

                  [Amount],

 

                  [TrxId],

 

                  [TrxTypeId],

 

                  [DateIn],

 

                  [Used],

 

                  [DateOut],

 

                  [OriginalTrxId],

 

                  [ModifiedUser],

 

                  [ModifiedDate],

 

                  [BinReason]

 

      INTO #ins

 

      FROM inserted

 

      WHERE [ModifiedUser] is not null;

 


 

      SELECT TOP 1 @ModifiedUser = ModifiedUser

 

      FROM #ins;

 


 

      SET @ModifiedUser = ISNULL(@ModifiedUser, '');

 


 

      SELECT [Id],

 

                  [MeterNum],

 

                  [Amount],

 

                  [TrxId],

 

                  [TrxTypeId],

 

                  [DateIn],

 

                  [Used],

 

                  [DateOut],

 

                  [OriginalTrxId],

 

                  [ModifiedUser],

 

                  [ModifiedDate],

 

                  [BinReason]

 

      INTO #del

 

      FROM deleted

 

      WHERE [ModifiedUser] is not null;

 


 

      IF(@ModifiedUser IS NULL)

 

            SELECT TOP 1 @ModifiedUser = ModifiedUser

 

            FROM #del;

 


 

      -- Get primary key columns for full outer join - d alias will be used later

 

      SELECT @PKCols = COALESCE(@PKCols+' and', ' on')+' i.'+c.COLUMN_NAME+' = d.'+c.COLUMN_NAME

 

      FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk INNER JOIN

 

              INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON c.TABLE_NAME = pk.TABLE_NAME

 

               AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

 

      WHERE pk.TABLE_NAME = @TableName

 

               AND CONSTRAINT_TYPE = 'PRIMARY KEY'

 

              

 


 

      --PRINT '@PKCols'

 

      --PRINT @PKCols

 


 

      -- Get primary key fields select for insert

 

      --select @PKFieldSelect =  coalesce(@PKFieldSelect,',') + COLUMN_NAME

 

      SELECT @PKFieldSelect = COALESCE(@PKFieldSelect+''+'', '''')+''+COLUMN_NAME+''''

 

      FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk INNER JOIN

 

              INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON c.TABLE_NAME = pk.TABLE_NAME

 

               AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

 

      WHERE pk.TABLE_NAME = @TableName

 

               AND CONSTRAINT_TYPE = 'PRIMARY KEY'

 

             

 


 

      --PRINT '@PKFieldSelect'

 

      --PRINT @PKFieldSelect

 


 

      --Get the values        ''

 

      SELECT @temp1 = 'convert(varchar(100), coalesce(i.';

 


 

      SELECT @temp2 = ',d.';

 


 

      SELECT @PKValueSelect = @temp1+COLUMN_NAME+@temp2+COLUMN_NAME+'))'

 

      FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk INNER JOIN

 

              INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON c.TABLE_NAME = pk.TABLE_NAME

 

               AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

 

      WHERE pk.TABLE_NAME = @TableName

 

               AND CONSTRAINT_TYPE = 'PRIMARY KEY'

 


 

      --PRINT '@PKValueSelect'

 

      --PRINT @PKValueSelect

 


 

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

 


 

                  -- if substring(COLUMNS_UPDATED(),@char, 1) & @bit > 0 or @Type in ('I','D')

 

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

 


 

                              --PRINT '-----------sql'

 

                              --PRINT @sql

 

                              EXEC (@sql);

 

                        END;

 

            END;

     END;
GO



