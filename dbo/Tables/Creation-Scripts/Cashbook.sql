CREATE TABLE [dbo].[Cashbook] (
    [CshId]            INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Description]      VARCHAR (256)  NOT NULL,
    [Type]             CHAR (1)       NOT NULL,
    [Amount]           MONEY          NOT NULL,
    [DateTime]         DATETIME       NOT NULL,
    [AccId]            INT            NOT NULL,
    [BankAccId]        INT            NOT NULL,
    [PaymentType]      VARCHAR (50)   NOT NULL,
    [AccTransId]       INT            NOT NULL,
    [ReversalID]       INT            NULL,
    [TransferId]       INT            NULL,
    [CashDepositTrxId] BIGINT         NULL,
    [CrmCaseNumber]    NVARCHAR (50)  NULL,
    [Username]         NVARCHAR (250) NULL
);


GO

CREATE NONCLUSTERED INDEX [index_186_185_Cashbook]
    ON [dbo].[Cashbook]([DateTime] ASC)
    INCLUDE([CshId], [Type], [Amount], [BankAccId], [AccTransId]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [index_292_291_Cashbook]
    ON [dbo].[Cashbook]([DateTime] ASC)
    INCLUDE([CshId], [Type], [Amount], [AccId], [BankAccId], [AccTransId]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [index_682_681_Cashbook]
    ON [dbo].[Cashbook]([AccTransId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [index_979_978_Cashbook]
    ON [dbo].[Cashbook]([ReversalID] ASC)
    INCLUDE([CshId]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [IX_Cashbook_AccId_ReversalID_TransferId_Amount_DateTime]
    ON [dbo].[Cashbook]([AccId] ASC, [ReversalID] ASC, [TransferId] ASC, [Amount] ASC, [DateTime] ASC)
    INCLUDE([CshId], [Description], [BankAccId]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxCBAccId]
    ON [dbo].[Cashbook]([AccId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[Cashbook]
    ADD CONSTRAINT [FK_Cashbook_Accounts] FOREIGN KEY ([AccId]) REFERENCES [dbo].[Accounts] ([AccId]);


GO



ALTER TABLE [dbo].[Cashbook]
    ADD CONSTRAINT [FK_Cashbook_AccTrans] FOREIGN KEY ([AccTransId]) REFERENCES [dbo].[AccTrans] ([TransId]);


GO



ALTER TABLE [dbo].[Cashbook]
    ADD CONSTRAINT [FK_Cashbook_BankAccounts] FOREIGN KEY ([BankAccId]) REFERENCES [dbo].[BankAccounts] ([BankAccId]);


GO



ALTER TABLE [dbo].[Cashbook]
    ADD CONSTRAINT [FK_Cashbook_CashDepositTrx] FOREIGN KEY ([CashDepositTrxId]) REFERENCES [dbo].[CashDepositTrx] ([Id]);


GO



ALTER TABLE [dbo].[Cashbook]
    ADD CONSTRAINT [PK_Cashbook] PRIMARY KEY CLUSTERED ([CshId] ASC) WITH (FILLFACTOR = 90);


GO



