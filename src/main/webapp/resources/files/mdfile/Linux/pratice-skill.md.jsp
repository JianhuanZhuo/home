<%@ page contentType="text/html; charset=UTF-8" %><p>以前练 Linux 还算比较熟悉，现在有段时间没玩有些命令也生疏了，这里篇作为 Linux 使用技巧累积的记录，后续继续更新。</p>
<!--more-->
<h3>查看命令所在位置</h3>
<p>使用 <code>whereis</code> 命令</p>
<pre><code class="language-bash">tom@S1:~/bat$ whereis java
java: /usr/share/java
</code></pre>
<h3>查看端口</h3>
<pre><code class="language-bash">netstat -tunalp | grep LISTEN
</code></pre>
<h3>脱离终端运行</h3>
<p>使用 <code>nohup</code> (<strong>no</strong> <strong>h</strong>ang <strong>up</strong>)命令，如下是使用 <code>wget</code> 下载某个 MP4 文件，时间过长。所以可以考虑使用 <code>nohup</code> 让终端关闭还可以继续后台下载。</p>
<blockquote>
<p>nohup wget <a href="http://xx.mp4">http://xx.mp4</a> &amp;</p>
</blockquote>
