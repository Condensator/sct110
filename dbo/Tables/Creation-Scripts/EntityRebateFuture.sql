CREATE TABLE [dbo].[EntityRebateFuture] (
    [Id]                    INT           IDENTITY (1, 1) NOT NULL,
    [FutureDate]            DATETIME      NOT NULL,
    [RebateCash]            MONEY         NOT NULL,
    [RebateCashIsPercent]   BIT           NOT NULL,
    [RebateCard]            MONEY         NOT NULL,
    [RebateCardIsPercent]   BIT           NOT NULL,
    [RebateDebit]           MONEY         NOT NULL,
    [RebateDebitIsPercent]  BIT           NOT NULL,
    [RebateCheque]          MONEY         NOT NULL,
    [RebateChequeIsPercent] BIT           NOT NULL,
    [EntId]                 INT           NOT NULL,
    [IsDeleted]             BIT           NOT NULL,
    [ModifiedUser]          NVARCHAR (50) NULL,
    [ModifiedDate]          DATETIME      NULL
);


GO

ALTER TABLE [dbo].[EntityRebateFuture]
    ADD CONSTRAINT [DF__EntityReb__IsDel__54B751CD] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[EntityRebateFuture]
    ADD CONSTRAINT [DF__EntityReb__Rebat__4D163005] DEFAULT ((0)) FOR [RebateCash];


GO



ALTER TABLE [dbo].[EntityRebateFuture]
    ADD CONSTRAINT [DF__EntityReb__Rebat__4E0A543E] DEFAULT ((0)) FOR [RebateCashIsPercent];


GO



ALTER TABLE [dbo].[EntityRebateFuture]
    ADD CONSTRAINT [DF__EntityReb__Rebat__4EFE7877] DEFAULT ((0)) FOR [RebateCard];


GO



ALTER TABLE [dbo].[EntityRebateFuture]
    ADD CONSTRAINT [DF__EntityReb__Rebat__4FF29CB0] DEFAULT ((0)) FOR [RebateCardIsPercent];


GO



ALTER TABLE [dbo].[EntityRebateFuture]
    ADD CONSTRAINT [DF__EntityReb__Rebat__50E6C0E9] DEFAULT ((0)) FOR [RebateDebit];


GO



ALTER TABLE [dbo].[EntityRebateFuture]
    ADD CONSTRAINT [DF__EntityReb__Rebat__51DAE522] DEFAULT ((0)) FOR [RebateDebitIsPercent];


GO



ALTER TABLE [dbo].[EntityRebateFuture]
    ADD CONSTRAINT [DF__EntityReb__Rebat__52CF095B] DEFAULT ((0)) FOR [RebateCheque];


GO



ALTER TABLE [dbo].[EntityRebateFuture]
    ADD CONSTRAINT [DF__EntityReb__Rebat__53C32D94] DEFAULT ((0)) FOR [RebateChequeIsPercent];


GO



ALTER TABLE [dbo].[EntityRebateFuture]
    ADD CONSTRAINT [PK__EntityRe__3214EC074B2DE793] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



