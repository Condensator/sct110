CREATE TABLE [dbo].[BusProduct] (
    [Id]     INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Type]   VARCHAR (4)  NOT NULL,
    [Period] VARCHAR (32) NOT NULL,
    [Cost]   MONEY        NOT NULL
);


GO

ALTER TABLE [dbo].[BusProduct]
    ADD CONSTRAINT [PK_BusProduct] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



