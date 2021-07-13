CREATE TABLE [dbo].[AbnormalSalesAutoSuspendService] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [AccountNr]         VARCHAR (50)  NULL,
    [GroupDescription]  VARCHAR (200) NULL,
    [DeviceId]          INT           NULL,
    [DeviceDescription] VARCHAR (200) NULL,
    [Contactperson]     VARCHAR (50)  NULL,
    [Telephone]         VARCHAR (50)  NULL,
    [Cellphone]         VARCHAR (50)  NULL,
    [StartDate]         DATETIME      NULL,
    [EndDate]           DATETIME      NULL,
    [TimePeriod]        DATETIME      NULL,
    [Quantity]          INT           NULL,
    [TradeValue]        MONEY         NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

