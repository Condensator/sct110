CREATE TABLE [dbo].[AMSUsers] (
    [Id]        INT IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DevUserId] INT NOT NULL,
    [AmsUserId] INT NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [ndxAMSUserDevUserId]
    ON [dbo].[AMSUsers]([DevUserId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[AMSUsers]
    ADD CONSTRAINT [FK_AMSUsers_DevUser] FOREIGN KEY ([DevUserId]) REFERENCES [dbo].[DevUser] ([Id]);


GO



ALTER TABLE [dbo].[AMSUsers]
    ADD CONSTRAINT [PK_AMSUsers] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO



