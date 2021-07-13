CREATE TABLE [dbo].[DenyTrxTypes] (
    [DenyTypeId] INT IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DevUsrId]   INT NULL,
    [TrxTypeId]  INT NULL,
    [IsDeleted]  BIT NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [ndxDenyTrxTypesTrxTypeId]
    ON [dbo].[DenyTrxTypes]([TrxTypeId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxDevUserId]
    ON [dbo].[DenyTrxTypes]([DevUsrId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxIsdeleted]
    ON [dbo].[DenyTrxTypes]([IsDeleted] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DenyTrxTypes]
    ADD CONSTRAINT [DF_DenyTrxTypes_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[DenyTrxTypes]
    ADD CONSTRAINT [FK_DenyTrxTypes_DevUser] FOREIGN KEY ([DevUsrId]) REFERENCES [dbo].[DevUser] ([Id]);


GO



ALTER TABLE [dbo].[DenyTrxTypes]
    ADD CONSTRAINT [FK_DenyTrxTypes_TrxTypes] FOREIGN KEY ([TrxTypeId]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO



ALTER TABLE [dbo].[DenyTrxTypes]
    ADD CONSTRAINT [PK_DenyTrxTypes] PRIMARY KEY CLUSTERED ([DenyTypeId] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO



