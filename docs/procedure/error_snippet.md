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

      );

      UPDATE [qa].[qa_result_fact_timesheet]
      SET is_active=0
      WHERE is_active=1;

      INSERT INTO [qa].[qa_result_fact_timesheet]
      (
        qa_datetime,
        last_timesheet_file,
--->    test_case,
        qa_result,
        impacted_records,
        server_name,
        client,
        is_active
      )
      SELECT
        GETDATE() AS qa_datetime,
        @last_timesheet_file_name AS last_timesheet_file,
        test_case,
```
