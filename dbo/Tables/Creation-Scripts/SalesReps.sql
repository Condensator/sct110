CREATE TABLE [dbo].[SalesReps] (
    [SalesRepId]    INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [SalesRepName]  VARCHAR (50) NOT NULL,
    [ContactNumber] VARCHAR (15) NULL,
    [ContactID]     INT          NOT NULL,
    [IsDeleted]     BIT          NOT NULL
);


GO

ALTER TABLE [dbo].[SalesReps]
    ADD CONSTRAINT [DF_SalesReps_ContactID] DEFAULT ((1)) FOR [ContactID];


GO



ALTER TABLE [dbo].[SalesReps]
    ADD CONSTRAINT [DF_SalesReps_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[SalesReps]
    ADD CONSTRAINT [PK_SalesReps] PRIMARY KEY CLUSTERED ([SalesRepId] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO



