CREATE TABLE [dbo].[TrxSABC] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [Request]      VARCHAR (MAX) NULL,
    [RequestType]  VARCHAR (MAX) NULL,
    [Response]     VARCHAR (MAX) NULL,
    [ResponseType] VARCHAR (MAX) NULL,
    [DateTime]     NVARCHAR (50) NULL,
    [DeviceId]     INT           NULL,
    [Date]         DATETIME      NULL,
    [Reference]    VARCHAR (50)  NULL
);


GO

ALTER TABLE [dbo].[TrxSABC]
    ADD CONSTRAINT [DF__TrxSABC__Date__004131E4] DEFAULT (getdate()) FOR [Date];


GO



ALTER TABLE [dbo].[TrxSABC]
    ADD CONSTRAINT [PK_TrxSABC_1] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



