# utils.get_surrounding_lines

Function to get surrounding lines from a message.

## Usage of adjacent_line_count

You can how many surrounding lines to show using the second to last `adjacent_line_count` argument.

```sql
-- With `adjacent_line_count = 1`
SELECT utils.get_surrounding_lines('Hey\nthere\nhow\nare\nyou', 3, 1, 1) AS snippet1;

-- With `adjacent_line_count = 2`
SELECT utils.get_surrounding_lines('Hey\nthere\nhow\nare\nyou', 3, 2, 1) AS snippet2;
```

## Output of adjacent_line_count

|        snippet1         |
| ----------------------- |
| there\n--->how\n    are |

|               snippet2                |
| ------------------------------------- |
| Hey\nthere\n--->how\n    are\n    you |

## Usage with highlight

You can highlight the line number with last argument as 1.

```sql
SELECT utils.get_surrounding_lines('Hey\nthere\nhow\nare\nyou', 3, 1, 1) AS snippet;
```

## Output with highlight

|         snippet         |
| ----------------------- |
| there\n--->how\n    are |

## Usage without highlight

You can avoid highlighting the line number with last argument as 0.

```sql
SELECT utils.get_surrounding_lines('Hey\nthere\nhow\nare\nyou', 3, 1, 0) AS snippet;
```

## Output without highlight

|     snippet     |
| --------------- |
| there\nhow\nare |
