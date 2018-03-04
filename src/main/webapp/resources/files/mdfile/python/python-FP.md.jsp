<%@ page contentType="text/html; charset=UTF-8" %><p>Python 语言的函数式编程支持学习笔记。</p>
<!--more-->
<h2>Closure</h2>
<p>函数闭包，返回函数，延迟计算，</p>
<p>匿名函数支持
lambda表达式</p>
<h2>Decorator</h2>
<p>在代码运行期间动态增加功能的方式，称之为“装饰器”（Decorator）。</p>
<p>本质上，decorator就是一个返回函数的高阶函数</p>
<h2>高阶函数</h2>
<h3>map</h3>
<p><code>map()</code>函数提供一种函数映射，其原型如下：</p>
<p>map(function, iterable, ...)</p>
<p>map函数将对<code>iterable</code>中的每一个元素作为参数调用<code>function</code>，其中它使用<code>yeild</code>返回一个<code>iterator</code>迭代器</p>
<pre><code class="language-python">&gt;&gt;&gt; import operator
&gt;&gt;&gt; map(operator.add, [1,2,3], [4, 5, 6])
&lt;map object at 0x00000034C7690160&gt;
&gt;&gt;&gt; b = map(operator.add, [1,2,3], [4, 5, 6])
&gt;&gt;&gt; b
&lt;map object at 0x00000034C7690278&gt;
&gt;&gt;&gt; for x in b: print(x)

5
7
9
</code></pre>
<p><code>map()</code>函数的实现很简单，但它体现了函数式编程中“函数是第一公民”的思想。</p>
<h3>filter</h3>
<p>filter，意为过滤器。也就是用来过滤掉某个集合中不符合条件的元素的。</p>
<p>原型如下：
filter(function, iterable)</p>
<p>filter函数将对<code>iterable</code>中的每一个元素作为参数调用<code>function</code>，删除所有<code>function</code>返回值等价于<code>None</code>的元素，保留并返回其他元素，其中它使用<code>yeild</code>返回一个<code>iterator</code>迭代器</p>
<p>如下例子中，要在0-30中过滤掉不是5的倍数的数：</p>
<pre><code class="language-python">&gt;&gt;&gt; for x in filter((lambda x: (x%5)==0), range(31)): print(x)

0
5
10
15
20
25
30
</code></pre>
<h3>reduce</h3>
<p>reduce，与map类似，但在函数计算时会将前一元素的结果作为下一个元素的计算项</p>
<p>解决如下的一些问题的：</p>
<pre><code class="language-python">&gt;&gt;&gt; L = range(10)
&gt;&gt;&gt; res = 0
&gt;&gt;&gt; for x in L:
		operactor(res, x)

&gt;&gt;&gt; print(res)
45
</code></pre>
<p>那么上式使用<code>reduce</code>的版本(我现在的版本是Python3.5，Python2.x中不需要第一行引入)是：</p>
<pre><code class="language-python">&gt;&gt;&gt; from functools import *
&gt;&gt;&gt; reduce((lambda x, y: x+y), range(10))
45
</code></pre>
