<%@ page contentType="text/html; charset=UTF-8" %><p>python这里的字典指的是可以使用标签名<code>label</code>进行索引的容器<code>collection</code>，在编程语言中十分常见，<code>R</code>语言中有着很相似的机制，而<code>Java</code>中它看起来也和<code>Map</code>差不多。
dictionary使用<code>hash</code>散列方法实现的。</p>
<!--more-->
<h2>1. index</h2>
<p>在python中常见的索引列表的下标索引<code>index</code>，如下图所示。也就是将下标映射到目标元素了，它表示了数学上的函数映射关系（键值对关系），键<code>key</code>为下标，值<code>value</code>为目标元素。</p>
<pre><code class="language-python">things = ['a', 'b', 'c']
print things[1]

输出：
b
</code></pre>
<p>那么字典<code>dictionary</code>则是使用标签名<code>label</code>作为映射关系的键<code>key</code>，那么如下将很容易理解：</p>
<pre><code class="language-python">things = {'label1': 'a', 'label2':'b', 'label3':'c'}
print things['label1']

输出：
b
</code></pre>
<blockquote>
<p><strong>索引键</strong>，若需要对映射的键进行索引，可以使用<code>.keys()</code>方法，它将返回键的<code>List</code>集合；或者使用<code>for key in things</code>，而这里的<code>key</code>是一个指代了<code>things</code>集合中的键，不是关键字应该是一种语法糖。</p>
</blockquote>
<p>另一种构建方法是使用<code>dict</code>构造器：</p>
<pre><code class="language-python">class dict(**kwarg) 
class dict(mapping, **kwarg) 
class dict(iterable, **kwarg) 

# 实例
&gt;&gt;&gt; dict.fromkeys(['a', 'b'])
{'b': None, 'a': None}
&gt;&gt;&gt; dict.fromkeys(['a', 'b'], 0)
{'b': 0, 'a': 0}
&gt;&gt;&gt; dict(name='Bob', age=42)
{'age': 42, 'name': 'Bob'}
&gt;&gt;&gt; dict([('name', 'mel'), ('age', 45)])
{'age': 45, 'name': 'mel'}
</code></pre>
<p>不过，在python中使用了字典后，仍可以使用下标进行索引，也就是说字典只是一种扩展的索引方式而已。但毫无疑问，这种方式的索引将更便于用户的理解，且使得列表的元素可以被更多类型的键<code>key</code>进行映射。</p>
<h3>1.1. 常见字典常量和操作</h3>
<table>
<thead>
<tr><th>操作</th><th>解释</th></tr>
</thead>
<tbody>
<tr><td>D1 = {}</td><td>空字典</td></tr>
<tr><td>D2 = {'spam':2, 'eggs':3}</td><td>两个项目的字典</td></tr>
<tr><td>D3 = {'food':{'ham':1, 'egg':2}}</td><td>嵌套的字典</td></tr>
<tr><td>D2['eggs']</td><td>以键进行索引</td></tr>
<tr><td>D3['food']['ham']</td><td>以键进行嵌套索引</td></tr>
<tr><td>D2.has_key('egg')</td><td>成员关系测试（Python3.5中已删除）</td></tr>
<tr><td>'eggs' in D2</td><td>成员关系测试</td></tr>
<tr><td>D2.keys()</td><td>键列表</td></tr>
<tr><td>D2.values()</td><td>值列表</td></tr>
<tr><td>D2.copy()</td><td>复制</td></tr>
<tr><td>D2.get(key[, default])</td><td>如果key为键的键值对存在，返回该值；否则返回default的值，default没有给的话返回一个None</td></tr>
<tr><td>pop(key[, default])</td><td>删除并返回以key为键的值，若该键不存在，则返回default</td></tr>
<tr><td>D2.update([other])</td><td>使用other的键值对覆盖/重写本身的键值对，类似于合并</td></tr>
<tr><td>del D2[key]</td><td>删除指定键值对</td></tr>
<tr><td>iter(D2)</td><td>返回D2字典的迭代器</td></tr>
<tr><td>D2.clear()</td><td>清空字典D2</td></tr>
<tr><td>len(D2)</td><td>取元素数目</td></tr>
<tr><td>D2[key] = 41</td><td>修改/新增键</td></tr>
</tbody>
</table>
<h3>1.2. in dictionary</h3>
<p>关于字典，在使用<code>in</code>进行迭代时，它将优先使用键<code>key</code>，如下的例子中将输出键：</p>
<pre><code class="language-python">d = {'a': 1, 'b': 2, 'c': 3}
for x in d:
	print(x)

结果输出：
a
b
c
</code></pre>
<ul>
<li>如果要迭代<code>value</code>，可以用<code>for value in d.values()</code></li>
<li>如果要同时迭代<code>key</code>和<code>value</code>，可以用<code>for k, v in d.items()</code></li>
</ul>
<h2>2. hashable key</h2>
<p>必须是可以散列计算的键，</p>
<h3>2.1. 使用get()避免missing-key错误</h3>
<p>get()方法描述如下：</p>
<ul>
<li>原型：D2.get(key[, default])</li>
<li>释义：如果key为键的键值对存在，返回该值；否则返回default的值，default没有给的话返回一个None</li>
</ul>
<p>在字典操作中容易遇到的一个错误是 “键值对不存在”，这个是个十分杂碎却又不得不正视的错误：</p>
<pre><code class="language-python">&gt;&gt;&gt; D['c']
Traceback (most recent call last):
  File &quot;&lt;pyshell#2&gt;&quot;, line 1, in &lt;module&gt;
    D['c']
KeyError: 'c'
</code></pre>
<p>如下有三个版本避免missing-key错误：</p>
<pre><code>D = {'a':1, 'b':2}

# ver1，先对键进行测试
if 'c' in D:
    print(D['c'])
else:
    print(0)

# ver2，使用try捕获错误
try:
    print(D['c'])
except KeyError:
    print(0)

# ver3，使用get()方法
print(D.get('c', 0))
</code></pre>
<p>如上三者中，很明显看出get()方法最为简单。</p>
<h2>3. mutable</h2>
<p>字典<code>dict</code>是可修改<code>mutable</code>的对象，也就是说在初始化后建立的键值映射关系可以被修改，如下例子：</p>
<pre><code class="language-python">sue = {}
sue['name'] = 'Sue Jones'
sue['age'] = 45
sue['pay'] = 4000
print sue

输出结果为：
{'pay': 4000, 'age': 45, 'name': 'Sue Jones'}
</code></pre>
<h2>4. method</h2>
<p>如上所示，转化为<code>List</code>类型</p>
<pre><code class="language-python">things = {'label1': 'a', 'label2':'b', 'label3':'c'}
print things.items()

输出：
[('label1', 'a'), ('label2', 'b'), ('label3', 'c')]
</code></pre>
