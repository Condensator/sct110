CREATE TABLE [dbo].[Policy] (
    [Id]              INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [PolicyNumber]    VARCHAR (17) NOT NULL,
    [FirstNames]      VARCHAR (50) NOT NULL,
    [Surname]         VARCHAR (30) NOT NULL,
    [cellphoneNumber] VARCHAR (10) NOT NULL,
    [IdNumber]        VARCHAR (13) NOT NULL
);


GO

ALTER TABLE [dbo].[Policy]
    ADD CONSTRAINT [PK_Policy] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



