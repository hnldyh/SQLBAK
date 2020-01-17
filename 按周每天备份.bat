echo 设置要备份的数据库文件夹... 	   
set "pbuf=D:\MSSQL\Backup" 		 	 	 	
set "pbuf1=d:\WEAVER"	 	
set "pbuf2=d:\WWWROOT"	 	   
echo 设置本地备份文件存放文件夹...  	
set "mbuf=d:\BAK"  		 	    
echo 设置远程备份服务器共享文件夹	 
set "tbuf=\\192.168.1.2\BAK"  	
echo 设置备份文件名(以星期几命名，即备份文件只保存最近一周)...  	
set "name=%date:~11,2%"  	 	
set "name=%tbuf%\%name%"	
set "time_begin=%time%"
set "day_begin=%date%"	

echo  ========================================================================== >>"D:\BAK\log.txt"
echo 备份开始于%date% %time%  >>"D:\BAK\log.txt"

echo 本地备份	 >>"D:\BAK\log.txt"
robocopy "%pbuf%"  "%mbuf%\MSSQL\Backup"    /mir /ns /nc /nfl /ndl /np /r:10 /w:10   /MT:128  /LOG+:"D:\BAK\log.txt"          
robocopy "%pbuf1%"  "%mbuf%\WEAVER"   /mir /ns /nc /nfl /ndl /np /r:10 /w:10   /MT:128  /LOG+:"D:\BAK\log.txt"                         
robocopy "%pbuf2%"  "%mbuf%\WWWROOT"   /mir /ns /nc /nfl /ndl /np /r:10 /w:10   /MT:128  /LOG+:"D:\BAK\log.txt"          

echo VPN远程服务器       >>"D:\BAK\log.txt"
rasdial PT /d 		>>"D:\BAK\log.txt"			 
rasdial PT  杨璜 yanghuang	>>"D:\BAK\log.txt"			 

echo 网络连接备份服务器   	>>"D:\BAK\log.txt"
net use  "%tbuf%"  "password" /user:"BAK"		>>"D:\BAK\log.txt"	 

echo 远程备份		 >>"D:\BAK\log.txt"
robocopy  "%mbuf%"  "%name%"  /mir /ns /nc /nfl /ndl /np /r:10 /w:10  /MT:128  /LOG+:"D:\BAK\log.txt"          

echo 断开网络连接		 >>"D:\BAK\log.txt"
net use * /d /y		>>"D:\BAK\log.txt"			 
rasdial PT /d		>>"D:\BAK\log.txt"			 
echo 备份完毕！	 	>>"D:\BAK\log.txt"
echo 备份结束于%date% %time%  >>"D:\BAK\log.txt"
echo  ========================================================================== >>"D:\BAK\log.txt"
echo 计算用时
echo off
set "day_end=%date%"
set /a "d1=%day_end:~8,2%"
set /a "d0=%day_begin:~8,2%"
set /a "dd=d1-d0"
set "time_end=%time%"
set /a "hh=%time_end:~0,2%*3600"
set /a "mm=%time_end:~3,2%*60"
set /a "ss=%time_end:~6,2%"
set /a "t1=hh+mm+ss"
set /a "hh=%time_begin:~0,2%*3600"
set /a "mm=%time_begin:~3,2%*60"
set /a "ss=%time_begin:~6,2%"
set /a "t0=hh+mm+ss"
set /a "t=t1-t0"
set /a "hh=%t%/3600"
set /a "mm=(%t%-%hh%*3600)/60"
set /a "ss=%t%%%60"

echo 共用时 %dd% 天 %hh% 小时 %mm% 分钟 %ss% 秒  >>"D:\BAK\log.txt"
