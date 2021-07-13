CREATE TABLE [dbo].[TrxTypesOptions] (
    [Id]           INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [TrxTypeId]    INT          NOT NULL,
    [Name]         VARCHAR (20) NOT NULL,
    [Title]        VARCHAR (50) NOT NULL,
    [ValueType]    VARCHAR (10) NOT NULL,
    [DefaultValue] VARCHAR (50) NOT NULL
);


GO

ALTER TABLE [dbo].[TrxTypesOptions]
    ADD CONSTRAINT [FK_TrxTypesOptions_TrxTypes] FOREIGN KEY ([TrxTypeId]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO



ALTER TABLE [dbo].[TrxTypesOptions]
    ADD CONSTRAINT [PK_TrxTypesOptions] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



