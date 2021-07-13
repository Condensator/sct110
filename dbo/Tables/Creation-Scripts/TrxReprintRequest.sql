CREATE TABLE [dbo].[TrxReprintRequest] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [TrxTypeId]           INT           NOT NULL,
    [TrxId]               BIGINT        NOT NULL,
    [FoundTrxId]          BIGINT        NULL,
    [SearchReference]     VARCHAR (50)  NULL,
    [SearchOrigReference] VARCHAR (100) NULL,
    [SearchTransRef]      VARCHAR (15)  NULL
);


GO

ALTER TABLE [dbo].[TrxReprintRequest]
    ADD CONSTRAINT [PK_TrxReprintRequest] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxFoundTrxId]
    ON [dbo].[TrxReprintRequest]([FoundTrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxId]
    ON [dbo].[TrxReprintRequest]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO




CREATE TRIGGER [dbo].[utr_DELETE_TrxReprintRequest_After] ON [dbo].[TrxReprintRequest]
AFTER DELETE 

AS 
BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxReprintRequestArchive
(Id,TrxTypeId,TrxId,FoundTrxId,SearchReference,SearchOrigReference,SearchTransRef)
  
SELECT 
Id,TrxTypeId,TrxId,FoundTrxId,SearchReference,SearchOrigReference,SearchTransRef
FROM Deleted

DELETE FROM Trx 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)

END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxReprintRequest_After]
    ON [dbo].[TrxReprintRequest];


GO



