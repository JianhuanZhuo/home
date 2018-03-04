<%@ page contentType="text/html; charset=UTF-8" %><h2>0. Generator</h2>
<p><code>List Comprehensions</code>是一种根据指定规则产生数据容器，但是在数据量十分大）时，一次性产生庞大的数据是不合理的（考虑到这些数据的处理也是需要时间的），为了让数据能以类似于数据流的方式产生，<code>python</code>提供一种<strong>一边循环一边计算</strong>的机制，称为生成器：<code>generator</code></p>
<!--more-->
<p>如下是一个例子：</p>
<pre><code class="language-python">a = [1,2]
b = [3,4]
g = ((x, y) for x in a for y in b if x != y)
print g
print type (g)
print next(g)
a = [5, 6]
print next(g)
b = [7, 8]
print next(g)
print next(g)

结果输出：
&lt;generator object &lt;genexpr&gt; at 0x00000000026CE1F8&gt;
&lt;type 'generator'&gt;
(1, 3)
(1, 4)
(2, 7)
(2, 8)
</code></pre>
<ul>
<li><code>genterator</code>中保存算法而非直接生成数据，可以使用<code>next()</code>迭代产生数据，但这个函数是<strong>桀骜不驯的</strong>，如上的例子中你可以看到如果在迭代未完成的情况下修改算法中使用到的数据，那么产生的结果可能不是你想要的。</li>
<li>延后计算是**函数式编程（Functional Programming）**一个重要的思想，这方面将在进行其他文章讨论。</li>
<li>一般而言，我们将使用<code>generator</code>于<code>for</code>循环中，如下：</li>
</ul>
<pre><code class="language-bash">&gt;&gt;&gt; g = (x * x for x in range(4))
&gt;&gt;&gt; for n in g:
...     print(n)
... 
0
1
4
9
</code></pre>
<ul>
<li>注意，该式中的<code>g</code>是<code>generator</code>类型，而非<code>List</code></li>
</ul>
<p>那么如下的式子可用，也就是不那么奇怪了</p>
<pre><code class="language-python">print sum(x for x in [1,2,3])
</code></pre>
<h2>1. Infinite Sequence</h2>
<p>生成器<code>generator</code>更大的作用在于，生成无限序列<code>Infinite Sequence</code>。</p>
<h3>1.1. Demand</h3>
<p>我们知道，在数学上表示的序列，如果是无限的，那么序列的个数会是无穷。而这种序列在存储空间有限的机器上很难生成，如下：</p>
<p>$\lim_{n \rightarrow + \infty}{n} $</p>
<p>每一个元素的都是明确、有规律可循，但是在编程语言上“一次性生成”序列却无法表示出这个序列，因为任意指定存储单元都是有限的。</p>
<h3>1.2. Solution</h3>
<p>对于上节问题的无限序列，可以知道的是即时，那么“不存储”这个序列，这是一种延后计算的策略，</p>
<p>一件经典的例子是<strong>斐波那契数列</strong>：</p>
<pre><code class="language-python">def fib():
    n, a, b = 0, 0, 1
    while True:
        yield b
        a, b = b, a + b
        n = n + 1
</code></pre>
<ul>
<li>上述的函数中的<code>yield</code>是一个关键字，它的语法意义是将这个函数定义为一个生成器<code>generator</code>，在调用该函数时返回一个保存有该算法（斐波那契数列生成算法）的生成器<code>generator</code></li>
<li>这个生成器可以按照该算法得出斐波那契<strong>无限</strong>数列，而数列不是一次性生成的，而是在“需要”这个数的时候计算的，如下所示：</li>
</ul>
<pre><code class="language-python">f = fib()
print(next(f))
print(next(f))
print(next(f))
print(next(f))

输出结果为：
1
1
2
3
</code></pre>
