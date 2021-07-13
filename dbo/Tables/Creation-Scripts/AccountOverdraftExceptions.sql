CREATE TABLE [dbo].[AccountOverdraftExceptions] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [AccId]      INT           NOT NULL,
    [Username]   VARCHAR (250) NOT NULL,
    [DateLoaded] SMALLDATETIME NOT NULL,
    [Period]     INT           NOT NULL,
    [DateExpire] SMALLDATETIME NOT NULL
);


GO

ALTER TABLE [dbo].[AccountOverdraftExceptions]
    ADD CONSTRAINT [DF__AccountOv__DateL__45871D15] DEFAULT (getdate()) FOR [DateLoaded];


GO



