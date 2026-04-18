@echo off
chcp 65001 >nul 2>&1
title 定时关机工具 v1.0

echo ========================================
echo        定时关机工具 v1.0
echo ========================================
echo.
echo 请选择操作：
echo.
echo  1 - 设置定时关机
echo  2 - 取消定时关机
echo  3 - 查看当前关机计划
echo  4 - 立即重启
echo  5 - 立即关机
echo.
echo  0 - 退出
echo.
echo ========================================
echo.

set /p choice="请输入选项编号: "

if "%choice%"=="1" goto setoff
if "%choice%"=="2" goto cancel
if "%choice%"=="3" goto view
if "%choice%"=="4" goto restart
if "%choice%"=="5" goto shutdownnow
if "%choice%"=="0" exit

:setoff
set /p minutes="请输入多少分钟后关机: "
set /a secs=%minutes%*60
shutdown /s /t %secs%
echo 已在 %minutes% 分钟后关机！
goto end

:cancel
shutdown /a
echo 已取消定时关机！
goto end

:view
echo 正在查看关机计划...
schtasks /query /fo table | findstr /i "shutdown"
goto end

:restart
shutdown /r /t 60
echo 将在60秒后重启！
goto end

:shutdownnow
shutdown /s /t 0
goto end

:end
echo.
pause
