# Docker 安全实验环境

> 🎯 一键搭建完整的网络安全学习环境，包含多个漏洞靶机和渗透测试工具

## 📋 目录

- [环境介绍](#环境介绍)
- [快速开始](#快速开始)
- [服务列表](#服务列表)
- [使用指南](#使用指南)
- [常见场景](#常见场景)
- [故障排查](#故障排查)
- [安全警告](#安全警告)

---

## 🎯 环境介绍

本项目使用 Docker Compose 快速搭建一个完整的网络安全学习环境，包括：

### 漏洞靶机
- **DVWA** - Damn Vulnerable Web Application（综合Web漏洞）
- **SQLi Labs** - SQL注入专项练习（65+关卡）
- **bWAPP** - 综合漏洞练习平台（100+漏洞）
- **WebGoat** - OWASP官方学习平台
- **Juice Shop** - 现代Web应用漏洞练习

### 攻击工具
- **Kali Linux** - 渗透测试工具集
- **OWASP ZAP** - 自动化Web扫描
- **Nuclei** - 快速漏洞扫描器

### 管理工具
- **Portainer** - Docker可视化管理
- **WebTop** - Web远程桌面

### 网络架构
```
┌─────────────────────────────────────────────┐
│        Security Lab Network (172.20.0.0/24) │
├─────────────────────────────────────────────┤
│                                             │
│  漏洞靶机 (172.20.0.10-19)                  │
│    ├── DVWA         (172.20.0.10)          │
│    ├── SQLi Labs    (172.20.0.11)          │
│    ├── bWAPP        (172.20.0.12)          │
│    ├── WebGoat      (172.20.0.13)          │
│    └── Juice Shop   (172.20.0.14)          │
│                                             │
│  支持服务 (172.20.0.20-29)                  │
│    ├── MySQL        (172.20.0.20)          │
│    └── Redis        (172.20.0.21)          │
│                                             │
│  攻击工具 (172.20.0.100-109)                │
│    ├── Kali         (172.20.0.100)         │
│    ├── ZAP          (172.20.0.101)         │
│    └── Nuclei       (172.20.0.102)         │
│                                             │
│  管理工具 (172.20.0.200-209)                │
│    ├── Portainer    (172.20.0.200)         │
│    └── WebTop       (172.20.0.201)         │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 🚀 快速开始

### 环境要求

- **Docker Desktop** (Windows/Mac) 或 **Docker Engine** (Linux)
  - Windows: [下载 Docker Desktop](https://www.docker.com/products/docker-desktop)
  - 版本要求: Docker 20.10+, Docker Compose 2.0+
- **系统资源**:
  - 内存: 至少 8GB（推荐 16GB）
  - 磁盘: 至少 20GB 可用空间
  - CPU: 4核心以上推荐

### 一键启动（Windows）

```batch
# 1. 进入目录
cd labs/docker-lab

# 2. 双击运行 start.bat
# 或在命令行执行：
start.bat
```

### 一键启动（Linux/Mac）

```bash
# 1. 进入目录
cd labs/docker-lab

# 2. 添加执行权限
chmod +x start.sh

# 3. 运行脚本
./start.sh
```

### 手动启动

```bash
# 1. 创建工作目录
mkdir -p tools wordlists output nuclei-templates

# 2. 拉取镜像（首次需要）
docker-compose pull

# 3. 启动所有服务
docker-compose up -d

# 4. 查看服务状态
docker-compose ps

# 5. 查看日志
docker-compose logs -f
```

---

## 📦 服务列表

### 漏洞靶机

| 服务 | 地址 | 默认账号 | 说明 |
|------|------|---------|------|
| **DVWA** | http://localhost:8080 | admin / password | 包含 SQL注入、XSS、文件上传、命令执行等漏洞 |
| **SQLi Labs** | http://localhost:8081 | - | 65+ 关卡 SQL 注入练习，从基础到高级 |
| **bWAPP** | http://localhost:8082 | bee / bug | 100+ 种 Web 漏洞，首次访问点击安装 |
| **WebGoat** | http://localhost:8083 | 需注册 | OWASP 官方学习平台，系统性课程 |
| **Juice Shop** | http://localhost:3000 | - | 现代技术栈的漏洞挑战，适合进阶 |

### 攻击工具

| 服务 | 使用方式 | 说明 |
|------|---------|------|
| **Kali Linux** | `docker exec -it kali-tools bash` | 完整的渗透测试工具集 |
| **OWASP ZAP** | http://localhost:8090 | Web 应用安全扫描器 |
| **Nuclei** | `docker exec -it nuclei-scanner sh` | 基于模板的快速漏洞扫描 |

### 管理工具

| 服务 | 地址 | 说明 |
|------|------|------|
| **Portainer** | http://localhost:9000 | Docker 容器可视化管理 |
| **WebTop** | http://localhost:3010 | Web 远程桌面（KDE） |

### 数据库服务

| 服务 | 端口 | 账号 | 说明 |
|------|------|------|------|
| **MySQL** | 3306 | root / rootpassword | 支持 DVWA 等靶机 |
| **Redis** | 6379 | - | 缓存服务 |

---

## 📖 使用指南

### 1. 初次使用

#### Windows 用户
```batch
# 步骤1: 确保 Docker Desktop 已启动
# 步骤2: 进入目录
cd d:\workspace\github\cybersecurity-doc\labs\docker-lab

# 步骤3: 运行启动脚本
start.bat

# 首次运行会拉取镜像，需要等待 10-30 分钟
```

#### 验证环境
```bash
# 查看所有容器状态
docker-compose ps

# 应该看到所有服务状态为 "Up" 或 "healthy"
```

### 2. 访问靶机

#### DVWA 使用示例
```bash
# 1. 浏览器访问
http://localhost:8080

# 2. 登录
用户名: admin
密码: password

# 3. 创建数据库（首次访问）
点击 "Create / Reset Database"

# 4. 开始练习
选择不同难度的漏洞进行练习
```

#### SQLi Labs 使用示例
```bash
# 1. 浏览器访问
http://localhost:8081

# 2. 点击 "Setup" 初始化数据库

# 3. 从 Lesson 1 开始学习
# 每个关卡都有不同的注入技巧
```

### 3. 使用攻击工具

#### Kali Linux 容器
```bash
# 进入 Kali 容器
docker exec -it kali-tools bash

# 更新工具
apt update && apt upgrade -y

# 安装常用工具
apt install -y nmap sqlmap dirb nikto

# 扫描靶机
nmap -sV 172.20.0.10  # 扫描 DVWA

# SQL 注入测试
sqlmap -u "http://172.20.0.10/vulnerabilities/sqli/?id=1&Submit=Submit"

# 目录扫描
dirb http://172.20.0.10
```

#### OWASP ZAP 使用
```bash
# 方式1: Web 界面
浏览器访问 http://localhost:8090

# 方式2: 命令行扫描
docker exec -it zap-scanner zap-baseline.py -t http://172.20.0.10
```

#### Nuclei 扫描
```bash
# 进入容器
docker exec -it nuclei-scanner sh

# 更新模板
nuclei -update-templates

# 扫描目标
nuclei -u http://172.20.0.10 -t cves/

# 扫描所有漏洞
nuclei -u http://172.20.0.10 -severity critical,high,medium
```

### 4. 管理容器

#### 查看日志
```bash
# 查看所有日志
docker-compose logs -f

# 查看特定服务日志
docker-compose logs -f dvwa
docker-compose logs -f kali-tools
```

#### 重启服务
```bash
# 重启单个服务
docker-compose restart dvwa

# 重启所有服务
docker-compose restart
```

#### 停止环境
```bash
# 停止所有容器（保留数据）
docker-compose stop

# 停止并删除容器（保留卷）
docker-compose down

# 停止并删除所有数据
docker-compose down -v
```

---

## 🎯 常见场景

### 场景1: SQL 注入学习路径

```bash
# 1. 从 SQLi Labs 开始（系统学习）
访问 http://localhost:8081
完成 Lesson 1-20（基础注入）

# 2. 在 DVWA 中实践
访问 http://localhost:8080
选择 SQL Injection（低/中/高难度）

# 3. 使用 SQLMap 自动化
docker exec -it kali-tools bash
sqlmap -u "http://dvwa/vulnerabilities/sqli/?id=1&Submit=Submit" \
       --cookie="security=low; PHPSESSID=xxx" \
       --dbs
```

### 场景2: XSS 攻击练习

```bash
# 1. DVWA XSS Reflected
访问 http://localhost:8080/vulnerabilities/xss_r/
尝试不同的 XSS payload

# 2. DVWA XSS Stored
访问 http://localhost:8080/vulnerabilities/xss_s/
练习存储型 XSS

# 3. bWAPP XSS 练习
访问 http://localhost:8082
选择 XSS 相关挑战
```

### 场景3: 渗透测试流程

```bash
# 步骤1: 信息收集
docker exec -it kali-tools bash
nmap -sV -sC 172.20.0.10-14

# 步骤2: 漏洞扫描
nuclei -u http://172.20.0.10 -severity critical,high

# 步骤3: Web 目录扫描
dirb http://172.20.0.10 /usr/share/wordlists/dirb/common.txt

# 步骤4: 漏洞利用
# 根据发现的漏洞选择对应工具

# 步骤5: 后渗透
# 获取 shell 后进行权限提升等操作
```

### 场景4: 自动化扫描

```bash
# 使用 ZAP 自动化扫描
docker exec -it zap-scanner zap-full-scan.py \
    -t http://172.20.0.10 \
    -r zap-report.html

# 使用 Nuclei 批量扫描
cat targets.txt | nuclei -t cves/ -o results.txt
```

---

## 🔧 高级配置

### 自定义端口

编辑 `.env` 文件：
```bash
# 修改端口映射
DVWA_PORT=9001
SQLI_LABS_PORT=9002
# ... 其他服务
```

### 添加自定义工具

```bash
# 进入 Kali 容器安装工具
docker exec -it kali-tools bash
apt install -y your-tool-name

# 或者构建自定义镜像
# 创建 Dockerfile
FROM kalilinux/kali-rolling
RUN apt update && apt install -y \
    nmap \
    sqlmap \
    your-custom-tools
```

### 持久化数据

```yaml
# 在 docker-compose.yml 中添加卷映射
services:
  kali:
    volumes:
      - ./my-tools:/root/my-tools
      - ./reports:/root/reports
```

### 网络隔离

```yaml
# 创建多个网络隔离不同服务
networks:
  attack-network:
  target-network:
```

---

## 🐛 故障排查

### 问题1: 端口冲突

**症状**: 启动失败，提示端口被占用

**解决**:
```bash
# Windows 查看端口占用
netstat -ano | findstr :8080

# 修改 .env 文件中的端口
DVWA_PORT=9001
```

### 问题2: 容器启动失败

**症状**: 容器状态为 "Exited"

**解决**:
```bash
# 查看容器日志
docker-compose logs dvwa

# 检查资源使用
docker stats

# 重启 Docker Desktop
```

### 问题3: 镜像拉取失败

**症状**: pull 镜像超时

**解决**:
```bash
# 配置 Docker 镜像加速
# 编辑 Docker Desktop 设置 -> Docker Engine
{
  "registry-mirrors": [
    "https://docker.mirrors.ustc.edu.cn",
    "https://hub-mirror.c.163.com"
  ]
}

# 或使用代理
export HTTP_PROXY=http://proxy:port
export HTTPS_PROXY=http://proxy:port
```

### 问题4: 网络不通

**症状**: 容器间无法通信

**解决**:
```bash
# 检查网络
docker network ls
docker network inspect docker-lab_security-lab

# 重建网络
docker-compose down
docker-compose up -d
```

### 问题5: 内存不足

**症状**: 容器频繁重启

**解决**:
```bash
# 调整 Docker Desktop 内存限制
# Settings -> Resources -> Memory: 至少 8GB

# 或限制单个容器内存
services:
  dvwa:
    deploy:
      resources:
        limits:
          memory: 512M
```

---

## ⚠️ 安全警告

### 重要安全提示

**⚠️ 本环境包含故意设计的漏洞，仅用于学习目的！**

### 安全建议

1. **不要暴露到公网**
   ```bash
   # 仅在本地运行，不要做端口转发
   # 如果使用云服务器，配置防火墙规则
   ```

2. **使用虚拟机隔离**
   - 建议在虚拟机中运行 Docker
   - 定期快照，出问题可以恢复

3. **定期清理**
   ```bash
   # 清理未使用的镜像和容器
   docker system prune -a
   ```

4. **监控资源**
   ```bash
   # 定期检查异常容器
   docker ps -a
   docker stats
   ```

5. **学习完成后停止**
   ```bash
   # 不使用时停止环境
   docker-compose down
   ```

---

## 📚 学习路径建议

### 初学者路径
```
Week 1: 环境搭建 + DVWA 低难度
  ├── Day 1-2: 环境搭建，熟悉 Docker
  ├── Day 3-4: DVWA SQL 注入（低）
  ├── Day 5-6: DVWA XSS（低）
  └── Day 7: 复习总结

Week 2: SQLi Labs + 工具使用
  ├── Day 1-3: SQLi Labs Lesson 1-20
  ├── Day 4-5: 学习使用 SQLMap
  └── Day 6-7: 实践总结

Week 3-4: 多平台练习
  ├── bWAPP 基础漏洞
  ├── WebGoat 课程
  └── Juice Shop 挑战
```

### 进阶路径
```
Month 1: 高级漏洞利用
  ├── DVWA 高难度
  ├── 二次注入
  └── 条件竞争

Month 2: 自动化与工具开发
  ├── Nuclei 模板编写
  ├── Python 自动化脚本
  └── 自定义工具开发

Month 3: 综合项目
  ├── 完整渗透测试流程
  ├── 报告编写
  └── CTF 比赛
```

---

## 📖 参考资料

### 官方文档
- [DVWA 官方](https://github.com/digininja/DVWA)
- [OWASP WebGoat](https://github.com/WebGoat/WebGoat)
- [OWASP Juice Shop](https://github.com/bkimminich/juice-shop)

### 学习资源
- 项目根目录: `../../01-foundation/` - 基础知识
- 项目根目录: `../../08-resources/` - 学习资源汇总
- 项目根目录: `../../07-labs/` - 实验指南

---

## 🤝 问题反馈

遇到问题可以：
1. 查看本文档的 [故障排查](#故障排查) 章节
2. 查看 Docker 日志: `docker-compose logs`
3. 提交 Issue（如果是项目问题）

---

## 📄 许可证

本项目仅供学习和研究使用，请勿用于非法用途。

**使用本环境即表示你同意：**
- 仅在合法授权的环境中使用
- 遵守当地法律法规
- 承担使用风险

---

**🎉 祝你学习愉快！记住：实践是最好的老师！**
