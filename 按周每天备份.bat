
echo ����Ҫ���ݵ��ļ���...  
set "pbuf=D:\SQLBAK"  
echo ���ñ����ļ�����ļ���...  
set "tbuf=\\192.168.1.1\SQLBAK"  
echo ���ñ����ļ���(�����ڼ��������������ļ�ֻ�������һ��)...  
set name=%date%  
set name=%name:~-4,2%  
set "name=%tbuf%\%name%"
if not exist "log" md "log"

echo ==============================================	>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
echo %date%%time%��ʼ����							>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
echo ==============================================	>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
rasdial PT /d										>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
rasdial PT yh yh3									>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
net use "%tbuf%" "yh3" /user:"SQLBAK"				>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
robocopy "%pbuf%" "%name%" *.* /mir					>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
net use * /d /y										>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
rasdial PT /d										>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
echo ==============================================	>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
echo %date%%time%�������							>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
echo ==============================================	>>".\log\%date:~0,4%%date:~5,2%%date:~8,2%".txt
pause
