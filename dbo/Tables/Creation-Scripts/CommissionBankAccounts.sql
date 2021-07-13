CREATE TABLE [dbo].[CommissionBankAccounts] (
    [AccountsId]     INT NOT NULL,
    [BankAccountsId] INT NOT NULL
);


GO

ALTER TABLE [dbo].[CommissionBankAccounts]
    ADD CONSTRAINT [FK_CommissionBankAccounts_Accounts] FOREIGN KEY ([AccountsId]) REFERENCES [dbo].[Accounts] ([AccId]);


GO



ALTER TABLE [dbo].[CommissionBankAccounts]
    ADD CONSTRAINT [FK_CommissionBankAccounts_BankAccounts] FOREIGN KEY ([BankAccountsId]) REFERENCES [dbo].[BankAccounts] ([BankAccId]);


GO



ALTER TABLE [dbo].[CommissionBankAccounts]
    ADD CONSTRAINT [PK_CommissionBankAccounts] PRIMARY KEY CLUSTERED ([AccountsId] ASC);


GO



