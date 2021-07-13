CREATE TABLE [dbo].[AccountOptions] (
    [AccId]               INT NOT NULL,
    [AutoBalanceClearing] BIT NOT NULL,
    [TransferAccId]       INT NOT NULL,
    [TransferTerms]       INT NOT NULL
);


GO

ALTER TABLE [dbo].[AccountOptions]
    ADD CONSTRAINT [FK_AccountOptions_Accounts] FOREIGN KEY ([AccId]) REFERENCES [dbo].[Accounts] ([AccId]);


GO



ALTER TABLE [dbo].[AccountOptions]
    ADD CONSTRAINT [PK_AccountOptions] PRIMARY KEY CLUSTERED ([AccId] ASC) WITH (FILLFACTOR = 90);


GO



