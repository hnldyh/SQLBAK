echo ����Ҫ���ݵ����ݿ��ļ���... 	   
set "pbuf=D:\MSSQL\Backup" 		 	 	 	
set "pbuf1=d:\WEAVER"	 	
set "pbuf2=d:\WWWROOT"	 	   
echo ���ñ��ر����ļ�����ļ���...  	
set "mbuf=d:\BAK"  		 	    
echo ����Զ�̱��ݷ����������ļ���	 
set "tbuf=\\192.168.1.2\BAK"  	
echo ���ñ����ļ���(�����ڼ��������������ļ�ֻ�������һ��)...  	
set "name=%date:~11,2%"  	 	
set "name=%tbuf%\%name%"	
set "time_begin=%time%"
set "day_begin=%date%"	

echo  ========================================================================== >>"D:\BAK\log.txt"
echo ���ݿ�ʼ��%date% %time%  >>"D:\BAK\log.txt"

echo ���ر���	 >>"D:\BAK\log.txt"
robocopy "%pbuf%"  "%mbuf%\MSSQL\Backup"    /mir /ns /nc /nfl /ndl /np /r:10 /w:10   /MT:128  /LOG+:"D:\BAK\log.txt"          
robocopy "%pbuf1%"  "%mbuf%\WEAVER"   /mir /ns /nc /nfl /ndl /np /r:10 /w:10   /MT:128  /LOG+:"D:\BAK\log.txt"                         
robocopy "%pbuf2%"  "%mbuf%\WWWROOT"   /mir /ns /nc /nfl /ndl /np /r:10 /w:10   /MT:128  /LOG+:"D:\BAK\log.txt"          

echo VPNԶ�̷�����       >>"D:\BAK\log.txt"
rasdial PT /d 		>>"D:\BAK\log.txt"			 
rasdial PT  ��� yanghuang3	>>"D:\BAK\log.txt"			 

echo �������ӱ��ݷ�����   	>>"D:\BAK\log.txt"
net use  "%tbuf%"  "password" /user:"BAK"		>>"D:\BAK\log.txt"	 

echo Զ�̱���		 >>"D:\BAK\log.txt"
robocopy  "%mbuf%"  "%name%"  /mir /ns /nc /nfl /ndl /np /r:10 /w:10  /MT:128  /LOG+:"D:\BAK\log.txt"          

echo �Ͽ���������		 >>"D:\BAK\log.txt"
net use * /d /y		>>"D:\BAK\log.txt"			 
rasdial PT /d		>>"D:\BAK\log.txt"			 
echo ������ϣ�	 	>>"D:\BAK\log.txt"
echo ���ݽ�����%date% %time%  >>"D:\BAK\log.txt"
echo  ========================================================================== >>"D:\BAK\log.txt"
echo ������ʱ
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

echo ����ʱ %dd% �� %hh% Сʱ %mm% ���� %ss% ��  >>"D:\BAK\log.txt"
