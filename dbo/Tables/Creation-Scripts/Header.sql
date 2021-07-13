CREATE TABLE [dbo].[Header] (
    [ID]         INT           IDENTITY (1, 1) NOT NULL,
    [HeaderHTML] VARCHAR (MAX) NOT NULL
);


GO

ALTER TABLE [dbo].[Header]
    ADD CONSTRAINT [PK_Header] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO



