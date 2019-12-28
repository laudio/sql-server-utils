# utils.error_snippet

Procedure to get snippet of procedure / function where error was encountered.

## Usage

You can use the `utils.error_snippet` procedure as follows:

```sql
BEGIN TRY
  -- Execute procedure with any possible error.
  EXEC proc_name 'arg1', 'arg2';
END TRY
BEGIN CATCH
  -- This procedure prints the errored snippet from given procedure.
  EXEC utils.error_snippet 'proc_name', @adjacent_line_count = 10;

  THROW;
END CATCH
```

## Output

Error snippet with the error line highlighted:

```bash
12
13      UPDATE [qa].[qa_result_fact_timesheet]
14      SET is_active=0
15      WHERE is_active=1;
16
17 -->  INSERT INTO [qa].[qa_result_fact_timesheet]
18      (
19        qa_datetime,
20        last_timesheet_file,
21        test_case,
22        qa_result,
```
