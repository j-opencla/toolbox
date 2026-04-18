@echo off
chcp 65001 >nul
echo ========================================
echo        进程管理器 v1.0
echo ========================================
echo.

echo 正在获取系统进程信息...
echo.

tasklist /FI "STATUS eq running" /FO TABLE

echo.
echo [提示] 可使用 taskkill /PID 进程ID /F 来结束进程
echo.
pause
