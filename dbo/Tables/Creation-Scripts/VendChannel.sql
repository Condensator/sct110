CREATE TABLE [dbo].[VendChannel] (
    [Id]          INT            NOT NULL,
    [Description] NVARCHAR (256) NOT NULL,
    [IsDefault]   BIT            NOT NULL
);


GO

ALTER TABLE [dbo].[VendChannel]
    ADD CONSTRAINT [PK__VendChan__3214EC07A62FEDCF] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



