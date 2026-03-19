# 基础环境搭建详细指南

> 最小化可用的实验环境配置，适合零基础学习者快速上手

## 🎯 环境目标

搭建一个包含以下内容的基础实验环境：

- ✅ 虚拟化平台（VMware/VirtualBox）
- ✅ Kali Linux攻击机
- ✅ Windows 10测试机
- ✅ 简单Web靶机（DVWA）
- ✅ 网络连通性配置

**预计时间**：2-3小时

## 📋 前置准备

### 硬件检查

```bash
# Windows检查
# 打开任务管理器 → 性能 → 查看CPU和内存
最低要求：4核心CPU + 8GB内存
推荐配置：6核心CPU + 16GB内存

# 硬盘空间
至少100GB可用空间（建议SSD）
```

### BIOS设置（重要）

```bash
# 进入BIOS（启动时按F2/Del/F12）
# 启用虚拟化技术
Intel CPU: 启用 VT-x 和 VT-d
AMD CPU: 启用 AMD-V 和 SVM

# 保存并重启
```

### 下载镜像

| 软件/系统 | 下载地址 | 大小 | 备注 |
|----------|---------|------|------|
| VMware Workstation | https://www.vmware.com/products/workstation-pro.html | ~600MB | 推荐使用 |
| VirtualBox | https://www.virtualbox.org/wiki/Downloads | ~100MB | 免费选择 |
| Kali Linux | https://www.kali.org/get-kali/ | ~3GB | 选择VMware镜像 |
| Windows 10 ISO | https://www.microsoft.com/software-download/windows10 | ~5GB | 官方工具下载 |

## 🚀 分步实施

### 第一步：安装虚拟化软件（30分钟）

#### VMware Workstation安装

```powershell
# 1. 以管理员身份运行安装程序
右键点击安装文件 → 以管理员身份运行

# 2. 安装向导
- 点击"下一步"
- 接受许可协议
- 选择安装位置（建议SSD）
- 用户体验设置：取消勾选（无需加入体验计划）
- 快捷方式：保持默认
- 点击"安装"
- 等待安装完成

# 3. 输入许可证密钥
# 试用版可免费使用30天

# 4. 重启计算机
```

#### VirtualBox安装（免费方案）

```powershell
# 1. 运行安装程序

# 2. 安装向导
- 点击"Next"
- 选择安装位置
- 选择要安装的功能（保持默认）
- 网络接口警告：点击"Yes"（会临时断网）
- 开始安装
- 完成安装

# 3. 安装Extension Pack
- 下载 Extension Pack
- 打开VirtualBox
- 管理 → 全局设定 → 扩展
- 点击右侧"+"添加扩展包
- 确认安装

# 4. 重启计算机
```

### 第二步：创建Kali Linux虚拟机（45分钟）

#### 方案A：导入预构建镜像（推荐，快速）

```bash
# 1. 下载Kali VMware镜像
访问：https://www.kali.org/get-kali/
选择："Kali Linux VMware 64-Bit (7z)"
大小：约3GB

# 2. 解压镜像文件
使用7-Zip或WinRAR解压
解压到：D:\VirtualMachines\Kali-Linux\

# 3. 在VMware中打开
- 打开VMware Workstation
- 点击"打开虚拟机"
- 浏览到解压目录，选择 .vmx 文件
- 点击"打开"

# 4. 调整虚拟机设置
点击"编辑虚拟机设置"
- 内存：调整为 4GB（如果宿主机内存>=16GB，可分配更多）
- 处理器：2核心
- 硬盘：保持默认（已配置）
- 网络：
  - 网络适配器1：NAT模式（访问互联网）
  - 添加网络适配器2：Host-Only模式（内部通信）

# 5. 启动虚拟机
点击"开启此虚拟机"
# 首次启动可能需要几分钟

# 6. 登录系统
用户名：kali
密码：kali

# 7. 安装VMware Tools（如未自动安装）
虚拟机菜单 → 安装VMware Tools
# 在虚拟机中：
sudo cp /media/cdrom0/VMwareTools-*.tar.gz /tmp/
cd /tmp
sudo tar zxpf VMwareTools-*.tar.gz
cd vmware-tools-distrib
sudo ./vmware-install.pl
# 一路回车使用默认设置
```

#### 方案B：从ISO手动安装（适合定制化）

```bash
# 1. 创建新虚拟机
VMware → 创建新的虚拟机

# 2. 选择配置类型
选择"典型(推荐)"

# 3. 选择操作系统
选择"稍后安装操作系统"

# 4. 选择操作系统类型
- 客户机操作系统：Linux
- 版本：Debian 10.x 64位（Kali基于Debian）

# 5. 虚拟机名称和位置
名称：Kali-Linux
位置：D:\VirtualMachines\Kali-Linux\

# 6. 磁盘容量
最大磁盘大小：50GB
选择"将虚拟磁盘拆分成多个文件"

# 7. 自定义硬件
- 内存：4096MB（4GB）
- 处理器：2核心
- 新CD/DVD：选择ISO镜像文件（浏览到下载的Kali ISO）
- 网络适配器：NAT + Host-Only
- 点击"完成"

# 8. 启动虚拟机并安装
选择"Graphical Install"
# 按照安装向导操作：
- 选择语言：中文（简体）或 English
- 选择位置：中国
- 配置键盘：汉语或 American English
- 配置网络：主机名 kali
- 设置用户和密码：
  - 全名：kali
  - 用户名：kali
  - 密码：[你的密码]
- 磁盘分区：使用整个磁盘
- 完成安装
- 等待安装完成（约30分钟）
- 重启系统
```

#### Kali初始配置

```bash
# 1. 更新系统
sudo apt update
sudo apt upgrade -y

# 2. 安装常用工具
sudo apt install -y \
  git \
  curl \
  wget \
  vim \
  tmux \
  terminator \
  htop \
  net-tools \
  tree

# 3. 配置中文支持（可选）
sudo apt install -y locales
sudo dpkg-reconfigure locales
# 选择 zh_CN.UTF-8 UTF-8
# 空格选择，回车确认

# 4. 设置时区
sudo timedatectl set-timezone Asia/Shanghai

# 5. 配置静态IP（Host-Only网卡）
# 查看网络接口
ip addr

# 编辑网络配置
sudo vim /etc/network/interfaces

# 添加以下内容（eth1是Host-Only网卡，根据实际情况调整）
auto eth1
iface eth1 inet static
    address 192.168.10.100
    netmask 255.255.255.0
    network 192.168.10.0
    broadcast 192.168.10.255

# 重启网络服务
sudo systemctl restart networking

# 验证IP配置
ip addr show eth1

# 6. 创建基础快照
# VMware菜单：虚拟机 → 快照 → 拍摄快照
快照名称：Kali-Base-$(date +%Y%m%d)
描述：Kali Linux基础环境配置完成
```

### 第三步：创建Windows 10虚拟机（60分钟）

#### 创建虚拟机

```bash
# 1. 创建新虚拟机
VMware → 创建新的虚拟机 → 典型配置

# 2. 选择安装源
选择"稍后安装操作系统"

# 3. 选择操作系统
- 客户机操作系统：Microsoft Windows
- 版本：Windows 10 x64

# 4. 虚拟机名称和位置
名称：Windows10-Lab
位置：D:\VirtualMachines\Windows10-Lab\

# 5. 磁盘容量
最大磁盘大小：60GB
选择"将虚拟磁盘拆分成多个文件"

# 6. 自定义硬件
- 内存：4096MB（4GB）
- 处理器：2核心
- 新CD/DVD：选择Windows 10 ISO镜像
- 网络适配器：Host-Only模式
- 点击"完成"
```

#### 安装Windows 10

```bash
# 1. 启动虚拟机
点击"开启此虚拟机"

# 2. Windows安装向导
- 选择语言、时间、键盘：默认
- 点击"现在安装"
- 选择Windows版本：Windows 10 专业版
- 接受许可条款
- 选择安装类型：自定义：仅安装Windows（高级）
- 选择磁盘：驱动器 0 未分配的空间
- 点击"下一步"
- 等待安装完成（约30分钟）
- 设置区域和键盘布局
- 创建账户：
  - 用户名：TestUser
  - 密码：Test@123
- 完成设置

# 3. 安装VMware Tools
虚拟机菜单 → 安装VMware Tools
# 在Windows中：
- 打开"此电脑"
- 双击DVD驱动器
- 运行 setup64.exe
- 选择"典型安装"
- 完成安装并重启
```

#### Windows初始配置

```powershell
# 1. 配置静态IP
# 打开"控制面板" → "网络和Internet" → "网络连接"
# 右键"以太网" → "属性"
# 选择"Internet 协议版本 4 (TCP/IPv4)"
IP地址：192.168.10.101
子网掩码：255.255.255.0
默认网关：192.168.10.1
首选DNS：8.8.8.8

# 2. 关闭防火墙（仅限实验环境）
控制面板 → 系统和安全 → Windows Defender 防火墙
→ 启用或关闭Windows Defender 防火墙
→ 专用网络和公用网络都选择"关闭"

# 3. 启用远程桌面
此电脑（右键）→ 属性 → 远程桌面
→ 启用远程桌面

# 4. 创建测试用户
# 以管理员身份打开PowerShell
net user test Test@123 /add
net localgroup administrators test /add

# 5. 安装基础软件
# 使用浏览器下载并安装：
- Notepad++（文本编辑器）
- 7-Zip（解压缩）
- Chrome或Firefox（浏览器）
- Python 3.x（编程环境）

# 6. 创建快照
# VMware菜单：虚拟机 → 快照 → 拍摄快照
快照名称：Win10-Base-$(date +%Y%m%d)
描述：Windows 10基础环境配置完成
```

### 第四步：部署DVWA靶机（20分钟）

#### 方案A：Docker部署（最简单，推荐）

```bash
# 在Kali Linux中操作

# 1. 启动Docker服务
sudo systemctl start docker
sudo systemctl enable docker

# 2. 拉取并运行DVWA
sudo docker run --rm -it -p 80:80 vulnerables/web-dvwa

# 3. 访问DVWA
# 打开浏览器，访问：http://localhost
# 或从其他机器访问：http://192.168.10.100
# 默认账号：admin / password

# 4. 设置安全级别
# 登录后，点击"DVWA Security"
# 选择"low"级别（适合初学者）
# 点击"Submit"
```

#### 方案B：直接在虚拟机中部署

```bash
# 在Linux虚拟机中部署DVWA

# 1. 安装LAMP环境
sudo apt update
sudo apt install -y apache2 mysql-server php php-mysql php-gd

# 2. 启动服务
sudo systemctl start apache2
sudo systemctl start mysql
sudo systemctl enable apache2
sudo systemctl enable mysql

# 3. 配置MySQL
sudo mysql -u root
> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
> FLUSH PRIVILEGES;
> EXIT;

# 4. 下载DVWA
cd /var/www/html
sudo git clone https://github.com/digininja/DVWA.git

# 5. 配置DVWA
cd DVWA/config
sudo cp config.inc.php.dist config.inc.php
sudo vim config.inc.php
# 修改数据库配置：
$_DVWA[ 'db_server' ]   = '127.0.0.1';
$_DVWA[ 'db_database' ] = 'dvwa';
$_DVWA[ 'db_user' ]     = 'root';
$_DVWA[ 'db_password' ] = 'password';

# 6. 设置权限
sudo chmod -R 777 /var/www/html/DVWA/hackable/uploads/
sudo chmod -R 777 /var/www/html/DVWA/external/phpids/0.6/lib/IDS/tmp/phpids_log.txt
sudo chmod -R 777 /var/www/html/DVWA/config/

# 7. 修改PHP配置
sudo vim /etc/php/7.x/apache2/php.ini
# 修改以下设置：
allow_url_include = On
allow_url_fopen = On
safe_mode = Off

# 重启Apache
sudo systemctl restart apache2

# 8. 初始化数据库
# 浏览器访问：http://localhost/DVWA/setup.php
# 点击"Create/Reset Database"

# 9. 登录
# 访问：http://localhost/DVWA/
# 用户名：admin
# 密码：password
```

### 第五步：网络连通性测试（15分钟）

#### 网络配置验证

```bash
# 1. 检查VMware网络配置
# VMware：编辑 → 虚拟网络编辑器

# 查看网络配置
VMnet1 (Host-Only)：192.168.10.0/24
子网IP：192.168.10.0
子网掩码：255.255.255.0

# 确认DHCP已启用或禁用
# 建议：禁用DHCP，使用静态IP

# 2. 验证虚拟机网络适配器设置
# Kali Linux：
- 网络适配器1：NAT（用于访问互联网）
- 网络适配器2：Host-Only（用于内部通信）

# Windows 10：
- 网络适配器：Host-Only
```

#### 连通性测试

```bash
# 在Kali Linux中测试

# 1. 查看IP配置
ip addr

# 应该看到：
# eth0: NAT网络（通常是10.0.0.x或类似）
# eth1: Host-Only网络（192.168.10.100）

# 2. 测试到Windows的连通性
ping 192.168.10.101
# 应该能ping通

# 3. 测试到DVWA的连通性
curl http://localhost
# 或
curl http://192.168.10.100

# 4. 扫描Windows开放端口
nmap -sV 192.168.10.101
# 应该看到3389端口（RDP）开放

# 5. 测试远程桌面连接
rdesktop 192.168.10.101
# 或使用Remmina
remmina
# 连接到 192.168.10.101
# 用户名：test
# 密码：Test@123

# 6. 测试互联网访问
ping 8.8.8.8
ping www.baidu.com
```

