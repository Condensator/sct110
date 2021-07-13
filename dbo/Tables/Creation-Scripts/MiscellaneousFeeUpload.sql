CREATE TABLE [dbo].[MiscellaneousFeeUpload] (
    [Id]                     INT            NOT NULL,
    [EntityId]               INT            NOT NULL,
    [SystemId]               INT            NOT NULL,
    [MiscellaneousFeeFileId] INT            NOT NULL,
    [MiscellaneousProductId] INT            NOT NULL,
    [DocumentType]           NVARCHAR (50)  NOT NULL,
    [TransactionType]        NVARCHAR (50)  NOT NULL,
    [PostDate]               DATETIME       NOT NULL,
    [DateReceived]           DATETIME       NOT NULL,
    [Reference]              NVARCHAR (100) NOT NULL,
    [AmountExcl]             MONEY          NOT NULL,
    [VatPercentage]          MONEY          NOT NULL,
    [CalculatedVat]          BIT            NOT NULL,
    [ProcessStatus]          INT            NOT NULL,
    [ProcessDate]            DATETIME       NULL
);


GO

ALTER TABLE [dbo].[MiscellaneousFeeUpload]
    ADD CONSTRAINT [DF__Miscellan__Proce__24FE18DB] DEFAULT ((0)) FOR [ProcessStatus];


GO



ALTER TABLE [dbo].[MiscellaneousFeeUpload]
    ADD CONSTRAINT [FK_MiscellaneousFeeUpload_MiscellaneousFeeFile] FOREIGN KEY ([MiscellaneousFeeFileId]) REFERENCES [dbo].[MiscellaneousFeeFile] ([Id]);


GO



ALTER TABLE [dbo].[MiscellaneousFeeUpload]
    ADD CONSTRAINT [FK_MiscellaneousFeeUpload_MiscellaneousFeeProcessStatus] FOREIGN KEY ([ProcessStatus]) REFERENCES [dbo].[CashDepositFeeProcessStatus] ([Id]);


GO



CREATE NONCLUSTERED INDEX [IX_MiscellaneousFeeUpload_EntityId_MiscellaneousFeeFileId_DocumentType_ProcessStatus]
    ON [dbo].[MiscellaneousFeeUpload]([EntityId] ASC, [MiscellaneousFeeFileId] ASC, [DocumentType] ASC, [ProcessStatus] ASC)
    INCLUDE([Id], [MiscellaneousProductId], [Reference], [AmountExcl], [VatPercentage], [CalculatedVat]);


GO



CREATE NONCLUSTERED INDEX [ndxMiscFeeFileIdProcessStatus_Include]
    ON [dbo].[MiscellaneousFeeUpload]([MiscellaneousFeeFileId] ASC, [ProcessStatus] ASC)
    INCLUDE([Id], [EntityId], [DocumentType], [PostDate], [AmountExcl], [ProcessDate]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[MiscellaneousFeeUpload]
    ADD CONSTRAINT [PK_MiscellaneousFeeUpload] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



