CREATE TABLE [dbo].[DeviceClearance] (
    [Id]          INT      IDENTITY (1, 1) NOT NULL,
    [DevId]       INT      NOT NULL,
    [ClearanceId] INT      NOT NULL,
    [StartDate]   DATETIME NOT NULL,
    [CloseDate]   DATETIME NULL,
    [Closed]      BIT      NOT NULL,
    [DevUserId]   INT      NULL
);


GO

CREATE NONCLUSTERED INDEX [idx_DeviceClearance_CloseDate]
    ON [dbo].[DeviceClearance]([CloseDate] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [idx_DeviceClearance_DevId]
    ON [dbo].[DeviceClearance]([DevId] ASC)
    INCLUDE([Closed]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DeviceClearance]
    ADD CONSTRAINT [DF__DeviceCle__Start__355870B9] DEFAULT (getdate()) FOR [StartDate];


GO



ALTER TABLE [dbo].[DeviceClearance]
    ADD CONSTRAINT [DF_DeviceClearance_Closed] DEFAULT ((0)) FOR [Closed];


GO



ALTER TABLE [dbo].[DeviceClearance]
    ADD CONSTRAINT [FK_DeviceClearance_Devices] FOREIGN KEY ([DevId]) REFERENCES [dbo].[Devices] ([DevId]);


GO



ALTER TABLE [dbo].[DeviceClearance]
    ADD CONSTRAINT [PK_DeviceClearance] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



