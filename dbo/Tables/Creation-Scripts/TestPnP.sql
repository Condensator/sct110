CREATE TABLE [dbo].[TestPnP] (
    [TrxId]        BIGINT       NOT NULL,
    [FullAmount]   MONEY        NOT NULL,
    [TrxTypeId]    INT          NOT NULL,
    [InvDetailId]  INT          NULL,
    [DevId]        INT          NULL,
    [AccId]        INT          NOT NULL,
    [SerialNumber] VARCHAR (50) NULL,
    [EntId]        INT          NOT NULL,
    [AddId]        INT          NULL,
    [DeviceName]   VARCHAR (50) NOT NULL,
    [RegionName]   VARCHAR (50) NOT NULL,
    [TransType]    VARCHAR (50) NOT NULL
);


GO

