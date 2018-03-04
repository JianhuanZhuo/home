<%@ page contentType="text/html; charset=UTF-8" %><p>呃，今天单位给的电脑需要做保密检查，然而那个软件是 Windows 下才能用的，而这电脑是 Ubuntu 的，所以没办法只好装个 Windows 给它扫描，没想到把引导搞挂了。</p>
<!--more-->
<p>参考：
<a href="https://lukeplant.me.uk/blog/posts/sharing-internet-connection-to-chroot/">Sharing internet connection to chroot</a>
<a href="https://ask.fedoraproject.org/en/question/80362/how-do-i-update-grub-in-fedora-23/">How do I update grub in Fedora 23?</a>
<a href="http://tieba.baidu.com/p/2000120780">sudo：update-grub：找不到命令 这要怎么办？</a></p>
<h2>修复至 Linux 启动</h2>
<p>找了个 Linux Live 盘，开机启动。</p>
<pre><code>// 切换至管理员权限模式
sudo -i

// 挂载，先挂载根分区再挂载引导分区
// sda1 是 /boot 分区
// fedora-root 是 / 根分区
// 使用 fdsik -l 查看即可
mount /dev/mapper/fedora-root /mnt

// 绑定，否会出现某些问题
mount --bind /dev /mnt/dev
mount --bind /proc /mnt/proc
mount --bind /sys /mnt/sys
mount --bind /run /mnt/run

// 切换根目录
chroot /mnt

// 安装
sudo grub-install /dev/sda
</code></pre>
<h2>在 Linux 下修复 Windows 引导</h2>
<p>Ubuntu 貌似为 <code>update-grub</code></p>
<p>Fedora 下为 <code>grub2-mkconfig</code> 命令，后带参数使得将更新到的配置写入到 <code>.cfg</code> 文件中：</p>
<pre><code>grub2-mkconfig -o /boot/grub2/grub.cfg
grub2-install /dev/sda
</code></pre>
<p>之后重启即可。</p>
<h2>常见问题</h2>
<p>安装有 Windows 和 Ubuntu 双系统的电脑，由 Ubuntu 引导，引导菜单中</p>
<p><a href="https://askubuntu.com/questions/493826/grub-rescue-problem-after-deleting-ubuntu-partition">GRUB rescue problem after deleting Ubuntu partition!</a></p>
<h2>使用修复工具修复 windows</h2>
<pre><code class="language-bash">BOOTREC /SCANOS
BOOTREC /FIXMBR
BOOTREC /FIXBOOT
BOOTREC /REBUILDBCD
</code></pre>
<p>参考：<a href="http://jingyan.baidu.com/article/1876c8526112f5890b137638.html">如何修复Windows 10引导记录损坏故障</a></p>
