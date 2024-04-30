CREATE TABLE [dbo].[tblUserRecordValues] (
    [Recordid] BIGINT        NOT NULL,
    [FieldId]  BIGINT        NOT NULL,
    [Value]    VARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Recordid] ASC, [FieldId] ASC),
    FOREIGN KEY ([FieldId]) REFERENCES [dbo].[tblUserFormFields] ([FieldId]),
    FOREIGN KEY ([Recordid]) REFERENCES [dbo].[tblUserRecords] ([RecordId])
);

