<%@ page contentType="text/html; charset=UTF-8" %><h2>方法也是属性</h2>
<p>我们知道，在Python中方法（函数）也是被当成对象，由一个变量名（方法名）指向内存中的一个方法对象，而非简单的代码序列。所以类中的方法也被一个属性存在。其调用由方法名右边的括号<code>()</code>触发。如下是一个简单的示例：</p>
<pre><code class="language-python">&gt;&gt;&gt; c = m1.Cat()
&gt;&gt;&gt; c.eat          # eat仅作为实例c的一个属性
&lt;bound method Cat.eat of &lt;m1.Cat instance at 0x0000000002C94D88&gt;&gt;
&gt;&gt;&gt; c.eat('fish')  # 括号()触发调用
this cat will eat fish
</code></pre>
<p>也就是说Python将类的方法也当作了属性，所以OOP的操作简化为：</p>
<pre><code class="language-python">object.attribute
</code></pre>
<p>使用<code>dir()</code>函数可以查看所有属性，而这些属性到底是普通对象还是方法由对象的类型决定。由此看来对象属性名在Python中只是个索引其他对象的“键”而已，可以通过<code>__dict__</code>属性查看该字典。</p>
<p><img src="${pageContext.request.contextPath}/\img\python\class_attr_tree.png" alt="属性树" /></p>
<h2>继承搜索路径</h2>
<p>继承搜索路径：</p>
<ol>
<li>实例对象中寻找属性</li>
<li>在创建实例的类中寻找属性</li>
<li>在较高的超类中查找</li>
</ol>
<p>注意：</p>
<ul>
<li>先在实例对象中查找，再到类中查找，也就是说对象可能存在类中没有的属性（或方法），这是动态绑定的结果。</li>
<li>对于超类查找，会自底向上（爸爸的爸爸叫爷爷），自左到右（多重继承）进行查找。</li>
</ul>
