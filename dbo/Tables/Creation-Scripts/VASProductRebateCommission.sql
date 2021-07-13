CREATE TABLE [dbo].[VASProductRebateCommission] (
    [Id]                    INT           IDENTITY (1, 1) NOT NULL,
    [VASProductId]          INT           NOT NULL,
    [FeeOutlet]             MONEY         NOT NULL,
    [FeeOutletIsPercent]    BIT           NOT NULL,
    [FeeSwitch]             MONEY         NOT NULL,
    [FeeSwitchIsPercent]    BIT           NOT NULL,
    [FeeProvider]           MONEY         NOT NULL,
    [FeeProviderIsPercent]  BIT           NOT NULL,
    [RebateCash]            MONEY         NOT NULL,
    [RebateCashIsPercent]   BIT           NOT NULL,
    [RebateCard]            MONEY         NOT NULL,
    [RebateCardIsPercent]   BIT           NOT NULL,
    [RebateDebit]           MONEY         NOT NULL,
    [RebateDebitIsPercent]  BIT           NOT NULL,
    [RebateCheque]          MONEY         NOT NULL,
    [RebateChequeIsPercent] BIT           NOT NULL,
    [EntityId]              INT           NULL,
    [IsDeleted]             BIT           NOT NULL,
    [FeeCharge]             MONEY         NOT NULL,
    [FeeChargeIsPercent]    BIT           NOT NULL,
    [CommissionTypeId]      INT           NULL,
    [CommissionOnFreeUnits] BIT           NOT NULL,
    [ModifiedUser]          NVARCHAR (50) NULL,
    [ModifiedDate]          DATETIME      NULL,
    [IsCommissionable]      BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[VASProductRebateCommission]
    ADD CONSTRAINT [DF_VASProductRebateCommission_CommissionOnFreeUnits] DEFAULT ((1)) FOR [CommissionOnFreeUnits];


GO



ALTER TABLE [dbo].[VASProductRebateCommission]
    ADD CONSTRAINT [DF_VASProductRebateCommission_FeeCharge] DEFAULT ((0)) FOR [FeeCharge];


GO



ALTER TABLE [dbo].[VASProductRebateCommission]
    ADD CONSTRAINT [DF_VASProductRebateCommission_FeeChargeIsPercentage] DEFAULT ((0)) FOR [FeeChargeIsPercent];


GO



ALTER TABLE [dbo].[VASProductRebateCommission]
    ADD CONSTRAINT [DF_VASProductRebateCommission_FeeOutletIsPercent] DEFAULT ((0)) FOR [FeeOutletIsPercent];


GO



ALTER TABLE [dbo].[VASProductRebateCommission]
    ADD CONSTRAINT [DF_VASProductRebateCommission_FeeProviderIsPercent] DEFAULT ((0)) FOR [FeeProviderIsPercent];


GO



ALTER TABLE [dbo].[VASProductRebateCommission]
    ADD CONSTRAINT [DF_VASProductRebateCommission_FeeSwitch] DEFAULT ((0)) FOR [FeeSwitch];


GO



ALTER TABLE [dbo].[VASProductRebateCommission]
    ADD CONSTRAINT [DF_VASProductRebateCommission_FeeSwitchIsPercent] DEFAULT ((0)) FOR [FeeSwitchIsPercent];


GO



ALTER TABLE [dbo].[VASProductRebateCommission]
    ADD CONSTRAINT [DF_VASProductRebateCommission_IsCommissionable] DEFAULT ((1)) FOR [IsCommissionable];


GO



ALTER TABLE [dbo].[VASProductRebateCommission]
    ADD CONSTRAINT [DF_VASProductRebateCommission_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[VASProductRebateCommission]
    ADD CONSTRAINT [DF_VASProductRebateCommission_RebateCardIsPercent] DEFAULT ((0)) FOR [RebateCardIsPercent];


GO



ALTER TABLE [dbo].[VASProductRebateCommission]
    ADD CONSTRAINT [DF_VASProductRebateCommission_RebateCashIsPercent] DEFAULT ((0)) FOR [RebateCashIsPercent];


GO



ALTER TABLE [dbo].[VASProductRebateCommission]
    ADD CONSTRAINT [DF_VASProductRebateCommission_RebateCheque] DEFAULT ((0)) FOR [RebateCheque];


GO



ALTER TABLE [dbo].[VASProductRebateCommission]
    ADD CONSTRAINT [DF_VASProductRebateCommission_RebateChequeIsPercent] DEFAULT ((0)) FOR [RebateChequeIsPercent];


GO



ALTER TABLE [dbo].[VASProductRebateCommission]
    ADD CONSTRAINT [DF_VASProductRebateCommission_RebateDebitIsPercent] DEFAULT ((0)) FOR [RebateDebitIsPercent];


GO



ALTER TABLE [dbo].[VASProductRebateCommission]
    ADD CONSTRAINT [PK_VASProductRebateCommission] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO




CREATE TRIGGER [dbo].[utr_VASProductRebateCommission_ChangeTracking] ON [dbo].[VASProductRebateCommission]
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

SELECT @TableName = 'VASProductRebateCommission'

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
	[VASProductId],
	[FeeOutlet],
	[FeeOutletIsPercent],
	[FeeSwitch],
	[FeeSwitchIsPercent],
	[FeeProvider],
	[FeeProviderIsPercent],
	[RebateCash],
	[RebateCashIsPercent],
	[RebateCard],
	[RebateCardIsPercent],
	[RebateDebit],
	[RebateDebitIsPercent],
	[RebateCheque],
	[RebateChequeIsPercent],
	[EntityId],
	[IsDeleted],
	[FeeCharge],
	[FeeChargeIsPercent],
	[CommissionTypeId],
	[CommissionOnFreeUnits],
	[ModifiedUser],
	[ModifiedDate],
	[IsCommissionable]
INTO #ins
FROM inserted

SELECT TOP 1 @ModifiedUser = ModifiedUser
FROM #ins

SELECT [Id],
	[VASProductId],
	[FeeOutlet],
	[FeeOutletIsPercent],
	[FeeSwitch],
	[FeeSwitchIsPercent],
	[FeeProvider],
	[FeeProviderIsPercent],
	[RebateCash],
	[RebateCashIsPercent],
	[RebateCard],
	[RebateCardIsPercent],
	[RebateDebit],
	[RebateDebitIsPercent],
	[RebateCheque],
	[RebateChequeIsPercent],
	[EntityId],
	[IsDeleted],
	[FeeCharge],
	[FeeChargeIsPercent],
	[CommissionTypeId],
	[CommissionOnFreeUnits],
	[ModifiedUser],
	[ModifiedDate],
	[IsCommissionable]
INTO #del
FROM deleted

IF (@ModifiedUser IS NULL)
	SELECT TOP 1 @ModifiedUser = ModifiedUser
	FROM #del

-- Get primary key columns for full outer join - d alias will be used later
SELECT @PKCols = coalesce(@PKCols + ' and', ' on') + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk INNER JOIN 
	INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON c.TABLE_NAME = pk.TABLE_NAME
	AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
WHERE pk.TABLE_NAME = @TableName
	AND CONSTRAINT_TYPE = 'PRIMARY KEY'	

--PRINT '@PKCols'
--PRINT @PKCols
-- Get primary key fields select for insert
--select @PKFieldSelect =  coalesce(@PKFieldSelect,',') + COLUMN_NAME
SELECT @PKFieldSelect = coalesce(@PKFieldSelect + '' + '', '''') + '' + COLUMN_NAME + ''''
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk INNER JOIN 
	INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON c.TABLE_NAME = pk.TABLE_NAME
	AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
WHERE pk.TABLE_NAME = @TableName
	AND CONSTRAINT_TYPE = 'PRIMARY KEY'	

--PRINT '@PKFieldSelect'
--PRINT @PKFieldSelect
--Get the values        ''
SELECT @temp1 = 'convert(varchar(100), coalesce(i.'

SELECT @temp2 = ',d.'

SELECT @PKValueSelect = @temp1 + COLUMN_NAME + @temp2 + COLUMN_NAME + '))'
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk INNER JOIN 
	INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON c.TABLE_NAME = pk.TABLE_NAME
	AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
WHERE pk.TABLE_NAME = @TableName
	AND CONSTRAINT_TYPE = 'PRIMARY KEY'

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



CREATE UNIQUE NONCLUSTERED INDEX [idx_VASProductRebateCommission_VASProductId]
    ON [dbo].[VASProductRebateCommission]([VASProductId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



