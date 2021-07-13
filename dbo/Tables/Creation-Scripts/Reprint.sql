CREATE TABLE [dbo].[Reprint] (
    [ID]                    BIGINT        IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [TrxId]                 BIGINT        NOT NULL,
    [ReprintObject]         VARCHAR (MAX) NULL,
    [ExtraInfo]             VARCHAR (MAX) NULL,
    [MerchantReprintObject] VARCHAR (MAX) NULL,
    [ForcedReprintDate]     DATETIME      NULL,
    [dtTimestamp]           ROWVERSION    NOT NULL
);


GO

ALTER TABLE [dbo].[Reprint]
    ADD CONSTRAINT [Idx_Reprint_TrxId] UNIQUE NONCLUSTERED ([TrxId] ASC) WITH (FILLFACTOR = 90) ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[Reprint]
    ADD CONSTRAINT [PK_Reprint_ID] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO





CREATE TRIGGER [dbo].[utr_DELETE_Reprint_After] ON [dbo].[Reprint]
AFTER DELETE 

AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..ReprintArchive
(ID,TrxId,ReprintObject,ExtraInfo,MerchantReprintObject)
  
SELECT ID,TrxId,ReprintObject,ExtraInfo,MerchantReprintObject
FROM reprint where id in (select id from deleted)

END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_Reprint_After]
    ON [dbo].[Reprint];


GO



