/*
SET STATISTICS TIME  ON 
DECLARE 
@UserId BIGINT = 1,
@FormId BIGINT = 1,
@pageNo INT = 130,
@pageSize INT=25,
@TotalRecords BIGINT =0 
EXEC Usp_GetFormRecords @UserId, @FormId, @pageNo, @pageSize, @TotalRecords OUT
SELECT @TotalRecords
SET STATISTICS TIME  OFF  
*/

CREATE PROCEDURE Usp_GetFormRecords
(
@UserId BIGINT,
@FormId BIGINT,
@pageNo INT = 130,
@pageSize INT=25,
@TotalRecords INT =0 OUT
)
AS
BEGIN
DECLARE @SelectCols VARCHAR(MAX), @pivotCols VARCHAR(MAX), @Query VARCHAR(MAX),
@DataQuery VARCHAR(MAX), @TotalQuery NVARCHAR(MAX)

-- tblfieldTypes
SELECT 
@SelectCols =
STRING_AGG((
CASE
	WHEN FieldType=3
		THEN 'JSON_QUERY('+ QUOTENAME(FieldId) +') as '+QUOTENAME(FieldId)
	ELSE QUOTENAME(FieldId)
END 
),', ')
FROM tblUserFormFields
where FormId = 1

SELECT @pivotCols = STRING_AGG(QUOTENAME(FieldId), ', ')
FROM tblUserFormFields
where FormId = 1

SET @Query = ' SELECT Recordid
		FROM tblUserRecords t
		WHERE formId = '+CAST(@FormId as varchar)+' '


SET @TotalQuery =' SELECT @TotalRecords = Count(Recordid)
					FROM tblUserRecords t
					WHERE formId = '+CAST(@FormId as varchar)+' '

	SET @Query += ' 
				ORDER BY Recordid desc
				OFFSET (('+CAST(@pageNo AS varchar)+' - 1) * '+CAST(@pageSize AS varchar)+') ROWS
				FETCH NEXT '+CAST(@pageSize AS varchar)+' ROWS ONLY '


SET @DataQuery = '
	SELECT Recordid as id, '+ @SelectCols +'
	FROM 
	(
		SELECT a.Recordid, CAST(b.FieldId AS VARCHAR) FieldId,
		CASE 
			WHEN c.FieldType=3 
				THEN (dbo.fn_GetOptionValue(b.[Value]))
				ELSE  b.[Value]
		END [Value]
		FROM 
		(
		'+@Query+'
		) a
		INNER JOIN tblUserRecordValues b on b.Recordid = a.Recordid
		INNER JOIN tblUserFormFields c on c.FieldId = b.FieldId
	) A
	PIVOT
	(
		MAX([Value])
		FOR FieldId IN ('+@pivotCols+')
	) X 
	FOR JSON PATH
	'
	PRINT @DataQuery
	 EXEC(@DataQuery)
	 EXEC sp_executesql @TotalQuery , N'@TotalRecords INT OUTPUT' , @TotalRecords=@TotalRecords  OUTPUT
END
