CREATE TABLE [dbo].[AppLogs] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [Message]         NVARCHAR (MAX) NULL,
    [MessageTemplate] NVARCHAR (MAX) NULL,
    [Level]           NVARCHAR (MAX) NULL,
    [TimeStamp]       DATETIME       NULL,
    [Exception]       NVARCHAR (MAX) NULL,
    [Properties]      NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_AppLogs] PRIMARY KEY CLUSTERED ([Id] ASC)
);

