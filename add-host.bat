@echo off

REM Banner Message
title AZYPAY Custom hosting script
echo #################################################
echo ##Warning, you are changing the host file##
echo ## Version 1.0.1                         ##
echo #################################################

REM Variable Declarations
SET NEWLINE=^& echo.
set hostspath=%windir%\System32\drivers\etc\hosts
set filesuff=%date:~-4%_%date:~3,2%_%date:~0,2%__%time:~0,2%_%time:~3,2%_%time:~6,2%
set /p domain_name="Enter domain name: "

REM Safe backup
echo Initiating host backup for rollback...
copy %hostspath% C:\host-backup\host__%filesuff% >NUL

REM Modify hostfile
echo Writing changes to host file.
ECHO %NEWLINE%^	127.0.0.1       %domain_name%>>%hostspath%

pause

echo Making amendements to apache file
REM variable declaration
set apachepath=S:\xamp\apache\conf\extra\httpd-vhosts.conf
set /p dir_path="Enter directory path: "

copy %apachepath% C:\host-backup\httpd-vhosts.conf__%filesuff% >NUL

ECHO %NEWLINE%^ ^<VirtualHost *:80^> >>%apachepath%
ECHO %NEWLINE%^ ServerAdmin helpdesk@azypay.com >>%apachepath%
ECHO %NEWLINE%^ DocumentRoot "%dir_path%" >>%apachepath%
ECHO %NEWLINE%^ ServerName %domain_name% >>%apachepath%
ECHO %NEWLINE%^ ErrorLog "logs/%domain_name%-error.log" >>%apachepath%
ECHO %NEWLINE%^ CustomLog "logs/%domain_name%-access.log" common >>%apachepath%
ECHO %NEWLINE%^ ^</VirtualHost^> >>%apachepath%


pause