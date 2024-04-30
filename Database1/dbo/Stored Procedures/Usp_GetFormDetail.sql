-- exec Usp_GetFormDetail 1
CREATE PROCEDURE Usp_GetFormDetail
(
@FormId BIGINT 
)
AS
BEGIN
	SELECT CAST( b.FieldId AS varchar) as Id,  b.Label as label, c.Name as FieldType, b.InputType, b.Placeholder, b.HelpText,  b.Direction, a.Active , 
	b.Required, b.MaxChar, b.MinChar,
	JSON_QUERY((
		SELECT  CAST( OptionId  AS varchar) as id, Label as label,
		selected, CAST( ParentOptionId AS varchar) as parentOption
		FROM tbltblUserFormFieldOptions 
		where FieldId = b.FieldId
		FOR JSON PATH
	)) AS options
	FROM tblUserForms a
	INNER JOIN tblUserFormFields b on b.FormId =  a.FormId
	INNER JOIN tblFieldTypes c on c.Id  =  b.FieldType
	WHERE a.FormId=@FormId
	AND B.Active	 = 1
END


