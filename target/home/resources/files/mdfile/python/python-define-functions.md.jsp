<%@ page contentType="text/html; charset=UTF-8" %><blockquote>
<p>In the context of programming, a function is a named sequence of statements that performs a computation. ---Allen B. Downey</p>
</blockquote>
<p>函数在<code>python</code>中是被视为一个可执行语句块的存在，对于<code>python</code>解释器而言，它的存在不过是向解释器的命名空间中注册了一个函数对象而已，以便后续代码中使用时给予调用。</p>
<!--more-->
<p>如上阐述的，在“执行”函数定义的时候只是注册一个函数对象，那么函数的函数体<code>body</code>将不被执行(也无法执行)，函数的函数体<code>body</code>只有在调用时才能被执行到。</p>
<h2>1. defination</h2>
<p>python官方给出的函数定义BNF范式如下所示：</p>
<pre><code>decorated      ::=  decorators (classdef | funcdef)
decorators     ::=  decorator+
decorator      ::=  &quot;@&quot; dotted_name [&quot;(&quot; [argument_list [&quot;,&quot;]] &quot;)&quot;] NEWLINE
funcdef        ::=  &quot;def&quot; funcname &quot;(&quot; [parameter_list] &quot;)&quot; &quot;:&quot; suite
dotted_name    ::=  identifier (&quot;.&quot; identifier)*
parameter_list ::=  (defparameter &quot;,&quot;)*
                    (  &quot;*&quot; identifier [&quot;,&quot; &quot;**&quot; identifier]
                    | &quot;**&quot; identifier
                    | defparameter [&quot;,&quot;] )
defparameter   ::=  parameter [&quot;=&quot; expression]
sublist        ::=  parameter (&quot;,&quot; parameter)* [&quot;,&quot;]
parameter      ::=  identifier | &quot;(&quot; sublist &quot;)&quot;
funcname       ::=  identifier
</code></pre>
<p>不用说看到，不了解BNF范式的同学，看到可能直接头大。
由上面的范式可以看出，这里的定义分为两个部分，一个是<code>decorators</code>部分和<code>funcdef</code>部分。</p>
<ul>
<li><code>decorators</code>是描述符定义。</li>
<li><code>funcdef</code>是函数定义。</li>
</ul>
<pre><code class="language-python">def functionName (parameterList) :
	suite
</code></pre>
<p>且存在如下限制：</p>
<ul>
<li>的</li>
<li>参数可赋予默认值</li>
</ul>
<p>这里需要提醒的是函数名的语法定义与变量名相同，都为<code>identifier</code>，且允许同时存在同名的函数与变量，这容易潜藏某些BUG，如下。</p>
<pre><code class="language-python">ss = 1
def ss():
	pass
print ss

输出为：
&lt;function ss at 0x00000000027299E8&gt;
</code></pre>
<p>如下代码中，ss引用的变量ss，这里虽然是很常见的作用域<code>scope</code>的把戏，但稍不留神很容易就被这些小差错搞走大把无谓的时间。</p>
<pre><code class="language-python">def ss():
	pass
ss = 1
print ss

输出为：
1
</code></pre>
<h3>1.1. def是可执行的代码</h3>
<p>一般而言，def语句在模块文件中编写，并在导入时生成定义。</p>
<p>一个很明显的例子是，你可以多次定义一个函数，如：</p>
<pre><code class="language-python">&gt;&gt;&gt; def func(): pass

&gt;&gt;&gt; def func(): print(2)
</code></pre>
<p>如上并不会报错，因为def语句的执行相当于生成一个函数对象，并将这个对象赋值给函数名，这与<code>x=1</code>类似。</p>
<p>一个比较有意思的例子是：</p>
<pre><code class="language-python"># 通过参数定义并获取不同功能的函数
def getFunc(f):
	if f==1:
		def func():
			... # 功能1
		
	else:
		def func():
			... # 功能2
