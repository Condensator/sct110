CREATE TABLE [dbo].[VasRegion] (
    [RegionID]    INT           NOT NULL,
    [Description] NVARCHAR (50) NULL
);


GO

ALTER TABLE [dbo].[VasRegion]
    ADD CONSTRAINT [PK_VasRegion] PRIMARY KEY CLUSTERED ([RegionID] ASC) WITH (FILLFACTOR = 90);


GO



