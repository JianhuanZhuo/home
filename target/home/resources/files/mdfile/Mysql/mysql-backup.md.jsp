<%@ page contentType="text/html; charset=UTF-8" %><p>数据库的备份，也有用来转移测试数据库到生产数据库。</p>
<!-- more -->
<h2>mysql 备份工具  mysqldump</h2>
<p>参考：</p>
<ol>
<li><a href="http://www.cnblogs.com/feichexia/p/MysqlDataBackup.html">MySQL数据备份之mysqldump使用</a></li>
<li><a href="https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html">4.5.4 mysqldump — A Database Backup Program</a></li>
</ol>
<h3>最简单的使用</h3>
<pre><code class="language-bash"># 安装完 MySQL 后，在命令行下使用如下命令，即可将 qs 数据库备份到文件 qs.dump 中
mysqldump -uroot -p qs &gt; qs.dump

# 恢复数据
mysql -uroot -p qs &lt; qs.dump
</code></pre>
