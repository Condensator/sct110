CREATE TABLE [dbo].[Municipality] (
    [Id]           INT          NOT NULL,
    [Municipality] VARCHAR (32) NOT NULL,
    [TrxTypeId]    INT          NOT NULL,
    [XMLTrxTypeId] INT          NULL,
    [Enabled]      BIT          NULL
);


GO

ALTER TABLE [dbo].[Municipality]
    ADD CONSTRAINT [PK_Municipality] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



