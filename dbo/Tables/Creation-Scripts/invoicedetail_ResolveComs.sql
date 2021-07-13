CREATE TABLE [dbo].[invoicedetail_ResolveComs] (
    [ActualPrec]             MONEY          NULL,
    [InvDetailId]            INT            IDENTITY (1, 1) NOT NULL,
    [InvId]                  INT            NOT NULL,
    [ItemCnt]                INT            NOT NULL,
    [ItemAmountExcl]         MONEY          NOT NULL,
    [ItemAmountIncl]         MONEY          NOT NULL,
    [ItemDescription]        NVARCHAR (255) NOT NULL,
    [ItemDateTime]           SMALLDATETIME  NOT NULL,
    [IsDeleted]              BIT            NOT NULL,
    [ItemFullAmount]         MONEY          NULL,
    [CommPercent]            MONEY          NULL,
    [TrxTypeId]              INT            NULL,
    [Reference]              VARCHAR (50)   NULL,
    [PaymentTypeId]          INT            NULL,
    [AccTransTypeId]         INT            NULL,
    [RebateValue]            MONEY          NULL,
    [FeeProvider]            MONEY          NULL,
    [ConvenienceFeeOutlet]   MONEY          NULL,
    [ConvenienceFeeProvider] MONEY          NULL,
    [ConvenienceFeeSwitch]   MONEY          NULL,
    [VasProductId]           INT            NULL,
    [VASSlidingId]           INT            NULL,
    [ComSlidingId]           INT            NULL,
    [FaceValue]              MONEY          NULL,
    [StockTypeID]            INT            NULL
);


GO

