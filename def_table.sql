set linesize 1000
set trimspool on
set pagesize 0
set head off

prompt TABLE_NAME	COLUMN_NAME	DATA_TYPE	DATA_LENGTH	NULLABLE
select
        ut.TABLE_NAME
||'	'|| ut.COLUMN_NAME
||'	'|| ut.DATA_TYPE
||'	'|| ut.DATA_LENGTH
||'	'|| ut.NULLABLE
from
  USER_TAB_COLUMNS ut 
where
  ut.TABLE_NAME not in ( 
    'CHAINED_ROWS'
  , 'CREATE$JAVA$LOB$TABLE'
  , 'EXCEPTIONS'
  , 'PLAN_TABLE'
  , 'PROF$PLAN_TABLE'
  ) 
  and ut.TABLE_NAME not like 'BIN$%' 
order by
  ut.TABLE_NAME
; 
