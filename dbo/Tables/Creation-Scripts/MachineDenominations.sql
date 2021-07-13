CREATE TABLE [dbo].[MachineDenominations] (
    [Id]          INT          NOT NULL,
    [MoneyType]   INT          NOT NULL,
    [Description] VARCHAR (20) NOT NULL,
    [Num]         INT          NOT NULL,
    [Value]       MONEY        NOT NULL
);


GO

ALTER TABLE [dbo].[MachineDenominations]
    ADD CONSTRAINT [PK_MachineDenominations] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



