CREATE TABLE [dbo].[GetColumns68682] (
    [accountnr]       VARCHAR (50)  NULL,
    [DeviceName]      VARCHAR (50)  NOT NULL,
    [DevId]           INT           NULL,
    [terminalshiftid] INT           NOT NULL,
    [startdate]       DATETIME      NOT NULL,
    [closedate]       DATETIME      NULL,
    [Reference]       VARCHAR (50)  NULL,
    [TrxId]           BIGINT        NOT NULL,
    [UserName]        NVARCHAR (20) NOT NULL,
    [Status]          INT           NULL,
    [FullAmount]      MONEY         NOT NULL,
    [TransDateTime]   DATETIME      NOT NULL,
    [Cash]            MONEY         NULL,
    [CreditCard]      FLOAT (53)    NULL,
    [DebitCard]       FLOAT (53)    NULL,
    [Cheque]          MONEY         NULL,
    [Other]           MONEY         NULL,
    [Total]           MONEY         NULL,
    [Change]          FLOAT (53)    NULL,
    [Id]              INT           NULL,
    [TrxTypeId]       INT           NOT NULL,
    [SWVersion]       VARCHAR (20)  NOT NULL,
    [serialnumber]    VARCHAR (50)  NULL
);


GO

