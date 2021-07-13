CREATE TABLE [dbo].[AccountLaneFees] (
    [Id]                      INT      IDENTITY (1, 1) NOT NULL,
    [AccId]                   INT      NOT NULL,
    [MonthlyEFTSwitchFee]     BIT      NOT NULL,
    [EFTLaneFee]              BIT      NOT NULL,
    [EFTSupportFee]           BIT      NOT NULL,
    [NumberOfLanes]           INT      NOT NULL,
    [LaneCost]                MONEY    NOT NULL,
    [MonthlySwitchFee]        MONEY    NOT NULL,
    [TradeLinkLaneSupportFee] MONEY    NOT NULL,
    [IsDeleted]               BIT      NOT NULL,
    [LiveDate]                DATETIME NULL,
    [DecommissionDate]        DATETIME NULL
);


GO

CREATE NONCLUSTERED INDEX [IX_AccountLaneFees_AccId]
    ON [dbo].[AccountLaneFees]([AccId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[AccountLaneFees]
    ADD CONSTRAINT [DF__AccountLa__EFTLa__53C3BEC3] DEFAULT ((0)) FOR [EFTLaneFee];


GO



ALTER TABLE [dbo].[AccountLaneFees]
    ADD CONSTRAINT [DF__AccountLa__EFTSu__54B7E2FC] DEFAULT ((0)) FOR [EFTSupportFee];


GO



ALTER TABLE [dbo].[AccountLaneFees]
    ADD CONSTRAINT [DF__AccountLa__IsDel__597C9819] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[AccountLaneFees]
    ADD CONSTRAINT [DF__AccountLa__LaneC__56A02B6E] DEFAULT ((0)) FOR [LaneCost];


GO



ALTER TABLE [dbo].[AccountLaneFees]
    ADD CONSTRAINT [DF__AccountLa__Month__52CF9A8A] DEFAULT ((0)) FOR [MonthlyEFTSwitchFee];


GO



ALTER TABLE [dbo].[AccountLaneFees]
    ADD CONSTRAINT [DF__AccountLa__Month__57944FA7] DEFAULT ((0)) FOR [MonthlySwitchFee];


GO



ALTER TABLE [dbo].[AccountLaneFees]
    ADD CONSTRAINT [DF__AccountLa__Numbe__55AC0735] DEFAULT ((0)) FOR [NumberOfLanes];


GO



ALTER TABLE [dbo].[AccountLaneFees]
    ADD CONSTRAINT [DF__AccountLa__Trade__588873E0] DEFAULT ((0)) FOR [TradeLinkLaneSupportFee];


GO



ALTER TABLE [dbo].[AccountLaneFees]
    ADD CONSTRAINT [PK__AccountL__3214EC0750E75218] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



