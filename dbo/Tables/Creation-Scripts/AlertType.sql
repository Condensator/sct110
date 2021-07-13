CREATE TABLE [dbo].[AlertType] (
    [Id]               INT           IDENTITY (1, 1) NOT NULL,
    [Code]             VARCHAR (20)  NOT NULL,
    [Description]      VARCHAR (50)  NOT NULL,
    [SMSText]          VARCHAR (150) NOT NULL,
    [EMailSubjectText] VARCHAR (250) NOT NULL,
    [EMailText]        VARCHAR (500) NOT NULL,
    [SendSMSClient]    BIT           NOT NULL,
    [SendEmailClient]  BIT           NOT NULL,
    [SendEmailExtra]   BIT           NOT NULL,
    [EMailAddress]     VARCHAR (250) NOT NULL,
    [IsDeleted]        BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[AlertType]
    ADD CONSTRAINT [DF_AlertType_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[AlertType]
    ADD CONSTRAINT [PK_AlertType] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



