select
  *
from (
  select
    sql_text
  , address
  , hash_value
  , parse_calls
  , executions
  , buffer_gets
  , disk_reads
  , buffer_gets/executions as buffer_per_run
  , disk_reads/executions disk_per_run
  , cpu_time
  , elapsed_time
  from
    v$sql
  where
    executions > 0
  order by
    elapsed_time desc
)
where
  rownum <= 10
;
