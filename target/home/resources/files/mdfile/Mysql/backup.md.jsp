<%@ page contentType="text/html; charset=UTF-8" %><h2>创建脚本</h2>
<pre><code class="language-bash"># 备份全部 mysql 数据
mysqldump -uroot -p123456 --all-databases  &gt; /data/dbdata/mysqlbak/`date +%Y%m%d`.sql
# 删除超过7天的备份数据，保留3个月里的 10号 20号 30号的备份数据；
find /data/dbdata/mysqlbak/ -mtime +7 -name '*[1-9].sql' -exec rm -rf {} \;
# 为节省空间，删除超过3个月的所有备份数据；
find /data/dbdata/mysqlbak/ -mtime +92 -name '*.sql' -exec rm -rf {} \;
</code></pre>
<p>如上的脚本中需要注意修改的有：</p>
<ol>
<li>用户名和密码</li>
<li>备份位置</li>
</ol>
<p>修改如下：
使用 <code>vim mysql_backup.sh</code> 命令编辑文件</p>
<pre><code class="language-bash"># 数据库根用户
user='root'
# 数据库根用户密码
psw='123456'
# 备份所在位置
folder='/home/ubuntu/backup/data'

# 每天5点备份mysql数据
mysqldump -u$user -p$psw --all-databases  &gt; $folder/`date +%Y%m%d`.sql
# 删除超过7天的备份数据，保留 10号 20号 30号的备份数据；
find $folder -mtime +7 -name '*[1-9].sql' -exec rm -rf {} \;
</code></pre>
<h2>定时执行</h2>
<p>首先记得将文件添加执行权限，如 <code>chmod +x mysql_backup.sh</code>，
使用 <code>crontab –e</code> 命令添加如下一条定时任务：</p>
<pre><code class="language-bash"># 每天5点执行
0 5 * * *  /home/ubuntu/backup/mysql_backup.sh
</code></pre>
<p>参考：<a href="http://blog.csdn.net/fo11ower/article/details/51697955">mysqldump 数据库备份定时任务</a></p>
<h2>数据恢复</h2>
<p>简单的整体恢复：</p>
<ol>
<li>
<p>进入 MySQL 命令行</p>
</li>
<li>
<p>使用命令 <code>source {foldler}\sqlfile.sql;</code></p>
	<link rel="canonical" href="https://v.qq.com/x/cover/bzc7xr95fot0p4e/p0025d0eqnm.html" />
</li>
</ol>
<p><embed src="https://imgcache.qq.com/tencentvideo_v1/playerv3/TPout.swf?max_age=86400&v=20161117&vid=p0025d0eqnm&auto=0" allowFullScreen="true" quality="high" width="480" height="400" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed></p>
<iframe frameborder="0" width="640" height="498" src="https://v.qq.com/iframe/player.html?vid=p0025d0eqnm&tiny=0&auto=0" allowfullscreen></iframe>
https://v.qq.com/x/cover/bzc7xr95fot0p4e.html
<p><a href="https://v.qq.com/x/page/f0502ix7r4r.html">https://v.qq.com/x/page/f0502ix7r4r.html</a></p>
<pre><code>&lt;link rel=&quot;canonical&quot; href=&quot;https://v.qq.com/x/page/undefined.html&quot; /&gt;
</code></pre>
<p><embed src="https://imgcache.qq.com/tencentvideo_v1/playerv3/TPout.swf?max_age=86400&v=20161117&vid=f0502ix7r4r&auto=0" allowFullScreen="true" quality="high" width="480" height="400" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed></p>
<iframe frameborder="0" width="640" height="498" src="https://v.qq.com/iframe/player.html?vid=f0502ix7r4r&tiny=0&auto=0" allowfullscreen></iframe>
