@echo off 
::Get Administrator Privileges
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

::Setting Window Size
mode con cols=120 lines=60
title JDK-Version change script of Bat

:menu
echo current jdk version:
java -version
echo.
echo =============================================
echo ################ JDK version-list ################
echo.
echo          [0]  cancel switch
echo          [8]  switch to JDK8
echo          [17] switch to JDK17
echo          [22] switch to JDK22
echo.
echo =============================================
echo.

set /P vb=Please choose need switch JDK versions:
if "%vb%" EQU "8" (
    setx "JAVA_HOME" "C:\Program Files\Java\jdk-1.8" /m
    echo Tips: Successfully switched JDK version, "JAVA_HOME" has been modified C:\Program Files\Java\jdk-1.8.
    pause
    echo.
) else if "%vb%" EQU "17" (
    setx "JAVA_HOME" "C:\Program Files\Java\jdk-17" /m
    echo Tips: Successfully switched JDK version, "JAVA_HOME" has been modified C:\Program Files\Java\jdk-17.
    pause
    echo.
) else if "%vb%" EQU "22" (
    setx "JAVA_HOME" "C:\Program Files\Java\jdk-22" /m
    echo Tips: Successfully switched JDK version, "JAVA_HOME" has been modified C:\Program Files\Java\jdk-22.
    pause
    echo.
) else if "%vb%" EQU "0" (
       goto exit
) else (
    echo.
    echo ! choosing version error, please renew choice ...
    echo.
    goto menu
    pause
)

echo Please press any key to exit.. & pause > nul

:exit