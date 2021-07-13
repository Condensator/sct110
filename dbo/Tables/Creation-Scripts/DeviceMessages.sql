CREATE TABLE [dbo].[DeviceMessages] (
    [Id]          INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [title]       VARCHAR (30)   NOT NULL,
    [message]     VARCHAR (1000) NOT NULL,
    [DevId]       INT            NOT NULL,
    [IsRead]      BIT            NULL,
    [CreatedDate] DATETIME       NULL,
    [ReadDate]    DATETIME       NULL
);


GO

CREATE NONCLUSTERED INDEX [Idx_DeviceMessagesDevId]
    ON [dbo].[DeviceMessages]([DevId] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DeviceMessages]
    ADD CONSTRAINT [DF_DeviceMessages_CreatedDate] DEFAULT (getdate()) FOR [CreatedDate];


GO



ALTER TABLE [dbo].[DeviceMessages]
    ADD CONSTRAINT [PK_DeviceMessages] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



