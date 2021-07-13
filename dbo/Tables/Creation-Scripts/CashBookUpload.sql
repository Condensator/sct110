CREATE TABLE [dbo].[CashBookUpload] (
    [id]            INT             IDENTITY (1, 1) NOT NULL,
    [TransactionId] NVARCHAR (100)  NOT NULL,
    [BankAccId]     INT             NOT NULL,
    [AccId]         INT             NOT NULL,
    [Received]      DATETIME        NOT NULL,
    [Amount]        MONEY           NOT NULL,
    [Reference]     NVARCHAR (1024) NOT NULL,
    [CashBookId]    INT             NULL,
    [PaymentType]   VARCHAR (20)    NULL
);


GO

CREATE NONCLUSTERED INDEX [ndxTransactionid]
    ON [dbo].[CashBookUpload]([TransactionId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[CashBookUpload]
    ADD CONSTRAINT [DF_CashBookUpload_Received] DEFAULT (getdate()) FOR [Received];


GO



ALTER TABLE [dbo].[CashBookUpload]
    ADD CONSTRAINT [FK_CashbookUpload_BankAccounts] FOREIGN KEY ([BankAccId]) REFERENCES [dbo].[BankAccounts] ([BankAccId]);


GO



ALTER TABLE [dbo].[CashBookUpload]
    ADD CONSTRAINT [FK_CashbookUpload_CashBook] FOREIGN KEY ([CashBookId]) REFERENCES [dbo].[Cashbook] ([CshId]);


GO



ALTER TABLE [dbo].[CashBookUpload]
    ADD CONSTRAINT [PK__CashBook__3213E83E0B48CC0D] PRIMARY KEY NONCLUSTERED ([id] ASC) WITH (FILLFACTOR = 90) ON [AEON_NC_Index_FG];


GO



