CREATE TABLE [dbo].[MiscellaneousFeeFile] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [FileDate]      DATETIME       NOT NULL,
    [FileName]      NVARCHAR (250) NULL,
    [FileData]      IMAGE          NOT NULL,
    [UserName]      NVARCHAR (250) NULL,
    [ProcessStatus] INT            NOT NULL,
    [ProcessDate]   DATETIME       NULL
);


GO

ALTER TABLE [dbo].[MiscellaneousFeeFile]
    ADD CONSTRAINT [DF__Miscellan__Proce__2221AC30] DEFAULT ((0)) FOR [ProcessStatus];


GO



ALTER TABLE [dbo].[MiscellaneousFeeFile]
    ADD CONSTRAINT [PK_MiscellaneousFeeFile] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



