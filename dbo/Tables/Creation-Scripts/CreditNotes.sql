CREATE TABLE [dbo].[CreditNotes] (
    [CRId]         INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [TimeStamp]    DATETIME      NOT NULL,
    [Description]  NVARCHAR (50) NOT NULL,
    [AmountExcl]   MONEY         NOT NULL,
    [AmountIncl]   MONEY         NOT NULL,
    [Printed]      INT           NULL,
    [IsDeleted]    BIT           NOT NULL,
    [IsExported]   BIT           NOT NULL,
    [AccTransId]   INT           NULL,
    [ReversalID]   BIGINT        NULL,
    [ComIssued]    BIT           NOT NULL,
    [RebateIssued] BIT           NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [index_267_266_CreditNotes]
    ON [dbo].[CreditNotes]([TimeStamp] ASC)
    INCLUDE([CRId], [Description], [AmountExcl], [AmountIncl], [AccTransId]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [index_33176_33175_CreditNotes]
    ON [dbo].[CreditNotes]([TimeStamp] ASC)
    INCLUDE([CRId], [Description], [AmountExcl], [AmountIncl], [Printed], [IsDeleted], [IsExported], [AccTransId], [ReversalID]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [index_557_556_CreditNotes]
    ON [dbo].[CreditNotes]([TimeStamp] ASC)
    INCLUDE([CRId], [AccTransId]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [IX_CreditNotes_ComIssued_TimeStamp]
    ON [dbo].[CreditNotes]([ComIssued] ASC, [TimeStamp] ASC)
    INCLUDE([CRId], [AccTransId]);


GO



CREATE NONCLUSTERED INDEX [IX_CreditNotes_Description_TimeStamp]
    ON [dbo].[CreditNotes]([Description] ASC, [TimeStamp] ASC)
    INCLUDE([CRId], [AmountExcl], [AmountIncl], [Printed], [IsDeleted], [IsExported], [AccTransId], [ReversalID], [ComIssued], [RebateIssued]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [IX_CreditNotes_RebateIssued_TimeStamp]
    ON [dbo].[CreditNotes]([RebateIssued] ASC, [TimeStamp] ASC)
    INCLUDE([CRId], [AccTransId]);


GO



CREATE NONCLUSTERED INDEX [ndxCreditNoteAccTransId]
    ON [dbo].[CreditNotes]([AccTransId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[CreditNotes]
    ADD CONSTRAINT [default_Printed] DEFAULT ((0)) FOR [Printed];


GO



ALTER TABLE [dbo].[CreditNotes]
    ADD CONSTRAINT [DF_Creditnotes_ComIssued] DEFAULT ((1)) FOR [ComIssued];


GO



ALTER TABLE [dbo].[CreditNotes]
    ADD CONSTRAINT [DF_Creditnotes_RebateIssued] DEFAULT ((1)) FOR [RebateIssued];


GO



ALTER TABLE [dbo].[CreditNotes]
    ADD CONSTRAINT [FK_CreditNotes_AccTrans] FOREIGN KEY ([AccTransId]) REFERENCES [dbo].[AccTrans] ([TransId]);


GO



ALTER TABLE [dbo].[CreditNotes]
    ADD CONSTRAINT [PK_CreditNotes] PRIMARY KEY CLUSTERED ([CRId] ASC) WITH (FILLFACTOR = 90);


GO



