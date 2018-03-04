<%@ page contentType="text/html; charset=UTF-8" %><p><code>List</code> 数据类型，可变的有序表。它使用索引获得指定位置的数据</p>
<!--more-->
<p>一个简单的例子：</p>
<pre><code class="language-python">hairs = ['brown', 'blond', 'red']
</code></pre>
<p>上面的代码的意思是声明一并定义一个
对于常见的操作：“增、删、改、查”</p>
<pre><code class="language-bash">&gt;&gt;&gt; hairs.append('yellow')     # 追加元素
&gt;&gt;&gt; hairs
['brown', 'blond', 'red', 'yellow']
&gt;&gt;&gt; hairs.pop()                # 弹出尾部元素
'yellow'
&gt;&gt;&gt; hairs.insert(2, 'green')   # 指定位置插入元素
&gt;&gt;&gt; hairs
['brown', 'blond', 'green', 'red']
&gt;&gt;&gt; hairs.pop(2)               # 删除指定位置的元素
'green'
&gt;&gt;&gt; hairs
['brown', 'blond', 'red']
</code></pre>
<ul>
<li>一个比较有意思的访问方法是访问倒数的元素。</li>
</ul>
<pre><code class="language-bash">&gt;&gt;&gt; hairs[-1]
'red'
</code></pre>
<h2>1. construction</h2>
<p><code>python</code>支持几种方式进行构造<code>List</code></p>
<ul>
<li>使用一对方括号创建空<code>List</code>：[]</li>
<li>在方括号内使用逗号分开初始项</li>
<li>使用list()构造函数进行构造</li>
</ul>
<p>还支持一种十分优雅的方式<code>List Comprehensions</code>创建<code>List</code>串，，一个简单的例子如下，可参见另一个笔记:<a href="">List Comprehensions</a></p>
<pre><code class="language-python">pays = [person[2] for person in people]
</code></pre>
<ul>
<li>由于<code>python</code>中全部数据类型都是对象，所以在<code>List</code>中可以存储不同类型的元素（因为存储的都是对象引用）</li>
<li>那么在<code>List</code>中嵌套<code>List</code>或其他集合元素也是合理的</li>
</ul>
<p>注：某些函数没有返回值，所以Python默认返回None，这时赋值引用是有点笨的：</p>
<pre><code class="language-python">&gt;&gt;&gt; aList = [1, 2, 3]
&gt;&gt;&gt; bList = aList.append(4) # append()默认返回None
&gt;&gt;&gt; print(bList)
None
</code></pre>
<h3>1.1. List in List</h3>
<p>嵌套列表是一种比较优雅的用法，一个比较常见的用法是多维数组或者矩阵：</p>
<pre><code class="language-python">&gt;&gt;&gt; matrix = [[1,2,3], [4,5,6], [7,8,9]]
&gt;&gt;&gt; matrix[1]                     # 获取行
[4, 5, 6]
&gt;&gt;&gt; [row[1] for row in matrix]    # 获取列
[2, 5, 8]
&gt;&gt;&gt; matrix[0][0]                  # 获取指定元素
1
</code></pre>
<p>矩阵使用如上表示方法并不是一个十分明智的选择，更好的做法是使用<code>numpy</code>这个扩展。</p>
<h2>2. Operation</h2>
<h3>2.1. range()</h3>
<p>而<code>range()</code>是产生列表的简单方式，在日常编程中经常用到一个简单的列表，如下：</p>
<pre><code class="language-python">num = range(0, 6)
for i in num :
	print i
</code></pre>
<p>上面的程序片所得结果与下方无异，但更长的而且也是这么简单的列表而言，<code>range()</code>函数实现起来更为简洁</p>
<pre><code class="language-python">num = [0, 1, 2, 3, 4, 5]
for i in num :
	print i
</code></pre>
<p>更为简单的用法是<code>range(size)</code>，即一个参数的用法，它将返回从0至size-1共size个元素的列表。这个十分有用，因为0为初始值、1为步长的列表刚好就是用于列表遍历的索引值，简单示例如下：</p>
<pre><code class="language-python">color = ['red', 'black', 'white']
for i in range(3) :
	print color[i]
</code></pre>
<p><code>range()</code>函数还可使用一个参数来表示取值步长（此参数不赋值时默认为1），如<code>range(1, 6, 2)</code>将得到的列表为<code>[1, 3, 5]</code>，即在满足条件1&lt;=x&lt;6的前提下，以2为步长取所有的值。
其中步长可以为负数，那么<code>range()</code>的第一个参数应该比第二个参数大。</p>
<p>和C语言中的数组类似，python中允许二维列表，如下所示：</p>
<pre><code class="language-python">num = [[1, 2], [3, 4]]
for i in num :
	for j in i :
		print j
