CREATE FUNCTION fn_GetOptionValue(@optionId bigint)
RETURNS VARCHAR(MAX) 
AS
BEGIN
DECLARE @json varchar(max)
SELECT @json = (
SELECT OptionId as id, label
FROM tbltblUserFormFieldOptions
where OptionId = @optionId
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
)
RETURN @json
END

