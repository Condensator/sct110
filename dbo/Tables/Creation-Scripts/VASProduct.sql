CREATE TABLE [dbo].[VASProduct] (
    [Id]                           INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Description]                  VARCHAR (100)  NULL,
    [TrxTypeId]                    INT            NOT NULL,
    [ProviderId]                   INT            NOT NULL,
    [IsVerify]                     BIT            NULL,
    [IsFullPayment]                BIT            NULL,
    [AdditionalFields]             INT            NULL,
    [ProductCode]                  VARCHAR (20)   NULL,
    [IsDeleted]                    BIT            NULL,
    [CalculateFromTotalCommission] BIT            NOT NULL,
    [FixedValueFlag]               INT            NULL,
    [FixedValueAmount]             MONEY          NULL,
    [IsCredit]                     BIT            NULL,
    [BillIssuerId]                 INT            NULL,
    [AllowReversal]                BIT            NULL,
    [IsVasproduct]                 BIT            NOT NULL,
    [ModifiedUser]                 NVARCHAR (50)  NULL,
    [ModifiedDate]                 DATETIME       NULL,
    [Exclusive]                    BIT            NOT NULL,
    [ExclusiveStartDate]           DATETIME       NULL,
    [ExclusiveEndDate]             DATETIME       NULL,
    [AirtimePlus]                  BIT            NOT NULL,
    [IsVoucherGeneration]          BIT            NOT NULL,
    [PrintBarcode]                 BIT            NOT NULL,
    [Barcode]                      NVARCHAR (50)  NULL,
    [DynamicInputFields]           VARCHAR (2000) NULL,
    [Category]                     VARCHAR (64)   NULL,
    [LogoID]                       VARCHAR (15)   NULL,
    [GroupID]                      SMALLINT       NULL
);


GO

ALTER TABLE [dbo].[VASProduct]
    ADD CONSTRAINT [DF__VASProduc__Airti__14E50818] DEFAULT ((0)) FOR [AirtimePlus];


GO



ALTER TABLE [dbo].[VASProduct]
    ADD CONSTRAINT [DF__VASProduc__Calcu__1EC08D37] DEFAULT ((0)) FOR [CalculateFromTotalCommission];


GO



ALTER TABLE [dbo].[VASProduct]
    ADD CONSTRAINT [DF__VASProduc__Exclu__4A050C08] DEFAULT ((0)) FOR [Exclusive];


GO



ALTER TABLE [dbo].[VASProduct]
    ADD CONSTRAINT [DF__VASProduc__IsCre__2E7A2FE9] DEFAULT ((0)) FOR [IsCredit];


GO



ALTER TABLE [dbo].[VASProduct]
    ADD CONSTRAINT [DF__VASProduc__IsVou__7B809688] DEFAULT ((0)) FOR [IsVoucherGeneration];


GO



ALTER TABLE [dbo].[VASProduct]
    ADD CONSTRAINT [DF__VASProduc__Print__49DC1DC1] DEFAULT ((0)) FOR [PrintBarcode];


GO



ALTER TABLE [dbo].[VASProduct]
    ADD CONSTRAINT [DF_VASProduct_AdditionalFields] DEFAULT ((0)) FOR [AdditionalFields];


GO



ALTER TABLE [dbo].[VASProduct]
    ADD CONSTRAINT [DF_VASProduct_IsFullPayment] DEFAULT ((0)) FOR [IsFullPayment];


GO



ALTER TABLE [dbo].[VASProduct]
    ADD CONSTRAINT [DF_VASProduct_IsVasproduct] DEFAULT ((1)) FOR [IsVasproduct];


GO



ALTER TABLE [dbo].[VASProduct]
    ADD CONSTRAINT [DF_VASProduct_IsVerify] DEFAULT ((0)) FOR [IsVerify];


GO



ALTER TABLE [dbo].[VASProduct]
    ADD CONSTRAINT [DF_VASProduct_ProductCode] DEFAULT ('') FOR [ProductCode];


GO



