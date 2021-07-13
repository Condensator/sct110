CREATE TABLE [dbo].[alledcontransactions] (
    [trxid]         INT          NOT NULL,
    [accid]         INT          NOT NULL,
    [devid]         INT          NULL,
    [paymenttypeid] INT          NULL,
    [trxtypeid]     INT          NOT NULL,
    [shfid]         INT          NOT NULL,
    [fullamount]    MONEY        NOT NULL,
    [billamount]    MONEY        NOT NULL,
    [transdatetime] DATETIME     NOT NULL,
    [reference]     VARCHAR (50) NULL,
    [status]        INT          NULL,
    [devusrid]      INT          NULL,
    [invdetailid]   INT          NULL
);


GO

