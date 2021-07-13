CREATE TABLE [dbo].[BankNotify] (
    [Id]              BIGINT        IDENTITY (1, 1) NOT NULL,
    [SourceBankId]    INT           NOT NULL,
    [AccountNumber]   VARCHAR (50)  NOT NULL,
    [TransactionId]   VARCHAR (100) NULL,
    [Reference]       VARCHAR (100) NOT NULL,
    [TransactionType] VARCHAR (1)   NOT NULL,
    [Amount]          MONEY         NOT NULL,
    [EffectiveDate]   DATETIME      NULL,
    [FromNotify]      BIT           NOT NULL,
    [FromStatement]   BIT           NOT NULL,
    [DateReceived]    DATETIME      NULL,
    [ProcessedStatus] INT           NOT NULL,
    [ProcessedDate]   DATETIME      NULL,
    [StatementId]     VARCHAR (100) NULL,
    [StatementText]   VARCHAR (250) NULL,
    [TransactionCode] VARCHAR (50)  NULL,
    [ReturnCode]      VARCHAR (10)  NULL,
    [IsDuplicate]     BIT           NULL
);


GO

CREATE NONCLUSTERED INDEX [IX_BankNotify_ProcessedStatus_SourceBankId]
    ON [dbo].[BankNotify]([ProcessedStatus] ASC, [SourceBankId] ASC)
    INCLUDE([Id], [AccountNumber]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxbanknotify]
    ON [dbo].[BankNotify]([SourceBankId] ASC, [AccountNumber] ASC, [TransactionType] ASC, [EffectiveDate] ASC, [Reference] ASC, [Amount] ASC, [TransactionId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxBanknotify2]
    ON [dbo].[BankNotify]([SourceBankId] ASC, [AccountNumber] ASC, [TransactionId] ASC, [TransactionType] ASC, [Amount] ASC, [EffectiveDate] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxBanknotify3]
    ON [dbo].[BankNotify]([SourceBankId] ASC, [AccountNumber] ASC, [TransactionType] ASC, [Amount] ASC, [EffectiveDate] ASC, [StatementId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxReference]
    ON [dbo].[BankNotify]([Reference] ASC)
    INCLUDE([Id], [SourceBankId], [AccountNumber], [TransactionId], [TransactionType], [Amount], [EffectiveDate], [FromNotify], [FromStatement], [DateReceived], [ProcessedStatus], [ProcessedDate], [StatementId], [StatementText], [TransactionCode], [ReturnCode], [IsDuplicate]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[BankNotify]
    ADD CONSTRAINT [DF_BankNotify_DateReceveived] DEFAULT (getdate()) FOR [DateReceived];


GO



ALTER TABLE [dbo].[BankNotify]
    ADD CONSTRAINT [DF_BankNotify_FromNotify] DEFAULT ((0)) FOR [FromNotify];


GO



ALTER TABLE [dbo].[BankNotify]
    ADD CONSTRAINT [DF_BankNotify_FromStatement] DEFAULT ((0)) FOR [FromStatement];


GO



ALTER TABLE [dbo].[BankNotify]
    ADD CONSTRAINT [DF_BankNotify_IsDuplicate] DEFAULT ((0)) FOR [IsDuplicate];


GO



ALTER TABLE [dbo].[BankNotify]
    ADD CONSTRAINT [DF_BankNotify_ProcessedStatus] DEFAULT ((0)) FOR [ProcessedStatus];


GO



ALTER TABLE [dbo].[BankNotify]
    ADD CONSTRAINT [FK_BankNotify_SourceBank] FOREIGN KEY ([SourceBankId]) REFERENCES [dbo].[SourceBank] ([Id]);


GO



ALTER TABLE [dbo].[BankNotify]
    ADD CONSTRAINT [PK_BankNoti__3214EC076FE99F9F] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



