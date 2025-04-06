经常使用java的朋友可以发现，我们需要在一台电脑上部署多种版本的java来运行不同的程序。但是java版本之间的切换很麻烦，要手动更改环境变量的值，所以我写了以下脚本来简化这一过程。

> [!TIP]
>
> 环境变量的形式是键值对，当值是目录时，在cmd中输入单词时会到path变量的目录下寻找这个词的可执行文件。  

```bat
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
```

## 脚本本地化

java的目录结构如下所示，我自己创建了scripts目录，然后把脚本放到了里面，脚本的名字叫jchan.bat

![jcbfbfdihr](https://cdn.jsdelivr.net/gh/kanocyann/PicGo@master/jcbfbfdihr.png)

如果路径不同请修改脚本中的语句

```bat
if "%vb%" EQU "8" (
    setx "JAVA_HOME" "C:\Program Files\Java\jdk-1.8" /m
    echo Tips: Successfully switched JDK version, "JAVA_HOME" has been modified C:\Program Files\Java\jdk-1.8.
```

1.其中第一行**EQU 8**代表输入的数字选项，按照自己的版本情况自行修改。

2.第二行setx "JAVA_HOME" "C:\Program Files\Java\jdk-1.8" /m中**C:\Program Files\Java\jdk-1.8**表示要写入环境变量键**JAVA_HOME**的值，所以后面的值要更改成自己java的路径(重要)。

3.第三行是输出提示，仍然是更改路径即可。

## 环境变量配置

使用前应该保证在环境变量里添加了如下配置

![hrjybmldpzvi](https://cdn.jsdelivr.net/gh/kanocyann/PicGo@master/hrjybmldpzvi.png)

**JAVA_HOME**的值随意，因为在之后切换的过程中会被脚本自己更改，所以只要做好**脚本本地化中的第二步即可**。

classpath按图示配置

```powershell
.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar
```

## path中添加java的环境变量

按图示填入值，注意一定要删除红色框中的值，这是java自己生成的path，会影响版本的切换！

黑色框的值自己填入，注意第二行，要填自己电脑scripts文件夹的路径。

```powershell
%JAVA_HOME%\bin
C:\Program Files\Java\scripts
```

![javahrjybmld](https://cdn.jsdelivr.net/gh/kanocyann/PicGo@master/javahrjybmld.png)

配置完毕后，你就可以使用了。

方法：Win+R->键入cmd->jchan(因为前面把脚本命名为了jchan.bat)->按脚本提示更改版本。

## 文件下载地址：[📄jchan.bat](https://cloud.nicht.top/s/P7ua)
