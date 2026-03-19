# 漏洞靶机推荐

> 精选的本地漏洞靶机资源，适合系统性学习各类安全漏洞

## 🎯 为什么使用本地靶机

相比在线平台，本地靶机的优势：

- ✅ **完全控制**：可以随时重置、修改配置
- ✅ **离线学习**：不需要网络连接
- ✅ **深度研究**：可以查看源码、配置
- ✅ **自由度高**：可以组合多种漏洞环境
- ✅ **成本低**：无需订阅费用

## 📚 靶机分类

### 一、Web应用漏洞靶机

适合学习Web渗透测试基础，覆盖OWASP Top 10漏洞。

#### 1. DVWA (Damn Vulnerable Web App) ⭐⭐⭐⭐⭐

**难度**：★☆☆☆☆  
**推荐度**：必学  
**适合阶段**：零基础、初级

**简介**：
- 最经典的Web漏洞靶机
- 包含常见的Web漏洞（SQL注入、XSS、文件上传等）
- 三个安全级别（Low、Medium、High）
- 详细的漏洞代码展示

**漏洞类型**：
- SQL注入
- XSS（反射型、存储型）
- 文件上传漏洞
- 文件包含漏洞
- 命令注入
- CSRF
- 暴力破解
- 不安全的反序列化

**部署方式**：
```bash
# 方式1：Docker部署（推荐）
docker run --rm -it -p 80:80 vulnerables/web-dvwa

# 方式2：下载源码部署
git clone https://github.com/digininja/DVWA.git
# 配置PHP和MySQL环境
```

**学习建议**：
- 从Low级别开始，逐步提升
- 对比不同级别的代码差异
- 手工测试为主，工具测试为辅
- 完成所有漏洞模块的学习

**资源**：
- 官网：https://dvwa.co.uk/
- GitHub：https://github.com/digininja/DVWA

---

#### 2. bWAPP (buggy Web Application) ⭐⭐⭐⭐

**难度**：★☆☆☆☆  
**推荐度**：强烈推荐  
**适合阶段**：零基础、初级

**简介**：
- 包含超过100种Web漏洞
- 漏洞种类全面，覆盖面广
- 支持安全级别调整

**漏洞类型**：
- OWASP Top 10全系列
- 各种注入漏洞（SQL、LDAP、XPath等）
- 各种XSS类型
- 文件操作漏洞
- 会话管理漏洞
- 加密漏洞
- 更多...

**部署方式**：
```bash
# Docker部署
docker run --rm -it -p 8080:80 raesene/bwapp

# 或下载安装包
# http://www.itsecgames.com/
```

**学习建议**：
- 按漏洞类型系统性学习
- 每个漏洞至少测试3次
- 记录测试步骤和Payload

---

#### 3. WebGoat ⭐⭐⭐⭐

**难度**：★★☆☆☆  
**推荐度**：强烈推荐  
**适合阶段**：初级、中级

**简介**：
- OWASP官方教育项目
- 交互式学习平台
- 包含详细的教学提示

**特点**：
- 每个漏洞有教学说明
- 提供Hints提示
- 难度适中，循序渐进
- 覆盖Web安全和Web服务安全

**部署方式**：
```bash
# 使用Java运行
java -jar webgoat-server-8.0.0.jar --server.port=8080

# 访问：http://localhost:8080/WebGoat
```

**学习建议**：
- 跟随教学步骤学习
- 尝试不看提示独立完成
- 完成所有课程章节

---

#### 4. sqli-labs ⭐⭐⭐⭐

**难度**：★★☆☆☆  
**推荐度**：SQL注入必练  
**适合阶段**：初级、中级

**简介**：
- 专门的SQL注入练习平台
- 65个关卡，从简单到复杂
- 覆盖几乎所有SQL注入类型

**关卡类型**：
- GET/POST注入
- Cookie注入
- 盲注
- 二次注入
- 宽字节注入
- 堆叠注入
- 更多...

**部署方式**：
```bash
# 下载源码
git clone https://github.com/Audi-1/sqli-labs.git

# 配置PHP和MySQL
# 访问：http://localhost/sqli-labs/
```

**学习建议**：
- 从Lesson 1开始，顺序完成
- 手工注入为主，工具为辅
- 总结每种注入的特点和Payload

---

#### 5. XSS挑战平台

**Pikachu（皮卡丘）** ⭐⭐⭐⭐

**简介**：
- 国产漏洞靶机，中文界面
- 包含多种XSS类型
- 还有其他常见漏洞

**部署方式**：
```bash
git clone https://github.com/zhuifengshaonianhanlu/pikachu.git
# 配置PHP和MySQL
```

---

### 二、综合漏洞靶机

包含多种服务和漏洞，适合练习完整的渗透测试流程。

#### 1. Metasploitable 2/3 ⭐⭐⭐⭐⭐

**难度**：★★☆☆☆  
**推荐度**：必学  
**适合阶段**：初级、中级

**简介**：
- Metasploit团队出品
- 故意设计的漏洞系统
- 包含大量服务和漏洞

**包含服务**：
- FTP、SSH、Telnet
- Apache、MySQL
- Samba、Tomcat
- 多个Web应用
- 更多...

**漏洞类型**：
- 弱口令
- 已知CVE漏洞
- 配置错误
- 未授权访问
- 更多...

**部署方式**：
```bash
# 下载虚拟机镜像
# https://sourceforge.net/projects/metasploitable/

# 解压后用VMware打开
# 网络设置为Host-Only
```

**学习建议**：
- 使用Nmap进行端口扫描
- 使用Metasploit进行漏洞利用
- 练习后渗透技术
- 尝试多种漏洞利用路径

---

#### 2. VulnHub靶机系列 ⭐⭐⭐⭐⭐

**简介**：
- 社区贡献的漏洞靶机平台
- 大量不同难度的靶机
- 模拟真实场景

**推荐靶机列表**：

**入门级（难度：★☆☆☆☆）**：
- **Kioptrix: Level 1** - 经典入门靶机
- **Mr-Robot: 1** - 模拟Mr. Robot剧集
- **DC-1** - DC系列入门
- **Vulnix** - NFS和SMTP漏洞练习

**初级（难度：★★☆☆☆）**：
- **Kioptrix: Level 2-5** - 系列进阶
- **DC-2/3/4** - WordPress相关漏洞
- **Stapler: 1** - 真实系统模拟
- **Mr-Robot: 1** - Web渗透

**中级（难度：★★★☆☆）**：
- **Hackable: II** - 多个服务
- **Lord Of The Root** - 提权练习
- **Tr0ll** - CTF风格靶机
- **Wintermute** - 多阶段渗透

**高级（难度：★★★★☆）**：
- **FristiLeaks: 1.3** - Web渗透进阶
- **Brainpan** - 缓冲区溢出
- **C Lazy** - 多种技术组合

**下载和使用**：
```bash
# 访问VulnHub官网
https://www.vulnhub.com/

# 下载.ova文件
# 用VMware或VirtualBox导入
# 网络设置为NAT或Host-Only
```

**学习建议**：
- 从低难度开始
- 每台靶机至少攻克一次
- 查看Writeup学习他人思路
- 记录渗透过程和心得

---

### 三、内网渗透靶机

适合学习域渗透、内网横向移动等高级技术。

#### 1. GOAD (Game of Active Directory) ⭐⭐⭐⭐⭐

**难度**：★★★★☆  
**推荐度**：域渗透必练  
**适合阶段**：中级、高级

**简介**：
- 完整的域环境靶场
- 包含多个域控制器和客户端
- 模拟真实企业AD环境

**包含内容**：
- Windows Server 2016/2019
- 域控制器
- 多个域用户和组
- 各种AD漏洞配置

**部署方式**：
```bash
# 下载和部署
https://github.com/Orange-Cyberdefense/GOAD

# 需要较大硬件资源
# 建议32GB内存以上
```

**学习内容**：
- 域信息收集
- Kerberos攻击
- 横向移动
- 权限提升
- 权限维持

---

#### 2. Active Directory Lab ⭐⭐⭐⭐

**简介**：
- 自己搭建域环境
- 更灵活的配置选项
- 可以定制漏洞场景

**搭建步骤**：
1. 安装Windows Server 2019虚拟机
2. 安装Active Directory域服务
3. 配置域控制器
4. 创建域用户和组
5. 加入Windows 10客户端

**学习内容**：
- AD架构理解
- 组策略配置
- 域权限管理
- 常见AD攻击

---

#### 3. VulnNet ⭐⭐⭐⭐

**简介**：
- TryHackMe平台上的内网靶场
- 包含多个虚拟机
- 模拟企业内网环境

**学习内容**：
- 内网信息收集
- 横向移动技术
- 权限提升
- 域渗透基础

---

### 四、专项漏洞靶机

