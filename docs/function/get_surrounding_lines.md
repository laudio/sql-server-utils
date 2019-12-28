# utils.get_surrounding_lines

Function to get surrounding lines from a text.

## Usage of adjacent_line_count

You can choose how many surrounding lines to show using the second to last `adjacent_line_count` argument.

```sql
-- With `adjacent_line_count = 1`
SELECT utils.get_surrounding_lines('Hey\nthere\nhow\nare\nyou', 3, 1, 1) AS snippet1;

-- With `adjacent_line_count = 2`
SELECT utils.get_surrounding_lines('Hey\nthere\nhow\nare\nyou', 3, 2, 1) AS snippet2;
```

## Output of adjacent_line_count

|                snippet1                |
| -------------------------------------- |
| 2    there\n3 -->how\n4    are |

|                              snippet2                              |
| ------------------------------------------------------------------ |
| 1    Hey\n2    there\n3 -->how\n4    are\n5    you |

## Usage with highlight

You can highlight the line number with last argument as 1.

```sql
SELECT utils.get_surrounding_lines('Hey\nthere\nhow\nare\nyou', 3, 1, 1) AS snippet;
```

## Output with highlight

|                 snippet                 |
| --------------------------------------- |
| 2     there\n3 -->how\n4    are |

## Usage without highlight

You can avoid highlighting the line number with last argument as 0.

```sql
SELECT utils.get_surrounding_lines('Hey\nthere\nhow\nare\nyou', 3, 1, 0) AS snippet;
```

## Output without highlight

|                  snippet                  |
| ----------------------------------------- |
| 2     there\n3     how\n4     are |