#### Windows端测试

```powershell
# 在Windows 10中测试

# 1. 查看IP配置
ipconfig

# 应该看到：
# IPv4 地址：192.168.10.101
# 子网掩码：255.255.255.0

# 2. 测试到Kali的连通性
ping 192.168.10.100

# 3. 访问DVWA
# 打开浏览器，访问：http://192.168.10.100
# 或 http://192.168.10.100:80（如果使用Docker）
```

### 第六步：创建完整环境快照（5分钟）

```bash
# 为所有虚拟机创建快照

# 1. Kali Linux快照
VMware菜单：虚拟机 → 快照 → 拍摄快照
名称：Lab-Complete-$(date +%Y%m%d)
描述：基础实验环境搭建完成，包含DVWA

# 2. Windows 10快照
名称：Lab-Complete-$(date +%Y%m%d)
描述：基础实验环境搭建完成

# 3. 备份快照（可选）
# 关闭所有虚拟机
# 复制虚拟机文件夹到外部硬盘
# 例如：复制 D:\VirtualMachines\ 到 E:\Backup\
```

## 🎯 环境验证清单

完成以下检查确认环境搭建成功：

### 基础环境

- [ ] VMware/VirtualBox正常安装并运行
- [ ] Kali Linux虚拟机正常启动
- [ ] Windows 10虚拟机正常启动
- [ ] 两台虚拟机可以互相ping通

### 网络配置

- [ ] Kali可以访问互联网（ping 8.8.8.8）
- [ ] Kali和Windows在同一个Host-Only网络
- [ ] IP地址配置正确（Kali: 192.168.10.100, Windows: 192.168.10.101）

### 功能验证

- [ ] DVWA可以正常访问和登录
- [ ] 可以从Kali扫描Windows开放端口
- [ ] 可以从Kali远程桌面连接Windows
- [ ] Nmap、Burp Suite等工具可以正常使用

### 快照管理

- [ ] 创建了基础环境快照
- [ ] 快照命名清晰（包含日期）
- [ ] 测试了快照恢复功能

## 📚 下一步学习

环境搭建完成后，你可以：

1. **开始Web渗透学习**
   - 参考：[学习路径 - Web渗透测试](../../00-roadmap/learning-path.md)
   - 练习DVWA各个漏洞模块

2. **熟悉Kali工具**
   - Nmap端口扫描
   - Burp Suite Web测试
   - Metasploit渗透测试

3. **部署更多靶机**
   - 参考：[漏洞靶机推荐](../vulnerable-machines/)
   - 部署Metasploitable、bWAPP等

4. **参加CTF练习**
   - 参考：[CTF平台推荐](../ctf-platforms/)
   - 在TryHackMe完成入门路径

## 💡 常见问题

### Q1: Kali无法连接互联网？

```bash
# 检查NAT网络适配器
ip addr show eth0

# 如果没有IP，尝试重新获取
sudo dhclient eth0

# 检查DNS
cat /etc/resolv.conf
# 添加DNS服务器
sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf
```

### Q2: 虚拟机之间无法ping通？

```bash
# 检查Host-Only网络配置
# VMware：编辑 → 虚拟网络编辑器

# 确认两台虚拟机在同一子网
# Kali: ip addr show eth1
# Windows: ipconfig

# 检查防火墙
# Windows: 关闭防火墙
# Kali: sudo ufw disable

# 尝试重启网络服务
# Kali: sudo systemctl restart networking
```

### Q3: VMware提示虚拟化未启用？

```bash
# 重启计算机进入BIOS
# 找到虚拟化设置（通常在CPU或Security选项）
# Intel: 启用 VT-x
# AMD: 启用 SVM
# 保存并重启
```

### Q4: 虚拟机运行缓慢？

```bash
# 增加虚拟机内存和CPU分配
# 关闭不必要的服务和进程
# 使用SSD存储虚拟机文件
# 定期清理快照
```

---

**恭喜！基础实验环境搭建完成！** 🎉

现在开始你的网络安全学习之旅吧！参考[学习路径](../../00-roadmap/learning-path.md)继续深入学习。
