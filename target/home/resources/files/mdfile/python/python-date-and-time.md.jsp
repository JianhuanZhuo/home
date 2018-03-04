<%@ page contentType="text/html; charset=UTF-8" %><p>首先，我们需要从库中引入<code>datatime</code>模块，以便获得时间日期的一些函数：</p>
<pre><code class="language-python">from datetime import datetime
</code></pre>
<!--more-->
<p>如下操作将使用<code>now()</code>函数获得当前系统时间：</p>
<pre><code class="language-python">from datetime import datetime

now=datetime.now()
print now
print now.year
print now.month
print now.day

print type(now)
print type(now.year)
print type(now.month)
print type(now.day)

输出结果为：
2016-02-27 20:50:16.597000
2016
2
27

&lt;type 'datetime.datetime'&gt;
&lt;type 'int'&gt;
&lt;type 'int'&gt;
&lt;type 'int'&gt;
</code></pre>
<ul>
<li>如上可知，<code>now()</code>函数将返回一个<code>datetime.datetime</code>类型的返回值，该返回值记录有当前时间的信息。</li>
<li>若需抽取<code>datetime</code>类型中的信息可以使用<code>.year</code>、<code>.month</code>、<code>.day</code>获得相应的信息，即成员的值，其类型为<code>int</code>。</li>
<li>还可访问的成员还有<code>hour</code>、<code>minute</code>、<code>second</code>。</li>
</ul>
