CREATE TABLE [dbo].[POSTerminals] (
    [Id]        INT IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DevId]     INT NULL,
    [PosTermId] INT NULL,
    [IsDeleted] BIT NOT NULL
);


GO

ALTER TABLE [dbo].[POSTerminals]
    ADD CONSTRAINT [DF_POSTerminals_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



