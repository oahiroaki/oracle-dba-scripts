set heading off
set trimspool on

select 
          'SQL_ID'
||CHR(9)||'CHILD_NUMBER'
||CHR(9)||'PLAN_HASH_VALUE'
||CHR(9)||'BUFFER_GETS'
||CHR(9)||'DISK_READS'
||CHR(9)||'CPU_TIME'
||CHR(9)||'ELAPSED_TIME'
||CHR(9)||'USER_IO_WAIT_TIME'
||CHR(9)||'FETCHES'
||CHR(9)||'EXECUTIONS'
||CHR(9)||'SHARABLE_MEM'
||CHR(9)||'PERSISTENT_MEM'
||CHR(9)||'RUNTIME_MEM'
||CHR(9)||'PARSE_CALLS'
||CHR(9)||'SORTS'
from
  dual
;

select
           SQL_ID
||CHR(9)|| CHILD_NUMBER      -- 子カーソルの番号
||CHR(9)|| PLAN_HASH_VALUE   -- SQLプランのハッシュ値
||CHR(9)|| BUFFER_GETS       -- バッファ取得数
||CHR(9)|| DISK_READS        -- DISK読み込み数
||CHR(9)|| CPU_TIME          -- CPU利用時間(us)
||CHR(9)|| ELAPSED_TIME      -- 応答時間(us)
||CHR(9)|| USER_IO_WAIT_TIME -- IO待ち時間(us)
||CHR(9)|| FETCHES           -- フェッチ数
||CHR(9)|| EXECUTIONS        -- 実行回数
||CHR(9)|| SHARABLE_MEM      -- 共有メモリ(Byte)
||CHR(9)|| PERSISTENT_MEM    -- 固定メモリ(Byte)
||CHR(9)|| RUNTIME_MEM       -- 実行時メモリ(Byte)
||CHR(9)|| PARSE_CALLS       -- 解析コール数
||CHR(9)|| SORTS             -- ソート数
from
  V$SQL
where
  SQL_ID = '&SQLID'
;
