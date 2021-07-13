CREATE TABLE [dbo].[BadDebtStatus] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (50) NOT NULL,
    [IsDeleted]   BIT           NOT NULL
);


GO

CREATE CLUSTERED INDEX [ClusteredIndex-20180801-175105]
    ON [dbo].[BadDebtStatus]([Id] ASC);


GO



ALTER TABLE [dbo].[BadDebtStatus]
    ADD CONSTRAINT [DF__BadDebtSt__IsDel__4D283EDD] DEFAULT ((0)) FOR [IsDeleted];


GO



