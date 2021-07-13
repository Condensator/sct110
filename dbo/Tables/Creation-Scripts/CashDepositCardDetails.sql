CREATE TABLE [dbo].[CashDepositCardDetails] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [AccountsAccId] INT            NOT NULL,
    [ClientCode]    NVARCHAR (20)  NOT NULL,
    [CardName]      NVARCHAR (255) NOT NULL,
    [CardNumber]    BIGINT         NOT NULL
);


GO

ALTER TABLE [dbo].[CashDepositCardDetails]
    ADD CONSTRAINT [FK_CashDepositCardDetails_Accounts] FOREIGN KEY ([AccountsAccId]) REFERENCES [dbo].[Accounts] ([AccId]);


GO



ALTER TABLE [dbo].[CashDepositCardDetails]
    ADD CONSTRAINT [PK_CashDepositCardDetails] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



