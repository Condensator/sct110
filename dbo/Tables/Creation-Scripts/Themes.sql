CREATE TABLE [dbo].[Themes] (
    [ID]          INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Description] VARCHAR (250)   NULL,
    [CssFilename] VARCHAR (250)   NULL,
    [ReportImage] VARBINARY (MAX) NULL
);


GO

ALTER TABLE [dbo].[Themes]
    ADD CONSTRAINT [PK_Themes] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO



