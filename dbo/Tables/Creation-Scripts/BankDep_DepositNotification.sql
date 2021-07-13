CREATE TABLE [dbo].[BankDep_DepositNotification] (
    [DepositId]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [BankAccId]                 INT            NOT NULL,
    [AccSystemId]               INT            NOT NULL,
    [NotificationId]            VARCHAR (100)  NULL,
    [StatementId]               VARCHAR (100)  NULL,
    [Reference]                 VARCHAR (250)  NOT NULL,
    [TransactionCode]           VARCHAR (50)   NOT NULL,
    [PaymentType]               VARCHAR (50)   NULL,
    [ReturnCode]                VARCHAR (50)   NULL,
    [TransactionType]           VARCHAR (1)    NOT NULL,
    [TransactionAmount]         MONEY          NOT NULL,
    [DepFeeAmount]              MONEY          NOT NULL,
    [TransactionDate]           DATETIME       NULL,
    [FromNotify]                BIT            NOT NULL,
    [FromStatement]             BIT            NOT NULL,
    [DateReceived]              DATETIME       NULL,
    [ProcessedStatus]           INT            NOT NULL,
    [ProcessedDate]             DATETIME       NULL,
    [StatementText]             VARCHAR (250)  NULL,
    [IsDuplicate]               BIT            NULL,
    [ExternalAccountId]         INT            NULL,
    [DepFeeLevel]               INT            NULL,
    [CashbookId]                INT            NULL,
    [ExternalAccMaxDeposit]     MONEY          NULL,
    [ExternalAccLastMonthTrade] MONEY          NULL,
    [TransactionComment]        VARCHAR (250)  NULL,
    [TrxTypeId]                 INT            NULL,
    [CashDepositTrxId]          BIGINT         NULL,
    [CrmCaseNumber]             NVARCHAR (50)  NULL,
    [Username]                  NVARCHAR (250) NULL,
    [TIMESTAMP]                 ROWVERSION     NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [index_324_323_BankDep_DepositNotification]
    ON [dbo].[BankDep_DepositNotification]([AccSystemId] ASC, [DateReceived] ASC, [ProcessedStatus] ASC)
    INCLUDE([DepositId], [BankAccId], [NotificationId], [Reference], [TransactionAmount], [ExternalAccountId]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [IX_BankDep_DepositNotification_BankAccId_DateReceived_ProcessedStatus]
    ON [dbo].[BankDep_DepositNotification]([BankAccId] ASC, [DateReceived] ASC, [ProcessedStatus] ASC)
    INCLUDE([DepositId], [NotificationId], [Reference], [TransactionAmount], [ExternalAccountId]);


GO



CREATE NONCLUSTERED INDEX [IX_BankDep_DepositNotification_BankAccId_Reference_TransactionType_TransactionAmount_FromNotify_TransactionDate]
    ON [dbo].[BankDep_DepositNotification]([BankAccId] ASC, [Reference] ASC, [TransactionType] ASC, [TransactionAmount] ASC, [FromNotify] ASC, [TransactionDate] ASC);


GO



CREATE NONCLUSTERED INDEX [IX_BankDep_DepositNotification_BankAccId_TransactionType_TransactionAmount_FromStatement_TransactionDate]
    ON [dbo].[BankDep_DepositNotification]([BankAccId] ASC, [TransactionType] ASC, [TransactionAmount] ASC, [FromStatement] ASC, [TransactionDate] ASC)
    INCLUDE([Reference]);


GO



CREATE NONCLUSTERED INDEX [ndxAccSystemId]
    ON [dbo].[BankDep_DepositNotification]([AccSystemId] ASC)
    INCLUDE([DepositId], [BankAccId], [NotificationId], [Reference], [TransactionAmount], [ExternalAccountId]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxBankAccid2]
    ON [dbo].[BankDep_DepositNotification]([BankAccId] ASC, [StatementId] ASC, [TransactionAmount] ASC, [FromStatement] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxBankaccidNotiTranFromnFromS]
    ON [dbo].[BankDep_DepositNotification]([BankAccId] ASC, [NotificationId] ASC, [TransactionAmount] ASC, [FromNotify] ASC, [FromStatement] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxBankDep3]
    ON [dbo].[BankDep_DepositNotification]([BankAccId] ASC, [TransactionAmount] ASC, [TransactionDate] ASC, [FromStatement] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxBankdep4]
    ON [dbo].[BankDep_DepositNotification]([BankAccId] ASC, [NotificationId] ASC, [TransactionType] ASC, [TransactionAmount] ASC, [TransactionDate] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxBankdepNotifcations]
    ON [dbo].[BankDep_DepositNotification]([TransactionType] ASC)
    INCLUDE([DepositId], [BankAccId], [NotificationId], [Reference], [TransactionAmount], [DateReceived], [ProcessedStatus]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxProcessedStatus]
    ON [dbo].[BankDep_DepositNotification]([ProcessedStatus] ASC)
    INCLUDE([DepositId], [TransactionDate]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[BankDep_DepositNotification]
    ADD CONSTRAINT [DF_BankDep_DepositNotification_DepFeeAmount] DEFAULT ((0)) FOR [DepFeeAmount];


GO



ALTER TABLE [dbo].[BankDep_DepositNotification]
    ADD CONSTRAINT [DF_BankDep_DepositNotification_ExternalAccLastMonthTrade] DEFAULT ((0)) FOR [ExternalAccLastMonthTrade];


GO



ALTER TABLE [dbo].[BankDep_DepositNotification]
    ADD CONSTRAINT [DF_BankDep_DepositNotification_ExternalAccMaxDeposit] DEFAULT ((0)) FOR [ExternalAccMaxDeposit];


GO



ALTER TABLE [dbo].[BankDep_DepositNotification]
    ADD CONSTRAINT [DF_BankDep_DepositNotification_TrxTypeId] DEFAULT ((0)) FOR [TrxTypeId];


GO



ALTER TABLE [dbo].[BankDep_DepositNotification]
    ADD CONSTRAINT [DF_DepositNotify_DateReceveived] DEFAULT (getdate()) FOR [DateReceived];


GO



ALTER TABLE [dbo].[BankDep_DepositNotification]
    ADD CONSTRAINT [DF_DepositNotify_FromNotify] DEFAULT ((0)) FOR [FromNotify];


GO



ALTER TABLE [dbo].[BankDep_DepositNotification]
    ADD CONSTRAINT [DF_DepositNotify_FromStatement] DEFAULT ((0)) FOR [FromStatement];


GO



ALTER TABLE [dbo].[BankDep_DepositNotification]
    ADD CONSTRAINT [DF_DepositNotify_IsDuplicate] DEFAULT ((0)) FOR [IsDuplicate];


GO



ALTER TABLE [dbo].[BankDep_DepositNotification]
    ADD CONSTRAINT [DF_DepositNotify_ProcessedStatus] DEFAULT ((1)) FOR [ProcessedStatus];


GO



ALTER TABLE [dbo].[BankDep_DepositNotification]
    ADD CONSTRAINT [FK_BankDep_DepositNotification_BankAccount] FOREIGN KEY ([BankAccId]) REFERENCES [dbo].[BankDep_BankAccount] ([BankAccId]);


GO



ALTER TABLE [dbo].[BankDep_DepositNotification]
    ADD CONSTRAINT [FK_BankDep_DepositNotification_CashDepositTrx] FOREIGN KEY ([CashDepositTrxId]) REFERENCES [dbo].[CashDepositTrx] ([Id]);


GO



ALTER TABLE [dbo].[BankDep_DepositNotification]
    ADD CONSTRAINT [PK_BankDep_DepositNotification] PRIMARY KEY CLUSTERED ([DepositId] ASC) WITH (FILLFACTOR = 90);


GO



