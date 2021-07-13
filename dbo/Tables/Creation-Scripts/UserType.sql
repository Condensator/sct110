CREATE TABLE [dbo].[UserType] (
    [Id]          INT          NOT NULL,
    [Description] VARCHAR (20) NOT NULL
);


GO

ALTER TABLE [dbo].[UserType]
    ADD CONSTRAINT [PK__UserType__3214EC07754180C3] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



