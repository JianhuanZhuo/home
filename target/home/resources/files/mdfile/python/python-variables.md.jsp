<%@ page contentType="text/html; charset=UTF-8" %><p>变量<code>Variables</code>是什么？
Allen B. Downey给的答案是：</p>
<blockquote>
<p>A variable is a name that refers to a value.</p>
</blockquote>
<p>除了“由下划线、字母和数字组成的非数字开头的序列串”之外，还有别的有意思的东西。</p>
<!--more-->
<p>在<code>python</code>中，可以使用赋值语句 <code>assignment statement</code> 在用户空间中创建一个变量。
一个简单的例子是：</p>
<pre><code class="language-python">&gt;&gt;&gt; a = 23
</code></pre>
<p>如上的例子中，python执行了三个步骤实现这个请求：</p>
<ol>
<li>创建一个对象代表 23 这个值；</li>
<li>创建一个变量 a （如果a这个变量不存在的话）；</li>
<li>将变量和新的对象23连接起来。</li>
</ol>
<p>在python中，一句比较简短的概括是：变量事实上是到对象内存空间的一个指针。</p>
<h1>变量名解析</h1>
<h2>LEGB原则</h2>
<p>这里先解释下LEGB这几个字母的意思：</p>
<table>
<thead>
<tr><th>首字母</th><th>释义</th><th>备注</th><th>实例</th></tr>
</thead>
<tbody>
<tr><td>L</td><td>Local 本地（函数）</td><td>在函数内赋值的，并没有在该函数内声明为全局变量的变量名</td><td>列表解析表达式中的变量</td></tr>
<tr><td>E</td><td>Embedded 上层函数的本地作用域</td><td>上层函数作用域中的变量名</td><td>函数内的变量</td></tr>
<tr><td>G</td><td>Global 全局（模块文件）</td><td>模块文件顶层赋值的变量名</td><td>py文件中最顶层的变量定义</td></tr>
<tr><td>B</td><td>Buildin 内置（Python）</td><td>内置变量名模块中的预定义变量名</td><td>open range</td></tr>
</tbody>
</table>
<p>在python使用某个变量名时，Python将依次搜索L、E、G、B四个作用域，并在第一次能够找到这个变量名的地方停下，如果全部作用域都没找到，则报错。</p>
<h2>变量名查找实例</h2>
<pre><code class="language-python">#Global scope
X = -99
X = abs(X)
G = 2               # Global 作用域的G

def func(Y):
    # Local scope
    G = 3           # 定义了一个Local 作用域的G，与上面定义的G不是一个东西 
    Z = X+Y+G
    return Z

func(1)
</code></pre>
<ol>
<li>abs这个函数名在B中找到，因为它是内置函数中的一个</li>
<li>X在该模块顶层中声明，故在第九行中的引用在G中找到</li>
<li>Y是<code>func</code>函数的参数，它是一个Local</li>
<li>由于LEGB原则在查找变量名时，只返回第一个查找到变量名，故在计算第九行<code>Z = X+Y+G</code>时，查找到的<code>G</code>在函数func内定义的只有Local作用域的<code>G</code></li>
</ol>
<h3>一些问题</h3>
<p>先看下如下的一段代码：</p>
<pre><code class="language-python">def f():
	print(X)

X = 42

