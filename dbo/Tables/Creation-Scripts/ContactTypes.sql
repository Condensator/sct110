CREATE TABLE [dbo].[ContactTypes] (
    [ContactTypeID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ContactType]   VARCHAR (20) NOT NULL,
    [IsDeleted]     BIT          NOT NULL
);


GO

ALTER TABLE [dbo].[ContactTypes]
    ADD CONSTRAINT [DF_ContactTypes_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[ContactTypes]
    ADD CONSTRAINT [PK_ContactTypes] PRIMARY KEY CLUSTERED ([ContactTypeID] ASC) WITH (FILLFACTOR = 90);


GO



