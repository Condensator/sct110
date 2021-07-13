CREATE TABLE [dbo].[DeviceCoordinates] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Date]        DATETIME      NULL,
    [Coordinates] VARCHAR (100) NULL,
    [DevId]       INT           NULL
);


GO

CREATE NONCLUSTERED INDEX [ndxDevid]
    ON [dbo].[DeviceCoordinates]([DevId] ASC)
    INCLUDE([ID], [Date], [Coordinates]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DeviceCoordinates]
    ADD CONSTRAINT [PK__DeviceCo__3214EC272076F8DB] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO



