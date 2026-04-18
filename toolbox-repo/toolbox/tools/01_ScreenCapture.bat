@echo off
chcp 65001 >nul 2>&1
title 屏幕区域截图工具

echo ========================================
echo        屏幕区域截图工具 v1.0
echo ========================================
echo.
echo 使用方法：
echo 1. 按任意键后屏幕会变灰
echo 2. 按住鼠标左键拖动选择截图区域
echo 3. 松开鼠标后自动保存截图
echo.
echo 提示：截图保存在桌面
echo ========================================
echo.
pause

mspaint screen clippings

echo.
echo 截图完成！请查看桌面上的截图文件。
echo.
pause
