CREATE TABLE [dbo].[DevTrxTypes] (
    [DevTrxId]         INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DevId]            INT          NULL,
    [TrxTypeId]        INT          NULL,
    [AccId]            INT          NULL,
    [IsDeleted]        BIT          NOT NULL,
    [RebateApplicable] BIT          NOT NULL,
    [CardAcceptorId]   VARCHAR (15) NOT NULL,
    [MaxTranAmount]    MONEY        NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [IX_DevTrxTypes_TrxTypeId]
    ON [dbo].[DevTrxTypes]([TrxTypeId] ASC)
    INCLUDE([DevId], [AccId]);


GO



CREATE NONCLUSTERED INDEX [ndx_DevTrxTypes_DevId_IsDeleted]
    ON [dbo].[DevTrxTypes]([DevId] ASC, [IsDeleted] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndx_Devtrxtypes_TrxTypeId]
    ON [dbo].[DevTrxTypes]([TrxTypeId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxAccId]
    ON [dbo].[DevTrxTypes]([AccId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE UNIQUE NONCLUSTERED INDEX [ndxAccidDevidTrxtypeid]
    ON [dbo].[DevTrxTypes]([AccId] ASC, [DevId] ASC, [TrxTypeId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxDevTrxId]
    ON [dbo].[DevTrxTypes]([DevId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxTypeidAccid]
    ON [dbo].[DevTrxTypes]([TrxTypeId] ASC)
    INCLUDE([AccId]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DevTrxTypes]
    ADD CONSTRAINT [DF__DevTrxTyp__MaxTr__4160E05C] DEFAULT ((0)) FOR [MaxTranAmount];


GO



ALTER TABLE [dbo].[DevTrxTypes]
    ADD CONSTRAINT [DF_DevTrxTypes_CardAcceptorId] DEFAULT ('') FOR [CardAcceptorId];


GO



ALTER TABLE [dbo].[DevTrxTypes]
    ADD CONSTRAINT [DF_DevTrxTypes_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[DevTrxTypes]
    ADD CONSTRAINT [DF_DevTrxTypes_RebateApplicable] DEFAULT ((0)) FOR [RebateApplicable];


GO



ALTER TABLE [dbo].[DevTrxTypes]
    ADD CONSTRAINT [FK_DevTrxTypes_Accounts] FOREIGN KEY ([AccId]) REFERENCES [dbo].[Accounts] ([AccId]);


GO



ALTER TABLE [dbo].[DevTrxTypes]
    ADD CONSTRAINT [FK_DevTrxTypes_Devices] FOREIGN KEY ([DevId]) REFERENCES [dbo].[Devices] ([DevId]);


GO



ALTER TABLE [dbo].[DevTrxTypes]
    ADD CONSTRAINT [FK_DevTrxTypes_TrxTypes] FOREIGN KEY ([TrxTypeId]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO



ALTER TABLE [dbo].[DevTrxTypes]
    ADD CONSTRAINT [PK_DevTrxTypes] PRIMARY KEY CLUSTERED ([DevTrxId] ASC) WITH (FILLFACTOR = 90);


GO



