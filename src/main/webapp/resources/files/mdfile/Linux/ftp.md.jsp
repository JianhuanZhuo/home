<%@ page contentType="text/html; charset=UTF-8" %><p>安装 FTP 服务</p>
<blockquote>
<p>sudo apt-get install vsftpd</p>
</blockquote>
<p>新建 FTP 工作目录</p>
<blockquote>
<p>sudo mkdir /home/ftp</p>
</blockquote>
<p>新建 FTP 用户 ftpboy 并为该用户设置密码</p>
<blockquote>
<p>sudo useradd -d /home/ftp -s /bin/bash ftpboy
passwd ftpname</p>
</blockquote>
<p>修改配置</p>
<blockquote>
<p>vi vsftpd.conf</p>
</blockquote>
<pre><code>// 查看版本，检查是否已安装 FTP 服务
vsftpd -version

// 启动服务
sudo service vsftpd start
</code></pre>
<p>常用配置：</p>
<pre><code class="language-bash"># 允许用户可写
write_enable=YES
</code></pre>
