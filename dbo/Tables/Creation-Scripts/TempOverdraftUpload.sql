CREATE TABLE [dbo].[TempOverdraftUpload] (
    [Id]                  INT      IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [AccountId]           INT      NOT NULL,
    [SystemId]            INT      NOT NULL,
    [TempOverdraftFileId] INT      NOT NULL,
    [PostDate]            DATETIME NOT NULL,
    [DateReceived]        DATETIME NOT NULL,
    [Amount]              MONEY    NOT NULL,
    [OverdraftDays]       INT      NOT NULL,
    [ProcessStatus]       INT      NOT NULL,
    [ProcessDate]         DATETIME NULL
);


GO

ALTER TABLE [dbo].[TempOverdraftUpload]
    ADD CONSTRAINT [DF__TempOverd__Proce__59D33482] DEFAULT ((0)) FOR [ProcessStatus];


GO



ALTER TABLE [dbo].[TempOverdraftUpload]
    ADD CONSTRAINT [FK_TempOverdraftUpload_TempOverdraftFile] FOREIGN KEY ([TempOverdraftFileId]) REFERENCES [dbo].[TempOverdraftFile] ([Id]);


GO



ALTER TABLE [dbo].[TempOverdraftUpload]
    ADD CONSTRAINT [PK_TempOverdraftUpload] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



