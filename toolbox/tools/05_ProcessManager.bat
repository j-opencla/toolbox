@echo off
chcp 65001 >nul 2>&1
title 进程管理器 v1.0

echo ========================================
echo        进程管理器 v1.0
echo ========================================
echo.
echo [CPU占用最高的进程]
echo.

wmic process get name,processid,workingsetsize,PercentProcessorTime /format:list | findstr /i "Name=" | findstr /i "process"

echo.
echo [内存占用最高的进程 Top 10]
echo.

wmic process get name,workingsetsize /format:sorttables | findstr /i "process" | more /p /c 10 >nul 2>&1

echo.
tasklist /fo table /m | more /p /c 15

echo.
echo ========================================
echo 提示：如需结束进程，请记下进程名，输入N退出后手动结束
echo.

choice /c YN /m "是否结束某个进程"
if errorlevel 2 goto end

:setp
set /p pname="请输入要结束的进程名（如：notepad.exe）: "
taskkill /f /im "%pname%"
goto end

:end
echo.
pause
