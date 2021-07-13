CREATE TABLE [dbo].[VendRetry] (
    [Id]                   INT           IDENTITY (1, 1) NOT NULL,
    [PartnerId]            VARCHAR (3)   NOT NULL,
    [LocalAuthCode]        VARCHAR (3)   NOT NULL,
    [ClientId]             VARCHAR (13)  NOT NULL,
    [TerminalId]           VARCHAR (13)  NOT NULL,
    [DateTime]             VARCHAR (17)  NOT NULL,
    [UniqueNumber]         VARCHAR (14)  NOT NULL,
    [SecurityKey]          VARCHAR (8)   NOT NULL,
    [Operator]             VARCHAR (10)  NOT NULL,
    [MeterNumber]          VARCHAR (11)  NULL,
    [CardData]             VARCHAR (13)  NULL,
    [Amount]               MONEY         NOT NULL,
    [PayType]              VARCHAR (6)   NOT NULL,
    [TenderAmount]         MONEY         NOT NULL,
    [OriginalFailReason]   VARCHAR (250) NULL,
    [LastVendRetry]        DATETIME      NULL,
    [LastVendRetryResults] VARCHAR (700) NULL,
    [ReceiptNumber]        VARCHAR (24)  NULL,
    [InternalDate]         DATETIME      NULL
);


GO

ALTER TABLE [dbo].[VendRetry]
    ADD CONSTRAINT [PK_VendRetry] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxVendRetryInternaldateReceiptNumber]
    ON [dbo].[VendRetry]([InternalDate] ASC, [ReceiptNumber] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxVendRetryMeternumInternaldateReceiptnumber]
    ON [dbo].[VendRetry]([MeterNumber] ASC, [InternalDate] ASC, [ReceiptNumber] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



