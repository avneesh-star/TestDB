CREATE TABLE [dbo].[tblEmployee] (
    [Empid]      INT           IDENTITY (1, 1) NOT NULL,
    [NAME]       VARCHAR (100) NULL,
    [CITY]       VARCHAR (100) NULL,
    [SALARY]     INT           NULL,
    [CreateDate] DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([Empid] ASC)
);

