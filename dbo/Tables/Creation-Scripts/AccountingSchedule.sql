CREATE TABLE [dbo].[AccountingSchedule] (
    [Id]                    INT          IDENTITY (1, 1) NOT NULL,
    [Description]           VARCHAR (30) NOT NULL,
    [IsPreset]              BIT          NOT NULL,
    [IsMonthly]             BIT          NOT NULL,
    [IsByShift]             BIT          NOT NULL,
    [IsMonday]              BIT          NOT NULL,
    [IsTuesday]             BIT          NOT NULL,
    [IsWednesday]           BIT          NOT NULL,
    [IsThursday]            BIT          NOT NULL,
    [IsFriday]              BIT          NOT NULL,
    [IsSaturday]            BIT          NOT NULL,
    [IsSunday]              BIT          NOT NULL,
    [IsBiMonthly]           BIT          NOT NULL,
    [MonthlyDateOne]        INT          NULL,
    [MonthlyDateTwo]        INT          NULL,
    [IsByShiftConsolidated] BIT          NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [IsByShift]
    ON [dbo].[AccountingSchedule]([IsByShift] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [IsMonthly]
    ON [dbo].[AccountingSchedule]([IsMonthly] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[AccountingSchedule]
    ADD CONSTRAINT [DF__Accountin__IsByS__1ECCA0BC] DEFAULT ((0)) FOR [IsByShiftConsolidated];


GO



ALTER TABLE [dbo].[AccountingSchedule]
    ADD CONSTRAINT [DF_AccountingSchedule_IsBiMonthly] DEFAULT ((0)) FOR [IsBiMonthly];


GO



ALTER TABLE [dbo].[AccountingSchedule]
    ADD CONSTRAINT [DF_AccountingSchedule_IsPreset] DEFAULT ((0)) FOR [IsPreset];


GO



ALTER TABLE [dbo].[AccountingSchedule]
    ADD CONSTRAINT [DF_AccountingSchedule_MonthlyDateOne] DEFAULT ((15)) FOR [MonthlyDateOne];


GO



ALTER TABLE [dbo].[AccountingSchedule]
    ADD CONSTRAINT [DF_AccountingSchedule_MonthlyDateTwo] DEFAULT ((30)) FOR [MonthlyDateTwo];


GO



ALTER TABLE [dbo].[AccountingSchedule]
    ADD CONSTRAINT [PK_AccountingSchedule] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



