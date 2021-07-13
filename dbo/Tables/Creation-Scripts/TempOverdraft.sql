CREATE TABLE [dbo].[TempOverdraft] (
    [Id]             INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [OverDraftType]  INT            NOT NULL,
    [Expired]        BIT            NOT NULL,
    [AccId]          INT            NOT NULL,
    [Reference]      VARCHAR (256)  NOT NULL,
    [Amount]         MONEY          NOT NULL,
    [LoadedDateTime] DATETIME       NOT NULL,
    [ExpiryDateTime] DATETIME       NULL,
    [OverdraftDays]  INT            NOT NULL,
    [BankAccId]      INT            NULL,
    [ExpireOnRule]   INT            NULL,
    [PaymentType]    VARCHAR (64)   NULL,
    [ProcessingUser] NVARCHAR (256) NOT NULL
);


GO

ALTER TABLE [dbo].[TempOverdraft]
    ADD CONSTRAINT [DF_TempOverdraft_Expired] DEFAULT ((0)) FOR [Expired];


GO



ALTER TABLE [dbo].[TempOverdraft]
    ADD CONSTRAINT [DF_TempOverdraft_ExpireOnRule] DEFAULT ((1)) FOR [ExpireOnRule];


GO



ALTER TABLE [dbo].[TempOverdraft]
    ADD CONSTRAINT [DF_TempOverdraft_LoadedDateTime] DEFAULT (getdate()) FOR [LoadedDateTime];


GO



ALTER TABLE [dbo].[TempOverdraft]
    ADD CONSTRAINT [DF_TempOverdraft_OverdraftDays] DEFAULT ((3)) FOR [OverdraftDays];


GO



ALTER TABLE [dbo].[TempOverdraft]
    ADD CONSTRAINT [DF_TempOverdraft_ProcessingUser] DEFAULT (N'System') FOR [ProcessingUser];


GO



ALTER TABLE [dbo].[TempOverdraft]
    ADD CONSTRAINT [FK_TempOverdraft_Accounts] FOREIGN KEY ([AccId]) REFERENCES [dbo].[Accounts] ([AccId]);


GO



ALTER TABLE [dbo].[TempOverdraft]
    ADD CONSTRAINT [PK_TempOverdraft] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



