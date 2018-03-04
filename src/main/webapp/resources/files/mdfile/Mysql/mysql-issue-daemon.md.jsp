<%@ page contentType="text/html; charset=UTF-8" %><p>今日在启用 Mysql 时出现如下错误：</p>
<blockquote>
<p>Another MySQL daemon already running with the same unix socket.</p>
</blockquote>
<p>可能是最近 MySQL 用得比较频繁，东西改来改去，出 BUG 了，在此做一次记录。</p>
<!--more-->
<h2>原因</h2>
<p>查找 MySQL 官方文档和 StakeOverflow 之后，究其原因是多个 MySQL 进程使用了同一个 socket。也就是之前的一个 MySQL 实例未正常关闭，导致其占用的 socket 未释放，故在第二个 MySQL 实例启动的时候，直接报错。</p>
<h2>解决</h2>
<p>有两种解决方式：</p>
<ol>
<li>重启服务器，已清除之前的僵尸进程释放 socket。</li>
<li>对欲启动 MySQL 指定其他的 socket 实例</li>
</ol>
<p>第一种比较简单，重启即可。
第二种，则需修改 MySQL 配置文件 <code>/etc/my.cnf</code>
如第五行，指定一个 sock。</p>
<pre><code class="language-bash"># Tom zhuo change this file to fix BUG of failing to start mysqld
# And origin file was backuped to my.cnf.bak in 2017/3/14  
[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
user=mysql
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
default-character-set=utf8
</code></pre>
