CREATE TABLE [dbo].[waitstats] (
    [wait_type]           NVARCHAR (60) NOT NULL,
    [waiting_tasks_count] BIGINT        NOT NULL,
    [wait_time_ms]        BIGINT        NOT NULL,
    [max_wait_time_ms]    BIGINT        NOT NULL,
    [signal_wait_time_ms] BIGINT        NOT NULL,
    [now]                 DATETIME      NOT NULL
);


GO

ALTER TABLE [dbo].[waitstats]
    ADD CONSTRAINT [DF__waitstats__now__6E967D76] DEFAULT (getdate()) FOR [now];


GO



