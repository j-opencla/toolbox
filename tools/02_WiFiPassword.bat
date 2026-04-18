@echo off
chcp 65001 >nul
echo ========================================
echo       WiFi密码查看器 v1.0
echo ========================================
echo.

echo 正在获取已保存的WiFi网络和密码...
echo.
echo ----------------------------------------

:: 获取所有已保存的WiFi配置文件
for /f "tokens=2* delims=:" %%i in ('netsh wlan show profiles ^| findstr "所有用户配置文件"') do (
    set "ssid=%%i"
    set "ssid=!ssid:~1!"
    echo WiFi名称: !ssid!
    for /f "tokens=2* delims=:" %%a in ('netsh wlan show profiles name="!ssid!" key=clear ^| findstr "关键内容"') do (
        echo 密码: %%a
    )
    echo ----------------------------------------
)

echo.
echo 注意: 只显示当前电脑已连接过的WiFi
echo.
pause
