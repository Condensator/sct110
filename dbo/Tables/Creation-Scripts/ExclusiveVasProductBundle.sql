CREATE TABLE [dbo].[ExclusiveVasProductBundle] (
    [Id]           INT IDENTITY (1, 1) NOT NULL,
    [VASProductId] INT NOT NULL,
    [EntityEntId]  INT NOT NULL
);


GO

ALTER TABLE [dbo].[ExclusiveVasProductBundle]
    ADD CONSTRAINT [FK_ExclusiveVasProductBundle_Entity] FOREIGN KEY ([EntityEntId]) REFERENCES [dbo].[Entity] ([EntId]);


GO



ALTER TABLE [dbo].[ExclusiveVasProductBundle]
    ADD CONSTRAINT [FK_ExclusiveVasProductBundle_ExclusiveVasProductBundle] FOREIGN KEY ([VASProductId]) REFERENCES [dbo].[VASProduct] ([Id]);


GO



ALTER TABLE [dbo].[ExclusiveVasProductBundle]
    ADD CONSTRAINT [PK_ExclusiveVasProductBundle] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



