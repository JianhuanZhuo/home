<%@ page contentType="text/html; charset=UTF-8" %><p>由于工作需要在 MySQL 数据库上进行定时清理某些不在使用的表格等数据，故查阅了 MySQL 事件调度的用法，特此记录。</p>
<!--more-->
<h2>开启调度功能</h2>
<pre><code class="language-bash">mysql&gt; SHOW VARIABLES LIKE 'event_scheduler';
+-----------------+-------+
| Variable_name   | Value |
+-----------------+-------+
| event_scheduler | OFF   |
+-----------------+-------+
1 row in set

mysql&gt; SET GLOBAL event_scheduler = ON;
Query OK, 0 rows affected

mysql&gt; SHOW VARIABLES LIKE 'event_scheduler';
+-----------------+-------+
| Variable_name   | Value |
+-----------------+-------+
| event_scheduler | ON    |
+-----------------+-------+
1 row in set
</code></pre>
<h2>创建事件</h2>
<p>语法如下：</p>
<pre><code>REATE
    [DEFINER = { user | CURRENT_USER }]
    EVENT
    [IF NOT EXISTS]
    event_name
    ON SCHEDULE schedule
    [ON COMPLETION [NOT] PRESERVE]
    [ENABLE | DISABLE | DISABLE ON SLAVE]
    [COMMENT 'comment']
    DO event_body;

schedule:
    AT timestamp [+ INTERVAL interval] ...
  | EVERY interval
    [STARTS timestamp [+ INTERVAL interval] ...]
    [ENDS timestamp [+ INTERVAL interval] ...]

interval:
    quantity {YEAR | QUARTER | MONTH | DAY | HOUR | MINUTE |
              WEEK | SECOND | YEAR_MONTH | DAY_HOUR | DAY_MINUTE |
              DAY_SECOND | HOUR_MINUTE | HOUR_SECOND | MINUTE_SECOND}
</code></pre>
<p>一个使用实例：</p>
<pre><code class="language-bash">mysql&gt; create event ww
    -&gt; on schedule every 1 second
    -&gt; do call test_pri;
Query OK, 0 rows affected
</code></pre>
<h2>事件删除</h2>
<p>事件删除语法：</p>
<pre><code>DROP EVENT [IF EXISTS] event_name
</code></pre>
<h2>错误记录</h2>
<h3>过程中结果为 NULL</h3>
<p>如下，在一次过程中使用游标技术逐一检查每行的 id 和 db，然而不如人意，使用过程得到的结果全部为 NULL。</p>
<pre><code class="language-SQL">BEGIN
	#Routine body goes here...
	declare id int;
	declare db, ent, type char(128);
	declare done INTEGER;
	declare cur cursor for select id, db, ent, type from wz.tmp_pool_manager where crtime &lt; date_sub(now(), interval 1 hour);
	declare continue handler for not found set done = true;

	open cur;
	
	read_loop: loop
		fetch cur into id, db, ent, type;
		if done then
			leave read_loop;
		end if;
		select id, db;
	end loop;	
	
	close cur;
END
</code></pre>
<p>各种查阅，在 Mysql 的官方手册上看到这句话：</p>
<blockquote>
<p>A local variable should not have the same name as a table column.</p>
</blockquote>
<p>才恍悟过来，是由于我个人习惯把变量的名字都和对应列名上了，所以只要把变量名改掉（如前面加个 X）即可。</p>
