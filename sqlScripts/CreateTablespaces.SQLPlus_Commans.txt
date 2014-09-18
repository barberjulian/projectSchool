SQL> CREATE TABLESPACE INDX01
  2  DATAFILE 'F:\DBM\FALLB\DB801\ORACLE\ADMIN\oradata\DISK3\indx01.DBF' SIZE 1M
  3  AUTOEXTEND ON
  4  MINIMUM EXTENT 16
  5  DEFAULT STORAGE (Initial 16K
  6  NEXT 16K
  7  PCTINCREASE 0);

Tablespace created.

SQL> 
SQL> CREATE TABLESPACE USERS01
  2  DATAFILE 'F:\DBM\FALLB\DB801\ORACLE\ADMIN\oradata\DISK1\users01.DBF' SIZE 2M
  3  AUTOEXTEND ON
  4  MINIMUM EXTENT 16
  5  DEFAULT STORAGE (Initial 16K
  6  NEXT 16K
  7  PCTINCREASE 0);

Tablespace created.

SQL> 
SQL> CREATE TABLESPACE RONLY
  2  DATAFILE 'F:\DBM\FALLB\DB801\ORACLE\ADMIN\oradata\DISK1\ronly.DBF' SIZE 1M
  3  AUTOEXTEND ON
  4  MINIMUM EXTENT 16
  5  DEFAULT STORAGE (Initial 16K
  6  NEXT 16K
  7  PCTINCREASE 0);

Tablespace created.

SQL> CREATE TEMPORARY TABLESPACE TEMP01
  2  TEMPFILE 'F:\DBM\FALLB\DB801\ORACLE\ADMIN\oradata\DISK1\TEMP01.dbf' SIZE 1M
  3  REUSE EXTENT MANAGEMENT LOCAL UNIFORM SIZE 512K;

Tablespace created.

SQL> SELECT FILE_NAME, FILE_ID, TABLESPACE_NAME FROM DBA_DATA_FILES;
rows will be truncated

rows will be truncated


FILE_NAME                                                                                                                                                                                               
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
F:\DBM\FALLB\DB801\ORACLE\ADMIN\ORADATA\DISK1\SYSTEM01.DBF                                                                                                                                              
F:\DBM\FALLB\DB801\ORACLE\ADMIN\ORADATA\DISK1\SYSAUX01.DBF                                                                                                                                              
F:\DBM\FALLB\DB801\ORACLE\ADMIN\ORADATA\DISK3\INDX01.DBF                                                                                                                                                
F:\DBM\FALLB\DB801\ORACLE\ADMIN\ORADATA\DISK1\USERS01.DBF                                                                                                                                               
F:\DBM\FALLB\DB801\ORACLE\ADMIN\ORADATA\DISK1\RONLY.DBF                                                                                                                                                 


SQL> SELECT TABLESPACE_NAME, BYTES, BLOCKS, STATUS FROM DBA_DATA_FILES;

TABLESPACE_NAME                     BYTES     BLOCKS STATUS                                                                                                                                             
------------------------------ ---------- ---------- ---------                                                                                                                                          
SYSTEM                          198164480      24190 AVAILABLE                                                                                                                                          
SYSAUX                          146800640      17920 AVAILABLE                                                                                                                                          
INDX01                            1048576        128 AVAILABLE                                                                                                                                          
USERS01                           2097152        256 AVAILABLE                                                                                                                                          
RONLY                             1048576        128 AVAILABLE                                                                                                                                          

SQL> ALTER TABLESPACE INDX01 OFFLINE;

Tablespace altered.

SQL> SELECT STATUS FROM V$DATAFILE;

STATUS                                                                                                                                                                                                  
-------                                                                                                                                                                                                 
SYSTEM                                                                                                                                                                                                  
ONLINE                                                                                                                                                                                                  
OFFLINE                                                                                                                                                                                                 
ONLINE                                                                                                                                                                                                  
ONLINE                                                                                                                                                                                                  


SQL> ALTER TABLESPACE INDX01 RENAME DATAFILE
  2  'F:\DBM\FALLB\DB801\ORACLE\ADMIN\oradata\DISK3\indx01.DBF' TO
  3  'F:\DBM\FALLB\DB801\ORACLE\ADMIN\oradata\DISK5\indx01.DBF';

Tablespace altered.

SQL> SELECT STATUS FROM V$DATAFILE;

STATUS                                                                                                                                                                                                  
-------                                                                                                                                                                                                 
SYSTEM                                                                                                                                                                                                  
ONLINE                                                                                                                                                                                                  
OFFLINE                                                                                                                                                                                                 
ONLINE                                                                                                                                                                                                  
ONLINE                                                                                                                                                                                                  

SQL> ALTER TABLESPACE INDX01 ONLINE;

Tablespace altered.

SQL> SELECT STATUS FROM V$DATAFILE;

