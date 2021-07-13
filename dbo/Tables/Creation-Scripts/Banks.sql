CREATE TABLE [dbo].[Banks] (
    [BankId]    INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [BankName]  VARCHAR (50) NOT NULL,
    [IsDeleted] BIT          NOT NULL
);


GO

ALTER TABLE [dbo].[Banks]
    ADD CONSTRAINT [DF_Banks_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[Banks]
    ADD CONSTRAINT [PK_Banks] PRIMARY KEY CLUSTERED ([BankId] ASC) WITH (FILLFACTOR = 90);


GO



