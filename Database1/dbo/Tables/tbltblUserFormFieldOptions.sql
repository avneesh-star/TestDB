CREATE TABLE [dbo].[tbltblUserFormFieldOptions] (
    [OptionId]       BIGINT        IDENTITY (1, 1) NOT NULL,
    [Label]          VARCHAR (100) NULL,
    [Selected]       BIT           DEFAULT ((0)) NULL,
    [DisplayOrder]   INT           NULL,
    [FieldId]        BIGINT        NULL,
    [ParentOptionId] BIGINT        NULL,
    [Active]         BIT           DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([OptionId] ASC),
    FOREIGN KEY ([FieldId]) REFERENCES [dbo].[tblUserFormFields] ([FieldId]),
    FOREIGN KEY ([ParentOptionId]) REFERENCES [dbo].[tbltblUserFormFieldOptions] ([OptionId])
);

