<%@ page contentType="text/html; charset=UTF-8" %><p>python支持<code>List Comprehensions</code>（一般译为“推导表达式”）的概念来构造<code>List</code>串，这种方式看起来更为的“公式化”，也极大的提高比较公式的表达式计算书写与结果值构造效率。</p>
<!--more-->
<h2>1. simple List construct</h2>
<p>举例说，假设我们要创建一个<code>List</code>串，它是某个表达式多个结果的集合，一般的做法是使用一个循环如下：</p>
<pre><code class="language-python">&gt;&gt;&gt; squares = []
&gt;&gt;&gt; for x in range(10):
...     squares.append(x**2)
...
&gt;&gt;&gt; squares
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
</code></pre>
<p>而使用Lambda(λ)演算可以简化为如下比较像数学表达式的语句：</p>
<pre><code class="language-python">squares = list(map(lambda x: x**2, range(10)))
</code></pre>
<p>它与下面使用推导表达式的语句等价：</p>
<pre><code class="language-python">squares = [x**2 for x in range(10)]
</code></pre>
<h2>2. List Comprehensions format</h2>
<p>上一节的例子中可以略窥<code>List Comprehensions</code>格式，在python中，其一般使用格式如下：
[expression
<strong>for</strong> target1 <strong>in</strong> sequence1 [<strong>if</strong> condition1]
<strong>for</strong> target2 <strong>in</strong> sequence2 [<strong>if</strong> condition2]
...
<strong>for</strong> targetN <strong>in</strong> sequenceN [<strong>if</strong> conditionN]
]</p>
<ul>
<li>结果表达式可以是元组<code>tuple</code>等多个变量的容器，其中变量的值应该在<code>for</code>语句中有所“赋值”；</li>
<li>如上嵌套的表达式中，总是从内层的<code>N</code>开始循环的，如同嵌套了for循环一样。</li>
<li>结果表达式可以使用嵌套的<code>List Comprehensions</code>。</li>
</ul>
<p>下面的例子可粗略体现如上规则：</p>
<pre><code class="language-python">&gt;&gt;&gt; [(x, y) for x in [1,2,3] for y in [3,1,4] if x != y]
[(1, 3), (1, 4), (2, 3), (2, 1), (2, 4), (3, 1), (3, 4)]
</code></pre>
<p>一个嵌套的例子，演示转置一个矩阵的操作：</p>
<pre><code class="language-python">&gt;&gt;&gt; matrix = [
...     [1, 2, 3, 4],
...     [5, 6, 7, 8],
...     [9, 10, 11, 12],
... ]
&gt;&gt;&gt; [[row[i] for row in matrix] for i in range(4)]
[[1, 5, 9], [2, 6, 10], [3, 7, 11], [4, 8, 12]]
</code></pre>
