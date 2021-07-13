CREATE TABLE [dbo].[BankDepositAccountReference] (
    [Idx]           INT       IDENTITY (1, 1) NOT NULL,
    [AccountPrefix] NCHAR (3) NOT NULL
);


GO

ALTER TABLE [dbo].[BankDepositAccountReference]
    ADD CONSTRAINT [PK_BankDepositAccountReference] PRIMARY KEY CLUSTERED ([Idx] ASC);


GO



