CREATE TABLE [dbo].[VasCategory] (
    [CatID]       INT          NOT NULL,
    [Description] VARCHAR (50) NULL
);


GO

ALTER TABLE [dbo].[VasCategory]
    ADD CONSTRAINT [PK_VasCategory] PRIMARY KEY CLUSTERED ([CatID] ASC) WITH (FILLFACTOR = 90);


GO



