CREATE TABLE [dbo].[Journal] (
    [JournalId]   INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Description] VARCHAR (256) NOT NULL,
    [Type]        CHAR (1)      NOT NULL,
    [Amount]      MONEY         NOT NULL,
    [DateTime]    DATETIME      NOT NULL,
    [AccId]       INT           NOT NULL,
    [AccTransId]  INT           NOT NULL,
    [StockTypeId] INT           NULL
);


GO

ALTER TABLE [dbo].[Journal]
    ADD CONSTRAINT [FK_Journal_Accounts] FOREIGN KEY ([AccId]) REFERENCES [dbo].[Accounts] ([AccId]);


GO



ALTER TABLE [dbo].[Journal]
    ADD CONSTRAINT [FK_Journal_AccTrans] FOREIGN KEY ([AccTransId]) REFERENCES [dbo].[AccTrans] ([TransId]);


GO



ALTER TABLE [dbo].[Journal]
    ADD CONSTRAINT [PK_Journal] PRIMARY KEY CLUSTERED ([JournalId] ASC) WITH (FILLFACTOR = 90);


GO



