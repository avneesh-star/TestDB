CREATE TABLE [dbo].[tblUserFormFields] (
    [FieldId]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [FormId]      BIGINT         NULL,
    [Label]       VARCHAR (500)  NULL,
    [Description] VARCHAR (1000) NULL,
    [FieldType]   TINYINT        NULL,
    [InputType]   VARCHAR (100)  NULL,
    [Placeholder] VARCHAR (500)  NULL,
    [HelpText]    VARCHAR (500)  NULL,
    [Required]    BIT            DEFAULT ((0)) NULL,
    [ErrorText]   VARCHAR (1000) NULL,
    [MaxChar]     INT            NULL,
    [MinChar]     INT            NULL,
    [Direction]   VARCHAR (10)   NULL,
    [Active]      BIT            DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([FieldId] ASC),
    FOREIGN KEY ([FieldType]) REFERENCES [dbo].[tblFieldTypes] ([Id]),
    FOREIGN KEY ([FormId]) REFERENCES [dbo].[tblUserForms] ([FormId])
);

