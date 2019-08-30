# SQLBAK
Remote backup of cloud server database, daily backup on a weekly cycle.

2019.08.30修改 

         云服务器数据库异地备份，按周循环每天备份。

         必备条件：

         1、需创建VPN拨号PT到异地网络。

         2、在异地备份服务器上创建SQLBAK备份操作员帐号。
         
         3、在异地备份服务器上D盘创建SQLBAK目录并共享，赋予SQLBAK用户完全控制权限。
         
         4、在云服务器创建SQLBAK备份操作员帐号，和异地备份服务器相同密码。
         
         5、在云服务器上创建计划任务，给予权限，设定没登录也运行。每天定时执行批处理文件，将数据库备份目录备份到远程服务器上。
