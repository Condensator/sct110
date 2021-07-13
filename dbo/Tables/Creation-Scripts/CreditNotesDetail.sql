CREATE TABLE [dbo].[CreditNotesDetail] (
    [CRDetailId]             INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [CRId]                   INT            NOT NULL,
    [ItemCnt]                INT            NOT NULL,
    [ItemAmountExcl]         MONEY          NOT NULL,
    [ItemAmountIncl]         MONEY          NOT NULL,
    [ItemDescription]        NVARCHAR (255) NOT NULL,
    [ItemDateTime]           SMALLDATETIME  NOT NULL,
    [IsDeleted]              BIT            NOT NULL,
    [TrxTypeId]              INT            NULL,
    [Reference]              VARCHAR (50)   NULL,
    [AccTransTypeId]         INT            NULL,
    [PaymentTypeId]          INT            NULL,
    [VASProductId]           INT            NULL,
    [CommissionValue]        MONEY          NOT NULL,
    [CommissionIssued]       BIT            NOT NULL,
    [SupplierGLCode]         VARCHAR (20)   NULL,
    [RebateValue]            MONEY          NULL,
    [FeeProvider]            MONEY          NULL,
    [ConvenienceFeeOutlet]   MONEY          NULL,
    [ConvenienceFeeProvider] MONEY          NULL,
    [ConvenienceFeeSwitch]   MONEY          NULL,
    [ProviderRebateValue]    MONEY          NULL,
    [Units]                  DECIMAL (18)   NULL
);


GO

CREATE NONCLUSTERED INDEX [IDX_FK_CrId]
    ON [dbo].[CreditNotesDetail]([CRId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [index_33698_33697_CreditNotesDetail]
    ON [dbo].[CreditNotesDetail]([CommissionValue] ASC)
    INCLUDE([CRId], [ItemCnt], [ItemAmountIncl], [ItemDescription], [CommissionIssued]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[CreditNotesDetail]
    ADD CONSTRAINT [DF_CreditNotesDetail_CommissionIssued] DEFAULT ((0)) FOR [CommissionIssued];


GO



ALTER TABLE [dbo].[CreditNotesDetail]
    ADD CONSTRAINT [DF_CreditNotesDetail_CommissionValue] DEFAULT ((0)) FOR [CommissionValue];


GO



ALTER TABLE [dbo].[CreditNotesDetail]
    ADD CONSTRAINT [DF_CreditNotesDetail_TrxTypeId] DEFAULT ((0)) FOR [TrxTypeId];


GO



ALTER TABLE [dbo].[CreditNotesDetail]
    ADD CONSTRAINT [FK_CreditNotesDetail_CreditNotes] FOREIGN KEY ([CRId]) REFERENCES [dbo].[CreditNotes] ([CRId]);


GO



ALTER TABLE [dbo].[CreditNotesDetail]
    ADD CONSTRAINT [PK_CreditNotesDetail] PRIMARY KEY CLUSTERED ([CRDetailId] ASC) WITH (FILLFACTOR = 90);


GO



