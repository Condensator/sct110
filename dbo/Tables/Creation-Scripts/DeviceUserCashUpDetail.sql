CREATE TABLE [dbo].[DeviceUserCashUpDetail] (
    [Id]                 INT IDENTITY (1, 1) NOT NULL,
    [DeviceUserCashUpId] INT NOT NULL,
    [TrxTenderId]        INT NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [idx_DeviceUserCashUpDetail_DeviceUserCashUpId]
    ON [dbo].[DeviceUserCashUpDetail]([DeviceUserCashUpId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [idx_DeviceUserCashUpDetail_TrxTenderId]
    ON [dbo].[DeviceUserCashUpDetail]([TrxTenderId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DeviceUserCashUpDetail]
    ADD CONSTRAINT [FK_DeviceUserCashUpDetail_DeviceUserCashUp] FOREIGN KEY ([DeviceUserCashUpId]) REFERENCES [dbo].[DeviceUserCashUp] ([Id]);


GO



ALTER TABLE [dbo].[DeviceUserCashUpDetail]
    ADD CONSTRAINT [FK_DeviceUserCashUpDetail_TrxTender] FOREIGN KEY ([TrxTenderId]) REFERENCES [dbo].[TrxTender] ([Id]);


GO



ALTER TABLE [dbo].[DeviceUserCashUpDetail]
    ADD CONSTRAINT [PK_DeviceUserCashUpDetail] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO




CREATE TRIGGER [dbo].[utr_DELETE_DeviceUserCashUpDetail_After]ON [dbo].[DeviceUserCashUpDetail]
AFTER DELETE 

AS 

BEGIN
  SET NOCOUNT ON;

INSERT INTO AEON_SA_Archive..DeviceUserCashUpDetailArchive
(Id, DeviceUserCashUpId, TrxTenderId)  
  
SELECT Id, DeviceUserCashUpId, TrxTenderId
FROM deleted  
   
DELETE FROM DeviceUserCashUpDetail 
WHERE EXISTS(SELECT d.Id FROM deleted d WHERE DeviceUserCashUpDetail.Id = d.id)
END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_DeviceUserCashUpDetail_After]
    ON [dbo].[DeviceUserCashUpDetail];


GO



