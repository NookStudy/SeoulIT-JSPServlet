alter session set "_ORACLE_SCRIPT"=true;
create user musthave identified by 1234;
GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO musthave;
ALTER USER musthave DEFAULT TABLESPACE USERS;
ALTER USER musthave TEMPORARY TABLESPACE TEMP;