CREATE TABLE [dbo].[BulkDepositTransferFile] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [FileDate]      DATETIME       NOT NULL,
    [FileName]      NVARCHAR (250) NULL,
    [FileData]      IMAGE          NOT NULL,
    [UserName]      NVARCHAR (250) NOT NULL,
    [ProcessStatus] INT            NOT NULL,
    [CashBookId]    INT            NOT NULL,
    [ProcessDate]   DATETIME       NULL
);


GO

ALTER TABLE [dbo].[BulkDepositTransferFile]
    ADD CONSTRAINT [DF__BulkDepos__CashB__3C18127E] DEFAULT ((0)) FOR [CashBookId];


GO



ALTER TABLE [dbo].[BulkDepositTransferFile]
    ADD CONSTRAINT [DF__BulkDepos__Proce__3B23EE45] DEFAULT ((0)) FOR [ProcessStatus];


GO



ALTER TABLE [dbo].[BulkDepositTransferFile]
    ADD CONSTRAINT [PK_BulkDepositTransferFile] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



