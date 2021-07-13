CREATE TABLE [dbo].[Addres] (
    [AddId]     INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Address1]  VARCHAR (80) NULL,
    [Address2]  VARCHAR (80) NULL,
    [Address3]  VARCHAR (80) NULL,
    [Address4]  VARCHAR (80) NULL,
    [Code]      VARCHAR (10) NULL,
    [RegionId]  INT          NOT NULL,
    [IsDeleted] BIT          NOT NULL,
    [Latitude]  VARCHAR (50) NULL,
    [Longitude] VARCHAR (50) NULL
);


GO

ALTER TABLE [dbo].[Addres]
    ADD CONSTRAINT [DF_Addres_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[Addres]
    ADD CONSTRAINT [DF_Addres_RegionId] DEFAULT ((0)) FOR [RegionId];


GO



ALTER TABLE [dbo].[Addres]
    ADD CONSTRAINT [FK_Addres_Regions] FOREIGN KEY ([RegionId]) REFERENCES [dbo].[Regions] ([RegionID]);


GO



ALTER TABLE [dbo].[Addres]
    ADD CONSTRAINT [PK_Addres] PRIMARY KEY CLUSTERED ([AddId] ASC) WITH (FILLFACTOR = 90);


GO



