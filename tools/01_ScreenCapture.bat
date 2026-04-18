@echo off
chcp 65001 >nul
echo ========================================
echo        屏幕截图工具 v1.0
echo ========================================
echo.

:: 检查是否安装了截图工具
where SnippingTool.exe >nul 2>&1
if %errorlevel% equ 0 (
    echo 正在启动 Windows 截图工具...
    start snippingtool
) else (
    echo 正在启动 Xbox Game Bar 截图功能...
    echo 请按 Win+G 打开 Xbox Game Bar，然后点击截图按钮
    start ms-gamebar:
)

echo.
echo 截图完成！截图文件通常保存在：
echo %USERPROFILE%\Pictures\Screenshots
echo.
pause
