CREATE TABLE [dbo].[DevTrxTypeOptions] (
    [Id]          INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DevId]       INT          NOT NULL,
    [OptionId]    INT          NOT NULL,
    [OptionValue] VARCHAR (50) NOT NULL
);


GO

ALTER TABLE [dbo].[DevTrxTypeOptions]
    ADD CONSTRAINT [FK_DevTrxTypeOptions_Devices] FOREIGN KEY ([DevId]) REFERENCES [dbo].[Devices] ([DevId]);


GO



ALTER TABLE [dbo].[DevTrxTypeOptions]
    ADD CONSTRAINT [FK_DevTrxTypeOptions_TrxTypesOptions] FOREIGN KEY ([OptionId]) REFERENCES [dbo].[TrxTypesOptions] ([Id]);


GO



ALTER TABLE [dbo].[DevTrxTypeOptions]
    ADD CONSTRAINT [PK_DevTrxTypeOptions] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



