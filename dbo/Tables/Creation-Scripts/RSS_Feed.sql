CREATE TABLE [dbo].[RSS_Feed] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (256) NOT NULL,
    [Link]        VARCHAR (64)  NOT NULL,
    [Header]      VARCHAR (64)  NOT NULL,
    [PublishDate] DATETIME      NOT NULL
);


GO

ALTER TABLE [dbo].[RSS_Feed]
    ADD CONSTRAINT [DF_RSS_Feed_Link] DEFAULT ('') FOR [Link];


GO



ALTER TABLE [dbo].[RSS_Feed]
    ADD CONSTRAINT [DF_RSS_Feed_PublishDate] DEFAULT (getdate()) FOR [PublishDate];


GO



ALTER TABLE [dbo].[RSS_Feed]
    ADD CONSTRAINT [PK_RSS_Feed] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO



