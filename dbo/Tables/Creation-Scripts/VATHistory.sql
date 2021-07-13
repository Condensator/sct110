CREATE TABLE [dbo].[VATHistory] (
    [Id]            INT             IDENTITY (1, 1) NOT NULL,
    [Percentage]    DECIMAL (18, 4) NULL,
    [EffectiveDate] DATETIME        NULL
);


GO

ALTER TABLE [dbo].[VATHistory]
    ADD CONSTRAINT [PK_VATHistory] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



