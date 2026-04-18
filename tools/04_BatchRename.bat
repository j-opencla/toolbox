@echo off
chcp 65001 >nul
echo ========================================
echo       批量文件重命名工具 v1.0
echo ========================================
echo.

set /p folder="请输入要重命名的文件夹路径: "
if not exist "%folder%" (
    echo 错误: 文件夹不存在！
    pause
    exit /b 1
)

set /p prefix="请输入文件名前缀: "
set /p startnum="请输入起始数字: "

echo.
echo 将为 %folder% 下的文件添加前缀: %prefix% ，起始编号: %startnum%
set /p confirm="确认执行？(Y/N): "

if /i not "%confirm%"=="Y" exit /b

set count=%startnum%

for %%f in ("%folder%\*.*") do (
    set "ext=%%~xf"
    ren "%%f" "%prefix%!count!!ext!"
    echo 重命名: %%~nxf -> %prefix%!count!!ext!
    set /a count+=1
)

echo.
echo 完成！共重命名 %count% 个文件。
pause
