CREATE TABLE [dbo].[DevUser] (
    [Id]             INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [TerminalUserId] INT           NOT NULL,
    [UserName]       NVARCHAR (20) NOT NULL,
    [Pin]            INT           NOT NULL,
    [AccessLevel]    INT           NOT NULL,
    [Updated]        BIT           NOT NULL,
    [DevId]          INT           NOT NULL,
    [IsDeleted]      BIT           NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [Indx_PIN]
    ON [dbo].[DevUser]([Pin] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_TerminalUserID]
    ON [dbo].[DevUser]([TerminalUserId] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxDevidIsdeleted]
    ON [dbo].[DevUser]([DevId] ASC, [IsDeleted] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxDevIdTerminalUserIdPin]
    ON [dbo].[DevUser]([DevId] ASC, [TerminalUserId] ASC, [Pin] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DevUser]
    ADD CONSTRAINT [DF_DeviceUsers_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[DevUser]
    ADD CONSTRAINT [FK_DevUser_Devices] FOREIGN KEY ([DevId]) REFERENCES [dbo].[Devices] ([DevId]);


GO



ALTER TABLE [dbo].[DevUser]
    ADD CONSTRAINT [PK_DeviceUsers] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO



