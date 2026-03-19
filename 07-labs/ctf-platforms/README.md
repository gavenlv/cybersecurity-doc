# CTF平台推荐

> 在线CTF和练习平台，边学边练，从零基础到高手进阶

## 🎯 什么是在线练习平台

在线CTF和安全练习平台提供：

- ✅ **即开即用**：无需本地搭建环境
- ✅ **即时反馈**：实时验证答案
- ✅ **社区交流**：与其他学习者交流
- ✅ **难度分级**：从简单到困难
- ✅ **学习资源**：配套教程和Writeup

## 📊 平台对比总览

| 平台名称 | 难度范围 | 学习方式 | 推荐度 | 适合阶段 |
|---------|---------|---------|--------|---------|
| TryHackMe | ★☆☆~★★★ | 引导式学习 | ⭐⭐⭐⭐⭐ | 零基础、初级 |
| HackTheBox | ★★☆~★★★★ | 实战练习 | ⭐⭐⭐⭐⭐ | 初级、中级、高级 |
| PortSwigger Academy | ★☆☆~★★★ | Web专项 | ⭐⭐⭐⭐⭐ | 所有阶段 |
| PicoCTF | ★☆☆~★★☆ | CTF入门 | ⭐⭐⭐⭐ | 零基础、初级 |
| VulnHub | ★★☆~★★★★ | 本地靶机 | ⭐⭐⭐⭐ | 初级、中级、高级 |
| Hack The Box Academy | ★★☆~★★★★ | 系统课程 | ⭐⭐⭐⭐ | 初级、中级 |

---

## 🌟 一、TryHackMe ⭐⭐⭐⭐⭐

**网址**：https://tryhackme.com/  
**推荐指数**：⭐⭐⭐⭐⭐  
**适合人群**：零基础、初级学习者

### 平台特点

- 📚 **完整学习路径**：从零基础到进阶的系统性课程
- 🎯 **引导式学习**：每个步骤都有详细提示
- 🏠 **虚拟房间**：预配置的实验环境，一键启动
- 💡 **即时提示**：卡住时可查看提示
- 🏆 **积分排名**：完成挑战获得积分和徽章

### 推荐学习路径

#### 1. 零基础路径：Pre-Security

**时长**：40小时  
**内容**：
- 网络基础
- Linux基础
- Windows基础
- 安全概念入门

**适合**：完全零基础的学习者

#### 2. 初学者路径：Complete Beginner

**时长**：60小时  
**内容**：
- Linux命令行
- Web应用基础
- 网络协议
- 渗透测试入门
- 密码学基础

**适合**：有基础概念，想系统学习

#### 3. 渗透测试路径：Penetration Testing

**时长**：100小时  
**内容**：
- 信息收集
- 漏洞扫描
- 渗透测试方法论
- 后渗透技术
- 报告编写

**适合**：准备从事渗透测试工作

#### 4. 其他路径

- ** Offensive Pentesting** - 攻击性渗透测试
- **Cyber Defense** - 防御性安全
- **Red Teaming** - 红队攻防
- **Bug Bounty** - 漏洞赏金猎人

### 优秀房间推荐

**入门房间**：
- "Welcome" - 平台入门
- "Linux Modules" - Linux学习
- "Network Services" - 网络服务
- "OWASP Top 10" - Web安全基础

**进阶房间**：
- "Offensive Pentesting Path" - 渗透测试路径
- "Red Teaming" - 红队技术
- "Compromising Active Directory" - 域渗透

### 费用

- **免费版**：可访问大部分基础房间
- **订阅版**：$10/月，解锁所有内容

**建议**：初学者可以从免费版开始，进阶后考虑订阅

---

## 🎮 二、Hack The Box (HTB) ⭐⭐⭐⭐⭐

**网址**：https://www.hackthebox.com/  
**推荐指数**：⭐⭐⭐⭐⭐  
**适合人群**：初级、中级、高级学习者

### 平台特点

- 🎯 **实战导向**：真实场景模拟
- 🔥 **难度较高**：比TryHackMe更具挑战性
- 🏆 **排行榜**：全球排名系统
- 💻 **多种挑战**：机器、挑战、堡垒机、Pro实验室
- 🔍 **社区活跃**：大量Writeup和讨论

### 主要内容类型

#### 1. Machines（机器）

**类型**：
- **Active Machines**：正在运行的机器，竞争排名
- **Retired Machines**：已退役机器，有官方Writeup

**难度分级**：
- Easy（简单）
- Medium（中等）
- Hard（困难）
- Insane（极难）

**推荐机器（退役）**：
- **Easy**：Lame、Blue、Nibbles、Jerry
- **Medium**：Blocky、Bashed、Cronos
- **Hard**：Sunday、Solidstate

#### 2. Starting Point（起点）

**适合**：零基础、初学者

**内容**：
- 引导式学习
- 基础渗透测试技术
- 配套教程

**免费**：可免费访问部分内容

#### 3. Challenges（挑战）

**类型**：
- Web
- Crypto
- Pwn
- Reverse
- Forensics
- Misc

**适合**：专项技能训练

#### 4. Pro Labs（专业实验室）

**内容**：
- Dante：综合渗透测试
- RastaLabs：红队训练
- Cybernetics：高级红队
- Offshore：红队实战

**费用**：需要订阅

### 学习建议

#### 初学者路径

```
1. Starting Point（起点）
   ↓
2. Retired Easy Machines（5-10台）
   ↓
3. Retired Medium Machines（5-10台）
   ↓
4. Active Machines（参与竞争）
```

#### 进阶路径

```
1. Retired Medium/Hard Machines
   ↓
2. Challenges（专项训练）
   ↓
3. Pro Labs（专业实验室）
   ↓
4. Fortresses（堡垒机挑战）
```

### 费用

- **免费版**：可访问部分机器和挑战
- **VIP**：$14/月，解锁所有退役机器
- **VIP+**：$20/月，包含Pro实验室访问

**建议**：初级阶段从免费版开始，进阶后考虑VIP

---

## 🌐 三、PortSwigger Web Security Academy ⭐⭐⭐⭐⭐

**网址**：https://portswigger.net/web-security  
**推荐指数**：⭐⭐⭐⭐⭐  
**适合人群**：所有阶段的Web安全学习者

### 平台特点

- 🎓 **官方出品**：Burp Suite开发商
- 📚 **系统全面**：覆盖所有Web漏洞类型
- 🎯 **实践导向**：每个漏洞都有实验室
- 🆓 **完全免费**：所有内容免费开放
- 📖 **详细教程**：理论+实践结合

### 学习内容

#### 1. SQL注入

- SQL注入基础
- 盲注技术
- SQLMap使用
- 高级注入技术

#### 2. XSS

- 反射型XSS
- 存储型XSS
- DOM型XSS
- XSS绕过技术

#### 3. CSRF

- CSRF基础
- CSRF令牌绕过
- 预防措施

#### 4. 认证漏洞

- 密码重置漏洞
- 多因素认证绕过
- OAuth漏洞

#### 5. 访问控制

- 权限提升
- 不安全的直接对象引用
- 路径遍历

#### 6. 其他漏洞

- SSRF
- XXE
- 文件上传漏洞
- 命令注入
- 信息泄露
- 加密漏洞
- 业务逻辑漏洞

### 学习路径

```
1. SQL注入路径
   ↓
2. XSS路径
   ↓
3. 认证漏洞
   ↓
4. 访问控制
   ↓
5. 其他漏洞（按兴趣选择）
```

### 优势

- 完全免费
- 内容专业权威
- 实验室质量高
- 可以用Burp Suite练习

### 学习建议

- 每个主题先阅读理论
- 然后完成实验室练习
- 尝试不看提示独立完成
- 记录关键Payload

---

## 🎈 四、PicoCTF ⭐⭐⭐⭐

**网址**：https://picoctf.org/  
**推荐指数**：⭐⭐⭐⭐  
**适合人群**：零基础、初级学习者

### 平台特点

- 🎓 **教育导向**：专为初学者设计
- 🏫 **年度比赛**：每年举办大型CTF比赛
- 📚 **学习资源**：配套教程和视频
- 🆓 **完全免费**：所有内容免费

### 挑战类型

- **General Skills** - 基础技能
- **Cryptography** - 密码学
- **Web Exploitation** - Web渗透
- **Forensics** - 数字取证
- **Reverse Engineering** - 逆向工程
- **Binary Exploitation** - 二进制漏洞

### 难度分级

- 50-100分：简单
- 100-200分：中等
- 200+分：困难

### 学习建议

1. 从General Skills开始
2. 按分数从低到高完成
3. 每个类别完成10-20题
4. 查看Writeup学习思路

---

## 🔥 五、其他优秀平台

### 1. OverTheWire (Wargames) ⭐⭐⭐⭐

**网址**：https://overthewire.org/wargames/  
**适合**：Linux基础、权限提升学习

**推荐游戏**：
- **Bandit**：Linux命令行基础（必练）
- **Natas**：Web安全基础
- **Leviathan**：权限提升
- **Krypton**：密码学

**特点**：免费、SSH访问、循序渐进

### 2. Hack This Site ⭐⭐⭐

**网址**：https://www.hackthissite.org/  
**适合**：Web安全基础练习

**内容**：
- Basic missions
- Realistic missions
- Application missions
- Programming missions

### 3. Root-Me ⭐⭐⭐⭐

**网址**：https://www.root-me.org/  
**适合**：法语和英语学习者

**特点**：
- 大量挑战题目
- 社区活跃
- 难度适中

### 4. VulnHub ⭐⭐⭐⭐⭐

**网址**：https://www.vulnhub.com/  
**适合**：初级、中级、高级

**特点**：
- 下载本地运行的靶机
- 社区贡献
- 真实场景模拟

**详见**：[漏洞靶机推荐](../vulnerable-machines/)

### 5. Hack The Box Academy ⭐⭐⭐⭐

**网址**：https://academy.hackthebox.com/  
**适合**：系统化学习

**特点**：
- HTB官方课程
- 结构化学习路径
- 配套实验环境

**费用**：需要订阅（$7.5/月起）

### 6. PentesterLab ⭐⭐⭐⭐

**网址**：https://pentesterlab.com/  
**适合**：Web渗透测试

**特点**：
- 专注Web安全
- 循序渐进
- 代码审计

**费用**：免费+付费内容

---

## 📈 学习路径建议

### 零基础路径

```
第1个月：
- TryHackMe: Pre-Security路径
- OverTheWire: Bandit（前20关）
- PicoCTF: General Skills

第2-3个月：
- TryHackMe: Complete Beginner路径
- PortSwigger Academy: SQL注入、XSS
- PicoCTF: Web、Crypto基础题

第4-6个月：
- TryHackMe: Penetration Testing路径
- HackTheBox: Starting Point + Easy Machines
- PortSwigger Academy: 其他Web漏洞
```

### 初级路径

```
第1-3个月：
- HackTheBox: Retired Easy Machines（10台）
- TryHackMe: 渗透测试路径
- PortSwigger Academy: 完整Web安全课程

第4-6个月：
- HackTheBox: Retired Medium Machines（10台）
- VulnHub: 入门级靶机
- OverTheWire: Natas、Leviathan

第7-12个月：
- HackTheBox: Active Machines
- TryHackMe: Red Teaming路径
- 参加1-2个CTF比赛
```

### 中级路径

```
持续练习：
- HackTheBox: Medium/Hard Machines
- VulnHub: 中级靶机
- HackTheBox: Pro Labs
- 参加CTF比赛（每月1-2次）
```

## 💡 学习技巧

### 1. 不要急于求成

- 每道题至少尝试30分钟
- 卡住时先查看提示
- 实在不会再看Writeup
- 理解思路而非抄答案

### 2. 记录笔记

- 记录解题思路
- 整理常用Payload
- 记录新学到的技术
- 建立个人知识库

### 3. 社区交流

- 加入Discord/Telegram群组
- 在论坛提问和回答
- 分享学习心得
- 结识志同道合的朋友

### 4. 定期复习

- 每周回顾学过的内容
- 重复练习重要技能
- 总结规律和方法
- 形成自己的方法论

### 5. 实践为主

- 理论学习30%
- 动手实践70%
- 每天至少1小时练习
- 周末增加练习时间

## 🏆 CTF比赛推荐

### 大型年度CTF

- **DEF CON CTF** - 世界顶级CTF
- **HITCON CTF** - 台湾HITCON举办
- **PlaidCTF** - Plaid Parliament of Pwning
- **0CTF** - 中国顶级CTF

### 周期性CTF

- **PicoCTF** - 年度大型CTF（适合初学者）
- **HackTheBox CTF** - 定期举办
- **CTFtime.org** - CTF比赛聚合平台

### 参赛建议

- 初级：参加PicoCTF、本地CTF
- 中级：参加在线CTF比赛
- 高级：组建战队，参加大型CTF

---

## 🔗 相关资源

- [学习路径](../../00-roadmap/learning-path.md) - 理论学习
- [漏洞靶机](../vulnerable-machines/) - 本地靶机
- [工具清单](../../08-resources/tools/) - 渗透工具
- [实战项目](../../09-projects/) - 项目练习

---

**记住：CTF是检验能力的最佳方式，持续练习才能不断进步！** 🎯

建议每周至少完成：
- 3-5个TryHackMe房间 或
- 1-2台HackTheBox机器 或
- 10-20个PortSwigger实验室
