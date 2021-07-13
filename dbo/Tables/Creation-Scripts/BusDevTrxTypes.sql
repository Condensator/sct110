CREATE TABLE [dbo].[BusDevTrxTypes] (
    [DevTrxId]  INT NOT NULL,
    [DevId]     INT NULL,
    [TrxTypeId] INT NULL,
    [AccId]     INT NULL,
    [IsDeleted] BIT NOT NULL
);


GO

ALTER TABLE [dbo].[BusDevTrxTypes]
    ADD CONSTRAINT [DF_BusDevTrxTypes_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[BusDevTrxTypes]
    ADD CONSTRAINT [FK_BusDevTrxTypes_Devices] FOREIGN KEY ([DevId]) REFERENCES [dbo].[Devices] ([DevId]);


GO



ALTER TABLE [dbo].[BusDevTrxTypes]
    ADD CONSTRAINT [FK_BusDevTrxTypes_TrxTypes] FOREIGN KEY ([TrxTypeId]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO



ALTER TABLE [dbo].[BusDevTrxTypes]
    ADD CONSTRAINT [PK_BusDevTrxTypes] PRIMARY KEY CLUSTERED ([DevTrxId] ASC) WITH (FILLFACTOR = 90);


GO



