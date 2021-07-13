CREATE TABLE [dbo].[TrxRechargePlus] (
    [AtpId]        INT          IDENTITY (1, 1) NOT NULL,
    [TrxId]        BIGINT       NULL,
    [Serial]       VARCHAR (50) NULL,
    [TrxAmt]       MONEY        NULL,
    [IsDeleted]    BIT          NULL,
    [DevId]        INT          NULL,
    [CreationDate] DATETIME     NULL,
    [ExpiryDate]   DATETIME     NULL,
    [VoucherId]    VARCHAR (50) NULL,
    [Barcode]      VARCHAR (50) NULL
);


GO

ALTER TABLE [dbo].[TrxRechargePlus]
    ADD CONSTRAINT [DF__TrxRechar__IsDel__087F3133] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[TrxRechargePlus]
    ADD CONSTRAINT [PK__TrxRecha__28F8A26EA8C0FAA3] PRIMARY KEY CLUSTERED ([AtpId] ASC);


GO



CREATE NONCLUSTERED INDEX [idx_TrxRechargePlus_TrxId]
    ON [dbo].[TrxRechargePlus]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [idx_TrxRechargePlus_VoucherId]
    ON [dbo].[TrxRechargePlus]([VoucherId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



