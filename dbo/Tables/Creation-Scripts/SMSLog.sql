CREATE TABLE [dbo].[SMSLog] (
    [ID]        INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [SMSNumber] VARCHAR (20)  NOT NULL,
    [Message]   VARCHAR (280) NOT NULL,
    [AccountID] INT           NULL,
    [DateTime]  DATETIME      NOT NULL,
    [Sent]      BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[SMSLog]
    ADD CONSTRAINT [DF_SMSLog_DateTime] DEFAULT (getdate()) FOR [DateTime];


GO



ALTER TABLE [dbo].[SMSLog]
    ADD CONSTRAINT [DF_SMSLog_Sent] DEFAULT ((0)) FOR [Sent];


GO



ALTER TABLE [dbo].[SMSLog]
    ADD CONSTRAINT [PK_SMSLog] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [index_SMSLog_Include]
    ON [dbo].[SMSLog]([AccountID] ASC, [Sent] ASC)
    INCLUDE([ID], [SMSNumber], [Message], [DateTime]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxDateTime]
    ON [dbo].[SMSLog]([DateTime] ASC)
    INCLUDE([ID], [Message]);


GO



