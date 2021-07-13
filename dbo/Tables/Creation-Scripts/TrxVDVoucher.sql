CREATE TABLE [dbo].[TrxVDVoucher] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [TrxId]             BIGINT        NOT NULL,
    [Reference]         VARCHAR (50)  NULL,
    [ProviderReference] VARCHAR (50)  NULL,
    [SupplierCode]      INT           NOT NULL,
    [Amount]            MONEY         NOT NULL,
    [RespHeader]        VARCHAR (100) NULL,
    [RespBody]          VARCHAR (100) NULL,
    [RespFooter]        VARCHAR (100) NULL,
    [RespHelp]          VARCHAR (100) NULL,
    [Status]            INT           NOT NULL,
    [SerialNumber]      VARCHAR (25)  NULL,
    [Barcode]           VARCHAR (25)  NULL,
    [Pin]               VARCHAR (25)  NULL,
    [CreateDate]        DATETIME      NULL,
    [ExpiryDate]        DATETIME      NULL,
    [DevId]             INT           NULL,
    [ProductId]         INT           NULL
);


GO

ALTER TABLE [dbo].[TrxVDVoucher]
    ADD CONSTRAINT [PK__TrxVDVou__3214EC0716B94FCE] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



CREATE NONCLUSTERED INDEX [IX_TrxVDVoucher_SupplierCode]
    ON [dbo].[TrxVDVoucher]([SupplierCode] ASC)
    INCLUDE([TrxId], [Amount], [RespHeader], [SerialNumber], [CreateDate]);


GO



CREATE NONCLUSTERED INDEX [ndx_TrxVDVoucher_SerialNumber]
    ON [dbo].[TrxVDVoucher]([SerialNumber] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndx_TrxVDVVoucher_TrxId]
    ON [dbo].[TrxVDVoucher]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndx_VDVoucher_ProductId]
    ON [dbo].[TrxVDVoucher]([ProductId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxReferenceVDV]
    ON [dbo].[TrxVDVoucher]([Reference] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxVDVoucher_InsteadOf] ON [dbo].[TrxVDVoucher] 
INSTEAD OF DELETE

AS

BEGIN
  SET NOCOUNT ON;
  


DELETE FROM TrxVDVoucher WHERE TrxId IN (SELECT TrxId FROM deleted)

INSERT INTO AEON_SA_Archive..TrxVDVoucherArchive 
(TrxId,Reference,ProviderReference,SupplierCode,Amount,RespHeader,RespBody,RespFooter,RespHelp,Status,SerialNumber,Barcode,Pin,CreateDate,ExpiryDate,DevId,ProductId)  

SELECT 
TrxId,Reference,ProviderReference,SupplierCode,Amount,RespHeader,RespBody,RespFooter,RespHelp,Status,SerialNumber,Barcode,Pin,CreateDate,ExpiryDate,DevId,ProductId
FROM Deleted

DELETE FROM Trx 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)

END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxVDVoucher_InsteadOf]
    ON [dbo].[TrxVDVoucher];


GO