</code></pre>
<h3>2.2. 序列重复</h3>
<p>由于在List中可以容纳任意的对象及数量，对于复杂数据类型（如：List、Dict等）是使用引用的，所以在生成List时会有些地方<strong>和想象中的有点不一样</strong>：</p>
<p>由于List的元素使用引用，所以在List b中嵌套另一个List a时，若贸然修改List a会导致可能List b的值也会发生变化：</p>
<pre><code class="language-python">&gt;&gt;&gt; aList = [1, 2, 3]
&gt;&gt;&gt; a = [1, 2, 3]
&gt;&gt;&gt; b = [4, a, 5]
&gt;&gt;&gt; b
[4, [1, 2, 3], 5]
&gt;&gt;&gt; a[1] = 9
&gt;&gt;&gt; b
[4, [1, 9, 3], 5]
</code></pre>
<p>若在同一个List b中重复引用同一个List a（因为List不是Set，相同元素可重复），那么会出现相同的但更有意思的作用：</p>
<pre><code class="language-python">&gt;&gt;&gt; b = [a, a, a]
&gt;&gt;&gt; b
[[1, 9, 3], [1, 9, 3], [1, 9, 3]]
&gt;&gt;&gt; a[2] = 66
&gt;&gt;&gt; b
[[1, 9, 66], [1, 9, 66], [1, 9, 66]]
</code></pre>
<p>当然，上面所述的内容从原理上也适用于Tuple、Dict等类型。</p>
<h3>2.3. 循环引用</h3>
<p>先给出一个例子：</p>
<pre><code class="language-python">&gt;&gt;&gt; a
[1, 9, 66]
&gt;&gt;&gt; a.append(a)
&gt;&gt;&gt; a
[1, 9, 66, [...]]
</code></pre>
<p>上面的例子中描述了这样的一件事：List a中的元素是<strong>自身的引用</strong>。
根据对象引用的访问规则，List a中的元素'a'将作为普通的元素访问，在访问到该元素时又跳回List a，所以<code>a[3][3][1]</code>得到<code>9</code>。</p>
<p>在开发者不知情的情况下，循环引用可能导致的后果是元素遍历时死循环。</p>
<p>当然，间接的嵌套循环也是存在的：</p>
<pre><code class="language-python">&gt;&gt;&gt; a = [1, 2]
&gt;&gt;&gt; b = [3, a]
&gt;&gt;&gt; a[1] = b
&gt;&gt;&gt; a
[1, [3, [...]]]
&gt;&gt;&gt; b
[3, [1, [...]]]
</code></pre>
<h3>2.4. 常见列表常量和操作</h3>
<table>
<thead>
<tr><th>操作</th><th>解释</th></tr>
</thead>
<tbody>
<tr><td>L1 = []</td><td>一个空列表</td></tr>
<tr><td>L2 = [0, 1, 2, 3]</td><td>四项：索引为0到3</td></tr>
<tr><td>L3 = ['abc', ['def', 'ghi']]</td><td>嵌套列表</td></tr>
<tr><td>L2[i]</td><td>索引</td></tr>
<tr><td>L3[i][j]</td><td>索引</td></tr>
<tr><td>L2[i:j]</td><td>分片</td></tr>
<tr><td>L2[i:j:k]</td><td>带步长的分片</td></tr>
<tr><td>len(L2)</td><td>求长度</td></tr>
<tr><td>L1 + L2</td><td>合并</td></tr>
<tr><td>L2 * 3</td><td>重复</td></tr>
<tr><td>for x in L2</td><td>迭代</td></tr>
<tr><td>3 in L2</td><td>成员关系</td></tr>
<tr><td>L2.append(4)</td><td>追加</td></tr>
<tr><td>L2.extend([5, 6, 7])</td><td>增长</td></tr>
<tr><td>L2.sort()</td><td>排序</td></tr>
<tr><td>L2.index(1)</td><td>搜索</td></tr>
<tr><td>L2.insert(I, X)</td><td>插入</td></tr>
<tr><td>L2.reverse()</td><td>反转</td></tr>
<tr><td>del L2[k]</td><td>删除</td></tr>
<tr><td>del L2[i:j]</td><td>指定分片裁剪</td></tr>
<tr><td>L2.pop()</td><td>弹出</td></tr>
<tr><td>L2.remove(2)</td><td>删除</td></tr>
<tr><td>L[i:j]=[]</td><td>删除</td></tr>
<tr><td>L2[i]=1</td><td>索引赋值</td></tr>
<tr><td>L2[i:j]=[4, 5, 6]</td><td>分片赋值</td></tr>
<tr><td>range(4)</td><td>生成整数列表</td></tr>
<tr><td>xrange(4)</td><td>生成整数元组</td></tr>
<tr><td>L4 = [x**2 for x in range(5)]</td><td>列表解析</td></tr>
</tbody>
</table>
<h2>3. subList</h2>
<p>一个简洁而优雅的方式使用切片获得子列表，关于切片的讨论，请参考
<a href="/2016/02/26/python/python-string/#3-2-_slice_string">python String - 3.2. slice string</a></p>
