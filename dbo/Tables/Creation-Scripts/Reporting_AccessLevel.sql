CREATE TABLE [dbo].[Reporting_AccessLevel] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (256) NOT NULL
);


GO

ALTER TABLE [dbo].[Reporting_AccessLevel]
    ADD CONSTRAINT [PK_Reporting_AccessLevel] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO



