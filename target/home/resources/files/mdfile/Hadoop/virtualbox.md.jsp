<%@ page contentType="text/html; charset=UTF-8" %><p>安装虚拟机</p>
<p>使用 VirtualManager 在命令行下对虚拟机进行管理
在此命令行模式下可以支持所有图形界面下提供的所有功能，还提供了图形界面不支持的功能。</p>
<p>VBoxManager 的命令都是子命令的形式。如果要指定一个虚拟机执行命令，可以指定其虚拟机名，或指定 UUID
在帮助文档中是<a href="https://www.virtualbox.org/manual/ch08.html">8. VBoxManage</a>章节。</p>
<p>这里需要注意的是，如果你是使用管理员身份（即使用<code>sudo</code>）创建虚拟机，则虚拟机是创建在 /root 目录下的，而该
目录下相关操作都需要以管理员身份进行。</p>
<p>使用<code>vboxmanage --version</code>命令检查是否安装并获得已安装的版本
启动虚拟机</p>
<pre><code>// 使用虚拟机名启动
vboxmanage startvm &quot;windows XP&quot;

// 使用 UUID 启动
vboxmanage startvm 63242123-sda12-sw-123-22

// 获取全部虚拟机的虚拟机名、UUID 和设置。
vboxmanage list vms
</code></pre>
<p>DEBUG1:安装遇到这类错误：</p>
<blockquote>
<p>WARNING: The vboxdrv kernel module is not loaded. Either there is no module available for the current kernel (4.7.1-1-ARCH) or it failed to load. Please recompile the kernel module and install it by sudo
/sbin/vboxconfig
You will not be able to start VMs until this problem is fixed.</p>
</blockquote>
<p>解决方法：<a href="https://askubuntu.com/questions/705720/virtualbox-kernel-driver-not-installed-error-despite-running-sbin-vboxconfig">VirtualBox “Kernel driver not installed” error despite running /sbin/vboxconfig</a></p>
<blockquote>
<p>sudo /usr/lib/virtualbox/vboxdrv setup</p>
</blockquote>
<p>DEBUG2:这类错误</p>
<blockquote>
<p>Cannot change owner vboxusers for device /dev/vboxdrv</p>
</blockquote>
<p>解决方法：<a href="https://ubuntuforums.org/archive/index.php/t-790303.html">[SOLVED]Vbox error!</a></p>
<blockquote>
<p>You can probably work around this, by creating the group manually:
# Create group:
sudo groupadd vboxusers
# Add user:
sudo adduser your_username vboxusers
# Then restart the module:
sudo ./vboxdrv setup</p>
</blockquote>
<p>DEBUG3:无法直接键入<code>virtualbox</code>命令打开：</p>
<blockquote>
<p>Effective UID is not root (euid=1000 egid=1000 uid=1000 gid=1000) (rc=-10)Please try reinstalling VirtualBox.
where: SUPR3HardenedMain what: 2
VERR_PERMISSION_DENIED (-10) - Permission denied.</p>
</blockquote>
<p>解决方法：<a href="https://forums.virtualbox.org/viewtopic.php?t=11154">Effective UID is not root</a>
查看<code>/usr/lib/virtualbox/VirtualBox</code>状态为</p>
<blockquote>
<p>-rwxr-x--- 1 root root   35368 4月  15 01:50 VirtualBox</p>
</blockquote>
<p>键入命令，将其修改</p>
<blockquote>
<p>sudo chmod 4711 /usr/lib/virtualbox/VirtualBox
-rws--x--x 1 root root   35368 4月  15 02:50 VirtualBox</p>
</blockquote>
<p>DEBUG4:启动时出现这类错误：</p>
<blockquote>
<p>vt-x is disabled in the bios for all cpu modes</p>
</blockquote>
<p>解决方法：</p>
<blockquote>
<ol>
<li>可能是设置的内存太小，调大内存</li>
<li>打开 Settings -&gt; System -&gt; 勾选 Enable PAE/NX</li>
<li>上述都不行，重启电脑，并在 BISO 界面勾选 CPU虚拟化功能，详参考<a href="https://support.lenovo.com/us/en/solutions/ht500006">Technology (VT-X) in Lenovo</a>。</li>
</ol>
</blockquote>
<h2>基本操作</h2>
<h3>创建虚拟机</h3>
<p>使用 <code>createvm</code> 命令，其后带参数如下：</p>
<table>
<thead>
<tr><th>参数</th><th>说明</th><th>必须</th></tr>
</thead>
<tbody>
<tr><td>--name &lt;name&gt;</td><td>虚拟机名标识，该标识将用于创建虚拟机文件</td><td>必须</td></tr>
<tr><td>--basefolder &lt;path&gt;</td><td>指定虚拟机文件所在的路径，重命名虚拟机不改变该路径</td><td>可选</td></tr>
<tr><td>--group &lt;group&gt;</td><td>添加到指定组中，组名以 / 开头的，且可嵌套</td><td>可选，默认添加到 / 组中</td></tr>
<tr><td>--ostype &lt;ostype&gt;</td><td>指定虚拟机要运行的操作系统类型，可使用<code>vboxmanage list ostypes</code>查看全部可用的参数值</td><td>可选</td></tr>
<tr><td>--uuid &lt;uuid&gt;</td><td>指定虚拟机 uuid，必须唯一</td><td>可选，系统默认自行生成</td></tr>
</tbody>
</table>
<p>需要注意的是，这个命令仅创建一个 XML 虚拟机文件，添加<code>--register</code>进行注册。</p>
<p>简单的使用示例：</p>
<pre><code>$ VBoxManage createvm --name &quot;SUSE 10.2&quot; --register
VirtualBox Command Line Management Interface Version 5.0.8
(C) 2005-2015 Oracle Corporation
All rights reserved.
Virtual machine ’SUSE 10.2’ is created.
UUID: c89fc351-8ec6-4f02-a048-57f4d25288e5
Settings file: ’/home/username/.config/VirtualBox/Machines/SUSE 10.2/SUSE 10.2.xml’
</code></pre>
<h3>VBOX 配置与运行信息查看</h3>
<p>查看 <code>vboxmanage list</code> 可以查看相关的配置信息和运行信息，其后参数如下：</p>
<p>|参数|说明|
|--|--|
|vms|列出所有虚拟机，指定 --long 或 -l 为虚拟机显示更为详细的信息|
|runningvms|列出正在运行的虚拟机|
|ostypes|列出 VBOX 支持的所有操作系统|
|intnets|现在当前的网络状态信息|
|bridgedifs|桥接模式网络信息|
|hostonlyifs|仅主机模式网络信息|
|natets|NAT 模式网络信息|
|dhcpservers|DHCP 模式网络信息|
|hostinfo|主机系统的信息，你当前电脑（不是虚拟机）的信息，包括主机时间、CPU、内存、操作系统版本|
|hostcpudids|主机 CPU 参数|
|hddbackends|列出所有 VBOX 支持的磁盘格式|
|usbhost|列出已挂载主机的 USB 设备信息，建议带上 sudo，以管理员身份运行该命令|
|usbfilters|列出所有已注册的 USB 过滤器|
|systemproperties|显示 VBOX 的全局配置信息|
|extpacks|显示已安装的全部扩展包|</p>
<p>这里的参数可能由于 VBOX 版本的不同而不同。</p>
<h3>虚拟机详细信息</h3>
<p>使用 <code>showvminfo</code> 查看虚拟机详细信息</p>
<blockquote>
<p>vboxmanage showvminfo &quot;SUSE 10.2&quot;</p>
</blockquote>
<p>对于列出的配置信息我们可以使用<code>vboxmanage modifyvm</code>命令进行修改，一个简单示例，修改指定虚拟机的内存为 512MB 配置</p>
<pre><code>vboxmanage modifyvm &quot;SUSE 10.2&quot; --momory 512
</code></pre>
<p>对于命令其后的参数可以参考 <a href="https://www.virtualbox.org/manual/ch08.html#vboxmanage-modifyvm">8.8. VBoxManage modifyvm</a> 章节。
这里列出几个常用的参数：</p>
<p>|参数|说明|
|--|--|
|--name &lt;name&gt;|虚拟机名|
|--memory &lt;memorysize&gt;|设置 RAM 内存大小，以 MB 为单位|
|--cpuhotplug on|off|设置 CPU 是否配置为热拔插模式，启用该模式，虚拟机的 CPU 将允许在运行时增删|
|--cpus &lt;cpucount&gt;|设置 CPU 的个数，如果 --cpuhotplug 设置为 on，则该参数表示最大 CPU 数|
|--boot&lt;1-4&gt; none|floppy|dvd|disk|net| 指定启动顺序，比如<code>vboxmanage modifyvm &quot;SUSE 10.2&quot; --boot1 disk</code>为名为<code>SUSE 10.2</code>的虚拟机设置第一启动顺序为硬盘|
|--nic&lt;1-N&gt; none|null|nat|natnetwork|bridged|intnet|hostonly|generic|在指定顺序设置虚拟网卡，<code>none</code>为不设置、<code>null</code>为不连接、<code>nat</code>为地址转换 NAT、<code>natnetwork</code>为新地址转换引擎、<code>bridged</code>为桥接模式、<code>intnet</code>为内部网络模式、<code>hostonly</code>为仅主机模式和<code>generic</code>子模式|
|--nictype&lt;1-N&gt; Am79C970A|Am79C973|82540EM|82543GC|82545EM|virtio|为特定顺序的虚拟网卡指定实现硬件类型|
|--bridgeadapter&lt;1-N&gt; none|&lt;devicename&gt;|如果该次序的网卡模式为桥接模式<code>bridged</code>，则指定虚拟网卡要使用哪个桥接接口，详见<a href="https://www.virtualbox.org/manual/ch06.html#network_bridged">6.5章节</a>，使用<code>vboxmanage list bridgedifs</code> 获得全部可用的桥接网络信息|
|--hostonlyadapter&lt;1-N&gt; none|&lt;devicename&gt;|如果该次序的网卡模式为仅主机模式<code>hostonly</code>，则指定虚拟网卡要使用哪个仅主机接口，详见<a href="https://www.virtualbox.org/manual/ch06.html#network_hostonly">6.7章节</a>|
|--intnet&lt;1-N&gt; network |如果该次序的网卡模式为内部模式<code>internal</code>，则为虚拟网卡指定内部网|
|--nat-network&lt;1-N&gt; &lt;network name&gt;|如果该次序的网卡模式为新地址转换网络模式<code>natnetwork</code>，则为虚拟网卡指定转换网络|
|--macaddress&lt;1-N&gt; auto|&lt;mac&gt;|为指定适配器设定 MAC 地址|
|--vrde on|off|指定是否启用 VRDE 远程桌面服务|
|--vrdeport default|&lt;ports&gt;|指定虚拟机的远程服务所绑定的端口，默认为 3389|</p>
<p>如上仅修改指定虚拟机的配置信息，其他更为详细的信息可以使用其他命令完成。</p>
<h3>启动虚拟机</h3>
<p>你可以使用<code>vboxmanage startvm</code>启动虚拟机，它后带虚拟机名和一个<code>--type</code>参数，可用参数值及其意义如下：</p>
<ol>
<li>gui，默认启动参数</li>
<li>sdl，带迷你 GUI 窗口，即有限制的 GUI 模式</li>
<li>headless，不使用 GUI 启动虚拟机，即后台启动虚拟机</li>
<li>separate，类似于 headless 模式，实验室功能。</li>
</ol>
<p>一个简单的示例：</p>
<pre><code>vboxmanage startvm &quot;SUSE 10.2&quot;
</code></pre>
<p>后台方式启动虚拟机，还可以直接使用 <code>vboxheadless -s &quot;SUSE 10.2&quot;</code>命令启动。
如果此时发生如下错误，可以参考上面的 DEBUG3，改正文件<code>/usr/lib/virtualbox/VirtualHeadless</code>的访问模式。</p>
<blockquote>
<p>Effective UID is not root</p>
</blockquote>
<p>启动虚拟机后无法连接至网络，使用<code>vboxmanage showvminfo</code>对虚拟机配置进行详细的查看，其中 NIC 网卡选项中的 <code>Cable Connected</code>选项应该是 <code>on</code> 否则无法连接网络。对于这个情况，可以使用<code>vboxmanage mofidyvm t7 --cableconnected1 on</code>启动网络连接。</p>
<h3>克隆虚拟机</h3>
<p>对于已经配置好的虚拟机，我们可以使用<code>vboxmanage clonevm</code>命令进行克隆扩展，避免重复的配置。</p>
<p>这里有几点需要注意的参数如下：</p>
<ol>
<li>--name <name> 重命名克隆虚拟机为name，若不指定则会在被克隆的虚拟机后加一个&quot;空格+Clone&quot;</li>
<li>--groups <group> 指定克隆虚拟机加入到指定的组，默认加入到 / 根组</li>
<li>--basefolder <basefolder> 指定克隆虚拟机文件至 basefolder 路径</li>
<li>--register 主动注册虚拟机，不注册无法使用</li>
</ol>
<p>一个克隆的简单示例如下：</p>
<pre><code>vboxmanage clonevm k4 --name k5 --register
</code></pre>
<p>在克隆虚拟机后，如果出现网卡无法正确读取或 IP 获取失败的情况，解决方法如下：
<a href="https://forums.virtualbox.org/viewtopic.php?f=3&amp;t=24383">No networking on copied/imported guests?</a>
简单粗暴的删除目录<code>/etc/udev/rules.d/</code>下所有规则文件，并重启即可</p>
<h3>添加存储介质</h3>
<p>为了在虚拟机中添加介质，你需要先添加一个媒体控制器，可以使用<code>vboxmanage storagectl</code>命令增删改控制器。
具体语法如下：</p>
<pre><code>vboxmanage storagectl &lt;uuid|vmname&gt; --name &lt;name&gt;
</code></pre>
<p>其后还需添加操作参数，常见参数如下：</p>
<p>|参数|说明|
|--|--|
|--add ide|sata|scsi|floppy|sas|usb|prie|添加指定类型的控制器|
|--rename &lt;name&gt;|修改控制器名|
|--remove|删除该控制器|</p>
<p>在一个虚拟机中<strong>一种控制器类型仅能创建一个控制器实例</strong>。</p>
<p>使用<code>vboxmanage createhd</code>命令创建媒体设备，如硬盘、DVD读写器和软盘。</p>
<p>如在我<code>/home/tom/result</code>目录下创建一个 VDI 格式的 1G 硬盘，其文件名为 d2.VDI，则可以使用如下命令：</p>
<pre><code>vboxmanage createhd disk --filename /home/tom/result/d2 --size 1024
</code></pre>
<p>在控制器下挂载一个硬盘，</p>
<p>在<code>sata</code>控制器下创建一个 DVD 驱动并挂载一个 Ubuntu ISO 镜像</p>
<pre><code>vboxmanage storageattach SU --storagectl sata --port 0 --type dvddrive --medium /home/tom/Downloads/ubuntu-12.04.5-server-amd64.iso
</code></pre>
<h3>导出导入虚拟机</h3>
<p>导出指定虚拟机很简单，仅一条命令需即可</p>
<pre><code>vboxmanage export t2 -o clone.ovf
</code></pre>
<p>上述命令将 t2 虚拟机导出到当前目录下的 clone.ovf 文件，其中该命令还会产生一个 clone-disk001.vmdk 磁盘文件。</p>
<p>导入也很简单，命令如下：</p>
<pre><code>VBoxManage import WindowsXp.ovf
</code></pre>
<p>需要注意的是<code>import</code>后带的是 *.ovf 格式的虚拟机文件，它的磁盘文件应该放在同目录下，否则会找不到。</p>
<p>如果导入的是 *ova 格式，则是将磁盘文件和虚拟机文件整合在一起，这个格式会比较方便一些。</p>
<p>在导入之后需要修改的几个参数可能如下：</p>
<pre><code>vboxmanage modifyvm t4Clone --name t5 --vrde on --vrdeport 5304 --bridgeadapter1 eth0
</code></pre>
<h3>安装虚拟机扩展</h3>
<pre><code>VBoxManage extpack install [--replace] &lt;tarball&gt;
VBoxManage extpack uninstall [--force] &lt;name&gt;
</code></pre>
<p>需要注意的是扩展的版本和虚拟机软件的版本一定要对应得上。否则可能会报如下错误：</p>
<blockquote>
<p>Failed to load the main module ('/usr/lib/virtualbox/ExtensionPacks/Oracle_VM_VirtualBox_Extension_Pack/linux.amd64/VBoxPuelMain.so'): VERR_FILE_NOT_FOUND - /usr/lib/virtualbox/ExtensionPacks/Oracle_VM_VirtualBox_Extension_Pack/linux.amd64/VBoxPuelMain.so: undefined symbol: RTLogRelGetDefaultInstanceEx.</p>
</blockquote>
<p>一个安装示例：</p>
<pre><code>[root@myheart-5 ~]# sudo vboxmanage extpack install --replace  Oracle_VM_VirtualBox_Extension_Pack-4.3.26-98988a.vbox-extpack 
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
Successfully installed &quot;Oracle VM VirtualBox Extension Pack&quot;.
[root@myheart-5 ~]# vboxmanage list extpacks
Extension Packs: 1
Pack no. 0:   Oracle VM VirtualBox Extension Pack
Version:      4.3.26
Revision:     98988
Edition:      
Description:  USB 2.0 Host Controller, Host Webcam, VirtualBox RDP, PXE ROM with E1000 support.
VRDE Module:  VBoxVRDP
Usable:       true 
Why unusable: 
</code></pre>
<h3>配置操作系统</h3>
<p>使用 Xshell 的群发功能，输入：</p>
<pre><code>cat ~/.ssh/id_rsa.pub | (ssh user@host &quot;cat &gt;&gt; ~/.ssh/authorized_keys&quot;)
</code></pre>
<p>获得全部的虚拟的 key，再用如下的脚本将 key 分发到全部虚拟机中：</p>
<pre><code>#!/bin/bash
for((i=1;i&lt;12;i++)){
	echo $i &quot;--&gt;&quot; &amp;&amp; scp $1 tom@k$i:$1
}
</code></pre>
<h3>强制关闭</h3>
<p>如果需要对虚拟机进行管理，可以使用<code>vboxmanage controlvm</code>命令，其后可带参数及意义如下：</p>
<p>|参数|说明|
|--|--|
|pause|暂停虚拟机（即挂起），使其处于假死状态|
|resume|从挂起状态恢复虚拟机|
|reset|重启虚拟机|
|poweroff|关闭虚拟机，断开电源|</p>
<h3>Virtualbox 虚拟机 inaccessible 问题解决方法</h3>
<p>参考：<a href="http://blog.csdn.net/achang21/article/details/48623995">Virtualbox 虚拟机 inaccessible 问题解决方法</a>
解决方法：</p>
<blockquote>
<p>cd /home/vnc/VirtualBoxVMs/k4/
ls // 发现发现有个文件 k4.vbox-prev文件
mv k4.vbox-prev k4.vbox</p>
</blockquote>
<h3>虚拟机一直挂起的问题</h3>
<p>一次服务器宕机后，虚拟机就直接一直躺着不起了，状态如下</p>
<blockquote>
<p>$ VBoxManage showvminfo &quot;k0&quot; | grep State
State:           paused (since 2016-08-26T21:56:48.212000000)</p>
</blockquote>
<p>尝试使用 <code>vboxmanage controlvm k0 resume</code> 无效</p>
<p>使用 <code>vboxmanage controlvm k0 reset</code> 报如下错：</p>
<blockquote>
<p>[!] FAILED calling console-&gt;Reset() at line 5558!
[!] Primary RC  = NS_ERROR_FAILURE (0x80004005) - Operation failed
[!] Full error info present: true , basic error info present: true
[!] Result Code = NS_ERROR_FAILURE (0x80004005) - Operation failed
[!] Text        = Cannot reset the machine as it is not running (machine state: 5)
[!] Component   = Console, Interface: IConsole, {d5a1cbda-f5d7-4824-9afe-d640c94c7dcf}
[!] Callee      = IConsole, {d5a1cbda-f5d7-4824-9afe-d640c94c7dcf}</p>
</blockquote>
<p>参考了 <a href="https://forums.virtualbox.org/viewtopic.php?f=8&amp;t=8963">Cannot resume from pause state</a>
认为可能是物理配置不足，使用<code>df -kh</code>查看了下，直接呵呵了</p>
<blockquote>
<p>[tom@myheart-5 ~]$ df -kh
Filesystem                       Size  Used Avail Use% Mounted on
/dev/mapper/vg_myheart4-lv_root   50G   46G  1.6G  97% /
tmpfs                             32G   84K   32G   1% /dev/shm
/dev/sda1                        485M   40M  420M   9% /boot
/dev/mapper/vg_myheart4-lv_home 1020G 1020G     0 100% /home
cm_processes                      32G     0   32G   0% /var/run/cloudera-scm-agent/process</p>
</blockquote>
<p>磁盘被塞爆了。清掉一些文件再启动即可。</p>
<h2>创建 USB 虚拟文件</h2>
<p>VBoxManage internalcommands createrawvmdk -filename &quot;F:\VirtualBox VMs\usb.vmdk&quot; -rawdisk \.\PhysicalDrive2
参考
<a href="http://lifehacker.com/how-to-boot-from-a-usb-drive-in-virtualbox-1648868568">​How to Boot from a USB Drive in VirtualBox</a>
<a href="http://jingyan.baidu.com/article/48a42057f511a8a924250403.html">VirtualBox怎么设置从u盘启动，虚拟机从U盘启动</a></p>
