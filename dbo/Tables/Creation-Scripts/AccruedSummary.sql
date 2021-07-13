CREATE TABLE [dbo].[AccruedSummary] (
    [Id]                 BIGINT        IDENTITY (1, 1) NOT NULL,
    [EntId]              INT           NOT NULL,
    [AccId]              INT           NOT NULL,
    [AccruedTotal]       MONEY         NOT NULL,
    [RunningTotal]       MONEY         NOT NULL,
    [DateUpdated]        DATETIME2 (7) NOT NULL,
    [LastProcessedTrxId] BIGINT        NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [IDX_AccruedSummary_EntId_AccId]
    ON [dbo].[AccruedSummary]([EntId] ASC)
    INCLUDE([AccId]);


GO



ALTER TABLE [dbo].[AccruedSummary]
    ADD CONSTRAINT [DF_AccruedSummary_AccruedTotal] DEFAULT ((0)) FOR [AccruedTotal];


GO



ALTER TABLE [dbo].[AccruedSummary]
    ADD CONSTRAINT [DF_AccruedSummary_DateUpated] DEFAULT (getdate()) FOR [DateUpdated];


GO



ALTER TABLE [dbo].[AccruedSummary]
    ADD CONSTRAINT [DF_AccruedSummary_RunningTotal] DEFAULT ((0)) FOR [RunningTotal];


GO



ALTER TABLE [dbo].[AccruedSummary]
    ADD CONSTRAINT [FK_AccruedSummary_Accounts] FOREIGN KEY ([AccId]) REFERENCES [dbo].[Accounts] ([AccId]);


GO



ALTER TABLE [dbo].[AccruedSummary]
    ADD CONSTRAINT [FK_AccruedSummary_AccruedSummary] FOREIGN KEY ([EntId]) REFERENCES [dbo].[Entity] ([EntId]);


GO



ALTER TABLE [dbo].[AccruedSummary]
    ADD CONSTRAINT [PK_AccruedSummary] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



