CREATE TABLE [dbo].[CashDepositNoteCount] (
    [Id]               BIGINT          IDENTITY (1, 1) NOT NULL,
    [CashDepositTrxId] BIGINT          NOT NULL,
    [Currency]         NVARCHAR (5)    NOT NULL,
    [Denomination]     DECIMAL (18, 2) NOT NULL,
    [NumberOfNotes]    INT             NOT NULL
);


GO

ALTER TABLE [dbo].[CashDepositNoteCount]
    ADD CONSTRAINT [FK_CashDepositNoteCount_CashDepositTrx] FOREIGN KEY ([CashDepositTrxId]) REFERENCES [dbo].[CashDepositTrx] ([Id]);


GO



ALTER TABLE [dbo].[CashDepositNoteCount]
    ADD CONSTRAINT [PK_CashDepositNoteCount] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



