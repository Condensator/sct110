CREATE TABLE [dbo].[BankAccounts] (
    [BankAccId]             INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [BankId]                INT          NOT NULL,
    [BankAccount]           VARCHAR (50) NOT NULL,
    [BankBranch]            VARCHAR (20) NULL,
    [AccNumber]             VARCHAR (20) NULL,
    [BranchCode]            VARCHAR (8)  NULL,
    [AccountType]           VARCHAR (20) NULL,
    [Reference]             VARCHAR (50) NULL,
    [Status]                SMALLINT     NOT NULL,
    [AddId]                 INT          NULL,
    [IsDeleted]             BIT          NOT NULL,
    [CashDepFee]            MONEY        NULL,
    [CashDepFeeType]        SMALLINT     NULL,
    [CashDepTrxTypeId]      INT          NULL,
    [CommissionPayoutEntId] INT          NULL,
    [CommPayoutFreq]        NVARCHAR (7) NULL
);


GO

ALTER TABLE [dbo].[BankAccounts]
    ADD CONSTRAINT [DF_BankAccounts_CashDepFee] DEFAULT ((0)) FOR [CashDepFee];


GO



ALTER TABLE [dbo].[BankAccounts]
    ADD CONSTRAINT [DF_BankAccounts_CashDepFeeType] DEFAULT ((0)) FOR [CashDepFeeType];


GO



ALTER TABLE [dbo].[BankAccounts]
    ADD CONSTRAINT [DF_BankAccounts_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[BankAccounts]
    ADD CONSTRAINT [FK_BankAccounts_Addres] FOREIGN KEY ([AddId]) REFERENCES [dbo].[Addres] ([AddId]);


GO



ALTER TABLE [dbo].[BankAccounts]
    ADD CONSTRAINT [FK_BankAccounts_Banks] FOREIGN KEY ([BankId]) REFERENCES [dbo].[Banks] ([BankId]);


GO



ALTER TABLE [dbo].[BankAccounts]
    ADD CONSTRAINT [PK_BankAccounts] PRIMARY KEY CLUSTERED ([BankAccId] ASC) WITH (FILLFACTOR = 90);


GO



