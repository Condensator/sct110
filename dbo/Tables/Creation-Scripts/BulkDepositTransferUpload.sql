CREATE TABLE [dbo].[BulkDepositTransferUpload] (
    [Id]                        INT      IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [AccountId]                 INT      NOT NULL,
    [BulkDepositTransferFileId] INT      NOT NULL,
    [PostDate]                  DATETIME NOT NULL,
    [DateReceived]              DATETIME NOT NULL,
    [Amount]                    MONEY    NOT NULL,
    [ProcessStatus]             INT      NOT NULL,
    [ProcessDate]               DATETIME NULL
);


GO

ALTER TABLE [dbo].[BulkDepositTransferUpload]
    ADD CONSTRAINT [DF__BulkDepos__Proce__3EF47F29] DEFAULT ((0)) FOR [ProcessStatus];


GO



ALTER TABLE [dbo].[BulkDepositTransferUpload]
    ADD CONSTRAINT [FK_BulkDepositTransferUpload_BulkDepositTransferFile] FOREIGN KEY ([BulkDepositTransferFileId]) REFERENCES [dbo].[BulkDepositTransferFile] ([Id]);


GO



ALTER TABLE [dbo].[BulkDepositTransferUpload]
    ADD CONSTRAINT [PK_BulkDepositTransferUpload] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



