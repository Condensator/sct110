CREATE TABLE [dbo].[TrxElectricityBin_History] (
    [Id]            INT           NOT NULL,
    [MeterNum]      VARCHAR (50)  NOT NULL,
    [Amount]        MONEY         NOT NULL,
    [TrxId]         BIGINT        NOT NULL,
    [TrxTypeId]     INT           NOT NULL,
    [DateIn]        DATETIME      NULL,
    [Used]          BIGINT        NULL,
    [DateOut]       DATETIME      NULL,
    [OriginalTrxId] BIGINT        NULL,
    [BinReason]     NVARCHAR (50) NULL,
    [ModifiedUser]  NVARCHAR (50) NULL
);


GO

ALTER TABLE [dbo].[TrxElectricityBin_History]
    ADD CONSTRAINT [DF__TrxElectr__Origi__780F312F] DEFAULT ((0)) FOR [OriginalTrxId];


GO



ALTER TABLE [dbo].[TrxElectricityBin_History]
    ADD CONSTRAINT [DF_TrxElectricityBin_History_DateIn] DEFAULT (getdate()) FOR [DateIn];


GO



ALTER TABLE [dbo].[TrxElectricityBin_History]
    ADD CONSTRAINT [DF_TrxElectricityBin_History_Used] DEFAULT ((0)) FOR [Used];


GO



ALTER TABLE [dbo].[TrxElectricityBin_History]
    ADD CONSTRAINT [PK_TrxElectricityBin_History] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



CREATE NONCLUSTERED INDEX [IX_TrxElectricityBin_History_TrxId]
    ON [dbo].[TrxElectricityBin_History]([TrxId] ASC)
    INCLUDE([OriginalTrxId]);


GO



CREATE NONCLUSTERED INDEX [ndxDateOut]
    ON [dbo].[TrxElectricityBin_History]([DateOut] ASC)
    INCLUDE([TrxId]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxElecBinHistOrigId]
    ON [dbo].[TrxElectricityBin_History]([OriginalTrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxElecBinHistoryTrxId]
    ON [dbo].[TrxElectricityBin_History]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxElecBinHistoryUsed]
    ON [dbo].[TrxElectricityBin_History]([Used] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO




CREATE TRIGGER [dbo].[utr_DELETE_TrxElectricityBin_History_After] ON [dbo].[TrxElectricityBin_History]
AFTER DELETE 

AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxElectricityBin_HistoryArchive
(Id,MeterNum,Amount,TrxId,TrxTypeId,DateIn,Used,DateOut,OriginalTrxId)
  
SELECT
Id,MeterNum,Amount,TrxId,TrxTypeId,DateIn,Used,DateOut,OriginalTrxId
FROM deleted

END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxElectricityBin_History_After]
    ON [dbo].[TrxElectricityBin_History];


GO