针对特定漏洞类型设计的靶机。

#### 1. NodeGoat ⭐⭐⭐

**简介**：
- Node.js应用安全靶机
- 学习Node.js特有漏洞

**漏洞类型**：
- 不安全的反序列化
- 代码注入
- 路径遍历
- XSS

**部署方式**：
```bash
git clone https://github.com/OWASP/NodeGoat.git
cd NodeGoat
npm install
npm start
```

---

#### 2. RailsGoat ⭐⭐⭐

**简介**：
- Ruby on Rails应用安全靶机
- 学习Rails框架安全

**部署方式**：
```bash
git clone https://github.com/OWASP/railsgoat.git
cd railsgoat
bundle install
rails server
```

---

#### 3. WebGoat.NET ⭐⭐⭐

**简介**：
- .NET平台Web安全靶机
- 学习.NET应用安全

---

## 🚀 靶机部署最佳实践

### 部署原则

1. **网络隔离**
   - 所有靶机部署在隔离网络中
   - 使用Host-Only或自定义网络
   - 禁止靶机访问互联网

2. **快照管理**
   - 部署完成后立即创建快照
   - 每次"攻破"后可以重置
   - 命名清晰，便于管理

3. **资源分配**
   - 根据靶机需求分配资源
   - 避免资源浪费
   - 定期关闭不用的靶机

### 部署流程

```bash
# 标准部署流程
1. 下载靶机镜像（.ova或ISO）
2. 导入虚拟化软件
3. 配置网络（Host-Only）
4. 启动并验证服务
5. 创建初始快照
6. 开始练习
```

### 学习流程

```bash
# 推荐学习流程
1. 信息收集（端口扫描、服务识别）
2. 漏洞发现（漏洞扫描、手工测试）
3. 漏洞利用（获取访问权限）
4. 权限提升（提升到root/system）
5. 后渗透（信息收集、横向移动）
6. 清理痕迹（恢复快照）
7. 总结记录（编写笔记）
```

## 📊 靶机难度对比表

| 靶机名称 | 难度 | 学习重点 | 适合阶段 | 推荐度 |
|---------|------|---------|---------|--------|
| DVWA | ★☆☆☆☆ | Web基础漏洞 | 零基础 | ⭐⭐⭐⭐⭐ |
| bWAPP | ★☆☆☆☆ | 全面Web漏洞 | 零基础 | ⭐⭐⭐⭐ |
| WebGoat | ★★☆☆☆ | 交互式学习 | 初级 | ⭐⭐⭐⭐ |
| sqli-labs | ★★☆☆☆ | SQL注入专项 | 初级 | ⭐⭐⭐⭐⭐ |
| Metasploitable | ★★☆☆☆ | 综合渗透 | 初级 | ⭐⭐⭐⭐⭐ |
| Kioptrix | ★★☆☆☆ | 系统渗透 | 初级 | ⭐⭐⭐⭐ |
| DC系列 | ★★☆☆☆ | WordPress渗透 | 初级 | ⭐⭐⭐⭐ |
| GOAD | ★★★★☆ | 域渗透 | 中级 | ⭐⭐⭐⭐⭐ |
| Brainpan | ★★★★☆ | 缓冲区溢出 | 高级 | ⭐⭐⭐⭐ |

## 💡 学习建议

### 初学者路径

```
1. DVWA (所有漏洞) 
   ↓
2. sqli-labs (至少前30关)
   ↓
3. bWAPP (主要漏洞)
   ↓
4. Metasploitable 2
   ↓
5. VulnHub入门级靶机
```

### 进阶路径

```
1. WebGoat (完整课程)
   ↓
2. Metasploitable 3
   ↓
3. VulnHub初级靶机 (5-10台)
   ↓
4. VulnHub中级靶机 (5-10台)
   ↓
5. 搭建域环境靶场
```

### 高级路径

```
1. VulnHub高级靶机
   ↓
2. GOAD域环境
   ↓
3. 真实漏洞复现
   ↓
4. CTF比赛
```

## 🔗 相关资源

- [实验环境搭建](../lab-setup/) - 如何部署靶机
- [CTF平台推荐](../ctf-platforms/) - 在线练习平台
- [学习路径](../../00-roadmap/learning-path.md) - 理论学习
- [工具清单](../../08-resources/tools/) - 渗透测试工具

---

**记住：靶机练习是提升实战能力的关键！** 🎯

建议每周至少完成1-2台靶机的攻克，持续积累经验。
