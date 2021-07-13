CREATE TABLE [dbo].[DenominationType] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [Code]        VARCHAR (20) NOT NULL,
    [DisplayText] VARCHAR (50) NOT NULL,
    [Value]       MONEY        NOT NULL,
    [IsFixed]     BIT          NOT NULL,
    [IsDeleted]   BIT          NOT NULL,
    [IsNote]      BIT          NOT NULL
);


GO

ALTER TABLE [dbo].[DenominationType]
    ADD CONSTRAINT [PK_DenominationType] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



