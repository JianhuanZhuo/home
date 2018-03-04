<%@ page contentType="text/html; charset=UTF-8" %><p>前几天接手两台服务器，服务器上 MySQL 密码被修改，问前任密码，却被告知忘记了。一波查询之后，重置了 MySQL 密码。特此做个记录。</p>
<!--more-->
<h2>步骤</h2>
<ol>
<li>停止当前服务，运行 <code>service mysqld stop</code></li>
<li>使用安全模式启动 MySQL，运行 <code>/usr/local/mysql/bin/mysqld_safe --skip-grant-tables &amp;</code></li>
<li>按如下步骤重置</li>
</ol>
<pre><code class="language-bash">[root@myheart-5 ~]# /usr/bin/mysqld_safe --skip-grant-tables&amp;
[2] 28947
[root@myheart-5 ~]# 170314 18:38:16 mysqld_safe Logging to '/var/log/mysqld.log'.
170314 18:38:16 mysqld_safe A mysqld process already exists

[2]-  Exit 1                  /usr/bin/mysqld_safe --skip-grant-tables
[root@myheart-5 ~]# 
[root@myheart-5 ~]# bg
[1]+ /usr/bin/mysqld_safe --skip-grant-tables &amp;
[root@myheart-5 ~]# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 1
Server version: 5.1.71 Source distribution

Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql&gt; use mysql
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql&gt; update user set password=password(&quot;root&quot;) where user=&quot;root&quot;;
Query OK, 4 rows affected (0.00 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql&gt; flush privileges; 
Query OK, 0 rows affected (0.00 sec)

mysql&gt; quit();
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'quit()' at line 1
mysql&gt; quit
Bye
</code></pre>
