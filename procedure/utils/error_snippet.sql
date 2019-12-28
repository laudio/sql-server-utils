--
-- Procedure to get snippet of procedure / function where error was encountered.
--
CREATE PROCEDURE utils.error_snippet
  @proc_name NVARCHAR(255),
  @adjacent_line_count INT = 2
AS
BEGIN

  DECLARE @proc_text TABLE (
    query NVARCHAR(MAX)
  );

  INSERT INTO @proc_text (query)
  EXEC sp_helptext @proc_name;

  DECLARE @query NVARCHAR(MAX) = (SELECT STRING_AGG(query, '') FROM @proc_text);

  DECLARE @snippet NVARCHAR(MAX) = utils.get_surrounding_lines(@query, ERROR_LINE(), @adjacent_line_count, 1);

  PRINT 'ERRORED QUERY SNIPPET:' + CHAR(13) + @snippet;

  SELECT @snippet;

END
