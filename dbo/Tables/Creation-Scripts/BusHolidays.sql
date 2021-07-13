CREATE TABLE [dbo].[BusHolidays] (
    [Id]   INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Name] VARCHAR (20) NOT NULL,
    [Day]  VARCHAR (5)  NOT NULL
);


GO

