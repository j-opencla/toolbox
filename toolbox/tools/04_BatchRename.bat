@echo off
chcp 65001 >nul 2>&1
title 文件批量重命名工具 v1.0

echo ========================================
echo        文件批量重命名工具 v1.0
echo ========================================
echo.
echo 此工具可以将文件夹内的文件批量重命名
echo.

set /p folder="请输入文件夹路径（拖拽文件夹到窗口即可）: "
set /p prefix="请输入文件名前缀（如：photo_）: "
set /p start="请输入起始数字（如：1）: "

if not exist "%folder%" (
    echo 错误：文件夹不存在！
    pause
    exit
)

echo.
echo 正在重命名...
echo.

set count=%start%
for %%f in ("%folder%\*.*") do (
    set "ext=%%~xf"
    ren "%%f" "%prefix%!count!!ext!"
    set /a count+=1
)

echo.
echo 完成！共重命名 !count! 个文件。
echo.

pause
