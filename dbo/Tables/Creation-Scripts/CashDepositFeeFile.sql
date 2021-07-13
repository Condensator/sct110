CREATE TABLE [dbo].[CashDepositFeeFile] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [FileDate]      DATETIME       NOT NULL,
    [FileName]      NVARCHAR (250) NULL,
    [FileData]      IMAGE          NOT NULL,
    [UserName]      NVARCHAR (250) NOT NULL,
    [ProcessStatus] INT            NOT NULL,
    [ProcessDate]   DATETIME       NULL
);


GO

ALTER TABLE [dbo].[CashDepositFeeFile]
    ADD CONSTRAINT [DF__CashDepos__Proce__343F5F4A] DEFAULT ((0)) FOR [ProcessStatus];


GO



ALTER TABLE [dbo].[CashDepositFeeFile]
    ADD CONSTRAINT [PK_CashDepositFeeFile] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



