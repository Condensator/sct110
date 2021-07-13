CREATE TABLE [dbo].[PWC_AON_CREDITNOTES] (
    [AccountNr]    VARCHAR (50)  NULL,
    [CRId]         INT           NOT NULL,
    [TimeStamp]    DATETIME      NOT NULL,
    [Description]  NVARCHAR (50) NOT NULL,
    [AmountExcl]   MONEY         NOT NULL,
    [AmountIncl]   MONEY         NOT NULL,
    [Printed]      INT           NULL,
    [IsDeleted]    BIT           NOT NULL,
    [IsExported]   BIT           NOT NULL,
    [AccTransId]   INT           NULL,
    [ReversalID]   BIGINT        NULL,
    [ComIssued]    BIT           NOT NULL,
    [RebateIssued] BIT           NOT NULL
);


GO