</code></pre>
<p>但如上的例子是十分不提倡的，因为在程序设计中，函数的功能应该尽量的明确、单一，如上的把戏会让维护人员在看到代码的瞬间直接爆炸。</p>
<h2>2. decorators</h2>
<p>表示都必须换行，而不能写在同一行那。</p>
<h2>3. comments</h2>
<p>注解或者说
比较注重的地方，小经历可以分享一下</p>
<blockquote>
<p>数据结构实验上我完成了抽象数据结构，
在操作系统课设上，在内存管理或控制台程序实现上，刚好想起有这么个东西，翻了一下云盘。刚好就这么，拿起来就是用了，那时刚好带了例程、使用说明、源码等。</p>
</blockquote>
<h2>4. parameter</h2>
<p>为了便于用户(函数调用者)的使用，在<code>python</code>中允许使用<strong>默认参数</strong>。
首先，一个简单的计算等差数列的函数奉上：</p>
<pre><code class="language-python">def count(n):
    return n*(n+1)/2    

print(count(3))

结果输出：
6.0
</code></pre>
<p>参数传递时，传递方式遵循如下两点：</p>
<ol>
<li>不可变对象使用值传递</li>
<li>可变对象使用引用传递</li>
</ol>
<blockquote>
<p>除了上述平凡的参数定义之外，作为<code>R</code>语言的追赶者与超越者，<code>python</code>成功地继承了<code>R</code>语言中自由到<strong>恶心</strong>的参数匹配机制。</p>
</blockquote>
<h3>4.1. 带表达式的参数默认值</h3>
<p>这里需要注意的是，参数默认值的表达式只在函数定义的时候执行一次，也就是说参数默认值在函数定义完成后必须是一个常量。示例如下：</p>
<pre><code class="language-python">defaultValue = 1

def func(param1 = defaultValue*2):
	print param1

defaultValue = 5
func()

输出为：
2
</code></pre>
<p>在上述例子中，<code>func()</code>函数中的参数<code>param1</code>的默认值在函数定义时就已依据此时的<code>defaultValue</code>计算出为2，并作为常量存储在命名空间中，再以后的使用中直接使用该常量值而不再使用<code>defaultValue</code>进行求值。</p>
<h4>4.1.1. 那么想在函数执行的时候默认关联某个变量又该怎么做呢？</h4>
<blockquote>
<p>我觉得这种意思是将行为(函数、过程)与属性绑定(结合)，那么使用类的面向对象工具更为直接了当。
另一种不推荐的是，不设默认值，以常规的方式没每次将需要关联的变量进行参数赋值。</p>
</blockquote>
<p>如下是工厂模式的一种实现：</p>
<pre><code class="language-python">def maker(N):
	def action(X， s=N):
		return X**s
	return action
</code></pre>
<p>这里引出的另一个问题是，在定义与执行的时机，常见于回调函数中的坑：</p>
<pre><code class="language-python">import sys
from tkinter import *
def f(x):
    print(x)
Button(None, text='执行函数f', command=f('mama')).pack(fill=X)
mainloop()
</code></pre>
<p>在如上的函数中，由于第五句作为执行语句，在执行时直接将<code>f('mama')</code>执行了，而不是作为一个调用函数存储，这里是执行的过程，一个延迟执行而转变为定义的方式是使用<code>Lambda</code>，如下：</p>
<pre><code class="language-python">import sys
from tkinter import *
def f(x):
    print(x)
Button(None, text='执行函数f', command=(lambda:f('mama'))).pack(fill=X)
mainloop()
</code></pre>
<h4>4.1.2. 使用偏函数</h4>
<p>偏函数在数学上的定义是，固定其他变量后对单个变量进行研究时，单变量表现出来的函数关系。</p>
<p>在Python中用于改造某些函数以产生固定指定参数的偏函数</p>
<p>其原型是：
functools.partial(func, *args, **keywords)</p>
<p>使用<code>functools.partial</code>创建带有默认参数的偏函数，如下所示：</p>
<pre><code class="language-python">def f(a, b):
	print(a)
	print(b)

import functools

k = functools.partial(f, b=2)

