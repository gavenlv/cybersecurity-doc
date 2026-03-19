@echo off
chcp 65001 >nul
echo ============================================
echo   网络安全实验环境 - 停止脚本
echo ============================================
echo.

echo [信息] 正在停止所有容器...
docker-compose down

echo.
echo [完成] 所有容器已停止
echo.
pause
