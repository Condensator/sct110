CREATE TABLE [dbo].[Backend_Error_Log] (
    [ID]               INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Stored_Procedure] VARCHAR (256)  NOT NULL,
    [Error]            VARCHAR (1024) NOT NULL,
    [Date_Time]        DATETIME       NOT NULL,
    [ErrorCode]        INT            NULL
);


GO

ALTER TABLE [dbo].[Backend_Error_Log]
    ADD CONSTRAINT [DF_Backend_Error_Log_Date_Time] DEFAULT (getdate()) FOR [Date_Time];


GO



ALTER TABLE [dbo].[Backend_Error_Log]
    ADD CONSTRAINT [DF_Backend_Error_Log_ErrorCode] DEFAULT ((0)) FOR [ErrorCode];


GO



ALTER TABLE [dbo].[Backend_Error_Log]
    ADD CONSTRAINT [PK_Backend_Error_Log] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO



