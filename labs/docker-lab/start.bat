@echo off
chcp 65001 >nul
echo ============================================
echo   网络安全实验环境 - 启动脚本
echo ============================================
echo.

REM 检查Docker是否运行
docker info >nul 2>&1
if errorlevel 1 (
    echo [错误] Docker未运行，请先启动Docker Desktop
    pause
    exit /b 1
)

echo [信息] Docker运行正常
echo.

REM 创建必要的目录
echo [步骤1] 创建工作目录...
if not exist "tools" mkdir tools
if not exist "wordlists" mkdir wordlists
if not exist "output" mkdir output
if not exist "nuclei-templates" mkdir nuclei-templates
echo [完成] 目录创建完成
echo.

REM 拉取镜像
echo [步骤2] 拉取Docker镜像（首次运行需要较长时间）...
docker-compose pull
echo.

REM 启动容器
echo [步骤3] 启动容器服务...
docker-compose up -d
echo.

REM 等待服务启动
echo [步骤4] 等待服务启动...
timeout /t 10 /nobreak >nul

REM 显示状态
echo.
echo ============================================
echo   服务启动状态
echo ============================================
docker-compose ps
echo.

echo ============================================
echo   访问地址
echo ============================================
echo [漏洞靶机]
echo   DVWA:          http://localhost:8080  (默认: admin/password)
echo   SQLi Labs:      http://localhost:8081
echo   bWAPP:          http://localhost:8082  (首次访问需安装)
echo   WebGoat:        http://localhost:8083
echo   Juice Shop:     http://localhost:3000
echo.
echo [扫描工具]
echo   OWASP ZAP:      http://localhost:8090
echo.
echo [管理界面]
echo   Portainer:      http://localhost:9000  (首次需设置密码)
echo   WebTop:         http://localhost:3010
echo.
echo [工具容器]
echo   Kali:           docker exec -it kali-tools bash
echo   Nuclei:         docker exec -it nuclei-scanner sh
echo.
echo ============================================
echo   常用命令
echo ============================================
echo   停止环境:       docker-compose down
echo   查看日志:       docker-compose logs [服务名]
echo   重启服务:       docker-compose restart [服务名]
echo   进入容器:       docker exec -it [容器名] bash
echo ============================================
echo.
pause
