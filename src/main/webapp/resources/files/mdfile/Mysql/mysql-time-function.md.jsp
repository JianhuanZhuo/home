<%@ page contentType="text/html; charset=UTF-8" %><h2>时间戳</h2>
<p>获取时间戳</p>
<pre><code class="language-sql">mysql&gt; select current_timestamp, current_timestamp();

+---------------------+---------------------+
| current_timestamp | current_timestamp() |
+---------------------+---------------------+
| 2008-08-09 23:22:24 | 2008-08-09 23:22:24 |
+---------------------+---------------------+
</code></pre>
<p>时间戳转日期</p>
<pre><code class="language-sql">select from_unixtime(1218290027); -- '2008-08-09 21:53:47'
select from_unixtime(1218124800); -- '2008-08-08 00:00:00'
select from_unixtime(1218169800); -- '2008-08-08 12:30:00'

-- 带格式的
select from_unixtime(1218169800, '%Y %D %M %h:%i:%s %x'); -- '2008 8th August 12:30:00 2008'
</code></pre>
<p>日期转时间戳</p>
<pre><code class="language-sql">select unix_timestamp(); -- 1218290027
select unix_timestamp('2008-08-08'); -- 1218124800
select unix_timestamp('2008-08-08 12:30:00'); -- 1218169800
</code></pre>
<h2>日期转字符串函数</h2>
<pre><code class="language-sql">mysql&gt; select date_format('2008-08-08 22:23:01', '%Y%m%d%H%i%s');

+----------------------------------------------------+
| date_format('2008-08-08 22:23:01', '%Y%m%d%H%i%s') |
+----------------------------------------------------+
| 20080808222301 |
+----------------------------------------------------+
</code></pre>
<h2>字符串转换为日期函数</h2>
<p><code>str_to_date(str, format)</code></p>
<pre><code class="language-sql">select str_to_date('08/09/2008', '%m/%d/%Y'); -- 2008-08-09
select str_to_date('08/09/08' , '%m/%d/%y'); -- 2008-08-09
select str_to_date('08.09.2008', '%m.%d.%Y'); -- 2008-08-09
select str_to_date('08:09:30', '%h:%i:%s'); -- 08:09:30
select str_to_date('08.09.2008 08:09:30', '%m.%d.%Y %h:%i:%s'); -- 2008-08-09 08:09:30

-- 转换为累计天数
select to_days('0000-00-00'); -- 0
select to_days('2008-08-08'); -- 733627
</code></pre>
<h2>SQLite to MySQL</h2>
<pre><code class="language-sql">
concat(unix_timestamp(billdate), '000')


strftime('%m', d.orderdate)
--- 换成
date_format(orderdate, '%Y')
--- 使用正则表达式为：
--- strftime\(\'(\%[a-zA-Z])\',\s*([a-z1-9\.A-Z]+)\)
--- date_format($2, '$1')



DATEtime(#{billdate} / 1000, 'unixepoch', 'localtime'),
--- 换成
from_unixtime(#{billdate}/1000)
--- 正则表达式
--- DATEtime\(\#\{([a-zA-Z]+)} / 1000, 'unixepoch', 'localtime'\)
--- from_unixtime(#{$1}/1000)


SELECT last_insert_rowid();
--- 换成
SELECT last_insert_id();

</code></pre>
