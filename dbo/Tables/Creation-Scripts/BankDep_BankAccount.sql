CREATE TABLE [dbo].[BankDep_BankAccount] (
    [BankAccId]            INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [SourceBankId]         INT           NOT NULL,
    [AccSystemId]          INT           NOT NULL,
    [BankAccount]          VARCHAR (50)  NOT NULL,
    [AccountNumber]        NVARCHAR (50) NOT NULL,
    [DepositAccountPrefix] VARCHAR (50)  NOT NULL,
    [AutoDepositMax]       MONEY         NOT NULL,
    [IsDeleted]            BIT           NOT NULL,
    [DefaultProcessStatus] INT           NOT NULL,
    [DefaultAccId]         INT           NULL,
    [DefaultAccSystemId]   INT           NULL,
    [IsKmsAccount]         BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[BankDep_BankAccount]
    ADD CONSTRAINT [DF_BankDep_BankAccount_DefaultProcessStatus] DEFAULT ((1)) FOR [DefaultProcessStatus];


GO



ALTER TABLE [dbo].[BankDep_BankAccount]
    ADD CONSTRAINT [DF_BankDep_BankAccount_KmsAccount] DEFAULT ((0)) FOR [IsKmsAccount];


GO



ALTER TABLE [dbo].[BankDep_BankAccount]
    ADD CONSTRAINT [PK_BankDep_BankAccounts] PRIMARY KEY CLUSTERED ([BankAccId] ASC);


GO



