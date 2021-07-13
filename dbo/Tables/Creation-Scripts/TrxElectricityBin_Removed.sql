CREATE TABLE [dbo].[TrxElectricityBin_Removed] (
    [Id]            INT          NOT NULL,
    [MeterNum]      VARCHAR (50) NOT NULL,
    [Amount]        MONEY        NOT NULL,
    [TrxId]         BIGINT       NOT NULL,
    [TrxTypeId]     INT          NOT NULL,
    [DateIn]        DATETIME     NULL,
    [Used]          BIGINT       NULL,
    [DateOut]       DATETIME     NULL,
    [OriginalTrxId] BIGINT       NULL,
    [Reason]        VARCHAR (20) NULL
);


GO

