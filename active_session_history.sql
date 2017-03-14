COL EV     FORM A50
COL DT     FORM A20
COL SQLID  FORM A13
COL OBN    FORM A32
COL SS     FORM A10
COL WTMS   FORM 999999.9
COL TWMS   FORM 999999.9

SELECT 
    TO_CHAR(T1.SAMPLE_TIME,'YYYY/MM/DD HH24:MI:SS')        AS DT,
    T1.SQL_ID                                              AS SQLID,
    T2.OBJECT_NAME                                         AS OBN,
    T1.EVENT                                               AS EV,
    T1.SESSION_STATE                                       AS SS,
    T1.WAIT_TIME/1000                                      AS WTMS,
    T1.TIME_WAITED/1000                                    AS TWMS
FROM
    V$ACTIVE_SESSION_HISTORY T1,
    DBA_OBJECTS              T2
WHERE
    T1.CURRENT_OBJ# = T2.DATA_OBJECT_ID(+)
AND T1.SQL_ID       = '&SQLID'
ORDER BY DT;

