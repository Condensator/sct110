CREATE TABLE [dbo].[SystemReportMenu] (
    [rptId]           INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [rptCatalogId]    INT           NOT NULL,
    [MasterId]        INT           NOT NULL,
    [RptName]         VARCHAR (50)  NOT NULL,
    [MenuParentId]    INT           NOT NULL,
    [RptStoredProc]   VARCHAR (50)  NOT NULL,
    [ParamDateRange]  BIT           NOT NULL,
    [ParamDateSingle] BIT           NOT NULL,
    [ParamDevId]      BIT           NOT NULL,
    [ParamEntId]      BIT           NOT NULL,
    [ParamAccId]      BIT           NOT NULL,
    [ParamShfId]      BIT           NOT NULL,
    [ParamInvId]      BIT           NOT NULL,
    [ParamTrxId]      BIT           NOT NULL,
    [ParamBankId]     BIT           NOT NULL,
    [ParamUserId]     BIT           NOT NULL,
    [ParamSaleRepId]  BIT           NOT NULL,
    [ParamTrxType]    BIT           NOT NULL,
    [ParamSupplierId] BIT           NOT NULL,
    [ReportPath]      VARCHAR (250) NULL,
    [ShowOnPage]      INT           NOT NULL,
    [IsDeleted]       BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[SystemReportMenu]
    ADD CONSTRAINT [DF_SystemReportMenu_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[SystemReportMenu]
    ADD CONSTRAINT [PK_SystemReportMenu] PRIMARY KEY CLUSTERED ([rptId] ASC) WITH (FILLFACTOR = 90);


GO



