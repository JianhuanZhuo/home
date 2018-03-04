<%@ page contentType="text/html; charset=UTF-8" %><h2>见表原则</h2>
<h3>定长字段与非定长字段分离</h3>
<p>将表中的定长字段与非定长字段分离，其中当一个表内的字段全部都为定长时，该表的类型为 <code>fix</code> 类型，即记录的长度为定长，这样系统会像数组一样按下标进行检索。</p>
<h3>常用信息与不常用信息的分离</h3>
<p>比如，社交网站中一般个人信息中的头像、昵称、性别、年龄等可以作为一种常用信息表，在点击该人查看详细信息才能看的字段可以作为一张不常用表。</p>
<h3>添加冗余字段</h3>
<p>比如，在实现某个论坛指定板块，如「体育」板块的今日新发帖量时，可以按板块表<strong>连接</strong>贴表的方式进行统计实现，也可以通过在板块表添加冗余字段 <code>nowaday_news</code> 表示今天新帖，在每次发新帖的同时更新该值。</p>
<h2>列类型选择</h2>
<h3>字段类型优先级</h3>
<blockquote>
<p>在不考虑其他情况下，可以按这个顺序选择：整形 &gt; date/time &gt; enum &gt; char &gt; varchar &gt; blob/text</p>
</blockquote>
<p>列的特点分析</p>
<ol>
<li><strong>整形</strong>：定长、没有国家/地区或字符集的差异。比如 <code>tinyint 1, 2, 3, 4</code> 与 <code>char(1) a, b, c, d</code> 的比较，虽然都只占一个字节，但 <code>order by</code> 操作时，前者比较快，因为后者需要考虑字符集和校对集。</li>
<li><strong>time</strong>：定长、运算快，节约空间。它需要考虑时区，可以使用时间戳进行替换。</li>
<li><strong>enum</strong>：能起到约束值的目的。内部使用整形存储，但与 <code>char</code> 联查时内部需要经历串与值的转化。</li>
<li><strong>char</strong>：定长，但排序等操作需要考虑字符集与校对集（或排序集）。</li>
<li><strong>varchar</strong>：不定长，且还要考虑字符集问题。</li>
<li><strong>text/blob</strong>：无法使用内存临时表，也就是排序等操作只能在磁盘上进行。</li>
</ol>
<p>附：关于 <code>date/time</code> 的选择可以直接选 int unsigned not null，存时间戳。如下：<a href="https://www.xaprb.com/blog/2014/01/30/timestamps-in-mysql/">https://www.xaprb.com/blog/2014/01/30/timestamps-in-mysql/</a></p>
<blockquote>
<p>All date and time columns shall be INT UNSIGNED NOT NULL, and shall store a Unix timestamp in UTC.</p>
</blockquote>
<h3>以够用为准</h3>
<p>在进行列类型选择时，以值所需大小够用为准。大的字段占用过多内存，影响速度。如存储年龄字段，以<code>tinyint unsigned not null</code>即可，使用<code>int</code>类型则浪费了三个字节。</p>
<h3>尽量的避免 NULL</h3>
<p><code>NULL</code> 的存在不利于索引。</p>
<h2>btree 索引常见误区</h2>
<p>误区1：在 where 条件常用的列都用上索引，
在如下的例子中在 <code>cat_id</code> 和 <code>price</code> 上都加上索引</p>
<pre><code>where cat_id=3 and price&gt;100; //查询第3栏目，100元以上的商品 
</code></pre>
<p>但这里只能用上 <code>cat_id</code> 或者 <code>price</code> ，因为<strong>索引是独立的</strong>。</p>
<p>误区2：在多列上建立索引后，查询哪个列索引都发挥作用
多列索引需要满足左前缀要求。如<code>index(a,b,c)</code>为例，这里需要注意<strong>顺序</strong>：</p>
<p>|语句|索引是否发挥了作用|
|--|--|
|where a=3|是，只使用了a列|
|where a=3 and b=5|是，使用了a，b列|
|where a=3 and b=4 and c=6|是，使用了abc列|
|where b=3| 否 |
|where c=4| 否 |
|where a=3 and c=3|a列可以发挥作用，c不能|
|where a=3 and b&gt;10 and c=7|ab能利用所以，c不行|
|where a=3 and b like 'xx%' and c=7|ab能利用所以，c不行|
|where a=3 and b like 'xx%'|ab能利用索引|
|where a=3 and b like '%xx'| a可以，b不能，因为**%开头无法索引**|</p>
<p>可以使用 <code>explain</code> 命令查看计划验证。</p>
<h3>一道面试题：</h3>
<p>有商品表，有主键 <code>goods_id</code>、栏目列 <code>cat_id</code>、价格 <code>price</code>
说：在价格列已经加了索引，但按价格查询还是很慢，问可能是什么原因，怎么解决？</p>
<p>答：如果根据日志统计，发现很多人这样查：电脑-&gt;某某品牌-&gt;价格 <code>index(cat\_id, brand\_id, price)</code>。所以去掉单独的 <code>price</code> 列索引，加 <code>(cat_id, price)</code> 复合索引，再查询。</p>
