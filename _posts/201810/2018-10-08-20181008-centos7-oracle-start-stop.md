---
title: centOS 7 中数据库的启动与停止
date: 11:38 2018/10/8
---

## 环境
centOS 7

oracle 11g

## oracle数据库的启动

    [oracle@oracledb ~]$ source  /home/oracle/.bash_profile
    [oracle@oracledb ~]$ lsnrctl  start

    LSNRCTL for Linux: Version 11.2.0.1.0 - Production on 08-OCT-2018 11:35:41

    Copyright (c) 1991, 2009, Oracle.  All rights reserved.

    Starting /opt/app/oracle/product/11.2.0/db_1/bin/tnslsnr: please wait...

    TNSLSNR for Linux: Version 11.2.0.1.0 - Production
    System parameter file is /opt/app/oracle/product/11.2.0/db_1/network/admin/listener.ora
    Log messages written to /opt/app/oracle/diag/tnslsnr/oracledb/listener/alert/log.xml
    Listening on: (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=oracledb)(PORT=35323)))

    Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=oracledb)(PORT=35323)))
    STATUS of the LISTENER
    ------------------------
    Alias                     LISTENER
    Version                   TNSLSNR for Linux: Version 11.2.0.1.0 - Production
    Start Date                08-OCT-2018 11:35:43
    Uptime                    0 days 0 hr. 0 min. 0 sec
    Trace Level               off
    Security                  ON: Local OS Authentication
    SNMP                      OFF
    Listener Parameter File   /opt/app/oracle/product/11.2.0/db_1/network/admin/listener.ora
    Listener Log File         /opt/app/oracle/diag/tnslsnr/oracledb/listener/alert/log.xml
    Listening Endpoints Summary...
      (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=oracledb)(PORT=35323)))
    Services Summary...
    Service "orcl11g" has 1 instance(s).
      Instance "orcl11g", status UNKNOWN, has 1 handler(s) for this service...
    The command completed successfully
    [oracle@oracledb ~]$ sqlplus /nolog

    SQL*Plus: Release 11.2.0.1.0 Production on Mon Oct 8 11:36:06 2018

    Copyright (c) 1982, 2009, Oracle.  All rights reserved.

    SQL> conn  / as sysdba
    Connected to an idle instance.
    SQL> startup
    ORACLE instance started.

    Total System Global Area 6680915968 bytes
    Fixed Size		    2213936 bytes
    Variable Size		 3825207248 bytes
    Database Buffers	 2818572288 bytes
    Redo Buffers		   34922496 bytes
    Database mounted.
    Database opened.
    SQL> exit
    Disconnected from Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
    With the Partitioning, OLAP, Data Mining and Real Application Testing options
    [oracle@oracledb ~]$



## oracle 数据库的停止

    [oracle@oracledb ~]$ sqlplus /nolog

    SQL*Plus: Release 11.2.0.1.0 Production on Mon Oct 8 11:40:30 2018

    Copyright (c) 1982, 2009, Oracle.  All rights reserved.

    SQL> conn  / as sysdba
    Connected.
    SQL> shutdown immediate
    Database closed.
    Database dismounted.
    ORACLE instance shut down.
    SQL> exit
    Disconnected from Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
    With the Partitioning, OLAP, Data Mining and Real Application Testing options
    [oracle@oracledb ~]$ lsnrctl stop

    LSNRCTL for Linux: Version 11.2.0.1.0 - Production on 08-OCT-2018 12:14:50

    Copyright (c) 1991, 2009, Oracle.  All rights reserved.

    Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=oracledb)(PORT=35323)))
    The command completed successfully
    [oracle@oracledb ~]$


