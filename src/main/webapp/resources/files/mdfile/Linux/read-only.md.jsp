<%@ page contentType="text/html; charset=UTF-8" %><p>一次机遇，Linux 服务器挂了，进行 Recovery 模式进行修复，发现文件系统全部只读，查找一阵子才解决。</p>
<!--more-->
<p>解决方式参考了<a href="https://askubuntu.com/questions/117950/how-do-i-change-file-system-in-recovery-mode-to-read-write-mode">SOF</a>，大致如下：</p>
<ol>
<li>关机；</li>
<li>按住 shift 键，进入 Recovery 模式，在 Grub 菜单下，选择 Root 菜单项；</li>
<li>键入命令<code>mount -o rw,remount /</code>，使文件系统可读写。</li>
</ol>