f()
输出结果为：
42
</code></pre>
<p>上面的代码中有一个需要注意的地方是，在函数<code>f()</code>中或之前并无定义<code>X</code>变量，却在语句块里使用了<code>X</code>，理论上是应该报错的，但却正常执行，这是因为在定义<code>f()</code>时，仅将代码做了存储，并无执行，而之前执行<code>X=42</code>将<code>X</code>变量存入顶级命名空间，再<code>f()</code>时则可以按照LEGB规则找到变量<code>X</code></p>
<h1>types</h1>
<p>在汇编或早期的语言中（B语言 BCPL）是&quot;无类型&quot;的编程语言，它仅能操作一种数据类型，即机器字。为了处理那些不同类型的数据，而产生了数据类型的概念。所以在我看来，类型意味着两个东西：</p>
<ul>
<li>数据的存储方法与表示范围</li>
<li>对数据的操作方式</li>
</ul>
<p>由于<code>python</code>语言本身的特性，导致变量的类型是可变，变量的类型在赋值时被决定。这种特性将比较“晚期”的高级语言中十分常见，如JavaScript、PHP语言等都可以看到（<strong>但python把事情做得更绝</strong>）。</p>
<p>下面的这个例子可以说明这一点：</p>
<pre><code class="language-python">pam = 123
print pam
print type(pam)
pam = &quot;str&quot;
print pam
print type(pam)
</code></pre>
<blockquote>
<p>类型可变，也就是说在python或其他动态语言的解释器环境中，变量的类型也将作为一种特殊的“属性”，它规定了变量本身的操作方式（与指定操作集进行绑定），而在运行过程中该“类型变量”是可修改的，有别于“传统”语言中仅对变量值的修改。</p>
</blockquote>
<p>在变来变去的变量中检查的类型，可以使用<code>type</code>：</p>
<pre><code class="language-python">&gt;&gt;&gt; type('Hello, World!')
&lt;type 'str'&gt;
&gt;&gt;&gt; type(17)
&lt;type 'int'&gt;
</code></pre>
<p>一个比较有意思的事实是，检查<code>type()</code>函数返回的“类型对象”的类型时，可以得到如下的回答：</p>
<pre><code class="language-python">&gt;&gt;&gt; type(type('Hello world'))
&lt;class 'type'&gt;
&gt;&gt;&gt; type(type(17))
&lt;class 'type'&gt;
</code></pre>
<p>也就是说类型<code>&lt;type 'str'&gt;</code>也是类型<code>&lt;class 'type'&gt;</code>的一个对象（实例）。</p>
<p>而显式对变量进行变换类型也是可行的，如下所示的一个例子中，<code>+</code>将要求一个自拼接的字符串作为目标操作数，但是<code>3.14</code>仅作为一个浮点数，无法满足要求，所以需要使用<code>str()</code>函数对其进行转换：</p>
<pre><code class="language-python">the_pi = 3.14
print &quot;The value of pi is around &quot; + str(the_pi)
</code></pre>
<ul>
<li>当然如上的<code>str()</code>函数称为转换，是有些不妥，因为在函数执行之后传入参数<code>the_pi</code>的类型并没有改变，也就是说<code>str()</code>函数不是原地操作。</li>
<li>如果将原式再加上一条<code>the_pi = str(the_pi)</code>那么<code>the_pi</code>的类型则会改变字符串类型，而这也是属于使用赋值改变类型的范畴了。</li>
</ul>
<h1>Variable</h1>
<h2>共享引用</h2>
<p>由如上的笔记中可以管窥如下Python动态类型模型，变量名在此仅作为一个类似指针的引用，而变量名所对应的实际的变量是对象内存空间中的对象：</p>
<p><img src="${pageContext.request.contextPath}/\img\python\share_reference3.png" alt="变量名与对象" /></p>
<p>那么对变量赋值仅仅是修改变量名引用到不同对象这个事实也就比较容易接受了：</p>
<p><img src="${pageContext.request.contextPath}/\img\python\share_reference.png" alt="变量名与对象" /></p>
<p>在对a进行赋值操作时，由于Python中a引用的数字类型对象无法修改成字符类型对象，所以在实际上是对a进行了对象替换的动作：</p>
<p><img src="${pageContext.request.contextPath}/\img\python\share_reference2.png" alt="变量名与对象" /></p>
<p>这种方式的对象引用十分类似Java中的字符串<code>String</code>的静态引用机制。</p>
<h3>is关键字</h3>
<p>在Python中，提供一种检查对象相等的关键字：<code>is</code></p>
<p>对上述内容的一个验证如下：</p>
<pre><code class="language-python">&gt;&gt;&gt; a = 3
&gt;&gt;&gt; b = a
&gt;&gt;&gt; a is b
True
&gt;&gt;&gt; a = 'spam'
&gt;&gt;&gt; a is b
False
&gt;&gt;&gt; a = 3
&gt;&gt;&gt; a is b
True
</code></pre>
<p>第8、9、10行对“a赋值回原来的3，那么a与b还引用同一个对象吗？”这个问题做了验证。这里得到的结果是a又指回了原来的对象。这是因为在Python中对对字符串做了优化，而对于长字符串而言，情况就可能有些不一样了。</p>
<pre><code class="language-python">&gt;&gt;&gt; str1 = 'this is a long string in python'
&gt;&gt;&gt; str2 = 'this is a long string in python'
&gt;&gt;&gt;&gt; str1 is str2
False
</code></pre>
<h3>与变量不同的地方</h3>
<p>如下一个例子：</p>
<pre><code class="language-python">&gt;&gt;&gt; L = [1, 2, 3]
&gt;&gt;&gt; for x in L:
	x += 1

