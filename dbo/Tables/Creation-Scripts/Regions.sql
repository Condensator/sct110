CREATE TABLE [dbo].[Regions] (
    [RegionID]   INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [RegionName] VARCHAR (50) NOT NULL,
    [SalesRepId] INT          NOT NULL,
    [IsDeleted]  BIT          NOT NULL
);


GO

ALTER TABLE [dbo].[Regions]
    ADD CONSTRAINT [DF_Regions_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[Regions]
    ADD CONSTRAINT [DF_Regions_SalesRepID] DEFAULT ((1)) FOR [SalesRepId];


GO



ALTER TABLE [dbo].[Regions]
    ADD CONSTRAINT [FK_Regions_SalesReps] FOREIGN KEY ([SalesRepId]) REFERENCES [dbo].[SalesReps] ([SalesRepId]);


GO



ALTER TABLE [dbo].[Regions]
    ADD CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED ([RegionID] ASC) WITH (FILLFACTOR = 90);


GO



