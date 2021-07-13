CREATE TABLE [dbo].[ProductPrefixes] (
    [Id]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [PrefixName]  VARCHAR (20) NOT NULL,
    [PrefixCode]  CHAR (10)    NOT NULL,
    [ProductId]   BIGINT       NOT NULL,
    [ProductName] VARCHAR (50) NOT NULL
);


GO

ALTER TABLE [dbo].[ProductPrefixes]
    ADD CONSTRAINT [PK_ProductPrefixes] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



