# 快速参考卡片

## 🚀 快速启动命令

```bash
# 启动环境
docker-compose up -d

# 查看状态
docker-compose ps

# 停止环境
docker-compose down
```

## 🌐 访问地址速查

| 服务 | 地址 | 账号 |
|------|------|------|
| DVWA | http://localhost:8080 | admin/password |
| SQLi Labs | http://localhost:8081 | - |
| bWAPP | http://localhost:8082 | bee/bug |
| WebGoat | http://localhost:8083 | 需注册 |
| Juice Shop | http://localhost:3000 | - |
| ZAP | http://localhost:8090 | - |
| Portainer | http://localhost:9000 | 首次设置 |

## 🛠️ 常用命令

### 容器管理
```bash
# 查看所有容器
docker ps -a

# 进入容器
docker exec -it kali-tools bash
docker exec -it dvwa bash

# 查看日志
docker-compose logs -f [服务名]

# 重启服务
docker-compose restart [服务名]

# 停止并删除
docker-compose down
```

### Kali 工具使用
```bash
# 进入 Kali
docker exec -it kali-tools bash

# Nmap 扫描
nmap -sV 172.20.0.10

# SQLMap
sqlmap -u "http://172.20.0.10/vuln.php?id=1"

# Dirb 目录扫描
dirb http://172.20.0.10

# Nikto 扫描
nikto -h http://172.20.0.10
```

### 网络信息
```bash
# 查看网络
docker network ls

# 网络详情
docker network inspect docker-lab_security-lab

# 容器 IP
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' dvwa
```

## 🎯 快速测试

### 测试 DVWA
```bash
# 访问
curl http://localhost:8080

# Nmap 扫描
nmap -p 80 localhost:8080
```

### 测试 SQL 注入
```bash
# SQLi Labs Lesson 1
# 浏览器访问
http://localhost:8081/Less-1/?id=1'

# 手动注入
http://localhost:8081/Less-1/?id=-1' union select 1,2,3--+
```

## 📊 资源监控

```bash
# 查看资源使用
docker stats

# 查看磁盘使用
docker system df

# 清理资源
docker system prune -a
```

## 🔧 故障排查

```bash
# 查看容器日志
docker-compose logs dvwa

# 查看容器详细信息
docker inspect dvwa

# 重新构建
docker-compose up -d --build

# 完全重置
docker-compose down -v
docker-compose up -d
```

## 📝 IP 地址速查

| 容器 | IP 地址 |
|------|---------|
| DVWA | 172.20.0.10 |
| SQLi Labs | 172.20.0.11 |
| bWAPP | 172.20.0.12 |
| WebGoat | 172.20.0.13 |
| Juice Shop | 172.20.0.14 |
| MySQL | 172.20.0.20 |
| Kali | 172.20.0.100 |
| ZAP | 172.20.0.101 |
| Nuclei | 172.20.0.102 |
