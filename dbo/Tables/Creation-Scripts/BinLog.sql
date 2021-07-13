CREATE TABLE [dbo].[BinLog] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [BinDateTime]      DATETIME       NOT NULL,
    [UserName]         NVARCHAR (256) NOT NULL,
    [TrxId]            BIGINT         NOT NULL,
    [BinReasonId]      INT            NOT NULL,
    [BinResult]        SMALLINT       NOT NULL,
    [ExtraInformation] NVARCHAR (500) NULL
);


GO

ALTER TABLE [dbo].[BinLog]
    ADD CONSTRAINT [DF__BinLog__BinDateT__476F6587] DEFAULT (getdate()) FOR [BinDateTime];


GO



