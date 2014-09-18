SQL> CREATE TABLE S_DEPT
  2  (deptNo  NUMBER(2)  CONSTRAINT dept_no_pk PRIMARY KEY,
  3   dName  VARCHAR(14),
  4   loc     CHAR(13))
  5   TABLESPACE USERS01;

Table created.

SQL> CREATE TABLE S_EMP
  2  (empNo  NUMBER(4) CONSTRAINT emp_no_pk PRIMARY KEY,
  3   eName  VARCHAR2(10),
  4   job  VARCHAR(9),
  5   mgr  NUMBER(4) CONSTRAINT emp_mgr_fk REFERENCES s_emp(empNo) NOT NULL,
  6   hireDate DATE,
  7   sal  NUMBER(7,2),
  8   comm  NUMBER(7,2),
  9   deptNo  NUMBER(2) CONSTRAINT emp_dept_no_fk REFERENCES s_dept(deptNo))
 10   TABLESPACE USERS01;

Table created.

SQL> SELECT TABLE_NAME, TABLESPACE_NAME
  2   FROM DBA_TABLES
  3   WHERE TABLESPACE_NAME LIKE 'US%';

TABLE_NAME                     TABLESPACE_NAME                                                                                                                                                          
------------------------------ ------------------------------                                                                                                                                           
S_DEPT                         USERS01                                                                                                                                                                  
S_EMP                          USERS01                                                                                                                                                                  

SQL> SELECT TABLE_NAME, INITIAL_EXTENT, NEXT_EXTENT, MAX_EXTENTS, PCT_INCREASE
  2   FROM DBA_TABLES
  3   WHERE TABLESPACE_NAME LIKE 'US%';

TABLE_NAME                     INITIAL_EXTENT NEXT_EXTENT MAX_EXTENTS PCT_INCREASE                                                                                                                      
------------------------------ -------------- ----------- ----------- ------------                                                                                                                      
S_DEPT                                  65536              2147483645                                                                                                                                   
S_EMP                                   65536              2147483645                                                                                                                                   

SQL> SELECT TABLESPACE_NAME,INITIAL_EXTENT, NEXT_EXTENT, MAX_EXTENTS, PCT_INCREASE
  2   FROM DBA_TABLES
  3   WHERE TABLESPACE_NAME LIKE 'US%';

TABLESPACE_NAME                INITIAL_EXTENT NEXT_EXTENT MAX_EXTENTS PCT_INCREASE                                                                                                                      
------------------------------ -------------- ----------- ----------- ------------                                                                                                                      
USERS01                                 65536              2147483645                                                                                                                                   
USERS01                                 65536              2147483645                                                                                                                                   

SQL> CREATE TABLE S_ITEM
  2  (itemNo   NUMBER(2) CONSTRAINT s_item_item_no_pk PRIMARY KEY,
  3   description VARCHAR(20),
  4   price   NUMBER(7,2))
  5   TABLESPACE USERS01
  6   STORAGE(INITIAL 512k NEXT 512k MAXEXTENTS 100 PCTINCREASE 0);

Table created.

SQL> SELECT TABLESPACE_NAME,INITIAL_EXTENT, NEXT_EXTENT, MAX_EXTENTS, PCT_INCREASE
  2   FROM DBA_TABLES
  3   WHERE TABLESPACE_NAME LIKE 'US%';

TABLESPACE_NAME                INITIAL_EXTENT NEXT_EXTENT MAX_EXTENTS PCT_INCREASE                                                                                                                      
------------------------------ -------------- ----------- ----------- ------------                                                                                                                      
USERS01                                 65536              2147483645                                                                                                                                   
USERS01                                 65536              2147483645                                                                                                                                   
USERS01                                524288              2147483645                                                                                                                                   


SQL> 
SQL>  CREATE GLOBAL TEMPORARY TABLE G_DEPT
  2   ON COMMIT PRESERVE ROWS
  3   AS
  4   SELECT * FROM S_DEPT;

Table created.

SQL> 
SQL> SELECT * FROM G_DEPT;

no rows selected

SQL> SELECT DEPTNO, DNAME, LOC FROM G_DEPT;

no rows selected

SQL> INSERT INTO S_DEPT VALUES (10,'ACCOUNTING','NEW YORK');

1 row created.

SQL> INSERT INTO S_DEPT VALUES (20,'RESEARCH','DALLAS');

1 row created.

SQL> INSERT INTO S_DEPT VALUES (30,'SALES','CHICAGO');

1 row created.

SQL> INSERT INTO S_DEPT VALUES (40,'OPERATIONS','BOSTON');

1 row created.


SQL>  CREATE GLOBAL TEMPORARY TABLE G_DEPT
  2   ON COMMIT PRESERVE ROWS
  3   AS
  4   SELECT * FROM S_DEPT;

Table created.

SQL> SELECT * FROM G_DEPT;

    DEPTNO DNAME          LOC                                                                                                                                                                           
---------- -------------- -------------                                                                                                                                                                 
        10 ACCOUNTING     NEW YORK                                                                                                                                                                      
        20 RESEARCH       DALLAS                                                                                                                                                                        
        30 SALES          CHICAGO                                                                                                                                                                       
        40 OPERATIONS     BOSTON                                                                                                                                                                        

SQL> SELECT TABLE_NAME, INITIAL_EXTENT, NEXT_EXTENT, MAX_EXTENTS, PCT_INCREASE
  2   FROM DBA_TABLES
  3   WHERE TABLESPACE_NAME LIKE 'US%';

TABLE_NAME               INITIAL_EXTENT NEXT_EXTENT  MAX_EXTENTS PCT_INCREASE
------------------------------ --------------- -------------- -------------- ---------------
S_EMP                                  16384              16384             2147483645     0
S_DEPT                                 16384              16384             2147483645     0
G_DEPT
S_ITEM                                 524288             16384             2147483645     0

SQL> DROP TABLE G_DEPT;
DROP TABLE G_DEPT
           *
ERROR at line 1:
ORA-14452: attempt to create, alter or drop an index on temporary table already in use 


SQL> ALTER TABLE S_DEPT
  2   ADD (LOCATION_PIC BLOB);

Table altered.

SQL> ALTER TABLE S_DEPT
  2  RENAME COLUMN LOC TO LOCATION;

Table altered.

SQL> ALTER TABLE S_DEPT
  2  MODIFY (LOCATION VARCHAR2(30));

Table altered.


SQL> CREATE BITMAP INDEX LOC_BM_IDX
  2  ON S_DEPT(LOCATION);

Index created.


SQL> SELECT TABLE_name, index_NAME, column_name FROM DBA_IND_COLUMNS
  2  WHERE TABLE_NAME = 'S_DEPT';

TABLE_NAME                     INDEX_NAME                     COLUMN_NAME                                                                                                                               
------------------------------ ------------------------------ ------------------------------------------------------------------------------------------------------------------------------------------
S_DEPT                         DEPT_NO_PK                     DEPTNO                                                                                                                                    
S_DEPT                         LOC_BM_IDX                     LOCATION                                                                                                                                  


SQL> spool off
