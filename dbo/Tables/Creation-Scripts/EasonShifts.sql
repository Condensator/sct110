CREATE TABLE [dbo].[EasonShifts] (
    [Id]        INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Status]    INT           NULL,
    [StartTime] DATETIME      NULL,
    [EndTime]   DATETIME      NULL,
    [EOSNumber] INT           NULL,
    [Total]     MONEY         NULL,
    [Data]      TEXT          NULL,
    [ErrorCode] INT           NULL,
    [ErrorText] VARCHAR (200) NULL
);


GO

