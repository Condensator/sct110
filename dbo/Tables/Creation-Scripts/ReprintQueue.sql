CREATE TABLE [dbo].[ReprintQueue] (
    [TrxId] BIGINT   NOT NULL,
    [Date]  DATETIME NOT NULL,
    [DevId] INT      NULL
);


GO

ALTER TABLE [dbo].[ReprintQueue]
    ADD CONSTRAINT [DF__ReprintQu__DevId__37E65BCD] DEFAULT (NULL) FOR [DevId];


GO



ALTER TABLE [dbo].[ReprintQueue]
    ADD CONSTRAINT [DF_reprintQueue_Date] DEFAULT (getdate()) FOR [Date];


GO



ALTER TABLE [dbo].[ReprintQueue]
    ADD CONSTRAINT [PK_reprintQueue] PRIMARY KEY CLUSTERED ([TrxId] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [IX_ReprintQueue_DevId]
    ON [dbo].[ReprintQueue]([DevId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO




CREATE TRIGGER [dbo].[utr_DELETE_ReprintQueue_After] ON [dbo].[ReprintQueue]
AFTER DELETE 

AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..ReprintQueueArchive
(TrxId,[Date])
  
SELECT TrxId,[Date]
FROM deleted

END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_ReprintQueue_After]
    ON [dbo].[ReprintQueue];


GO



