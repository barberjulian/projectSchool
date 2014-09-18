SQL> CREATE PROFILE NEWREG1 LIMIT
  2   FAILED_LOGIN_ATTEMPTS 3
  3   PASSWORD_LIFE_TIME 30
  4   PASSWORD_REUSE_TIME 31
  5   PASSWORD_GRACE_TIME 5
  6   SESSIONS_PER_USER 3;

Profile created.

SQL> DESC DBA_PROFILES;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PROFILE                                   NOT NULL VARCHAR2(30)
 RESOURCE_NAME                             NOT NULL VARCHAR2(32)
 RESOURCE_TYPE                                      VARCHAR2(8)
 LIMIT                                              VARCHAR2(40)

SQL> SET LINESIZE 125
SQL> SET PAGESIZE 50
SQL> SELECT PROFILE, RESOURCE_NAME, LIMIT FROM
  2   DBA_PROFILES
  3   WHERE PROFILE='NEWREG1';

PROFILE                        RESOURCE_NAME                    LIMIT                                                        
------------------------------ -------------------------------- ----------------------------------------                     
NEWREG1                        COMPOSITE_LIMIT                  DEFAULT                                                      
NEWREG1                        SESSIONS_PER_USER                3                                                            
NEWREG1                        CPU_PER_SESSION                  DEFAULT                                                      
NEWREG1                        CPU_PER_CALL                     DEFAULT                                                      
NEWREG1                        LOGICAL_READS_PER_SESSION        DEFAULT                                                      
NEWREG1                        LOGICAL_READS_PER_CALL           DEFAULT                                                      
NEWREG1                        IDLE_TIME                        DEFAULT                                                      
NEWREG1                        CONNECT_TIME                     DEFAULT                                                      
NEWREG1                        PRIVATE_SGA                      DEFAULT                                                      
NEWREG1                        FAILED_LOGIN_ATTEMPTS            3                                                            
NEWREG1                        PASSWORD_LIFE_TIME               30                                                           
NEWREG1                        PASSWORD_REUSE_TIME              31                                                           
NEWREG1                        PASSWORD_REUSE_MAX               DEFAULT                                                      
NEWREG1                        PASSWORD_VERIFY_FUNCTION         DEFAULT                                                      
NEWREG1                        PASSWORD_LOCK_TIME               DEFAULT                                                      
NEWREG1                        PASSWORD_GRACE_TIME              5                                                            

16 rows selected.

SQL> CREATE ROLE JRDBA1
  2   IDENTIFIED BY MJOAG2T;

Role created.

SQL> CREATE USER ASSOCDBA1
  2   IDENTIFIED BY MJOAG2T
  3   DEFAULT  TABLESPACE USERS01
  4   TEMPORARY TABLESPACE TEMP01
  5   QUOTA 512K  ON      USERS01;

User created.

SQL> GRANT JRDBA1
  2   TO ASSOCDBA1
  3   WITH ADMIN OPTION;

Grant succeeded.

SQL> SPOOL OFF
