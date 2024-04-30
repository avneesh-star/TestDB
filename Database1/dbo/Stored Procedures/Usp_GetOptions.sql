CREATE PROCEDURE Usp_GetOptions
(
@fieldId VARCHAR(100),
@ParentOptionId VARCHAR(100)=''
)
AS
BEGIN
	IF(@ParentOptionId IS NULL OR @ParentOptionId = '' )
	BEGIN
		SELECT  CAST( OptionId  AS varchar) as id, Label as label,
		selected, CAST( ParentOptionId AS varchar) as parentOption
		FROM tbltblUserFormFieldOptions 
		where FieldId = @fieldId
	END
	ELSE
	BEGIN
		SELECT  CAST( OptionId  AS varchar) as id, Label as label,
		selected, CAST( ParentOptionId AS varchar) as parentOption
		FROM tbltblUserFormFieldOptions 
		where FieldId = @fieldId
		AND  ParentOptionId = @ParentOptionId
	END
END