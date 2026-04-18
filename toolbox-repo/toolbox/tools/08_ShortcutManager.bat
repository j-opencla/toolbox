@echo off
chcp 65001 >nul 2>&1
title 快捷方式管理器 v1.0

echo ========================================
echo        快捷方式管理器 v1.0
echo ========================================
echo.
echo 此工具可以管理桌面和开始菜单的快捷方式
echo.

echo [当前桌面快捷方式]
echo.
dir /b "%userprofile%\Desktop\*.lnk" 2>nul
dir /b "%userprofile%\桌面\*.lnk" 2>nul
echo.

echo ========================================
echo.
echo 请选择操作：
echo.
echo  1 - 在桌面创建快捷方式
echo  2 - 删除桌面快捷方式
echo  3 - 备份桌面快捷方式列表
echo  4 - 查看开始菜单程序
echo.
echo  0 - 退出
echo.
echo ========================================
echo.

set /p choice="请输入选项编号: "

if "%choice%"=="1" goto create
if "%choice%"=="2" goto delete
if "%choice%"=="3" goto backup
if "%choice%"=="4" goto menu
if "%choice%"=="0" exit

:create
set /p target="请输入目标程序路径: "
set /p name="请输入快捷方式名称: "
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%userprofile%\Desktop\'+'%name%'+'.lnk');$s.TargetPath='%target%';$s.Save()"
echo 完成！
goto end

:delete
set /p lname="请输入要删除的快捷方式名称: "
del "%userprofile%\Desktop\%lname%.lnk" 2>nul
del "%userprofile%\桌面\%lname%.lnk" 2>nul
echo 完成！
goto end

:backup
dir /b "%userprofile%\Desktop\*.lnk" 2>nul > desktop_shortcuts.txt
echo 备份完成！文件保存在当前目录：desktop_shortcuts.txt
goto end

:menu
echo [开始菜单程序]
dir /b "%programdata%\Microsoft\Windows\Start Menu\Programs" 2>nul
goto end

:end
echo.
pause
