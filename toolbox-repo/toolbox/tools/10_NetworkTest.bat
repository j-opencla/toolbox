@echo off
chcp 65001 >nul 2>&1
title 网络速度测试工具 v1.0

echo ========================================
echo        网络速度测试工具 v1.0
echo ========================================
echo.

echo [正在测试网络连接...]
ping -n 1 8.8.8.8 >nul 2>&1
if %errorlevel% neq 0 (
    echo 网络连接失败！
    goto error
)
echo [√] 网络已连接
echo.

echo [正在获取网络信息...]
echo.
echo IP地址：
ipconfig | findstr /i "IPv4"
echo.
echo 网关：
ipconfig | findstr /i "Default Gateway"
echo.
echo DNS服务器：
ipconfig | findstr /i "DNS Servers"
echo.

echo [网络延迟测试]
echo.
ping -n 5 www.baidu.com
echo.

echo [带宽测试建议]
echo 建议访问以下网站进行更准确的测速：
echo   - speedtest.cn
echo   - fast.com
echo   - speedtest.net
echo.

goto end

:error
echo.
echo 请检查您的网络连接！

:end
echo.
echo ========================================
echo.

pause
