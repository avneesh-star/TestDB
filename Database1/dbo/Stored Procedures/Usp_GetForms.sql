-- exec Usp_GetForms 1
CREATE PROCEDURE Usp_GetForms
(
@Userid BIGINT
)
AS
BEGIN
	SELECT CAST(formid AS varchar) as id, Title as title
	from tblUserForms
	WHERE CreateBy = @Userid
	AND Active = 1
END