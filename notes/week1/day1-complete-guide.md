# Day 1: 环境搭建完整指南

> 🎯 目标：搭建完整的网络安全学习环境，迈出第一步

## 📋 今日任务概览

1. ✅ 确认 Docker 环境
2. ✅ 启动实验环境
3. ✅ 验证所有服务
4. ✅ 访问第一个靶机
5. ✅ 创建学习笔记

**预计时间**: 1-2 小时

---

## 🚀 任务 1: 确认 Docker 环境

### 步骤 1.1: 检查 Docker 安装

打开命令行工具：
- **Windows**: PowerShell 或 CMD
- **Mac/Linux**: Terminal

输入以下命令：

```bash
# 检查 Docker 版本
docker --version

# 检查 Docker Compose 版本
docker-compose --version
```

**预期输出**:
```
Docker version 24.0.x, build xxx
Docker Compose version v2.x.x
```

### 步骤 1.2: 检查 Docker 运行状态

```bash
# 查看 Docker 信息
docker info
```

**如果报错**:
- ❌ Windows: 确保 Docker Desktop 已启动
- ❌ Linux: 运行 `sudo systemctl start docker`

### ✅ 检查点 1

- [ ] Docker 已安装
- [ ] Docker 正在运行
- [ ] Docker Compose 可用

---

## 🎯 任务 2: 启动实验环境

### 步骤 2.1: 进入项目目录

```bash
# Windows (PowerShell)
cd d:\workspace\github\cybersecurity-doc\labs\docker-lab

# Mac/Linux
cd /path/to/cybersecurity-doc/labs/docker-lab
```

### 步骤 2.2: 创建必要目录

```bash
# 创建工具、字典、输出目录
mkdir tools wordlists output nuclei-templates
```

### 步骤 2.3: 启动环境

#### Windows 用户
```batch
# 方式1: 双击运行 start.bat

# 方式2: 命令行运行
.\start.bat
```

#### Linux/Mac 用户
```bash
# 添加执行权限
chmod +x start.sh

# 运行脚本
./start.sh
```

#### 手动启动（推荐学习）
```bash
# 拉取所有镜像（首次需要 10-30 分钟）
docker-compose pull

# 启动所有服务
docker-compose up -d

# 查看启动状态
docker-compose ps
```

### 步骤 2.4: 观察启动过程

**正常输出示例**:
```
[+] Running 12/12
 ⠿ Network docker-lab_security-lab    Created
 ⠿ Container dvwa                     Started
 ⠿ Container sqli-labs                Started
 ⠿ Container bwapp                    Started
 ⠿ Container webgoat                  Started
 ⠿ Container juice-shop               Started
 ⠿ Container mysql-db                 Started
 ⠿ Container kali-tools               Started
 ⠿ Container zap-scanner              Started
 ⠿ Container nuclei-scanner           Started
 ⠿ Container portainer                Started
 ⠿ Container webtop                   Started
```

**等待时间**: 首次启动需要拉取镜像，大约 10-30 分钟

### ✅ 检查点 2

- [ ] 进入项目目录成功
- [ ] 镜像拉取成功
- [ ] 所有容器启动
- [ ] 没有报错信息

---

## 🔍 任务 3: 验证服务状态

### 步骤 3.1: 查看容器状态

```bash
# 查看所有容器状态
docker-compose ps
```

**预期输出**:
```
NAME                COMMAND                  SERVICE             STATUS              PORTS
dvwa                "apache2-foreground"     dvwa                running (healthy)   0.0.0.0:8080->80/tcp
sqli-labs           "apache2-foreground"     sqli-labs           running             0.0.0.0:8081->80/tcp
bwapp               "apache2-foreground"     bwapp               running             0.0.0.0:8082->80/tcp
webgoat             "/home/webgoat/start…"   webgoat             running             0.0.0.0:8083->8080/tcp
juice-shop          "node app.js"            juice-shop          running             0.0.0.0:3000->3000/tcp
mysql-db            "docker-entrypoint.s…"   db                  running             3306/tcp
kali-tools          "/bin/bash"              kali                running
zap-scanner         "zap-webswing.sh"        zap                 running             0.0.0.0:8090->8090/tcp
nuclei-scanner      "sh"                     nuclei              running
portainer           "/portainer"             portainer           running             0.0.0.0:9000->9000/tcp
webtop              "/init"                  webtop              running             0.0.0.0:3010->3000/tcp
```

**关键指标**:
- STATUS 应该显示 `running` 或 `running (healthy)`
- PORTS 应该显示正确的端口映射

### 步骤 3.2: 检查容器健康

```bash
# 查看容器资源使用
docker stats --no-stream

# 查看网络
docker network inspect docker-lab_security-lab
```

### 步骤 3.3: 测试网络连通性

```bash
# 测试 DVWA 容器网络
docker exec dvwa ping -c 3 kali-tools

# 测试 Kali 容器网络
docker exec kali-tools ping -c 3 dvwa
```

### ✅ 检查点 3

- [ ] 所有容器状态为 running
- [ ] 端口映射正确
- [ ] 网络连通正常
- [ ] 资源使用正常

---

## 🌐 任务 4: 访问第一个靶机 - DVWA

### 步骤 4.1: 浏览器访问

打开浏览器，访问以下地址：

**主要靶机**:
- DVWA: http://localhost:8080
- SQLi Labs: http://localhost:8081
- bWAPP: http://localhost:8082
- WebGoat: http://localhost:8083
- Juice Shop: http://localhost:3000

### 步骤 4.2: 登录 DVWA

1. 访问 http://localhost:8080
2. 使用以下账号登录：
   - **用户名**: `admin`
   - **密码**: `password`

**首次访问会看到**:
```
Database Setup
Click below to setup the database.

[Create / Reset Database]
```

### 步骤 4.3: 创建数据库

1. 点击 **"Create / Reset Database"** 按钮
2. 等待数据库初始化完成
3. 自动跳转到登录页面
4. 再次使用 `admin/password` 登录

**成功标志**:
- 看到 "Welcome to Damn Vulnerable Web App!" 消息
- 左侧菜单显示多个漏洞模块

### 步骤 4.4: 探索 DVWA 功能

浏览以下模块，了解有哪些漏洞：

**命令执行类**:
- Command Injection - 命令注入
- File Inclusion - 文件包含

**注入类**:
- SQL Injection - SQL注入
- SQL Injection (Blind) - 盲注

**XSS类**:
- XSS (Reflected) - 反射型XSS
- XSS (Stored) - 存储型XSS

**其他**:
- Brute Force - 暴力破解
- File Upload - 文件上传
- CSRF - 跨站请求伪造
- Weak Session IDs - 弱会话ID

### 步骤 4.5: 设置安全等级

1. 点击左侧 **"DVWA Security"**
2. 查看当前安全等级（默认为 impossible）
3. 选择 **"low"**
4. 点击 **"Submit"**

**为什么要设置 low？**
- low 难度适合初学者
- 漏洞明显，容易理解
- 便于学习基本原理

### ✅ 检查点 4

- [ ] 成功访问 DVWA
- [ ] 成功登录
- [ ] 数据库创建成功
- [ ] 能看到漏洞模块
- [ ] 安全等级设置为 low

---

## 📊 任务 5: 访问管理工具

### Portainer - Docker 管理

1. 访问 http://localhost:9000
2. 首次访问需要设置管理员密码
3. 选择 "Get Started"
4. 选择 "local" 环境

**功能**:
- 查看所有容器状态
- 查看日志
- 进入容器终端
- 管理镜像和网络

### ✅ 检查点 5

- [ ] Portainer 访问成功
- [ ] 能看到所有容器列表
- [ ] 能查看容器日志

---

## 📝 任务 6: 创建学习笔记

### 步骤 6.1: 创建个人笔记文件

在项目中创建你的学习笔记：

```bash
# 创建笔记目录
mkdir -p notes/week1

# 创建今天的笔记
# Windows
echo "# Day 1 学习笔记" > notes/week1/day1.md

# Linux/Mac
touch notes/week1/day1.md
```

### 步骤 6.2: 记录关键信息

编辑 `notes/week1/day1.md`，记录以下内容：

```markdown
# Day 1 学习笔记 - 环境搭建

## 环境信息

- Docker 版本: 
- 操作系统:
- 启动时间:

## 服务列表

| 服务名称 | 访问地址 | 状态 |
|---------|---------|------|
| DVWA | http://localhost:8080 | ✅ |
| SQLi Labs | http://localhost:8081 | ✅ |
| ... | ... | ... |

## 遇到的问题

### 问题 1
描述：
解决方法：

## 学习要点

1. Docker Compose 可以一键启动多个容器
2. 漏洞靶机需要先创建数据库
3. 安全等级影响漏洞的可利用性

## 下一步

- [ ] 熟悉 DVWA 的各个模块
- [ ] 学习 SQL 注入基础
- [ ] 练习使用 Kali 工具
```

---

## 🎓 知识点总结

### Docker 基础概念

**镜像 (Image)**:
- 类似于虚拟机的快照
- 包含运行环境、应用程序
- 只读，不可修改

**容器 (Container)**:
- 镜像的运行实例
- 相互隔离的运行环境
- 可以启动、停止、删除

**网络 (Network)**:
- 容器间通信的桥梁
- 默认桥接网络
- 可以自定义网络地址

### Docker 常用命令

```bash
# 查看运行中的容器
docker ps

# 查看所有容器（包括停止的）
docker ps -a

# 查看镜像
docker images

# 启动容器
docker start [容器名]

# 停止容器
docker stop [容器名]

# 进入容器
docker exec -it [容器名] bash

# 查看日志
docker logs [容器名]

# 查看资源使用
docker stats

# 清理未使用的资源
docker system prune -a
```

### DVWA 简介

**DVWA (Damn Vulnerable Web Application)**:
- 故意设计漏洞的 Web 应用
- 用于学习 Web 安全
- 包含常见的 Web 漏洞

**安全等级**:
- **Low**: 漏洞明显，适合入门
- **Medium**: 有简单防护，需要绕过
- **High**: 较强防护，需要技巧
- **Impossible**: 安全实现，参考学习

---

## 🔧 常见问题排查

### 问题 1: 端口被占用

**症状**:
```
Error: bind: address already in use
```

**解决**:
```bash
# Windows 查看端口占用
netstat -ano | findstr :8080

# 修改 .env 文件中的端口
DVWA_PORT=9001
```

### 问题 2: 容器启动失败

**症状**: 容器状态为 "Exited"

**解决**:
```bash
# 查看容器日志
docker-compose logs dvwa

# 重启容器
docker-compose restart dvwa

# 完全重建
docker-compose down
docker-compose up -d
```

### 问题 3: 无法访问靶机

**症状**: 浏览器无法打开页面

**解决**:
```bash
# 检查容器是否运行
docker ps

# 检查端口映射
docker port dvwa

# 检查防火墙（Windows）
netsh advfirewall firewall show rule name=all | findstr 8080
```

### 问题 4: 内存不足

**症状**: 容器频繁重启

**解决**:
```bash
# 检查资源使用
docker stats

# 调整 Docker Desktop 内存限制
# Settings -> Resources -> Memory: 8GB+
```

---

## ✅ 完成检查清单

恭喜！如果你完成了以下所有任务，Day 1 就成功完成了：

- [ ] Docker 环境正常
- [ ] 所有容器启动成功
- [ ] 容器状态健康
- [ ] 能访问 DVWA (http://localhost:8080)
- [ ] 能登录 DVWA (admin/password)
- [ ] 数据库创建成功
- [ ] 安全等级设置为 low
- [ ] 能访问 Portainer (http://localhost:9000)
- [ ] 创建了学习笔记

---

## 🎯 明日预告

### Day 2: 工具熟悉

- 探索 DVWA 所有漏洞模块
- 进入 Kali Linux 容器
- 安装常用工具（nmap, sqlmap, dirb）
- 扫描靶机网络
- 学习基本的网络探测

**准备建议**:
- 提前了解 nmap 基本用法
- 复习 TCP/IP 基础知识
- 准备好笔记本记录命令

---

## 📚 扩展学习

### 推荐阅读
1. Docker 官方文档
2. DVWA 官方 GitHub
3. OWASP Top 10 简介

### 动手实践
1. 尝试启动单个容器: `docker-compose up -d dvwa`
2. 进入容器查看: `docker exec -it dvwa bash`
3. 查看容器日志: `docker-compose logs dvwa`

---

## 🎉 总结

今天你完成了：
- ✅ 搭建了完整的 Docker 安全实验环境
- ✅ 启动了 10+ 个安全服务
- ✅ 访问了第一个漏洞靶机 DVWA
- ✅ 创建了学习笔记系统

**你的安全学习之路正式开始了！** 🚀

---

**记住**:
- 环境搭建是第一步，后续学习都依赖这个环境
- 遇到问题不要慌，查看日志是关键
- 做好笔记，好记性不如烂笔头

**明天见！** 👋
