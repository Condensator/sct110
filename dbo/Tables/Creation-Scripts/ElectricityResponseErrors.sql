CREATE TABLE [dbo].[ElectricityResponseErrors] (
    [Id]                   BIGINT         IDENTITY (1, 1) NOT NULL,
    [SupplierName]         VARCHAR (50)   NULL,
    [DataFieldName]        VARCHAR (70)   NULL,
    [ValueReceivedFromSup] VARCHAR (5000) NULL,
    [ValueSentToClient]    VARCHAR (5000) NULL,
    [DataLengthReceived]   INT            NULL,
    [DataLengthSent]       INT            NULL,
    [DevId]                INT            NULL,
    [TrxTypeId]            INT            NULL,
    [ResponseName]         VARCHAR (20)   NULL,
    [EMailed]              BIT            NOT NULL,
    [DateTime]             DATETIME       NULL
);


GO

ALTER TABLE [dbo].[ElectricityResponseErrors]
    ADD CONSTRAINT [DF__Electrici__EMail__073871A2] DEFAULT ((0)) FOR [EMailed];


GO



ALTER TABLE [dbo].[ElectricityResponseErrors]
    ADD CONSTRAINT [PK__Electric__3214EC0705502930] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



