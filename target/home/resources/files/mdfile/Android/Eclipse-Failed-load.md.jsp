<%@ page contentType="text/html; charset=UTF-8" %><h3>启动Eclipse出现Failed to load</h3>
<p>启动 Eclipse 弹出“Failed to load the JNI shared library jvm.dll”错误。
原因很简单，找不到<code>jvm.dll</code>，但jre下确实存在这个动态链接库的。</p>
<p>（1）重新安装eclipse的版本相匹配的jre或者jdk并配置好环境变量。
（2）copy一个jvm.dll放在该目录下。</p>
<h3>wifi调试安卓程序</h3>
<ol>
<li>root手机</li>
<li>下载终端模拟器应用，如：terminal emulater</li>
<li>打开终端，输入<code>su</code>以期获得超级权限</li>
<li>若权限获取成功，则终端中的用户名会变为root</li>
<li>输入<code>setprop service.adb.tcp.port 5555</code>，设置监听的端口</li>
<li>输入<code>stop adbd</code>，关闭adbd</li>
<li>输入<code>start adbd</code>，重新启动adbd</li>
<li>在电脑端运行打开\platform-tools\文件夹、运行<code>adb connect IP:5555</code>，这里的IP是手机的IP，可以在wifi设置中查看</li>
<li>若出现类似<code>connected to 192.168.1.169:5555</code>提示，则说明连接成功，这样可以在设备中找到这个手机了。</li>
<li>断开连接使用<code>adb disconnect IP:5555</code>命令</li>
</ol>
