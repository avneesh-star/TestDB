CREATE TABLE [dbo].[tblUserRecords] (
    [RecordId]   BIGINT   IDENTITY (1, 1) NOT NULL,
    [FormId]     BIGINT   NULL,
    [CreateBy]   INT      NULL,
    [CreateDate] DATETIME DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([RecordId] ASC),
    FOREIGN KEY ([CreateBy]) REFERENCES [dbo].[UserMasters] ([Id]),
    FOREIGN KEY ([FormId]) REFERENCES [dbo].[tblUserForms] ([FormId])
);

