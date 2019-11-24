CREATE TABLE [dbo].[user_login_histories] (
    [user_id]         VARCHAR (8) NOT NULL,
    [last_login_date] DATETIME    NOT NULL
);



CREATE TABLE [dbo].[titles] (
    [id]           INT          IDENTITY (1, 1) NOT NULL,
    [name]         VARCHAR (50) NOT NULL,
    [tier_level]   INT          NOT NULL,
    [created_date] DATETIME     NOT NULL,
    [created_user] VARCHAR (8)  DEFAULT ('ADMIN') NOT NULL,
    [updated_date] DATETIME     NOT NULL,
    [updated_user] VARCHAR (8)  DEFAULT ('ADMIN') NOT NULL,
    CONSTRAINT [titles_PKC] PRIMARY KEY CLUSTERED ([id] ASC)
);


