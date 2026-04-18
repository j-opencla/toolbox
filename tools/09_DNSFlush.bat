@echo off
chcp 65001 >nul
echo ========================================
echo         DNS刷新工具 v1.0
echo ========================================
echo.

echo 正在刷新DNS缓存...
ipconfig /flushdns

echo.
echo 当前DNS配置:
ipconfig /all | findstr /i "dns"

echo.
echo 测试网络连接...
ping www.baidu.com -n 3

echo.
echo [可选操作]
echo 1. 使用Google DNS (8.8.8.8)
echo 2. 使用阿里DNS (223.5.5.5)
echo 3. 恢复自动DNS
echo 4. 退出
echo.

set /p choice="请选择 (1-4): "

if "%choice%"=="1" (
    netsh interface ip set dns name="以太网" static 8.8.8.8
    netsh interface ip add dns name="以太网" 8.8.4.4 index=2
    echo 已切换到Google DNS
) else if "%choice%"=="2" (
    netsh interface ip set dns name="以太网" static 223.5.5.5
    netsh interface ip add dns name="以太网" 223.6.6.6 index=2
    echo 已切换到阿里DNS
) else if "%choice%"=="3" (
    netsh interface ip set dns name="以太网" dhcp
    echo 已恢复自动DNS
) else (
    echo 保持当前DNS设置
)

echo.
pause
