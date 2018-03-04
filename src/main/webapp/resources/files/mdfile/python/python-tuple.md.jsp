<%@ page contentType="text/html; charset=UTF-8" %><p>通俗的说元组<code>tuple</code>是顺序的，不可变列表<code>list</code>，一旦创建了一个<code>tuple</code>就不能以任何方式改变它。</p>
<!--more-->
<h1>Operaction</h1>
<h2>create</h2>
<pre><code class="language-python">tuple1 = ('physics', 'chemistry', 1997, 2000)
tuple2 = (1, 2, 3, 4, 5 )
tuple3 = &quot;a&quot;, &quot;b&quot;, &quot;c&quot;, &quot;d&quot;
tuple4 = ()
tuple5 = 'hello',      # 这里说明在不引起歧义的情况下，圆括号是可以省略的
tuple6 = (1, 2)*4
tuple7 = (1, 2) + (3, 4)
</code></pre>
<ul>
<li>tuple4将创建一个空元组。</li>
<li>tuple5创建一个只有一个元素的元组，<code>'hello'</code>后跟着逗号<code>,</code>以示意此处创建元组<code>tuple</code>而非字符串<code>string</code>。</li>
</ul>
<p>python中，元组允许嵌套</p>
<pre><code class="language-python">t = 12345, 54321, 'hello!'
u = t, (1, 2, 3, 4, 5)
print u

输出：
((12345, 54321, 'hello!'), (1, 2, 3, 4, 5))
</code></pre>
<p>python中，可以使用现有容器进行元组创建</p>
<pre><code class="language-python">tuple1 = (1, 2);
tuple2 = (3, 4);
tuple3 = tuple1 + tuple2;
print tuple3

输出：
(1, 2, 3, 4)
</code></pre>
<h3>作为return的返回对象</h3>
<p>注意到在定义函数时，返回对象可以是多个变量。</p>
<p>如下：</p>
<pre><code class="language-python">def reMul(x1, x2):
    y1 = x1+x2
    y2 = x1-x2
    return y1, y2

print(reMul(1, 2))
print(type(reMul(1, 2)))

结果输出为：
(3, -1)
&lt;class 'tuple'&gt;
</code></pre>
<p>如上的例程说明，在Python中返回多个变量实际上是将多个返回量封装到一个元组中进行返回达到类似返回多个变量的效果。</p>
<h2>access</h2>
<h3>分片操作</h3>
<p>元组中也像List一样支持操作分片，具体可以操作List的相关说明。</p>
<h2>alter</h2>
<p>元组<code>tuple</code>在python中，被设计为一个常量<code>immutable</code>容器，所以其整体被视为一个单元，只能对元组进行整体的创建与删除(使用<code>del</code>)。</p>
<blockquote>
<p>因为有信仰所以有束缚</p>
</blockquote>
<p>所以用户无法对<code>tuple</code>进行<strong>增删改</strong>操作。</p>
<p>当然这一做法的目的是，是简化容器操作以获得一个<strong>更为轻量级</strong>的容器，对于一个创建之后直到删除都没有修改可能的数据集，使用列表<code>List</code>简直是暴殄天物，因为列表<code>List</code>在自动增长与边界检查的实现上付出了很大的代价，而这是选择列表<code>List</code>等自动尺寸容器后强制加上的。</p>
<ul>
<li>需要注意的是，这里的“常量容器”是指元组这个容器的大小是固定，且元素无法修改。如果元组的元素是另一个容器(如列表)的引入或句柄，那么该元素指向容器的操作与元组无关。这与深复制的原理相同。如下所示：</li>
</ul>
<pre><code class="language-python">t = [1,2]
tuple1 = (1, t);
tuple2 = (3, 4);
tuple3 = tuple1 + tuple2;
print tuple3

t[1] = 9
print tuple3

输出：
(1, [1, 2], 3, 4)
(1, [1, 9], 3, 4)
</code></pre>
<p>虽然无法直接修改元组，但是可以根据原来的元组修改后“组合”出新的元组。</p>
<p>也可以通过与List的相互转换对Tuple进行修改：</p>
<pre><code class="language-python">&gt;&gt;&gt; T = ('a', 'b')
&gt;&gt;&gt; temp = list(T)
&gt;&gt;&gt; temp
['a', 'b']
&gt;&gt;&gt; temp[0] = 'c'
&gt;&gt;&gt; temp
['c', 'b']
&gt;&gt;&gt; T = tuple(temp)
&gt;&gt;&gt; T
('c', 'b')
</code></pre>
<h2>function</h2>
<table>
<thead>
<tr><th>函数名</th><th>说明</th></tr>
</thead>
<tbody>
<tr><td>cmp(tuple1, tuple2)</td><td>比较两个元组元素。</td></tr>
<tr><td>len(tuple)</td><td>计算元组元素个数</td></tr>
<tr><td>max(tuple)</td><td>返回元组中元素最大值</td></tr>
<tr><td>min(tuple)</td><td>返回元组中元素最小值</td></tr>
<tr><td>tuple(seq)</td><td>将列表转换为元组</td></tr>
</tbody>
</table>
<p>&lt;&lt;&lt;&lt;&lt;&lt;&lt; HEAD</p>
<h2>zip</h2>
<p><code>zip()</code>函数允许我们并列多个列表为一个列，如下的示例：</p>
<pre><code class="language-python">&gt;&gt;&gt; L1 = [1, 2, 3]
&gt;&gt;&gt; L2 = [4, 5, 6]
&gt;&gt;&gt;&gt; for x in zip(L1, L2):
	print(x)

(1, 4)
(2, 5)
(3, 6)
</code></pre>
<p>这里需要注意的是：</p>
<ul>
<li>当参数的长度不同时，<code>zip</code>会以最短的长度为准截断其他的参数集合来获得等长的Tuple</li>
</ul>
<p>=======</p>
<blockquote>
<blockquote>
<blockquote>
<blockquote>
<blockquote>
<blockquote>
<blockquote>
<p>2e5f376e61f7f0fde18b3bdf5d76cf1fa922016f</p>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
<h2>others</h2>
<ul>
<li><code>tuple</code> 操作速度快，对于某些数据集需要做频繁的遍历，那么应该使用<code>tuple</code>。</li>
<li><code>tuple</code> 对数据进行 “写保护”，可以使代码更安全。</li>
</ul>
