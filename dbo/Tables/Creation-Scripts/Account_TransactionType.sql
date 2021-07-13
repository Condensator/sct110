CREATE TABLE [dbo].[Account_TransactionType] (
    [ID]                  INT           NOT NULL,
    [Description]         VARCHAR (256) NOT NULL,
    [AllowedType]         INT           NOT NULL,
    [MayAutomate]         BIT           NOT NULL,
    [VAT]                 INT           NOT NULL,
    [IsDeleted]           BIT           NOT NULL,
    [Percentage]          MONEY         NULL,
    [ExcludeIfNoActivity] BIT           NULL
);


GO

ALTER TABLE [dbo].[Account_TransactionType]
    ADD CONSTRAINT [DF_Account_TransactionType_ExcludeIfNoActivity] DEFAULT ((0)) FOR [ExcludeIfNoActivity];


GO



ALTER TABLE [dbo].[Account_TransactionType]
    ADD CONSTRAINT [DF_Account_TransactionType_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[Account_TransactionType]
    ADD CONSTRAINT [PK_Account_TransactionType] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO



