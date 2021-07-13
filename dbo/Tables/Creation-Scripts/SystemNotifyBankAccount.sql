CREATE TABLE [dbo].[SystemNotifyBankAccount] (
    [SystemId]      INT          NOT NULL,
    [SourceBankId]  INT          NOT NULL,
    [AccountNumber] VARCHAR (50) NOT NULL
);


GO

ALTER TABLE [dbo].[SystemNotifyBankAccount]
    ADD CONSTRAINT [FK_SystemNotifyBankAccount_SourceBank] FOREIGN KEY ([SourceBankId]) REFERENCES [dbo].[SourceBank] ([Id]);


GO



CREATE CLUSTERED INDEX [ndxSystemNotifyBankAccountAccountNumber]
    ON [dbo].[SystemNotifyBankAccount]([AccountNumber] ASC);


GO



