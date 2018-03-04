<%@ page contentType="text/html; charset=UTF-8" %><p>SQL 中的 case 常用在数据库查询中添加逻辑，即简单动态 sql。</p>
<!--more-->
<p>参考：<a href="http://www.cnblogs.com/4littleProgrammer/p/4820006.html">sql case 用法总结</a></p>
<p>sql 的case 类型于编程语言里的 if-esle if-else 或者 switch，但它不用于控制sql程序的执行流程，而是作为列的逻辑使用。</p>
<p>语法：
case [input_expression]
when when_expression then result_expression
[...n]
[else else_result_expression]
end</p>
<p>一个简单的例子是，根据学生信息表中的年龄和性别，返回如下可能;</p>
<ol>
<li><code>age&gt;18 &amp;&amp; gender=='男'</code> 成立为 男人</li>
<li><code>age&gt;18 &amp;&amp; gender=='女'</code> 成立为 女人</li>
<li><code>age&lt;=18 &amp;&amp; gender=='男'</code> 成立为 男孩</li>
<li><code>age&lt;=18 &amp;&amp; gender=='女'</code> 成立为 女孩</li>
</ol>
<pre><code class="language-sql">select *,
       case
       when age &gt; 18 and gender = 'm' then N'男人'
       when age &gt; 18 and gender = 'f' then N'女人'
       when age &lt;= 18 and gender = 'm' then N'男孩'
       when age &lt;= 18 and gender = 'f' then N'女孩'
       else N'未知' end
from stuinfo
</code></pre>
<pre><code class="language-sql">SELECT
  s.name,
  sum(CASE WHEN strftime('%m', r.rdate) == '01'
    THEN rd.num*rd.price
        ELSE 0 END) AS mon1,
  sum(CASE WHEN strftime('%m', r.rdate) == '02'
    THEN rd.num*rd.price
      ELSE 0 END) AS mon2,
  sum(CASE WHEN strftime('%m', r.rdate) == '03'
    THEN rd.num*rd.price
      ELSE 0 END) AS mon3,
  sum(CASE WHEN strftime('%m', r.rdate) == '04'
    THEN rd.num*rd.price
      ELSE 0 END) AS mon4,
  sum(CASE WHEN strftime('%m', r.rdate) == '05'
    THEN rd.num*rd.price
      ELSE 0 END) AS mon5,
  sum(CASE WHEN strftime('%m', r.rdate) == '06'
    THEN rd.num*rd.price
      ELSE 0 END) AS mon6,
  sum(CASE WHEN strftime('%m', r.rdate) == '07'
    THEN rd.num*rd.price
      ELSE 0 END) AS mon7,
  sum(CASE WHEN strftime('%m', r.rdate) == '08'
    THEN rd.num*rd.price
      ELSE 0 END) AS mon8,
  sum(CASE WHEN strftime('%m', r.rdate) == '09'
    THEN rd.num*rd.price
      ELSE 0 END) AS mon9,
  sum(CASE WHEN strftime('%m', r.rdate) == '10'
    THEN rd.num*rd.price
      ELSE 0 END) AS mon10,
  sum(CASE WHEN strftime('%m', r.rdate) == '11'
    THEN rd.num*rd.price
      ELSE 0 END) AS mon11,
  sum(CASE WHEN strftime('%m', r.rdate) == '12'
    THEN rd.num*rd.price
      ELSE 0 END) AS mon12
FROM receipt_detail rd, receipt r, supply s
WHERE strftime('%Y', r.rdate) == '2016' AND rd.rid == r.id AND r.sid == s.id
GROUP BY r.sid;
</code></pre>
