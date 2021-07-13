CREATE TABLE [dbo].[VasID] (
    [ProdID]   INT NOT NULL,
    [CatID]    INT NOT NULL,
    [RegionID] INT NOT NULL
);


GO

CREATE CLUSTERED INDEX [ClusteredIndex-20180801-174426]
    ON [dbo].[VasID]([ProdID] ASC);


GO



