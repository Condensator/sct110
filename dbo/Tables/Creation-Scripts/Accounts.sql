CREATE TABLE [dbo].[Accounts] (
    [AccId]                        INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [AccTypeId]                    INT           NOT NULL,
    [AccRefId]                     INT           NULL,
    [TotalBalance]                 MONEY         NOT NULL,
    [ReservedAmount]               MONEY         NOT NULL,
    [AvailableBalance]             MONEY         NOT NULL,
    [DailyLimit]                   MONEY         NOT NULL,
    [OverdraftLimit]               MONEY         NOT NULL,
    [CurrentAmount]                MONEY         NOT NULL,
    [OverdueAmount]                MONEY         NOT NULL,
    [LastPaidAmount]               MONEY         NULL,
    [LastPaidDate]                 SMALLDATETIME NULL,
    [AccountNr]                    VARCHAR (50)  NULL,
    [VatNr]                        VARCHAR (20)  NULL,
    [PaymentTerms]                 INT           NOT NULL,
    [IsActive]                     BIT           NOT NULL,
    [IsSuspended]                  BIT           NOT NULL,
    [IsAutoManage]                 BIT           NOT NULL,
    [IsConsignment]                BIT           NOT NULL,
    [CreditRating]                 VARCHAR (10)  NULL,
    [CreditScore]                  INT           NOT NULL,
    [RiskScore]                    INT           NOT NULL,
    [MaxCheque]                    MONEY         NOT NULL,
    [EntId]                        INT           NULL,
    [SecurityDeposit]              MONEY         NULL,
    [SecurityDepPersentageUsable]  INT           NULL,
    [IsDeleted]                    BIT           NOT NULL,
    [ContactId]                    INT           NULL,
    [FixedCostDescription]         VARCHAR (MAX) NULL,
    [FixedCostAmount]              MONEY         NULL,
    [TempOverdraftAmount]          MONEY         NULL,
    [TempOverdraftExpireDate]      DATETIME      NULL,
    [TempOverdraftExpireOnDeposit] BIT           NULL,
    [IsVATRegistered]              BIT           NOT NULL,
    [DebitOrderDayOfWeek]          INT           NULL,
    [Send_SMS_on_deposit]          BIT           NOT NULL,
    [Send_SMS_on_Invoice]          BIT           NOT NULL,
    [Send_SMS_on_Other]            BIT           NOT NULL,
    [SMSNumber]                    VARCHAR (20)  NOT NULL,
    [Send_SMS_on_Commission]       BIT           NOT NULL,
    [InvoiceSchedule]              INT           NULL,
    [CreditSchedule]               INT           NULL,
    [Invoice_CRON]                 VARCHAR (MAX) NOT NULL,
    [VAT_StructureID]              INT           NOT NULL,
    [EmergencyTopupAmount]         MONEY         NOT NULL,
    [TurnOverTierId]               INT           NULL,
    [DepositFeeLevel]              INT           NULL,
    [AccName]                      NVARCHAR (50) NULL,
    [ModifiedUser]                 NVARCHAR (50) NULL,
    [ModifiedDate]                 DATETIME      NULL,
    [CommissionSchedule]           INT           NOT NULL,
    [LegacyAccountNr]              NVARCHAR (50) NULL,
    [DayEndTime]                   TIME (7)      NOT NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [Indx_AccountNr]
    ON [dbo].[Accounts]([AccountNr] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [IsDeleted]
    ON [dbo].[Accounts]([IsDeleted] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxAccEntIt]
    ON [dbo].[Accounts]([EntId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [NDXAccidAcctypeid]
    ON [dbo].[Accounts]([AccId] ASC, [AccTypeId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxAccountnr2]
    ON [dbo].[Accounts]([AccountNr] ASC)
    INCLUDE([AccId], [EntId]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE UNIQUE NONCLUSTERED INDEX [ndxAccountsAccid]
    ON [dbo].[Accounts]([AccId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxAccountsisActisSusisDel]
    ON [dbo].[Accounts]([IsActive] ASC, [IsSuspended] ASC, [IsDeleted] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxAccTypeId]
    ON [dbo].[Accounts]([AccTypeId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxAcctypeid2]
    ON [dbo].[Accounts]([AccTypeId] ASC)
    INCLUDE([AccId], [AccountNr], [EntId]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxInvSchedule]
    ON [dbo].[Accounts]([InvoiceSchedule] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxIsActive]
    ON [dbo].[Accounts]([IsActive] ASC)
    INCLUDE([AccountNr], [EntId]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxIsActiveIsdeleted]
    ON [dbo].[Accounts]([IsActive] ASC, [IsDeleted] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxIsDeleted]
    ON [dbo].[Accounts]([IsDeleted] ASC)
    INCLUDE([AccId], [AccountNr], [IsActive]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxIsdeletedIsActive]
    ON [dbo].[Accounts]([IsDeleted] ASC, [IsActive] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxLegacyAccountNr]
    ON [dbo].[Accounts]([LegacyAccountNr] ASC);


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF__Accounts__Credit__2BAE79BF] DEFAULT ((0)) FOR [CreditSchedule];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF__Accounts__Invoic__54A66DB1] DEFAULT ((2)) FOR [InvoiceSchedule];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF_Accounts_AccType] DEFAULT ((1)) FOR [AccTypeId];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF_Accounts_DayEndTime] DEFAULT ('00:00:00') FOR [DayEndTime];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF_Accounts_DepositFeeLevel] DEFAULT ((1)) FOR [DepositFeeLevel];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF_Accounts_EmergencyTopupAmount] DEFAULT ((0)) FOR [EmergencyTopupAmount];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF_Accounts_Invoice_CRON] DEFAULT ('* * * * * *') FOR [Invoice_CRON];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF_Accounts_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF_Accounts_IsVATRegistered] DEFAULT ((0)) FOR [IsVATRegistered];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF_Accounts_parCommissionSchedule] DEFAULT ((1)) FOR [CommissionSchedule];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF_Accounts_Send_SMS_on_Commission] DEFAULT ((0)) FOR [Send_SMS_on_Commission];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF_Accounts_Send_SMS_on_deposit] DEFAULT ((0)) FOR [Send_SMS_on_deposit];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF_Accounts_Send_SMS_on_Invoice] DEFAULT ((0)) FOR [Send_SMS_on_Invoice];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF_Accounts_Send_SMS_on_Other] DEFAULT ((0)) FOR [Send_SMS_on_Other];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF_Accounts_SMSNumber] DEFAULT ('') FOR [SMSNumber];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF_Accounts_TempOverdraftExpireOnDeposit] DEFAULT ((1)) FOR [TempOverdraftExpireOnDeposit];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF_Accounts_TurnOverTierId] DEFAULT ((0)) FOR [TurnOverTierId];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [DF_Accounts_VAT_StructureID] DEFAULT ((1)) FOR [VAT_StructureID];


