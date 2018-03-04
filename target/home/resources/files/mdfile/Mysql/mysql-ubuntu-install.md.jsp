<%@ page contentType="text/html; charset=UTF-8" %><pre><code class="language-bash">sudo apt-get install mysql-server
</code></pre>
<p>中间有个面板需要设置 root 的密码。</p>
<h2>创建一个应用所需的数据库和用户</h2>
<h3>允许远程访问</h3>
<p>首先需要设置 MySQL 绑定监听</p>
<pre><code class="language-bash">sudo vim /etc/mysql/my.cnf 
</code></pre>
<p>在 my.cnf 添加下面这一行，表示地址绑定：</p>
<pre><code class="language-conf">[mysqld]
bind-address=0.0.0.0
</code></pre>
<blockquote>
<p>注意上面的 <code>[mysqld]</code> 不能省，表示这是一个块
注意，绑定特定的 IP 会出问题，参考这个 <a href="http://forum.ubuntu.org.cn/viewtopic.php?f=44&amp;t=182760">mysql不能启动与bind-address的设置</a></p>
</blockquote>
<p>重新启动服务器</p>
<pre><code class="language-bash">sudo service mysql restart
</code></pre>
<h3>创建数据库并赋权限</h3>
<pre><code class="language-bash"># 使用如下命令以 root 方式进入 MySQL 控制板
mysql -uroot -p
</code></pre>
<pre><code class="language-sql">--- 指定 UTF8 字符集创建数据库
CREATE DATABASE `qs` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci
</code></pre>
<p>添加指定用户外部访问的权限</p>
<pre><code class="language-sql">GRANT ALL PRIVILEGES ON `qs`.* TO `qs_root`@'%' IDENTIFIED BY '654321';
GRANT ALL PRIVILEGES ON `qs`.* TO `qs_root`@localhost IDENTIFIED BY '654321';
</code></pre>
<p>上述表示，赋予来自 <code>&quot;%&quot;</code> 地址的用户 <code>qs_root</code> 在使用密码 <code>&quot;654321&quot;</code> 验证通过的情况下，操作数据库 <code>qs</code> 的 <code>*</code> 权限。
注意，这里的 <code>&quot;%&quot;</code> 表示任意地址，<code>*</code> 表示所有权限。</p>
<p>GRANT ALL PRIVILEGES ON <code>home</code>.* TO <code>home_root</code>@'%' IDENTIFIED BY 'OxawpNHapxXQ4ays';
GRANT ALL PRIVILEGES ON <code>home</code>.* TO <code>home_root</code>@localhost IDENTIFIED BY 'OxawpNHapxXQ4ays';</p>
