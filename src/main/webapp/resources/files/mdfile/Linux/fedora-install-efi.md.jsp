<%@ page contentType="text/html; charset=UTF-8" %><p>安装 Fedora 时，出现 <code>EFI partition not valid</code> 解决方法的笔记</p>
<!--more-->
<h2>解决方法1：</h2>
<p>简单的解决方法：不要装 Win10 了，装个 Win7 吧。</p>
<h2>解决方法2：</h2>
<p>在选择磁盘后，点击左下角的 summer，取消磁盘作为引导盘的选项，即不会出现 EFI 分区无效的情况，
然后完成后，再选择一次，将磁盘添加为引导盘，即可。</p>
<p>参考：<a href="https://unix.stackexchange.com/questions/279938/installing-fedora-23-alongside-windows-10-efi-partition-not-valid">Installing Fedora 23 alongside Windows 10; EFI partition “not valid”</a></p>
