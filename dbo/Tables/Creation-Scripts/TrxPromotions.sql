CREATE TABLE [dbo].[TrxPromotions] (
    [MetaID]      INT            NOT NULL,
    [PromoName]   VARCHAR (50)   NULL,
    [Enabled]     INT            NULL,
    [Description] NVARCHAR (MAX) NULL,
    [Message]     NVARCHAR (MAX) NULL,
    [PromoId]     INT            IDENTITY (1, 1) NOT NULL
);


GO

ALTER TABLE [dbo].[TrxPromotions]
    ADD CONSTRAINT [PK_Promotions] PRIMARY KEY CLUSTERED ([PromoId] ASC);


GO



