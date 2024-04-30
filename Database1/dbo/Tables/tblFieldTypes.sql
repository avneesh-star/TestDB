CREATE TABLE [dbo].[tblFieldTypes] (
    [Id]     TINYINT       IDENTITY (1, 1) NOT NULL,
    [Name]   VARCHAR (100) NULL,
    [Active] BIT           DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

