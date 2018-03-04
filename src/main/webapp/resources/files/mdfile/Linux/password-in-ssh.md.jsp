<%@ page contentType="text/html; charset=UTF-8" %><p>在批量远程其他服务器时，如果使用超级管理员权限，则需要每次都为每个服务器输入密码，这相当麻烦。如下脚本：</p>
<pre><code class="language-bash">#!\bin\bash
for((i=101;i&lt;108;i++))
{
	ssh -t 192.168.1.$i sudo sudo apt-get update
}
</code></pre>
<p>会在每次登陆目标 <code>ssh</code> 时输入密码。</p>
<!--more-->
<p>解决方式如下：</p>
<h2>管道</h2>
<p>上一个命令的 <code>stdout</code> 接到下一个命令的 <code>stdin</code></p>
<pre><code class="language-bash">#!/bin/bash
for((i=101;i&lt;108;i++))
{
	echo [password] | ssh -S -t 192.168.1.$i sudo sudo apt-get update
}
</code></pre>
<h2>重定向</h2>
<pre><code class="language-bash">#!/bin/bash
for((i=101;i&lt;108;i++))
{
echo [password] | ssh -S -t 192.168.1.$i sudo sudo apt-get update&lt;&lt; EOF 
[password]
EOF
}
</code></pre>
<h2>-s 参数</h2>
<p>需要注意的是，如下 <code>man sudo</code> 得到的提示中知道：加上-S参数sudo才会从标准输入中读取密码，不加-S参数以上命令将起不到作用</p>
<blockquote>
<p>Write the prompt to the standard error and read the password from the standard input instead of using the terminal device. The password must be followed by a newline character.</p>
</blockquote>
