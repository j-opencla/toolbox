@echo off
chcp 65001 >nul 2>&1
title 系统信息查看器 v1.0

echo ========================================
echo        系统信息查看器 v1.0
echo ========================================
echo.

echo [主机信息]
hostname
echo.

echo [操作系统]
systeminfo | findstr /i "操作系统"
systeminfo | findstr /i "系统类型"
echo.

echo [处理器]
systeminfo | findstr /i "处理器"
echo.

echo [内存]
systeminfo | findstr /i "物理内存"
echo.

echo [显卡]
wmic path win32_VideoController get name
echo.

echo [硬盘空间]
wmic logicaldisk get caption,freespace,size
echo.

echo ========================================
echo.

pause
