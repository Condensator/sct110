CREATE TABLE [dbo].[DevShift] (
    [ShfId]           INT      IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DevId]           INT      NOT NULL,
    [TerminalShiftId] INT      NOT NULL,
    [StartDate]       DATETIME NOT NULL,
    [CloseDate]       DATETIME NULL,
    [Closed]          BIT      NOT NULL,
    [ClosedUserId]    INT      NULL,
    [IsDeleted]       BIT      NOT NULL,
    [Counter]         INT      NULL
);


GO

CREATE NONCLUSTERED INDEX [DevID]
    ON [dbo].[DevShift]([DevId] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [Indx_CloseDate]
    ON [dbo].[DevShift]([CloseDate] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO



CREATE NONCLUSTERED INDEX [ndxClosed]
    ON [dbo].[DevShift]([Closed] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = OFF, PAD_INDEX = ON);


GO



CREATE NONCLUSTERED INDEX [ndxDevidClosed]
    ON [dbo].[DevShift]([DevId] ASC, [Closed] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxDevidClosed2]
    ON [dbo].[DevShift]([DevId] ASC, [Closed] ASC)
    INCLUDE([ShfId], [TerminalShiftId], [StartDate], [CloseDate]) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxDevidClosedIncl]
    ON [dbo].[DevShift]([DevId] ASC, [Closed] ASC)
    INCLUDE([ShfId], [TerminalShiftId], [StartDate], [CloseDate], [ClosedUserId], [Counter]) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxDevidInclClosed]
    ON [dbo].[DevShift]([DevId] ASC)
    INCLUDE([TerminalShiftId]) WITH (FILLFACTOR = 90);


GO



ALTER TABLE [dbo].[DevShift]
    ADD CONSTRAINT [DF__DevShift__Counte__1EC42256] DEFAULT ((0)) FOR [Counter];


GO



ALTER TABLE [dbo].[DevShift]
    ADD CONSTRAINT [DF_DevShift_Closed] DEFAULT ((0)) FOR [Closed];


GO



ALTER TABLE [dbo].[DevShift]
    ADD CONSTRAINT [DF_DevShift_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[DevShift]
    ADD CONSTRAINT [FK_DevShift_Devices] FOREIGN KEY ([DevId]) REFERENCES [dbo].[Devices] ([DevId]);


GO



ALTER TABLE [dbo].[DevShift]
    ADD CONSTRAINT [PK_MachineShift] PRIMARY KEY CLUSTERED ([ShfId] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO



