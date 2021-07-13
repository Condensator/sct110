CREATE TABLE [dbo].[TrxTender_Items] (
    [Id]          INT    IDENTITY (1, 1) NOT NULL,
    [TrxTenderId] INT    NOT NULL,
    [TrxId]       BIGINT NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [ndx_TrxTenderId]
    ON [dbo].[TrxTender_Items]([TrxTenderId] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxTrxId]
    ON [dbo].[TrxTender_Items]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO




CREATE TRIGGER [dbo].[utr_DELETE_TrxTender_Items_After]ON [dbo].[TrxTender_Items]
AFTER DELETE 

AS 

BEGIN
  SET NOCOUNT ON;

INSERT INTO AEON_SA_Archive..TrxTender_ItemsArchive
(Id, TrxTenderId, TrxId)  
  
SELECT Id, TrxTenderId, TrxId
FROM deleted  
   
IF EXISTS (SELECT TrxTenderId from DeviceUserCashUpDetail where TrxTenderId in (SELECT TrxTenderId from Deleted))
DELETE FROM DeviceUserCashUpDetail WHERE TrxTenderId IN (SELECT TrxTenderId FROM deleted)

DELETE FROM TrxTender 
WHERE EXISTS(SELECT d.Id FROM deleted d WHERE TrxTender.Id = d.TrxTenderId)

END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxTender_Items_After]
    ON [dbo].[TrxTender_Items];


GO



