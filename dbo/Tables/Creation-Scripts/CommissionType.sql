CREATE TABLE [dbo].[CommissionType] (
    [Id]          INT           NOT NULL,
    [Description] VARCHAR (250) NULL,
    [IsDeleted]   BIT           NULL
);


GO

ALTER TABLE [dbo].[CommissionType]
    ADD CONSTRAINT [PK_CommissionType] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



