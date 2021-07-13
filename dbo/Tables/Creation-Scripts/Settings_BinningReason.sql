CREATE TABLE [dbo].[Settings_BinningReason] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [BinningReason] VARCHAR (150) NULL,
    [IsDeleted]     BIT           NULL
);


GO

ALTER TABLE [dbo].[Settings_BinningReason]
    ADD CONSTRAINT [DF__Settings___IsDel__55BD84DE] DEFAULT ((0)) FOR [IsDeleted];


GO



