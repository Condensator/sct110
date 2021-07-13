CREATE TABLE [dbo].[TrxNonVASCommission] (
    [Id]              BIGINT IDENTITY (1, 1) NOT NULL,
    [TrxId]           BIGINT NOT NULL,
    [TotalCommission] MONEY  NOT NULL,
    [ItemValue]       MONEY  NULL,
    [UnitTypeId]      INT    NULL,
    [UnitValue]       MONEY  NULL,
    [FreeUnitValue]   MONEY  NULL,
    [CommissionId]    INT    NULL
);


GO

ALTER TABLE [dbo].[TrxNonVASCommission]
    ADD CONSTRAINT [PK_TrxNonVASCommission] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



