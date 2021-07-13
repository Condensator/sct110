CREATE TABLE [dbo].[Favourites] (
    [Id]        INT          IDENTITY (1, 1) NOT NULL,
    [TrxGroup]  VARCHAR (50) NULL,
    [TrxType]   VARCHAR (50) NULL,
    [ProductId] VARCHAR (50) NULL,
    [TrxTypeId] INT          NULL
);


GO

ALTER TABLE [dbo].[Favourites]
    ADD CONSTRAINT [PK__Favourit__3214EC07753C98D7] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



