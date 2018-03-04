<%@ page contentType="text/html; charset=UTF-8" %><p><code>source</code> 命令用过很多次，但没了解这个命令，一次偶然看到这个，在此做个记录。</p>
<!--more-->
<p>source 命令用法：</p>
<pre><code class="language-bash">source FileName
</code></pre>
<p>作用:在当前bash环境下读取并执行FileName中的命令。
注：该命令通常用命令“.”来替代。
如：<code>source .bash_rc</code> 与 <code>. .bash_rc</code> 是等效的。</p>
<p>注意：source命令与shell scripts的区别是，
<strong>source在当前bash环境下执行命令，而scripts是启动一个子shell来执行命令</strong>。这样如果把设置环境变量（或alias等等）的命令写进scripts中，就只会影响子shell,无法改变当前的BASH,所以通过文件（命令列）设置环境变量时，要用source 命令。</p>
