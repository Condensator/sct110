CREATE TABLE [dbo].[TrxElectricityRecon] (
    [TrxId]     BIGINT       NOT NULL,
    [MeterNum]  VARCHAR (30) NOT NULL,
    [Receipt]   VARCHAR (30) NULL,
    [Reference] VARCHAR (50) NULL
);


GO

ALTER TABLE [dbo].[TrxElectricityRecon]
    ADD CONSTRAINT [PK_TrxElectricityRecon] PRIMARY KEY CLUSTERED ([TrxId] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxElecReconMeterNum]
    ON [dbo].[TrxElectricityRecon]([MeterNum] ASC);


GO




CREATE TRIGGER [dbo].[utr_DELETE_TrxElectricityRecon_After] ON [dbo].[TrxElectricityRecon]
AFTER DELETE 

AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxElectricityReconArchive
(TrxId,MeterNum,Receipt,Reference)
  
SELECT
TrxId,MeterNum,Receipt,Reference
FROM deleted

END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxElectricityRecon_After]
    ON [dbo].[TrxElectricityRecon];


GO



