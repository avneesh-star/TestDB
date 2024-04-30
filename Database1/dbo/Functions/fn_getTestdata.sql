
CREATE  FUNCTION dbo.fn_getTestdata 
(
@formid int
)
RETURNS 
@temp TABLE 
(
RecordId BIGINT, 
FormId BIGINT, 
CreateBy  BIGINT, 
CreateDate DATETIME
)
AS
BEGIN
	
	INSERT INTO @temp(RecordId, FormId, CreateBy, CreateDate)
	select RecordId, FormId, CreateBy, CreateDate 
	from tblUserRecords
	where FormId =@formid
	ORDER BY RecordId
	OFFSET 0 rows fetch next 25 rows only
	
	RETURN 
END
