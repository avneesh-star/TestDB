CREATE TABLE [dbo].[UserMasters] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Name]         NVARCHAR (MAX) NULL,
    [Email]        NVARCHAR (MAX) NULL,
    [Password]     NVARCHAR (MAX) NULL,
    [TfaSecretKEy] NVARCHAR (MAX) NULL,
    [TfaEnabled]   BIT            NOT NULL,
    CONSTRAINT [PK_UserMasters] PRIMARY KEY CLUSTERED ([Id] ASC)
);

