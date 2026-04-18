@echo off
chcp 65001 >nul 2>&1
title 磁盘清理向导 v1.0

echo ========================================
echo        磁盘清理向导 v1.0
echo ========================================
echo.
echo 当前磁盘使用情况：
echo.

wmic logicaldisk get caption,freespace,size,volumename /format:table

echo.
echo ========================================
echo.
echo 可清理的文件类型：
echo.
echo  1 - 临时文件（推荐）
echo  2 - Windows更新清理
echo  3 - 系统日志
echo  4 - 回收站
echo  5 - 浏览器缓存
echo  6 - 全部清理（推荐）
echo.
echo  0 - 退出
echo.
echo ========================================
echo.

set /p choice="请输入选项编号: "

if "%choice%"=="1" goto temp
if "%choice%"=="2" goto update
if "%choice%"=="3" goto logs
if "%choice%"=="4" goto recycle
if "%choice%"=="5" goto browser
if "%choice%"=="6" goto all
if "%choice%"=="0" exit

:temp
echo 正在清理临时文件...
del /q/f/s %temp%\* 2>nul
del /q/f/s C:\Windows\Temp\* 2>nul
echo 完成！释放了临时文件占用的空间。
goto end

:update
echo 正在清理Windows更新...
cleanmgr /d C /sagerun:1
goto end

:logs
echo 正在清理系统日志...
wevtutil el > temp.txt
for /f %%a in (temp.txt) do wevtutil cl "%%a"
del temp.txt
echo 完成！
goto end

:recycle
echo 正在清空回收站...
rd /s /q C:\$Recycle.Bin 2>nul
echo 完成！
goto end

:browser
echo 正在清理浏览器缓存...
del /q/f/s %localappdata%\Google\Chrome\User Data\Default\Cache\* 2>nul
del /q/f/s %localappdata%\Microsoft\Edge\User Data\Default\Cache\* 2>nul
echo 完成！
goto end

:all
echo 正在执行全面清理...
call :temp
call :recycle
echo 完成！建议运行第2项进行更深度清理。
goto end

:end
echo.
pause
