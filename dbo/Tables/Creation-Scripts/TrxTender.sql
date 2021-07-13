CREATE TABLE [dbo].[TrxTender] (
    [Id]         INT        IDENTITY (1, 1) NOT NULL,
    [ShiftId]    INT        NOT NULL,
    [Date]       DATETIME   NOT NULL,
    [Cash]       MONEY      NULL,
    [CreditCard] FLOAT (53) NULL,
    [DebitCard]  FLOAT (53) NULL,
    [Cheque]     MONEY      NULL,
    [Other]      MONEY      NULL,
    [Total]      MONEY      NULL,
    [Change]     FLOAT (53) NULL
);


GO

ALTER TABLE [dbo].[TrxTender]
    ADD CONSTRAINT [PK_TrxTender] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



CREATE NONCLUSTERED INDEX [trxTenderIdShiftId_Id]
    ON [dbo].[TrxTender]([ShiftId] ASC, [Id] ASC);


GO




CREATE TRIGGER [dbo].[utr_DELETE_TrxTender_InsteadOf] ON [dbo].[TrxTender]
INSTEAD OF DELETE

AS 

BEGIN
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxTenderArchive
(Id, ShiftId, Date, Cash,CreditCard, DebitCard, Cheque, Other, Total, Change)
  
SELECT Id, ShiftId, Date, Cash, CreditCard, DebitCard,Cheque, Other, Total, Change	
FROM deleted d  
WHERE NOT EXISTS(SELECT TTA.Id FROM AEON_SA_Archive..TrxTenderArchive TTA WHERE TTA.Id = d.Id)
                   
                   
DELETE FROM TrxTender
WHERE EXISTS(SELECT d.Id
                FROM deleted d  
               WHERE TrxTender.Id = d.Id
                AND NOT EXISTS(SELECT TTI.Id
                                 FROM TrxTender_Items TTI
                                WHERE TTI.TrxTenderId = d.Id))     

IF EXISTS (SELECT TrxTenderId from DeviceUserCashUpDetail where TrxTenderId in (SELECT Id from Deleted))
DELETE FROM DeviceUserCashUpDetail WHERE TrxTenderId IN (SELECT Id FROM deleted)
                                           
                   
END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxTender_InsteadOf]
    ON [dbo].[TrxTender];


GO