STATUS                                                                                                                                                                                                  
-------                                                                                                                                                                                                 
SYSTEM                                                                                                                                                                                                  
ONLINE                                                                                                                                                                                                  
ONLINE                                                                                                                                                                                                  
ONLINE                                                                                                                                                                                                  
ONLINE                                                                                                                                                                                                  


SQL> SELECT NAME, STATUS FROM V$DATAFILE;
rows will be truncated


NAME                                                                                                                                                                                                    
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
F:\DBM\FALLB\DB801\ORACLE\ADMIN\ORADATA\DISK1\SYSTEM01.DBF                                                                                                                                              
F:\DBM\FALLB\DB801\ORACLE\ADMIN\ORADATA\DISK1\SYSAUX01.DBF                                                                                                                                              
F:\DBM\FALLB\DB801\ORACLE\ADMIN\ORADATA\DISK5\INDX01.DBF                                                                                                                                                
F:\DBM\FALLB\DB801\ORACLE\ADMIN\ORADATA\DISK1\USERS01.DBF                                                                                                                                               
F:\DBM\FALLB\DB801\ORACLE\ADMIN\ORADATA\DISK1\RONLY.DBF                                                                                                                                                 

SQL> SET WRAP OFF
SQL> SELECT TS#, NAME FROM V$TABLESPACE;

       TS# NAME                                                                                                              
---------- ------------------------------                                                                                    
         0 SYSTEM                                                                                                            
         1 SYSAUX                                                                                                            
         2 INDX01                                                                                                            
         3 USERS01                                                                                                           
         4 RONLY                                                                                                             
         5 TEMP01                                                                                                            

6 rows selected.


SQL> CREATE TABLE t1
  2  (t1 number) TABLESPACE RONLY;

Table created.

SQL> ALTER TABLESPACE RONLY READ ONLY;

Tablespace altered.

SQL> SELECT NAME, ENABLED, STATUS FROM V$DATAFILE;
rows will be truncated

rows will be truncated


NAME                                                                                                                         
-----------------------------------------------------------------------------------------------------------------------------
F:\DBM\FALLB\DB801\ORACLE\ADMIN\ORADATA\DISK1\SYSTEM01.DBF                                                                   
F:\DBM\FALLB\DB801\ORACLE\ADMIN\ORADATA\DISK1\SYSAUX01.DBF                                                                   
F:\DBM\FALLB\DB801\ORACLE\ADMIN\ORADATA\DISK5\INDX01.DBF                                                                     
F:\DBM\FALLB\DB801\ORACLE\ADMIN\ORADATA\DISK1\USERS01.DBF                                                                    
F:\DBM\FALLB\DB801\ORACLE\ADMIN\ORADATA\DISK1\RONLY.DBF                                                                      


SQL> CREATE TABLE t2
  2  (t2 number) TABLESPACE RONLY;
CREATE TABLE t2
*
ERROR at line 1:
ORA-01647: tablespace 'RONLY' is read only, cannot allocate space in it 


SQL> DROP TABLE T1;

Table dropped.

SQL> 
SQL> DROP TABLESPACE RONLY INCLUDING CONTENTS AND DATAFILES;

Tablespace dropped.


SQL> SELECT TS#, NAME FROM V$TABLESPACE;

       TS# NAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
---------- ------------------------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
         0 SYSTEM                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
         1 SYSAUX                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
         2 INDX01                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
         3 USERS01                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
         5 TEMP01                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

SQL> SHOW PARAMETER UNDO;

NAME                                 TYPE        VALUE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
------------------------------------ ----------- ------------------------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
undo_management                      string      MANUAL                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
undo_retention                       integer     900                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
undo_tablespace                      string                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
SQL> SHUTDOWN IMMEDIATE;
Database closed.
Database dismounted.
ORACLE instance shut down.
SQL> startup pfile = O:\DB801\ORACLE\ADMIN\PFILE\initDB801.ora
ORACLE instance started.

Total System Global Area  104857600 bytes
Fixed Size                  2002272 bytes
Variable Size              92275360 bytes
Database Buffers            8388608 bytes
Redo Buffers                2191360 bytes
Database mounted.
Database opened.
SQL> 
SQL> show parameter undo;

NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
undo_management                      string      AUTO
undo_retention                       integer     900
undo_tablespace                      string
SQL> shutdown immediate
Database closed.
Database dismounted.
ORACLE instance shut down. 
SQL> startup pfile = O:\DB801\ORACLE\ADMIN\PFILE\initDB801.ora
ORACLE instance started.

Total System Global Area  104857600 bytes
Fixed Size                  2002272 bytes
Variable Size              92275360 bytes
Database Buffers            8388608 bytes
Redo Buffers                2191360 bytes
Database mounted.
Database opened.
SQL> show parameter undo;

NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
undo_management                      string      AUTO
undo_retention                       integer     900
undo_tablespace                      string      UNDOTBS

SQL> spool off                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
