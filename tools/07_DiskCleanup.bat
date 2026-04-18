@echo off
chcp 65001 >nul
echo ========================================
echo       磁盘清理向导 v1.0
echo ========================================
echo.

echo 可清理的项目:
echo   1. 临时文件
echo   2. Windows更新缓存
echo   3. 回收站
echo   4. 全部清理
echo.

set /p choice="请选择要清理的项目 (1-4): "

if "%choice%"=="1" (
    echo 正在清理临时文件...
    del /q /f /s %temp%\*.* 2>nul
    del /q /f /s C:\Windows\Temp\*.* 2>nul
    echo 临时文件已清理
) else if "%choice%"=="2" (
    echo 正在清理Windows更新缓存...
    takeown /r /f C:\Windows\SoftwareDistribution\Download 2>nul
    rd /s /q C:\Windows\SoftwareDistribution\Download 2>nul
    echo Windows更新缓存已清理
) else if "%choice%"=="3" (
    echo 正在清空回收站...
    rd /s /q %systemdrive%\$Recycle.Bin 2>nul
    echo 回收站已清空
) else if "%choice%"=="4" (
    echo 正在执行全部清理...
    call :clean_temp
    call :clean_updates
    call :clean_recycle
    echo 全部清理完成
) else (
    echo 无效选择
)

echo.
pause
exit /b

:clean_temp
del /q /f /s %temp%\*.* 2>nul
del /q /f /s C:\Windows\Temp\*.* 2>nul
goto :eof

:clean_updates
takeown /r /f C:\Windows\SoftwareDistribution\Download 2>nul
rd /s /q C:\Windows\SoftwareDistribution\Download 2>nul
goto :eof

:clean_recycle
rd /s /q %systemdrive%\$Recycle.Bin 2>nul
goto :eof
