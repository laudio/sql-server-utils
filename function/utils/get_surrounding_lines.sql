--
-- Function to get surrounding lines from a text.
--
CREATE FUNCTION utils.get_surrounding_lines(
  @text NVARCHAR(MAX),
  @line_number INT,
  @adjacent_line_count INT,
  @with_highlight BIT = 1
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
  DECLARE @snippet NVARCHAR(MAX) = '';

  DECLARE @line_table TABLE (
    line_number INT IDENTITY,
    line_text NVARCHAR(MAX)
  );

  -- TODO: Use inbuilt character for newline instead of using the literal character.
  INSERT INTO @line_table (line_text)
  SELECT value FROM STRING_SPLIT(@text, N'
');

  SELECT
    @snippet = @snippet + CHAR(13) + CAST(line_number AS VARCHAR(10)) +
      (
        CASE
          WHEN @with_highlight = 1 AND line_number = @line_number THEN ' -->'
          ELSE '    '
        END
      ) + line_text
  FROM @line_table
  WHERE line_number BETWEEN @line_number - @adjacent_line_count AND @line_number + @adjacent_line_count;

  RETURN @snippet;
END
