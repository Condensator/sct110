CREATE TABLE [dbo].[ArchiveParameters] (
    [Quantity]                     INT      NOT NULL,
    [BatchSize]                    INT      NOT NULL,
    [CutOffDate]                   DATETIME NOT NULL,
    [SkipElectricity]              BIT      NULL,
    [SkipAirTime]                  BIT      NULL,
    [SkipTopUpVodacom]             BIT      NULL,
    [SkipTopUpCellC]               BIT      NULL,
    [SkipTopUpMTN]                 BIT      NULL,
    [SkipTopUpNeotel]              BIT      NULL,
    [SkipTopUpTelkom]              BIT      NULL,
    [SkipTrxWebTickets]            BIT      NULL,
    [SkipTrxReversal]              BIT      NULL,
    [SkipTrxReprintRequest]        BIT      NULL,
    [SkipTrxBusTicket]             BIT      NULL,
    [SkipTrx]                      BIT      NULL,
    [MaxTrxIdold]                  INT      NULL,
    [MaxTrxIdDate]                 DATETIME NULL,
    [SkipTrxVDVoucher]             BIT      NULL,
    [SkipTrxVasSyntellAccPayment]  BIT      NULL,
    [SkipTrxVasSyntellFinePayment] BIT      NULL,
    [SkipTrxVasPayAtInsurance]     BIT      NULL,
    [SkipTrxSanral]                BIT      NULL,
    [SkipTrxVasSAPO]               BIT      NULL,
    [SkipTrxVasPayAt]              BIT      NULL,
    [SkipTrxTicketPro]             BIT      NULL,
    [SkipTrxMpower]                BIT      NULL,
    [SkipPinless]                  BIT      NULL,
    [MaxTrxId]                     BIGINT   NULL,
    [ArchiveTrxIgnoreLastUpdate]   DATETIME NULL,
    [SkipTJRecon]                  BIT      NULL,
    [SkipTrxAirtimeCancelled]      BIT      NULL,
    [SkipTrxTender]                BIT      NULL,
    [SkipReprint]                  BIT      NULL
);


GO

CREATE CLUSTERED INDEX [ClusteredIndex-20180801-174855]
    ON [dbo].[ArchiveParameters]([SkipElectricity] ASC, [SkipAirTime] ASC, [SkipTrxReversal] ASC, [SkipTrxReprintRequest] ASC, [SkipTrxBusTicket] ASC, [SkipTrx] ASC, [SkipTrxVDVoucher] ASC, [SkipTrxVasSyntellAccPayment] ASC, [SkipTrxVasSyntellFinePayment] ASC, [SkipTrxVasPayAtInsurance] ASC, [SkipTrxSanral] ASC, [SkipTrxVasSAPO] ASC, [SkipTrxVasPayAt] ASC, [SkipTrxTicketPro] ASC, [SkipTrxMpower] ASC, [SkipPinless] ASC);


GO



ALTER TABLE [dbo].[ArchiveParameters]
    ADD CONSTRAINT [DF__ArchivePa__SkipT__4CAFFF79] DEFAULT ((1)) FOR [SkipTJRecon];


GO



ALTER TABLE [dbo].[ArchiveParameters]
    ADD CONSTRAINT [DF__ArchivePa__SkipT__4DA423B2] DEFAULT ((0)) FOR [SkipTrxAirtimeCancelled];


GO



ALTER TABLE [dbo].[ArchiveParameters]
    ADD CONSTRAINT [DF__ArchivePa__SkipT__4E9847EB] DEFAULT ((0)) FOR [SkipTrxTender];


GO



