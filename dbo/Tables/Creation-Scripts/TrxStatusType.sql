CREATE TABLE [dbo].[TrxStatusType] (
    [Id]          INT          NOT NULL,
    [Description] VARCHAR (50) NULL
);


GO

ALTER TABLE [dbo].[TrxStatusType]
    ADD CONSTRAINT [PK_TrxStatusType] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