GO



ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED ([AccId] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO



/*
ALTER TRIGGER [dbo].[tri_AccountDeleted] ON [dbo].[Accounts] 
AFTER UPDATE  
AS   
BEGIN  
  
  SET NOCOUNT ON;  
  
  if ((select IsDeleted from inserted) > 0)   
  begin  
    update Accounts 
    set  IsActive = 0 
        ,IsDeleted = 1
    where AccId = (select AccId from inserted);  
  end  
*/

CREATE TRIGGER [dbo].[tri_AccountDeleted] ON [dbo].[Accounts] 
INSTEAD OF DELETE 
AS   
BEGIN  
 SET NOCOUNT ON;

    update Accounts 
    set  IsActive = 0 
        ,IsDeleted = 1
    where AccId = (select AccId from deleted)  

END
GO
DISABLE TRIGGER [dbo].[tri_AccountDeleted]
    ON [dbo].[Accounts];


GO



  
  
CREATE TRIGGER [dbo].[Tri_UpdateAccountAll]     
   ON  [dbo].[Accounts]     
   AFTER UPDATE    
AS     
BEGIN     
    
PRINT('Updating Overdue')    
          
  DECLARE @Balance MONEY,    
              @AccountID INT,    
              @OpeningBalance MONEY,    
              @PaymentTerms INT,    
              @OverDue MONEY,    
              @TotalBalance MONEY,    
              @Due MONEY    
    
  DECLARE  curAccountLoop CURSOR FOR    
  SELECT PaymentTerms, AccId, TotalBalance    
   FROM inserted     
    
  OPEN curAccountLoop    
  FETCH FROM curAccountLoop INTO @PaymentTerms, @AccountID, @TotalBalance    
  WHILE @@FETCH_STATUS = 0    
    BEGIN    
     
   SET @OpeningBalance = ISNULL(     
   (Select TOP(1) [ClosingBalance]     
      FROM AccTrans     
      WHERE AccID = @AccountID     
      AND TransDateTime <= DATEADD(DAY,-@PaymentTerms,GETDATE())    
      ORDER BY TransDateTime DESC    
   ),0)     
       
   PRINT('@AccountID: ' + CAST(@AccountID AS VARCHAR))    
   PRINT('@PaymentTerms: ' + CAST(@PaymentTerms AS VARCHAR))    
   PRINT('@OpeningBalance: ' + CAST(@OpeningBalance AS VARCHAR))    
   SET @OverDue = ISNULL((SELECT SUM(Amount) FROM AccTrans WHERE AccID = @AccountID AND TransDateTime >= DATEADD(DAY,-@PaymentTerms,GETDATE()) AND Type = 'C'), 0)    
   PRINT('Total of AccTrans: ' + CAST(@OverDue AS VARCHAR))    
   PRINT('@TotalBalance: ' + CAST(@TotalBalance AS VARCHAR))    
       
   SET @OverDue = -@OpeningBalance - @OverDue     
   if (@OverDue < 0) SET @OverDue = 0    
   PRINT('@OverDue: ' + CAST(@OverDue AS VARCHAR))    
   SET @Due = -@TotalBalance - @OverDue    
   if (@Due < 0) SET @Due = 0    
   PRINT('Due: ' + CAST(@Due AS VARCHAR))    
   UPDATE Accounts SET AvailableBalance = a.AB, CurrentAmount = a.Due, OverdueAmount = a.OverDue    
   FROM (SELECT ISNULL(CASE WHEN (GetDate() < TempOverdraftExpireDate)     
            THEN (TotalBalance + (SecurityDeposit * SecurityDepPersentageUsable / 100) + OverdraftLimit + TempOverdraftAmount + EmergencyTopupAmount - ReservedAmount)    
         WHEN (GetDate() >= TempOverdraftExpireDate)     
            THEN (TotalBalance + (SecurityDeposit * SecurityDepPersentageUsable / 100) + OverdraftLimit + EmergencyTopupAmount - ReservedAmount)     
          END,0) as AB,    
         @Due AS Due,    
         @OverDue AS OverDue    
      FROM Accounts acc    
      WHERE acc.AccId = @AccountID) a    
   WHERE AccId = @AccountID    
   FETCH NEXT FROM curAccountLoop INTO @PaymentTerms, @AccountID, @TotalBalance    
  END    
  CLOSE curAccountLoop    
  DEALLOCATE curAccountLoop    
END
GO




-- =============================================  
-- http://weblogs.asp.net/jongalloway/adding-simple-trigger-based-auditing-to-your-sql-server-database  
-- =============================================  
CREATE TRIGGER [dbo].[utr_Accounts_ChangeTracking] ON [dbo].[Accounts]
FOR INSERT,	DELETE,	UPDATE
AS
SET NOCOUNT ON;

IF UPDATE(ReservedAmount) OR UPDATE(AvailableBalance)
BEGIN
	DECLARE @i INT
END ELSE

BEGIN
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
		@AuditId UNIQUEIDENTIFIER;

	SELECT @TableName = 'Accounts';

	-- date and user  
	SELECT @DBUserName = system_user;

	SET @AuditId = NEWID();

	-- Action  
	IF EXISTS (
			SELECT AccId
			FROM inserted
			)
		IF EXISTS (
				SELECT AccId
				FROM deleted
				)
			SELECT @Type = 'U';
		ELSE
			SELECT @Type = 'I';;
	ELSE
		SELECT @Type = 'D';

	-- get list of columns  
	SELECT [AccId],
		[AccTypeId],
		[AccRefId],
		[TotalBalance],
		[ReservedAmount],
		[AvailableBalance],
		[DailyLimit],
		[OverdraftLimit],
		[CurrentAmount],
		[OverdueAmount],
		[LastPaidAmount],
		[LastPaidDate],
		[AccountNr],
		[VatNr],
		[PaymentTerms],
		[IsActive],
		[IsSuspended],
		[IsAutoManage],
		[IsConsignment],
		[CreditRating],
		[CreditScore],
		[RiskScore],
		[MaxCheque],
		[EntId],
		[SecurityDeposit],
		[SecurityDepPersentageUsable],
		[IsDeleted],
		[ContactId],
		[FixedCostDescription],
		[FixedCostAmount],
		[TempOverdraftAmount],
		[TempOverdraftExpireDate],
		[TempOverdraftExpireOnDeposit],
		[IsVATRegistered],
		[DebitOrderDayOfWeek],
		[Send_SMS_on_deposit],
		[Send_SMS_on_Invoice],
		[Send_SMS_on_Other],
		[SMSNumber],
		[Send_SMS_on_Commission],
		[InvoiceSchedule],
		[CreditSchedule],
		[Invoice_CRON],
		[VAT_StructureID],
		[EmergencyTopupAmount],
		[TurnOverTierId],
		[DepositFeeLevel],
		[AccName],
		[ModifiedUser],
		[ModifiedDate]
	INTO #ins
	FROM inserted;

	SELECT TOP 1 @ModifiedUser = ModifiedUser
	FROM #ins;

	SELECT [AccId],
		[AccTypeId],
		[AccRefId],
		[TotalBalance],
		[ReservedAmount],
		[AvailableBalance],
		[DailyLimit],
		[OverdraftLimit],
		[CurrentAmount],
		[OverdueAmount],
		[LastPaidAmount],
		[LastPaidDate],
		[AccountNr],
		[VatNr],
		[PaymentTerms],
		[IsActive],
		[IsSuspended],
		[IsAutoManage],
		[IsConsignment],
		[CreditRating],
		[CreditScore],
		[RiskScore],
		[MaxCheque],
		[EntId],
		[SecurityDeposit],
		[SecurityDepPersentageUsable],
		[IsDeleted],
		[ContactId],
		[FixedCostDescription],
		[FixedCostAmount],
		[TempOverdraftAmount],
		[TempOverdraftExpireDate],
		[TempOverdraftExpireOnDeposit],
		[IsVATRegistered],
		[DebitOrderDayOfWeek],
		[Send_SMS_on_deposit],
		[Send_SMS_on_Invoice],
		[Send_SMS_on_Other],
		[SMSNumber],
		[Send_SMS_on_Commission],
		[InvoiceSchedule],
		[CreditSchedule],
		[Invoice_CRON],
		[VAT_StructureID],
		[EmergencyTopupAmount],
		[TurnOverTierId],
		[DepositFeeLevel],
		[AccName],
		[ModifiedUser],
		[ModifiedDate]
	INTO #del
	FROM deleted;

	IF (@ModifiedUser IS NULL)
		SELECT TOP 1 @ModifiedUser = ModifiedUser
		FROM #del;

	-- Get primary key columns for full outer join - d alias will be used later  
	SELECT @PKCols = COALESCE(@PKCols + ' and', ' on') + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk,
		INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
	WHERE pk.TABLE_NAME = @TableName AND CONSTRAINT_TYPE = 'PRIMARY KEY' AND c.TABLE_NAME = pk.TABLE_NAME AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME;

	-- Get primary key fields select for insert  
	SELECT @PKFieldSelect = COALESCE(@PKFieldSelect + '' + '', '''') + '' + COLUMN_NAME + ''''
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk,
		INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
	WHERE pk.TABLE_NAME = @TableName AND CONSTRAINT_TYPE = 'PRIMARY KEY' AND c.TABLE_NAME = pk.TABLE_NAME AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME;

	--Get the values        ''  
	SELECT @temp1 = 'convert(varchar(100), coalesce(i.';

	SELECT @temp2 = ',d.';

	SELECT @PKValueSelect = @temp1 + COLUMN_NAME + @temp2 + COLUMN_NAME + '))'
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk,
		INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
	WHERE pk.TABLE_NAME = @TableName AND CONSTRAINT_TYPE = 'PRIMARY KEY' AND c.TABLE_NAME = pk.TABLE_NAME AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME;

	IF @PKCols IS NULL
	BEGIN
		RAISERROR (
				'no PK on table %s',
				16,
				- 1,
				@TableName
				);

		RETURN;
	END;

	SELECT @field = 0,
		@maxfield = MAX(ORDINAL_POSITION)
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = @TableName;

	--Test Code must be removed  
	SELECT @UpdateDate = CONVERT(VARCHAR(24), GETDATE(), 121);

	WHILE @field < @maxfield
	BEGIN
		SELECT @field = MIN(ORDINAL_POSITION)
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = @TableName AND ORDINAL_POSITION > @field;

		SELECT @bit = (@field - 1) % 8 + 1;

		SELECT @bit = POWER(2, @bit - 1);

		SELECT @char = ((@field - 1) / 8) + 1;

		IF @Type IN ('I', 'D', 'U')
		BEGIN
			SELECT @fieldname = COLUMN_NAME
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @TableName AND ORDINAL_POSITION = @field AND DATA_TYPE <> 'text' AND (CHARACTER_MAXIMUM_LENGTH IS NULL OR CHARACTER_MAXIMUM_LENGTH <= 500);

			SELECT @sql = 'insert Audit (Type, TableName,PrimaryKeyField, PrimaryKeyValue, FieldName, OldValue, NewValue, ModifiedDate, DBUserName, ModifiedUser, AuditId )';
			SELECT @sql = @sql + ' select ' + '''' + @Type + ''',';
			SELECT @sql = @sql + '''' + @TableName + '''';
			SELECT @sql = @sql + ',' + @PKFieldSelect;
			SELECT @sql = @sql + ',' + @PKValueSelect;
			SELECT @sql = @sql + ',' + '''' + @fieldname + '''';
			SELECT @sql = @sql + ',convert(varchar(1000),d.' + @fieldname + ')';
			SELECT @sql = @sql + ',convert(varchar(1000),i.' + @fieldname + ')';
			SELECT @sql = @sql + ',' + '''' + @UpdateDate + '''';
			SELECT @sql = @sql + ',' + '''' + @DBUserName + '''';
			SELECT @sql = @sql + ',' + '''' + @ModifiedUser + '''';
			SELECT @sql = @sql + ',' + '''' + CONVERT(NVARCHAR(50), @AuditId) + '''';
			SELECT @sql = @sql + ' from #ins i full outer join #del d ';
			SELECT @sql = @sql + @PKCols;
			SELECT @sql = @sql + ' where i.' + @fieldname + ' <> d.' + @fieldname;
			SELECT @sql = @sql + ' or (i.' + @fieldname + ' is null and d.' + @fieldname + ' is not null)';
			SELECT @sql = @sql + ' or (i.' + @fieldname + ' is not null and d.' + @fieldname + ' is null)';

			EXEC (@sql);
		END;
	END;
END;
GO
DISABLE TRIGGER [dbo].[utr_Accounts_ChangeTracking]
    ON [dbo].[Accounts];


GO



