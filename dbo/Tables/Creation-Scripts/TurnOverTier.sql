CREATE TABLE [dbo].[TurnOverTier] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [Description]         NVARCHAR (50) NOT NULL,
    [MinTurnOver]         MONEY         NOT NULL,
    [MaxTurnOver]         MONEY         NULL,
    [OverdraftPercentage] MONEY         NOT NULL,
    [IsDeleted]           BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[TurnOverTier]
    ADD CONSTRAINT [DF__TurnOverT__IsDel__4B3FF66B] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[TurnOverTier]
    ADD CONSTRAINT [DF__TurnOverT__Overd__4A4BD232] DEFAULT ((0)) FOR [OverdraftPercentage];


GO



CREATE CLUSTERED INDEX [ClusteredIndex-20180801-175014]
    ON [dbo].[TurnOverTier]([Id] ASC);


GO



