CREATE TABLE [dbo].[ConnectionSettings] (
    [ConnId]      INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [IPAddress]   VARCHAR (50)  NOT NULL,
    [Port]        INT           NOT NULL,
    [APN]         VARCHAR (256) NOT NULL,
    [APNUserName] VARCHAR (256) NOT NULL,
    [APNPassword] VARCHAR (256) NOT NULL
);


GO

ALTER TABLE [dbo].[ConnectionSettings]
    ADD CONSTRAINT [PK_ConnectionSettings] PRIMARY KEY CLUSTERED ([ConnId] ASC) WITH (FILLFACTOR = 90);


GO



