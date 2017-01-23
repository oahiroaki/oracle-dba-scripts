SET LONG 1000000
SET PAGESIZE 0
SET TRIMSPOOL ON
SET FEEDBACK OFF

-- View
select
  dbms_metadata.get_ddl('VIEW', views.VIEW_NAME)
from
  USER_VIEWS views
order by
  views.VIEW_NAME
;

-- MView
select
  dbms_metadata.get_ddl('MATERIALIZED_VIEW', views.MVIEW_NAME)
from
  USER_MVIEWS views
order by
  views.MVIEW_NAME
;
