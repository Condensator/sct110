CREATE TABLE [dbo].[CashBookUnAllocated] (
    [Id]            INT             IDENTITY (1, 1) NOT NULL,
    [TransactionId] NVARCHAR (100)  NOT NULL,
    [BankAccId]     INT             NOT NULL,
    [UserName]      NVARCHAR (256)  NOT NULL,
    [AccId]         INT             NOT NULL,
    [Received]      DATETIME        NOT NULL,
    [Processed]     DATETIME        NULL,
    [Amount]        MONEY           NOT NULL,
    [Reference]     NVARCHAR (1024) NOT NULL,
    [CashBookId]    INT             NULL,
    [ProcessStatus] INT             NOT NULL,
    [PaymentType]   VARCHAR (20)    NULL
);


GO

CREATE NONCLUSTERED INDEX [index_45_44_CashBookUnAllocated]
    ON [dbo].[CashBookUnAllocated]([TransactionId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[CashBookUnAllocated]
    ADD CONSTRAINT [DF__CashBookU__Proce__77B6D4AC] DEFAULT ((0)) FOR [ProcessStatus];


GO



ALTER TABLE [dbo].[CashBookUnAllocated]
    ADD CONSTRAINT [FK_CashBookUnAllocated_CashBook] FOREIGN KEY ([CashBookId]) REFERENCES [dbo].[Cashbook] ([CshId]);


GO



ALTER TABLE [dbo].[CashBookUnAllocated]
    ADD CONSTRAINT [PK_CashBookUnknown_Id] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



