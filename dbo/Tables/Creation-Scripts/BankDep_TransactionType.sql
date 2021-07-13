CREATE TABLE [dbo].[BankDep_TransactionType] (
    [TrxTypeId]          INT           IDENTITY (1, 1) NOT NULL,
    [SourceBankId]       INT           NOT NULL,
    [TransactionType]    VARCHAR (50)  NOT NULL,
    [PaymentType]        VARCHAR (20)  NOT NULL,
    [AutoDepositMax]     MONEY         NULL,
    [DoProcess]          BIT           NOT NULL,
    [DoAutoDeposit]      BIT           NOT NULL,
    [DepositFeeLevel]    INT           NOT NULL,
    [NotificationSend]   BIT           NOT NULL,
    [NotificationText]   VARCHAR (150) NULL,
    [NotificationType]   INT           NULL,
    [TransactionCodeOld] VARCHAR (500) NULL,
    [TransactionCode]    VARCHAR (MAX) NULL,
    [HoldPeriod]         INT           NOT NULL
);


GO

ALTER TABLE [dbo].[BankDep_TransactionType]
    ADD CONSTRAINT [DF_BankDep_TransactionType_DepositFeeLevel] DEFAULT ((0)) FOR [DepositFeeLevel];


GO



ALTER TABLE [dbo].[BankDep_TransactionType]
    ADD CONSTRAINT [DF_BankDep_TransactionType_DoAutoDeposit] DEFAULT ((0)) FOR [DoAutoDeposit];


GO



ALTER TABLE [dbo].[BankDep_TransactionType]
    ADD CONSTRAINT [DF_BankDep_TransactionType_DoProcess] DEFAULT ((1)) FOR [DoProcess];


GO



ALTER TABLE [dbo].[BankDep_TransactionType]
    ADD CONSTRAINT [DF_BankDep_TransactionType_HoldPeriod] DEFAULT ((0)) FOR [HoldPeriod];


GO



ALTER TABLE [dbo].[BankDep_TransactionType]
    ADD CONSTRAINT [DF_BankDep_TransactionType_NotificationText] DEFAULT ('') FOR [NotificationText];


GO



ALTER TABLE [dbo].[BankDep_TransactionType]
    ADD CONSTRAINT [FK_BankDep_TransactionType_SourceBank] FOREIGN KEY ([SourceBankId]) REFERENCES [dbo].[BankDep_SourceBank] ([SourceBankId]);


GO



ALTER TABLE [dbo].[BankDep_TransactionType]
    ADD CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED ([TrxTypeId] ASC) WITH (FILLFACTOR = 90);


GO



