CREATE TABLE [dbo].[POSUsers] (
    [Id]        INT IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [UsrId]     INT NULL,
    [PosUserId] INT NULL,
    [IsDeleted] BIT NOT NULL
);


GO

ALTER TABLE [dbo].[POSUsers]
    ADD CONSTRAINT [DF_POSUsers_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



