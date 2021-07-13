CREATE TABLE [dbo].[CommissionStructures] (
    [ID]          INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Description] VARCHAR (250) NULL,
    [IsDeleted]   BIT           NULL
);


GO

ALTER TABLE [dbo].[CommissionStructures]
    ADD CONSTRAINT [DF_CommissionStructures_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[CommissionStructures]
    ADD CONSTRAINT [PK_CommissionStructures] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO



