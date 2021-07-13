CREATE TABLE [dbo].[TempOverdraftFile] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [FileDate]      DATETIME       NOT NULL,
    [FileName]      NVARCHAR (250) NULL,
    [FileData]      IMAGE          NOT NULL,
    [UserName]      NVARCHAR (250) NOT NULL,
    [ProcessStatus] INT            NOT NULL,
    [ProcessDate]   DATETIME       NULL
);


GO

ALTER TABLE [dbo].[TempOverdraftFile]
    ADD CONSTRAINT [DF__TempOverd__Proce__56F6C7D7] DEFAULT ((0)) FOR [ProcessStatus];


GO



ALTER TABLE [dbo].[TempOverdraftFile]
    ADD CONSTRAINT [PK_TempOverdraftFile] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



