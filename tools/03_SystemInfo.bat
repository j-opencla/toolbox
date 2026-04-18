@echo off
chcp 65001 >nul
echo ========================================
echo        系统信息查看器 v1.0
echo ========================================
echo.

echo [计算机信息]
systeminfo | findstr /B /C:"OS 名称" /C:"OS 版本" /C:"系统类型" /C:"物理内存总量"

echo.
echo [处理器信息]
wmic cpu get name

echo.
echo [硬盘信息]
wmic diskdrive get model,size,status

echo.
echo [内存信息]
wmic memorychip get capacity,speed

echo.
echo [IP地址]
ipconfig | findstr /i "IPv4"

echo.
pause
