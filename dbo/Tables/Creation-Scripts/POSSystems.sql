CREATE TABLE [dbo].[POSSystems] (
    [Id]        INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DevId]     INT           NULL,
    [DataPath]  VARCHAR (255) NULL,
    [DBUser]    VARCHAR (30)  NULL,
    [DBPass]    VARCHAR (30)  NULL,
    [IsDeleted] BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[POSSystems]
    ADD CONSTRAINT [DF_POSSystems_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



