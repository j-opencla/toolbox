@echo off
chcp 65001 >nul
echo ========================================
echo        定时关机工具 v1.0
echo ========================================
echo.

echo 选项:
echo   1. 30分钟后关机
echo   2. 1小时后关机
echo   3. 2小时后关机
echo   4. 自定义时间(分钟)
echo   5. 取消定时关机
echo.

set /p choice="请选择 (1-5): "

if "%choice%"=="1" (
    shutdown /s /t 1800
    echo 将在30分钟后关机
) else if "%choice%"=="2" (
    shutdown /s /t 3600
    echo 将在1小时后关机
) else if "%choice%"=="3" (
    shutdown /s /t 7200
    echo 将在2小时后关机
) else if "%choice%"=="4" (
    set /p minutes="请输入关机时间(分钟): "
    set /a seconds=%minutes% * 60
    shutdown /s /t %seconds%
    echo 将在%minutes%分钟后关机
) else if "%choice%"=="5" (
    shutdown /a
    echo 已取消定时关机
) else (
    echo 无效选择
)

echo.
pause
