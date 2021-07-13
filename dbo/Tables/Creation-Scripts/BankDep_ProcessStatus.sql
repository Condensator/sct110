CREATE TABLE [dbo].[BankDep_ProcessStatus] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [ProcessStatus] VARCHAR (50) NOT NULL
);


GO

ALTER TABLE [dbo].[BankDep_ProcessStatus]
    ADD CONSTRAINT [PK_ProcessStatus] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



