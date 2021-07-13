CREATE TABLE [dbo].[AMSShifts] (
    [Id]          INT      IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DevId]       INT      NOT NULL,
    [AmsShiftId]  INT      NOT NULL,
    [ShiftStatus] INT      NOT NULL,
    [ShiftStart]  DATETIME NULL,
    [IsDeleted]   BIT      NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [ndxDevIdShiftStatus]
    ON [dbo].[AMSShifts]([DevId] ASC, [ShiftStatus] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[AMSShifts]
    ADD CONSTRAINT [DF_AMSShifts_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[AMSShifts]
    ADD CONSTRAINT [PK_AMSShifts] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



