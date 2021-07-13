CREATE TABLE [dbo].[TrxIntegrated] (
    [gTranID]                UNIQUEIDENTIFIER NOT NULL,
    [dtCreated]              DATETIME         NULL,
    [AirTrxID]               BIGINT           NULL,
    [TranType]               VARCHAR (50)     NULL,
    [TranRespCode]           VARCHAR (4)      NULL,
    [TranSystem]             VARCHAR (20)     NULL,
    [VoucherNr]              VARCHAR (30)     NULL,
    [SystemID]               VARCHAR (20)     NULL,
    [MerchantID]             VARCHAR (20)     NULL,
    [TerminalID]             VARCHAR (20)     NULL,
    [ExtTranDate]            VARCHAR (8)      NULL,
    [ExtTranTime]            VARCHAR (6)      NULL,
    [TraceNumber]            VARCHAR (30)     NULL,
    [SystemTraceAuditNumber] VARCHAR (8)      NULL,
    [SessionKey]             VARCHAR (50)     NULL,
    [CashierName]            VARCHAR (30)     NULL,
    [ProcessingCode]         VARCHAR (6)      NULL,
    [ProductID]              VARCHAR (20)     NULL,
    [TranValue]              VARCHAR (50)     NULL,
    [RetrievalReferenceNr]   VARCHAR (12)     NULL,
    [PrimaryAccountNr]       VARCHAR (20)     NULL,
    [CurrencyCodeTran]       VARCHAR (5)      NULL
);


GO

ALTER TABLE [dbo].[TrxIntegrated]
    ADD CONSTRAINT [DF_TrxIntegrated_dtCreated] DEFAULT (getdate()) FOR [dtCreated];


GO



ALTER TABLE [dbo].[TrxIntegrated]
    ADD CONSTRAINT [DF_TrxIntegrated_gTranID] DEFAULT (newid()) FOR [gTranID];


GO



ALTER TABLE [dbo].[TrxIntegrated]
    ADD CONSTRAINT [PK_TrxIntegrated] PRIMARY KEY CLUSTERED ([gTranID] ASC);


GO




CREATE TRIGGER [dbo].[utr_DELETE_TrxIntegrated_After] ON [dbo].[TrxIntegrated]
AFTER DELETE 

AS 
BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxIntegratedArchive
(gTranID,dtCreated,AirTrxID,TranType,TranRespCode,TranSystem,VoucherNr,SystemID,MerchantID,TerminalID
,ExtTranDate,ExtTranTime,TraceNumber,SystemTraceAuditNumber,SessionKey,CashierName,ProcessingCode,ProductID
,TranValue,RetrievalReferenceNr,PrimaryAccountNr,CurrencyCodeTran)
  
SELECT 
gTranID,dtCreated,AirTrxID,TranType,TranRespCode,TranSystem,VoucherNr,SystemID,MerchantID,TerminalID
,ExtTranDate,ExtTranTime,TraceNumber,SystemTraceAuditNumber,SessionKey,CashierName,ProcessingCode,ProductID
,TranValue,RetrievalReferenceNr,PrimaryAccountNr,CurrencyCodeTran
FROM Deleted

END
GO



