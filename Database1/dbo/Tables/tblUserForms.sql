CREATE TABLE [dbo].[tblUserForms] (
    [FormId]      BIGINT        IDENTITY (1, 1) NOT NULL,
    [Title]       VARCHAR (100) NULL,
    [Description] VARCHAR (500) NULL,
    [Active]      BIT           DEFAULT ((1)) NULL,
    [CreateBy]    INT           NULL,
    [CreateDate]  DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([FormId] ASC),
    FOREIGN KEY ([CreateBy]) REFERENCES [dbo].[UserMasters] ([Id])
);