ALTER TABLE [dbo].[VASProduct]
    ADD CONSTRAINT [FK_VASProduct_TrxTypes] FOREIGN KEY ([TrxTypeId]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO
ALTER TABLE [dbo].[VASProduct] NOCHECK CONSTRAINT [FK_VASProduct_TrxTypes];


GO



ALTER TABLE [dbo].[VASProduct]
    ADD CONSTRAINT [PK__VASProdu__3214EC07604834B3] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO




-- =============================================  
-- Author:  Du Toit Appelcryn  - http://weblogs.asp.net/jongalloway/adding-simple-trigger-based-auditing-to-your-sql-server-database  
-- Create date: 04/03/2016  
-- Description: Audit Trigger Test  
-- =============================================  
CREATE TRIGGER [dbo].[utr_VASProduct_ChangeTracking] ON [dbo].[VASProduct]
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

SELECT @TableName = 'VASProduct'

-- date and user  
SELECT @DBUserName = system_user

SET @AuditId = NEWID()

-- Action  
IF EXISTS (
		SELECT Id
		FROM inserted
		)
	IF EXISTS (
			SELECT Id
			FROM deleted
			)
		SELECT @Type = 'U'
	ELSE
		SELECT @Type = 'I'
ELSE
	SELECT @Type = 'D'

-- get list of columns  
SELECT [Id],
	[Description],
	[TrxTypeId],
	[ProviderId],
	[IsVerify],
	[IsFullPayment],
	[AdditionalFields],
	[ProductCode],
	[IsDeleted],
	[CalculateFromTotalCommission],
	[FixedValueFlag],
	[FixedValueAmount],
	[IsCredit],
	[BillIssuerId],
	[AllowReversal],
	[IsVasproduct],
	[ModifiedUser],
	[ModifiedDate],
	[PrintBarcode],
	[Barcode],
	[Exclusive],
	[ExclusiveStartDate],
	[ExclusiveEndDate],
	[AirtimePlus],
	[IsVoucherGeneration],
	[GroupID]
INTO #ins
FROM inserted

SELECT TOP 1 @ModifiedUser = ModifiedUser
FROM #ins

SELECT [Id],
	[Description],
	[TrxTypeId],
	[ProviderId],
	[IsVerify],
	[IsFullPayment],
	[AdditionalFields],
	[ProductCode],
	[IsDeleted],
	[CalculateFromTotalCommission],
	[FixedValueFlag],
	[FixedValueAmount],
	[IsCredit],
	[BillIssuerId],
	[AllowReversal],
	[IsVasproduct],
	[ModifiedUser],
	[ModifiedDate],
	[PrintBarcode],
	[Barcode],
	[Exclusive],
	[ExclusiveStartDate],
	[ExclusiveEndDate],
	[AirtimePlus],
	[IsVoucherGeneration],
	[GroupID]	
INTO #del
FROM deleted

IF (@ModifiedUser IS NULL)
	SELECT TOP 1 @ModifiedUser = ModifiedUser
	FROM #del

-- Get primary key columns for full outer join - d alias will be used later  
SELECT @PKCols = coalesce(@PKCols + ' and', ' on') + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON c.TABLE_NAME = pk.TABLE_NAME AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
WHERE pk.TABLE_NAME = @TableName AND CONSTRAINT_TYPE = 'PRIMARY KEY'

--PRINT '@PKCols'  
--PRINT @PKCols  
-- Get primary key fields select for insert  
--select @PKFieldSelect =  coalesce(@PKFieldSelect,',') + COLUMN_NAME  
SELECT @PKFieldSelect = coalesce(@PKFieldSelect + '' + '', '''') + '' + COLUMN_NAME + ''''
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON c.TABLE_NAME = pk.TABLE_NAME AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
WHERE pk.TABLE_NAME = @TableName AND CONSTRAINT_TYPE = 'PRIMARY KEY'

--PRINT '@PKFieldSelect'  
--PRINT @PKFieldSelect  
--Get the values        ''  
SELECT @temp1 = 'convert(varchar(100), coalesce(i.'

SELECT @temp2 = ',d.'

SELECT @PKValueSelect = @temp1 + COLUMN_NAME + @temp2 + COLUMN_NAME + '))'
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON c.TABLE_NAME = pk.TABLE_NAME AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
WHERE pk.TABLE_NAME = @TableName AND CONSTRAINT_TYPE = 'PRIMARY KEY'

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
	WHERE TABLE_NAME = @TableName AND ORDINAL_POSITION > @field

	SELECT @bit = (@field - 1) % 8 + 1

	SELECT @bit = power(2, @bit - 1)

	SELECT @char = ((@field - 1) / 8) + 1

	-- if substring(COLUMNS_UPDATED(),@char, 1) & @bit > 0 or @Type in ('I','D')  
	IF @Type IN ('I', 'D', 'U')
	BEGIN
		SELECT @fieldname = COLUMN_NAME
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = @TableName AND ORDINAL_POSITION = @field AND DATA_TYPE <> 'text' AND (CHARACTER_MAXIMUM_LENGTH IS NULL OR CHARACTER_MAXIMUM_LENGTH <= 500)

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
	--	PRINT @sql  
		EXEC (@sql)
	END
END
GO



-- =============================================  
-- Author:  Du Toit Appelcryn  - http://weblogs.asp.net/jongalloway/adding-simple-trigger-based-auditing-to-your-sql-server-database  
-- Create date: 04/03/2016  
-- Description: Audit Trigger Test  
-- =============================================  
CREATE  TRIGGER [dbo].[utr_VASProduct_ChangeTracking__20200804] ON [dbo].[VASProduct]
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

SELECT @TableName = 'VASProduct'

-- date and user  
SELECT @DBUserName = system_user

SET @AuditId = NEWID()

-- Action  
IF EXISTS (
		SELECT Id
		FROM inserted
		)
	IF EXISTS (
			SELECT Id
			FROM deleted
			)
		SELECT @Type = 'U'
	ELSE
		SELECT @Type = 'I'
ELSE
	SELECT @Type = 'D'

-- get list of columns  
SELECT   [Id],
  [Description],
  [TrxTypeId],
  [ProviderId],
  [IsVerify],
  [IsFullPayment],
  [AdditionalFields],
  [ProductCode],
  [IsDeleted],
  [CalculateFromTotalCommission],
  [FixedValueFlag],
  [FixedValueAmount],
  [IsCredit],
  [BillIssuerId],
  [AllowReversal],
  [IsVasproduct],
  [ModifiedUser],
  [ModifiedDate],
  [Exclusive],
  [ExclusiveStartDate],
  [ExclusiveEndDate],
  [AirtimePlus],
  [IsVoucherGeneration],
  [PrintBarcode],
  [Barcode],
  [DynamicInputFields],
  [LogoID],
  [Category]
INTO #ins
FROM inserted

SELECT TOP 1 @ModifiedUser = ModifiedUser
FROM #ins

SELECT 
  [Id],
  [Description],
  [TrxTypeId],
  [ProviderId],
  [IsVerify],
  [IsFullPayment],
  [AdditionalFields],
  [ProductCode],
  [IsDeleted],
  [CalculateFromTotalCommission],
  [FixedValueFlag],
  [FixedValueAmount],
  [IsCredit],
  [BillIssuerId],
  [AllowReversal],
  [IsVasproduct],
  [ModifiedUser],
  [ModifiedDate],
  [Exclusive],
  [ExclusiveStartDate],
  [ExclusiveEndDate],
  [AirtimePlus],
  [IsVoucherGeneration],
  [PrintBarcode],
  [Barcode],
  [DynamicInputFields],
  [LogoID],
  [Category]
INTO #del
FROM deleted

IF (@ModifiedUser IS NULL)
	SELECT TOP 1 @ModifiedUser = ModifiedUser
	FROM #del

-- Get primary key columns for full outer join - d alias will be used later  
SELECT @PKCols = coalesce(@PKCols + ' and', ' on') + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON c.TABLE_NAME = pk.TABLE_NAME AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
WHERE pk.TABLE_NAME = @TableName AND CONSTRAINT_TYPE = 'PRIMARY KEY'

--PRINT '@PKCols'  
--PRINT @PKCols  
-- Get primary key fields select for insert  
--select @PKFieldSelect =  coalesce(@PKFieldSelect,',') + COLUMN_NAME  
SELECT @PKFieldSelect = coalesce(@PKFieldSelect + '' + '', '''') + '' + COLUMN_NAME + ''''
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON c.TABLE_NAME = pk.TABLE_NAME AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
WHERE pk.TABLE_NAME = @TableName AND CONSTRAINT_TYPE = 'PRIMARY KEY'

--PRINT '@PKFieldSelect'  
--PRINT @PKFieldSelect  
--Get the values        ''  
SELECT @temp1 = 'convert(varchar(100), coalesce(i.'

SELECT @temp2 = ',d.'

SELECT @PKValueSelect = @temp1 + COLUMN_NAME + @temp2 + COLUMN_NAME + '))'
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON c.TABLE_NAME = pk.TABLE_NAME AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
WHERE pk.TABLE_NAME = @TableName AND CONSTRAINT_TYPE = 'PRIMARY KEY'

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
	WHERE TABLE_NAME = @TableName AND ORDINAL_POSITION > @field

	SELECT @bit = (@field - 1) % 8 + 1

	SELECT @bit = power(2, @bit - 1)

	SELECT @char = ((@field - 1) / 8) + 1

	-- if substring(COLUMNS_UPDATED(),@char, 1) & @bit > 0 or @Type in ('I','D')  
	IF @Type IN ('I', 'D', 'U')
	BEGIN
		SELECT @fieldname = COLUMN_NAME
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = @TableName AND ORDINAL_POSITION = @field AND DATA_TYPE <> 'text' AND (CHARACTER_MAXIMUM_LENGTH IS NULL OR CHARACTER_MAXIMUM_LENGTH <= 500)

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
DISABLE TRIGGER [dbo].[utr_VASProduct_ChangeTracking__20200804]
    ON [dbo].[VASProduct];


GO



CREATE NONCLUSTERED INDEX [IDX_VasProduct_TrxTypeId]
    ON [dbo].[VASProduct]([TrxTypeId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxBillIssuerId]
    ON [dbo].[VASProduct]([BillIssuerId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxIsCredit]
    ON [dbo].[VASProduct]([IsCredit] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



