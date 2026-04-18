@echo off
chcp 65001 >nul 2>&1
title WiFi密码查看器 v1.0

echo ========================================
echo        WiFi密码查看器 v1.0
echo ========================================
echo.
echo 正在获取已保存的WiFi网络...
echo.

for /f "tokens=1-2 delims=:" %%a in ('netsh wlan show interfaces ^| findstr /i "SSID"') do (
    set "ssid=%%b"
    set "ssid=!ssid:~1!"
)

echo 已连接的WiFi: %ssid%
echo.
echo 正在查看密码...
echo.

for /f "tokens=1-2 delims=:" %%i in ('netsh wlan show profile name="%ssid%" key=clear ^| findstr /i "关键内容"') do (
    set "key=%%j"
    set "key=!key:~1!"
    echo WiFi密码: !key!
)

echo.
echo ========================================
echo.
echo 提示：此工具只能查看已成功连接过的WiFi密码
echo.

pause
