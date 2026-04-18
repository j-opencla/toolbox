@echo off
chcp 65001 >nul
echo ========================================
echo        网络速度测试 v1.0
echo ========================================
echo.

echo 正在测试网络延迟...
echo.

:: 测试到百度
echo [百度]
ping www.baidu.com -n 4 | findstr "平均"

:: 测试到Google
echo.
echo [Google]
ping www.google.com -n 4 | findstr "平均"

:: 测试到阿里
echo.
echo [阿里云]
ping www.aliyun.com -n 4 | findstr "平均"

echo.
echo 正在获取网络适配器信息...
wmic nic where "NetEnabled=true" get Name,Speed,MACAddress

echo.
echo 网络配置:
ipconfig | findstr /i "ipv4 子网"

echo.
pause
