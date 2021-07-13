CREATE TABLE [dbo].[TrxRefundLog] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [RefundDateTime]   DATETIME       NOT NULL,
    [UserName]         NVARCHAR (256) NOT NULL,
    [TrxId]            BIGINT         NOT NULL,
    [RefundReasonId]   INT            NOT NULL,
    [RefundResult]     SMALLINT       NOT NULL,
    [ExtraInformation] NVARCHAR (500) NULL,
    [RefundFee]        MONEY          NOT NULL
);


GO

ALTER TABLE [dbo].[TrxRefundLog]
    ADD CONSTRAINT [DF_TrxRefundLog_RefundDateTime] DEFAULT (getdate()) FOR [RefundDateTime];


GO



ALTER TABLE [dbo].[TrxRefundLog]
    ADD CONSTRAINT [DF_TrxRefundLog_RefundFee] DEFAULT ((0)) FOR [RefundFee];


GO



ALTER TABLE [dbo].[TrxRefundLog]
    ADD CONSTRAINT [PK_TrxRefundLog] PRIMARY KEY CLUSTERED ([Id] ASC);


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxRefundLog_After] ON [dbo].[TrxRefundLog]
AFTER DELETE 
AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxRefundLogArchive
(Id,RefundDateTime,UserName,TrxId,RefundReasonId,RefundResult,ExtraInformation,RefundFee)
  
SELECT 
	Id,RefundDateTime,UserName,TrxId,RefundReasonId,RefundResult,ExtraInformation,RefundFee
FROM deleted


    
END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxRefundLog_After]
    ON [dbo].[TrxRefundLog];


GO



