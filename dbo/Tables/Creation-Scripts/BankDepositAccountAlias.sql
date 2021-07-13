CREATE TABLE [dbo].[BankDepositAccountAlias] (
    [Idx]                         INT           IDENTITY (1, 1) NOT NULL,
    [BankDepositAccountReference] INT           NOT NULL,
    [Alias]                       NVARCHAR (10) NOT NULL
);


GO

ALTER TABLE [dbo].[BankDepositAccountAlias]
    ADD CONSTRAINT [FK_BankDepositAccountAlias_BankDepositAccountReference] FOREIGN KEY ([BankDepositAccountReference]) REFERENCES [dbo].[BankDepositAccountReference] ([Idx]);


GO



ALTER TABLE [dbo].[BankDepositAccountAlias]
    ADD CONSTRAINT [PK_BankDepositAccountAlias] PRIMARY KEY CLUSTERED ([Idx] ASC);


GO