k(1)

结果输出：
1
2
</code></pre>
<ul>
<li>使用<code>functools.partial(f, b=2)</code>在函数<code>f()</code>的基础上创建了一个新的函数并绑定一个默认参数<code>b=2</code>，并将函数赋予给<code>k</code></li>
<li>在<code>k(1)</code>的调用中，只传入<code>a</code>参数，并使用默认<code>b=2</code>执行</li>
<li>这种在程序运行时加强函数能力的方法是函数式编程<strong>Functional Programming</strong>的一种思想，关于函数式编程请参考其他文章。</li>
</ul>
<h3>4.2. 使用关键字参数调用函数</h3>
<p>关键字参数(keyword argument)调用函数，是在调用函数的时候，明确指定参数值付给那个形参。</p>
<ul>
<li>在函数调用中，可以混合使用基于位置匹配的参数和关键字参数，前题是先给出固定位置的参数</li>
</ul>
<h3>4.3. 可变长参数</h3>
<p>在<code>python</code>里，带<code>*</code>的参数就是用来接受可变数量参数的，如下是一个有意思的实例：</p>
<pre><code class="language-python">def f(n, *elems):
	print(type(elems))
	for i in elems:
		if n&gt;0:
			n=n-1;
		else :
			break
		print(i)

f(3, 1, 2, 3, 4, 5)

结果输出：
&lt;type 'tuple'&gt;
1
2
3
</code></pre>
<ul>
<li>如上函数的作用是打印出第一个参数之外的n个参数</li>
<li>在函数定义中第一个参数被定义为<code>n</code>，其他参数作为可变参数</li>
<li>可变参数将被解释器打包成<code>tuple</code>元组传入函数</li>
<li>如上的用法中使用了单星<code>*</code>，它表示打包为元组传入，若使用双星<code>**</code>表示所有正常形参之外的其他的关键字参数都将被放置在一个字典中传递给函数。</li>
</ul>
<pre><code class="language-python">def funcF(a, **b):
  print a
  for x in b:
    print x + &quot;: &quot; + str(b[x])

funcF(100, c='你好', b=200)

结果输出为：
100
c: 你好
b: 200
</code></pre>
<h3>4.4. 参数匹配顺序</h3>
<pre><code class="language-python">&gt;&gt;&gt; def f(a, *pargs, **kargs): print(a, pargs, kargs)
...
&gt;&gt;&gt; f(1, 2, 3, x=1, y=2)
1 (2, 3) {'y':2, 'x':1}
</code></pre>
<h3>4.5. 多态对参数传递的影响</h3>
<p>Python里，语言天生多态，一些奇葩的组合在Python作者的眼里成了独到的闪光。
比如说，<code>x1 * x2</code>中得到的值完全依靠于<code>x1</code>和<code>x2</code>自身的类型和值，这种重载与多态在程序中很容易产生某些BUG，特别是在函数中，因为Python中函数的参数是不做类型检查，直到运算中类型不匹配才抛出异常。</p>
<p>如下：</p>
<pre><code class="language-python">def times(x1, x2):
	return x1*x2
</code></pre>
<p>如果如上的程序在一开始时是作为两个数值计算乘法的，但如下意外的调用中却产生了一个有点不好接受的结果：</p>
<pre><code class="language-python">&gt;&gt;&gt; times('Px', 3)
'PxPxPx'
</code></pre>
<p>这种灵活、自由为许多等级森严的机构所诟病（一家之言）。</p>
<h3>4.6. 分解参数</h3>
<p>在进行函数调用时，使用符合<code>*</code>和<code>**</code>将起到分解指定对象为参数的作用，</p>
<ul>
<li><code>*</code>将分解指定对象为参数</li>
<li><code>**</code>将分解参数，以键/值的方式传入</li>
</ul>
<pre><code class="language-python">&gt;&gt;&gt; def f(a, b): print(a, b)

