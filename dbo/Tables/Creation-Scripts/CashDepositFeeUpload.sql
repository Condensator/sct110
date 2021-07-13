CREATE TABLE [dbo].[CashDepositFeeUpload] (
    [Id]                     INT            NOT NULL,
    [EntityId]               INT            NOT NULL,
    [SystemId]               INT            NOT NULL,
    [CashDepositFeeFileId]   INT            NOT NULL,
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

ALTER TABLE [dbo].[CashDepositFeeUpload]
    ADD CONSTRAINT [DF__CashDepos__Proce__3BE08112] DEFAULT ((0)) FOR [ProcessStatus];


GO



ALTER TABLE [dbo].[CashDepositFeeUpload]
    ADD CONSTRAINT [FK_CashDepositFeeUpload_CashDepositFeeFile] FOREIGN KEY ([CashDepositFeeFileId]) REFERENCES [dbo].[CashDepositFeeFile] ([Id]);


GO



ALTER TABLE [dbo].[CashDepositFeeUpload]
    ADD CONSTRAINT [FK_CashDepositFeeUpload_CashDepositFeeProcessStatus] FOREIGN KEY ([ProcessStatus]) REFERENCES [dbo].[CashDepositFeeProcessStatus] ([Id]);


GO



ALTER TABLE [dbo].[CashDepositFeeUpload]
    ADD CONSTRAINT [PK_CashDepositFeeUpload] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



