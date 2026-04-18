@echo off
chcp 65001 >nul 2>&1
title DNS刷新工具 v1.0

echo ========================================
echo        DNS刷新工具 v1.0
echo ========================================
echo.
echo 正在获取当前DNS设置...
echo.

ipconfig /all | findstr /i "dns"

echo.
echo ========================================
echo.
echo 请选择DNS服务器：
echo.
echo  1 - 阿里DNS（223.5.5.5 / 223.6.6.6）- 国内快速
echo  2 - 百度DNS（180.76.76.76）- 国内快速
echo  3 - Google DNS（8.8.8.8 / 8.8.4.4）- 国外快速
echo  4 - Cloudflare DNS（1.1.1.1 / 1.0.0.1）- 全球推荐
echo  5 - 恢复默认DNS
echo.
echo  0 - 仅刷新DNS缓存
echo  9 - 退出
echo.
echo ========================================
echo.

set /p choice="请输入选项编号: "

if "%choice%"=="1" goto ali
if "%choice%"=="2" goto baidu
if "%choice%"=="3" goto google
if "%choice%"=="4" goto cloudflare
if "%choice%"=="5" goto default
if "%choice%"=="0" goto flush
if "%choice%"=="9" exit

:ali
echo 正在设置阿里DNS...
netsh interface ip set dns "以太网" static 223.5.5.5 primary
netsh interface ip add dns "以太网" 223.6.6.6
goto done

:baidu
echo 正在设置百度DNS...
netsh interface ip set dns "以太网" static 180.76.76.76 primary
netsh interface ip add dns "以太网" 180.76.76.76
goto done

:google
echo 正在设置Google DNS...
netsh interface ip set dns "以太网" static 8.8.8.8 primary
netsh interface ip add dns "以太网" 8.8.4.4
goto done

:cloudflare
echo 正在设置Cloudflare DNS...
netsh interface ip set dns "以太网" static 1.1.1.1 primary
netsh interface ip add dns "以太网" 1.0.0.1
goto done

:default
echo 正在恢复默认DNS...
netsh interface ip set dns "以太网" dhcp
goto done

:flush
echo 正在刷新DNS缓存...
ipconfig /flushdns
goto done

:done
echo.
echo DNS设置完成！正在刷新缓存...
ipconfig /flushdns
echo.
echo 当前DNS设置：
ipconfig /all | findstr /i "dns"
echo.
echo 完成！
goto end

:end
echo.
pause
