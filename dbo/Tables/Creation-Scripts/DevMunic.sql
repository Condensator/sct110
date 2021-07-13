CREATE TABLE [dbo].[DevMunic] (
    [Id]        INT IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DevId]     INT NOT NULL,
    [MunicId]   INT NOT NULL,
    [isDeleted] BIT NOT NULL,
    [isEnabled] BIT NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [ndxDevMunicDevId]
    ON [dbo].[DevMunic]([DevId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxDevMunicVarious]
    ON [dbo].[DevMunic]([isEnabled] ASC, [isDeleted] ASC, [DevId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DevMunic]
    ADD CONSTRAINT [FK__DevMunic__DevId__52B92F6B] FOREIGN KEY ([DevId]) REFERENCES [dbo].[Devices] ([DevId]);


GO



ALTER TABLE [dbo].[DevMunic]
    ADD CONSTRAINT [PK_DevMunic] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



