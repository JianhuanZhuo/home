<%@ page contentType="text/html; charset=UTF-8" %><p>都说Python是一门动态语言，那么Python的动态表现在哪？</p>
<p>动态语言的定义：动态编程语言是<strong>高级程序设计语言</strong>的一个类别，在计算机科学领域已被广泛应用。它是一类<strong>在运行时可以改变其结构的语言</strong>：例如新的函数、对象、甚至代码可以被引进，已有的函数可以被删除或是其他结构上的变化。动态语言目前非常具有活力。</p>
<!--more-->
<h1>动态的思考</h1>
<p>从编译的角度来讲，<code>python</code>是一种<strong>解释性语言</strong>，它不直接将<strong>整个程序</strong>编译成固定的指令后运行，而是在一个python解释器的环境下依次执行输入的“代码”。那么相对于编译语言、静态语言而言，<code>python</code>作为动态语言的优势如下：</p>
<ul>
<li>程序不是运行完整的指令段，而是一边编译一边执行的方式运行程序，那么代码可在运行时进行<strong>热修改</strong>。</li>
</ul>
<h1>语言本身的对象化</h1>
<p>让我体会比较深刻的是如下的一个例子，这么做的可能就是<code>True</code>在python这里只是一个变量名，OMG！</p>
<pre><code class="language-python">True = False    # 或者可以更绝一点的__bulidin__.True = False
</code></pre>
<p>灵活的代价是python的一个比较明显的缺点：执行速度慢。</p>
<h2>属性与方法的动态绑定</h2>
<p>正常情况下，当我们定义了一个class，创建了一个class的实例后，我们可以给该实例绑定任何属性和方法，这就是动态语言的灵活性。</p>
<pre><code class="language-bash">&gt;&gt;&gt; s = Student()
&gt;&gt;&gt; s.name = 'Michael' # 动态给实例绑定一个属性
&gt;&gt;&gt; print(s.name)
Michael

&gt;&gt;&gt; def set_age(self, age): # 定义一个函数作为实例方法
...     self.age = age
...
&gt;&gt;&gt; from types import MethodType
&gt;&gt;&gt; s.set_age = MethodType(set_age, s) # 给实例绑定一个方法
&gt;&gt;&gt; s.set_age(25) # 调用实例方法
&gt;&gt;&gt; s.age # 测试结果
25
</code></pre>
<ul>
<li>注意到这与继承等方式使实例属性与方法发生变化是不同的，上述的动态绑定是<strong>可以在运行时进行的</strong>。</li>
<li>给一个实例绑定的方法，对另一个实例是不起作用</li>
<li>为了给所有实例都绑定方法，可以给class绑定方法</li>
</ul>
<pre><code class="language-bash">&gt;&gt;&gt; s2 = Student() # 创建新的实例
&gt;&gt;&gt; s2.set_age(25) # 尝试调用方法
Traceback (most recent call last):
  File &quot;&lt;stdin&gt;&quot;, line 1, in &lt;module&gt;
AttributeError: 'Student' object has no attribute 'set_age'

&gt;&gt;&gt; def set_score(self, score):  #给class绑定方法
...     self.score = score
...
&gt;&gt;&gt; Student.set_score = MethodType(set_score, Student)
</code></pre>
<h3>解除绑定</h3>
<p>在<code>python</code>中可以使用<code>delattr</code>函数对指定的对象进行解除绑定：</p>
<pre><code class="language-bash">&gt;&gt;&gt; delattr(P, &quot;run&quot;)
&gt;&gt;&gt; P.run()

Traceback (most recent call last):
  File &quot;&lt;pyshell#48&gt;&quot;, line 1, in &lt;module&gt;
    P.run()
AttributeError: Person instance has no attribute 'run'
&gt;&gt;&gt;
</code></pre>
<h3><strong>slots</strong></h3>
<p>动态语言由于摈弃了静态语言的严谨性，所以在使用时容易由于人为的错操作而出错，<code>python</code>允许在定义class的时候，定义一个特殊的<code>__slots__</code>变量，来限制该class实例只能添加的属性和方法：</p>
<pre><code class="language-python">class Student(object):
    __slots__ = ('name', 'age')
</code></pre>
<ul>
<li>用<code>tuple</code>定义允许绑定的属性名称</li>
<li><code>__slots__</code>定义的属性仅对当前类实例起作用，对继承的子类不起作用</li>
<li><code>__slots__</code>只能限制添加属性，不能限制通过添加方法来添加属性</li>
</ul>
<h2>动态创建类</h2>
<p>动态语言的函数和类的定义，不是编译时定义的，而是运行时动态创建的。</p>
<p>比如，在创建一个在编译时不存在的类，如下：</p>
<pre><code class="language-python">def f(self):
	print('Hello, world.')

NewClass = type('NewClass', (), dict(sayHello=f))
newInstance = NewClass()
newInstance.sayHello()

输出结果为：
Hello, world.
</code></pre>
<p>如上示例使用<code>type()</code>创建了一个新的类<code>NewClass</code>。
<code>type()</code>函数依次传入3个参数：</p>
<ol>
<li>class的名称；</li>
<li>继承的父类集合，注意python支持多重继承，如果只有一个父类，别忘了<code>tuple</code>的单元素写法；</li>
<li>class的方法名称与函数绑定，这里我们把函数<code>f</code>绑定到方法名<code>sayHello</code>上。</li>
</ol>
<h2>修改类</h2>
