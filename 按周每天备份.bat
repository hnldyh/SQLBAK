
echo 设置要备份的文件夹...  
set "pbuf=D:\SQLBAK"  
echo 设置备份文件存放文件夹...  
set "tbuf=\\192.168.1.1\SQLBAK"  
echo 设置备份文件名(以星期几命名，即备份文件只保存最近一周)...  
set name=%date%  
set name=%name:~-4,2%  
set "name=%tbuf%\%name%"
if not exist "log" md "log"

echo ==============================================	>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
echo %date%%time%开始备份							>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
echo ==============================================	>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
rasdial PT /d										>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
rasdial PT yh yh3									>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
net use "%tbuf%" "yh3" /user:"SQLBAK"				>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
robocopy "%pbuf%" "%name%" *.* /mir					>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
net use * /d /y										>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
rasdial PT /d										>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
echo ==============================================	>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
echo %date%%time%备份完毕							>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
echo ==============================================	>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
pause