&gt;&gt;&gt; print(L)
[1, 2, 3]
&gt;&gt;&gt; print(x)
4
</code></pre>
<p>这里可能和开发者想象中的有些出入的地方，原因如下：</p>
<ol>
<li>L保存着原来<code>1</code>对象、<code>2</code>对象和<code>3</code>对象的引用。</li>
<li>在第一次循环时，<code>x</code>指向了<code>L</code>中的第一个元素<code>1</code>，</li>
<li>当执行<code>x += 1</code>时，Python创建了<code>2</code>对象（1+1=2），并将<code>x</code>指向了它</li>
<li>如此类推继续执行循环直至<code>L</code>内的元素全部遍历完</li>
</ol>
<p>如上的解释中可以看出<code>L</code>依旧保存的是原来对象的引用，<code>x+=1</code>并未修改<code>L</code>内元素的引用。</p>
<p>改进版本为：</p>
<pre><code class="language-python">&gt;&gt;&gt; for i in range(len(L)):
	L[i] += 1
	
&gt;&gt;&gt; print(L)
[2, 3, 4]
</code></pre>
<p>或者使用列表解析：</p>
<pre><code class="language-python">&gt;&gt;&gt; K = [x+1 for x in L]
&gt;&gt;&gt; print(K)
[2, 3, 4]
</code></pre>
<h2>原地操作</h2>
<p>对于共享引用的喜新厌旧，有另一个不同的，需要注意的地方：原地操作。</p>
<p>如下一个能简洁的说明问题的例子：</p>
<pre><code class="language-python">&gt;&gt;&gt; L1
[3, 3, 4]
&gt;&gt;&gt; L1 = [2, 3, 4]
&gt;&gt;&gt; L2 = L1
&gt;&gt;&gt; L1[0] = 3
&gt;&gt;&gt; L1
[3, 3, 4]
&gt;&gt;&gt; L2
[3, 3, 4]
</code></pre>
<p>在这里，与共享引用的喜新厌旧，在L1做出修改后，L1和L2引用的还是同一个对象（可以用is关键字验证）。</p>
<p>解决方式有：</p>
<ol>
<li>为L2新建一个对象，做相同的赋值</li>
<li>使用<code>copy</code>模块</li>
</ol>
<pre><code class="language-python">import copy

L2 = copy.copy(L1)          # 浅拷贝，仅对顶层元素（属性）
L2 = copy.deepcopy(L1)      # 嵌套拷贝

L2 = L1[:]                  # 使用分片对L1进行“全选”拷贝
</code></pre>
<h1>KeyWord</h1>
<p>与其他语言一样，<code>python</code>也有着自己的保留字/关键字。
如下：</p>
<pre><code>and       del       from      not       while    
as        elif      global    or        with     
assert    else      if        pass      yield    
break     except    import    print              
class     exec      in        raise              
continue  finally   is        return             
def       for       lambda    try
</code></pre>
<p>这里比较有意思的几个关键字</p>
<ul>
<li><code>or</code>、<code>and</code>、<code>not</code>它们是用于逻辑运算的运算符，相当于C语言中的<code>||</code>、<code>&amp;&amp;</code>、<code>!</code>，也就是说<code>python</code>使用了这几个比较文字化的关键字作为逻辑运算符。（注意，<code>||</code>、<code>&amp;&amp;</code>、<code>!</code>不可用了）</li>
</ul>
<h1>other</h1>
<h2>divide</h2>
<p>在<code>python</code>中有两种类型的除法，<code>/</code>(精确的)与<code>//</code>(不留余数)，如下的例子可以看出，这与之前学习的语言有些不同。</p>
<pre><code class="language-bash">&gt;&gt;&gt; 10 / 3
3.3333333333333335
&gt;&gt;&gt; 10 // 3
3
</code></pre>
<h2>scope</h2>
<p><code>python3</code>的整数没有大小限制，而某些语言的整数根据其存储长度是有大小限制的，例如Java对32位整数的范围限制在<code>-2147483648</code>-<code>2147483647</code>。这也是为什么<code>python</code>适合做大数据的运算处理了。</p>
<p>Python的浮点数也没有大小限制，但是超出一定范围就直接表示为<code>inf</code>（无限大）。</p>
