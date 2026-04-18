@echo off
chcp 65001 >nul
echo ========================================
echo       快捷方式管理器 v1.0
echo ========================================
echo.

echo 功能:
echo   1. 查看桌面快捷方式
echo   2. 创建网站快捷方式
echo   3. 清理无效快捷方式
echo.

set /p choice="请选择功能 (1-3): "

if "%choice%"=="1" (
    echo.
    echo 正在获取桌面快捷方式...
    dir /b "%userprofile%\Desktop\*.lnk" 2>nul
    dir /b "%public%\Desktop\*.lnk" 2>nul
) else if "%choice%"=="2" (
    set /p url="请输入网站地址: "
    set /p name="请输入快捷方式名称: "
    powershell -command "$s=(New-Object -COM WScript.Shell).CreateShortcut('%userprofile%\Desktop\%name%.lnk'); $s.TargetPath='%url%'; $s.Save()"
    echo 已创建快捷方式: %name%
) else if "%choice%"=="3" (
    echo 正在检查无效快捷方式...
    for %%f in ("%userprofile%\Desktop\*.lnk") do (
        powershell -command "$s=New-Object -ComObject WScript.Shell.CreateShortcut('%%f'); if(!(Test-Path $s.TargetPath)){Write-Host '无效: %%f'}"
    )
) else (
    echo 无效选择
)

echo.
pause
