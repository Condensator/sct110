CREATE TABLE [dbo].[TrxElectricityXmlReprints] (
    [Id]          BIGINT        NOT NULL,
    [ActId]       BIGINT        NULL,
    [DevId]       INT           NULL,
    [EventType]   VARCHAR (50)  NULL,
    [MeterNum]    VARCHAR (50)  NULL,
    [XMLData]     VARCHAR (MAX) NULL,
    [ReqDateTime] DATETIME      NULL,
    [InOut]       INT           NULL
);


GO

CREATE NONCLUSTERED INDEX [xmlReprintMeter2bigint]
    ON [dbo].[TrxElectricityXmlReprints]([MeterNum] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [xmlReprintTime2bigint]
    ON [dbo].[TrxElectricityXmlReprints]([ReqDateTime] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [xmlReprintTrxId2bigint]
    ON [dbo].[TrxElectricityXmlReprints]([ActId] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_NC_Index_FG];


GO