&gt;&gt;&gt; a = (1, 2)
&gt;&gt;&gt; f(*a)
1 2
&gt;&gt;&gt; k={'a':3, 'b':4}
&gt;&gt;&gt; f(**k)
3 4
</code></pre>
<h2>5. return</h2>
<p><code>python</code>使用<strong>显式</strong>的<code>return</code>语句进行函数返回。</p>
<blockquote>
<p>此处的显式是相对于某些语言的隐式返回而言的，如<code>R</code>使用函数末行作为函数返回的隐式返回。</p>
</blockquote>
<p>关于返回值，一个简单的例子如下：</p>
<pre><code class="language-python">def add(a, b):
	return a+b

print add(10, 5)
</code></pre>
<p><code>return</code>是<strong>黑箱模型</strong>中的输出，它表示输入在经过指定运算后得出的结果。
<code>python</code>在进入子函数后会顺序执行并接受<a href="/2016/01/19/flow-control/">流程控制</a>语句的限制，遇到<code>return</code>语句后跳出该函数，并将结果传递给调用者，宣告此次调用结束。</p>
<p>在<code>python</code>的函数定义中，不设有如<code>C</code>或<code>Java</code>中的返回类型。</p>
<p>笔者对此深有体会，对于C语言而言，当然这提供了一个检查机制，使得函数调用者能得到一个正确期望类型的返回值。但不是没有声明程序就跑不下去，调用者可以自行进行类型转换而得到自己想要的类型，但这样会出现类型转换错误的问题。
看到的接口是这样的：</p>
<pre><code class="language-C">/**
 *	@description    从内存中申请指定大小的内存空间
 *	@param          size：申请内存的大小
 *	@return         null为申请失败，否则返回申请到的内存地址
 */
char *malloc(int size);
</code></pre>
<p>然而在实现时，操作系统为了便利，在管理内存时使用的地址可能只使用int类型进行标记，所以上述接口的可能实现如下：</p>
<pre><code class="language-C">char *malloc(int size){
	int res = 0;
	...
	查找可用的地址块
	res = 可用地址块的起始地址
	...
	return (char *)res;
}
</code></pre>
<p>所以在理解上，返回类型仅是一种可选的检查机制，而非必要的，就如<code>Java</code>或<code>C++</code>重载机制中不会使用返回类型作为区别不同重载函数一样。</p>
<p>所以，<code>python</code>中函数不定义返回类型不在意料之外。</p>
<h3>5.1. 默认返回</h3>
<p>在函数执行完毕时，若无返回语句，将自动<code>return none</code></p>
<h3>5.2. 返回多个值</h3>
<p>返回多个值时，将多个返回值用逗号<code>,</code>隔开。如下一个获得坐标的函数，将返回<code>x</code>,<code>y</code>两个值：</p>
<pre><code class="language-python">def location():
    x=blablabla
    y=blablabla
    return x, y
</code></pre>
<p>而在调用时也使用类似的结构：</p>
<pre><code class="language-python">x, y = location()
print(x)
print(y)
</code></pre>
<ul>
<li>本质的来说，这是函数返回了一个<code>tuple</code>，从语言的层次上将多个返回值包装在一个<code>tuple</code>中（在没有这种特性的语言中，如Java，我们也可以自行定义一个专门储存这些返回值的类来实现的）。</li>
<li>而这种特性的实现，使得<code>python</code>语言更加“高级”与“数学化”。</li>
</ul>
<h2>6. reference</h2>
<p>函数的引用<code>reference</code>(或者说调用<code>call</code>)语法<code>semantic</code>上不属于函数的这一块，但学习函数的定义肯定是会用到函数的调用的，所以也把这部分笔记也写到这里了。</p>
<p>一个比较的用法是直接使用函数调用</p>
<pre><code class="language-python">def func():
	... # 函数体定义

func()
</code></pre>
<p>由于函数名在Python中的定义是执行函数对象的变量，故可以做赋值与传递，如下：</p>
<pre><code class="language-python">def func():
	... # 函数体定义

f = func # 给f赋值函数对象
f() # f调用func函数
</code></pre>
