CREATE TABLE [dbo].[SourceBank] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [Name]          VARCHAR (50) NOT NULL,
    [ProcessPrefix] VARCHAR (15) NOT NULL
);


GO

ALTER TABLE [dbo].[SourceBank]
    ADD CONSTRAINT [DF__SourceBan__Proce__100D812A] DEFAULT ('') FOR [ProcessPrefix];


GO



ALTER TABLE [dbo].[SourceBank]
    ADD CONSTRAINT [PK__SourceBa__3214EC0703A7AA45] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



