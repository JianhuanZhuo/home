<%@ page contentType="text/html; charset=UTF-8" %><p>import，比较有意思的说法叫进口（嗯，进口代码，哈哈哈），但一般译为导入。</p>
<p>import从功能与设计的初衷来看，与类C的<code>#include &lt;**.h&gt;</code>很类似，但后者是一种代码预处理，即将指定代码段插入到<code>#include &lt;**.h&gt;</code>所在的位置（仅此而已）。而<code>Python</code>中的<code>import</code>做了更多的工作。</p>
<!--more-->
<h2>导入语法</h2>
<pre><code class="language-python">import moduleName [as aliasName] (, moduleName [as aliasName])*
</code></pre>
<p>一个简单的用法如上，意为导入moduleName，<strong>可选的</strong>为模块名起一个别名aliasName。其后可以跟更多欲导入模块名与其别名的组合。</p>
<p>在文件的任意位置（并非只能在文件头部）使用<code>import amodule</code>时，Python将import后指定欲导入的模块名映射为外部文件名，即amodule.py。这样Python会将该模块内的所有全局变量与函数封入以模块名（或别名）为标识符的命名空间中，访问时以<code>模块名.属性</code>的方式访问。</p>
<pre><code class="language-python">from moduleName import obj [as aliasName] (, obj [as aliasName])*
from moduleName import *
</code></pre>
<p>如上的用法将从指定模块中导入指定的对象，<strong>可选的</strong>为导入对象起一个别名aliasName。其后可以跟更多欲导入对象名与其别名的组合。</p>
<p>使用<code>from</code>关键字将从指定模块中导入特定的对象（不是全部）至当前顶级命名空间中，并对同名变量进行<strong>覆盖</strong>，即导入到了另一个模块之中了。下面的例子可以说明这个问题：</p>
<pre><code class="language-python">from module import name1, name2 # 导入方式1
</code></pre>
<p>上面的导入与下面的语句等效</p>
<pre><code class="language-python">name1 = &quot;my name is tom&quot; # 仅用于说明覆盖的现象
import module
name1 = module.name1
name2 = module.name2
del module
</code></pre>
<p>注意到<code>name1 = module.name1</code>，这说明<code>from</code>导入时<strong>仅作了变量名的赋值</strong>，而不是拷贝。而且如果存在该模块中本身存在与导入模块中对象名相同的对象（如本例中的<code>name1</code>）那么原本的变量将会被覆盖。</p>
<p>注：</p>
<ul>
<li>若需要查看已经导入哪些模块，可以使用<code>sys.modules</code>进行查看</li>
</ul>
<pre><code class="language-python">&gt;&gt;&gt; import sys
&gt;&gt;&gt; a = set(sys.modules)
&gt;&gt;&gt; import m1
&gt;&gt;&gt; b = set(sys.modules)
&gt;&gt;&gt; b-a
set(['m1'])
</code></pre>
<h3>__all__和_X</h3>
<p>在使用<code>from moduleName import *</code>时，会将模块内的全部变量名全部复制出去并进行覆盖，这样来说可能存在模块原本不该被暴露的变量不小心被修改，解决这样问题的办法有<code>__all__</code>和<code>_X</code></p>
<pre><code class="language-python">__all__ = ['name', 'func']
print('start to loading module m1.py...')

import sys
name = 432
def func(): a = 23; print(a)
class klass: pass

print('loading end!')
</code></pre>
<p>如上，若在m1.py模块中定义了<code>__all__</code>，那么Python会在导入时查找是否定义了<code>__all__</code>，若是则仅导入<code>__all__</code>定义的变量名，其余则不导入，如下：</p>
<pre><code class="language-python">&gt;&gt;&gt; from m1 import *
&gt;&gt;&gt; func
&lt;function func at 0x0000000002DBB358&gt;
&gt;&gt;&gt; name
432
&gt;&gt;&gt; sys

Traceback (most recent call last):
  File &quot;&lt;pyshell#8&gt;&quot;, line 1, in &lt;module&gt;
    sys
NameError: name 'sys' is not defined
&gt;&gt;&gt; klass

Traceback (most recent call last):
  File &quot;&lt;pyshell#9&gt;&quot;, line 1, in &lt;module&gt;
    klass
NameError: name 'klass' is not defined
</code></pre>
<p>若在导入时没有找到<code>__all__</code>，则会导入所有不是单下划线开头的变量名。</p>
<p>注：</p>
<ul>
<li>如果只是为了避免变量名重复的，使用<code>as</code><strong>更加的可靠</strong>。</li>
</ul>
<h3>__name__</h3>
<p>每个模块中都一个特殊的属性<code>__name__</code>，这个属性是Python自动设定的，其设定规则如下：</p>
<ol>
<li>文件以顶层程序执行的，则在启动时设置为<code>&quot;__main__&quot;</code></li>
<li>若文件是被导入的，则设置为模块名</li>
</ol>
<p>这样，只在启动时运行某段程序的代码很简单写了：</p>
<pre><code class="language-python">import sys

if __name__ == '__main__' :
    print(sys.argv)

结果输出：
['D:\\project\\python\\m1.py']
</code></pre>
<p>也就是说，只有在作为顶层程序时<code>if __name__ == '__main__' :</code>下面的语句块才执行，那么这个语句块就非常<strong>适合写测试单元</strong>了。</p>
<h3>动态载入模块</h3>
<p>在需要动态载入模块时，会遇到一点尴尬的问题：import和from内的模块名都是“硬编码”的变量名。
如下的情况是直接报错的：</p>
<pre><code class="language-python">&gt;&gt;&gt; import &quot;string&quot;
SyntaxError: invalid syntax
&gt;&gt;&gt; x = &quot;string&quot;
&gt;&gt;&gt; import x

Traceback (most recent call last):
  File &quot;&lt;pyshell#9&gt;&quot;, line 1, in &lt;module&gt;
    import x
ImportError: No module named x
</code></pre>
<p>上面的设想类似于之前在用类C写代码时，想动态的注释到某段代码一样。当然在天生动态的Python里，解决办法十分简单，使用<code>exec()</code>函数即可：</p>
<pre><code class="language-python">&gt;&gt;&gt; x = 'm1'
&gt;&gt;&gt; exec(&quot;import &quot;+x)
</code></pre>
<p>或者可以使用<code>__import__(x)</code>，其中<code>__import__()</code>会更“专业”一些。因为<code>exec()</code>执行时会比<code>__import__()</code>多一步：将<code>&quot;import &quot;+x</code>编译成<code>__import__(x)</code>。</p>
<h2>导入过程</h2>
<p>而Python中的<code>import</code>在第一次导入指定文件时，会执行如下三个步骤：</p>
<ol>
<li>找到模块文件</li>
<li>编译成位码</li>
<li>找到模块的代码来创建其所定义的对象</li>
</ol>
<p>如上的说法中需要注意的是，这是<strong>第一次</strong>导入模块时才会发生的，否则会直接跳过。</p>
<p>如上的过程中，有几个比较有意思的细节可以阐述如下：</p>
<h3>搜索</h3>
<p>对于指定的模块名，Python需要在机器中找到这个文件并执行其他步骤。当然找不到就会报错啦。</p>
<p>而这里的找文件，存在一个搜索的问题，在哪里搜索，怎么搜索，搜索的顺序是怎么样的？</p>
<p>Python将在如下预定义路径中按顺序搜索，直到找到第一个合法的模块为止：</p>
<ol>
<li>程序主目录，</li>
<li>PYTHONPATH环境变量中定义的目录。这个变量若没有定义的话会直接跳过，否则自左到右进行扫描搜索。</li>
<li>标准库目录，Python自带的标准库目录。</li>
<li>.pth文件的目录，这个**.pth文件由用户编辑并指明有效的搜索路径。</li>
</ol>
<p>而在实际中若想查看本地机器中Python的实际搜索路径，可以查看<code>sys.path</code>，它将上述的路径都粘在了这个List中。当然这个List是可以被修改（所做的修改在程序结束之前有效，也就是临时的），修改使用List的相关方法操作（<code>append()</code>、<code>del</code>、<code>pop()</code>等）即可。</p>
<h3>编译</h3>
<p><img src="${pageContext.request.contextPath}/\img\python\module.png" alt="Python运行的基本模型" /></p>
<p>在找到指定的模块文件后，Python会将**.py文件编译为**.pyc文件，再做其他步骤。</p>
<p>这里Python做了一个优化，在编译之前Python会检查是否已存在之前编译过的**.pyc，若存在则检查该文件的时间戳，若发现源文件**.py的时间戳早于相应**.pyc文件的时间戳，即源文件在编译后未作修改。则直接加载**.pyc文件跳过了编译的过程。</p>
<h3>执行</h3>
<p>在载入**.pyc文件会自上而下的执行一次模块中的字节码。</p>
<p>对于之前已经<code>import</code>过的模块，执行这一步会省去，所以对于有类似于<code>print</code>的语句的模块在第一次导入时可能会产生输出，而之后的导入则没有。</p>
<p>对于顶层（即不在class与def内的）的赋值语句会以其变量名创建模块对象属性，这里的赋值语句包括=、def等。</p>
<p>并以模块名为变量名，生成模块对象的属性命名空间。其中模块命名空间的属性，可以使用<code>dir()</code>函数查看。</p>
<h3>import示例</h3>
<p>对于如下的一个模块文件m1.py，此过程中将在m1.py同一目录下生成一个m1.pyc文件：</p>
<pre><code class="language-python"># file: m1.py
print('start to loading module m1.py...')

import sys
name = 432
def func(): a = 23; print(a)
class klass: pass

print('loading end!')
</code></pre>
<p>使用如下的命令导入：</p>
<pre><code class="language-python">&gt;&gt;&gt; import m1
start to loading module m1.py...
loading end!
&gt;&gt;&gt; m1.sys
&lt;module 'sys' (built-in)&gt;
&gt;&gt;&gt; m1.name
432
&gt;&gt;&gt; m1.func
&lt;function func at 0x0000000002CBB358&gt;
&gt;&gt;&gt; m1.klass
&lt;class m1.klass at 0x0000000002CBD228&gt;
&gt;&gt;&gt; m1.a

Traceback (most recent call last):
  File &quot;&lt;pyshell#20&gt;&quot;, line 1, in &lt;module&gt;
    m1.a
AttributeError: 'module' object has no attribute 'a'
</code></pre>
<h2>模块包导入</h2>
<p>除了模块名导入之外，也可以指定文件目录导入。这相当于将计算机上的目录看作Python的一个命名空间了，其属性对应于目录中所包含的子目录和模块文件。</p>
<h3>导入语法</h3>
<pre><code class="language-python">import dir1.dir2.mod
</code></pre>
<p>如上例子可以很好的理解为：导入dir1目录下的dir2目录下的mod.py，其中平常使用的<code>\</code>或<code>/</code>分割符用<code>.</code>代替而已。
dir1的搜索方式与模块文件的搜索方式相同，这里可以使用相对路径的<code>..</code>和<code>.</code>。</p>
<p>这里可以看出一个比较有意思的地方是为什么在import模块文件时不能使用带.py后缀，如<code>import mod1.py</code>，因为这样会导致Python将mod1识别为一个目录，即查找一个mod1目录下的py.py模块文件。</p>
<h3>包文件</h3>
<p>在使用包导入时，需要注意的是：导入的路径上的每个目录都必有一个<code>__init__.py</code>文件，这是一个奇葩的存在（在我眼里是这样的），虽然有用，但没用时也要有这么一个文件，即使它是空白的。</p>
<p>在Python首次导入某个目录时，会自动执行<code>__init__.py</code>文件的全部代码。这里可以放置如数据库连接等初始化用的代码。</p>
<h2>重载模块</h2>
<p>若需要重新载入模块，使修改后的模块生效，可以使用<code>reload()</code>重新载入，而不是关闭程序重新打开。IDLE中Run Module选项也是使用该函数<code>reload()</code>将修改后的模块重新载入的。<code>reload()</code>函数会强制已加载的模块的代码重新载入并重新执行。</p>
<pre><code class="language-python">&gt;&gt;&gt; import m1
&gt;&gt;&gt; m1.showChange()
spam of python
&gt;&gt;&gt; import m1   # 这时候修改了showChange()函数了
&gt;&gt;&gt; m1.showChange()
spam of python
&gt;&gt;&gt; reload(m1)  # import没有更新到最新的变化，使用reload()
&lt;module 'm1' from 'm1.py'&gt;
&gt;&gt;&gt; m1.showChange()
eggs of python
</code></pre>
<p>这里重载模块有几个问题需要注意的是：</p>
<h3>from导入问题</h3>
<p><code>reload()</code>函数不会影响<code>from</code>导入，如下一个例子可以说明问题：</p>
<pre><code class="language-python">&gt;&gt;&gt; from m1 import X
&gt;&gt;&gt; X
'old obeject'
&gt;&gt;&gt; reload(m1)
&lt;module 'm1' from 'm1.py'&gt;
&gt;&gt;&gt; X
'old obeject'
&gt;&gt;&gt; m1.X
'new obeject'
</code></pre>
<p>如上，对于使用from导入的变量，因为已经加入到另一个模块中，所以在命名空间覆盖时无法覆盖这些变量，所以在上述例子中<code>X</code>变量没有如预想中的被覆盖掉。</p>
<h3>单模块重载</h3>
<p>在使用<code>reload()</code>重载时，其实现为：</p>
<ol>
<li>删除内存中的指定重载模块的映像</li>
<li>重新搜索、编译、执行该模块</li>
</ol>
<p>在执行如上过程中，若该模块中包含有其他模块，那么只会重载该模块而忽略其他模块的重载。因为<code>reload()</code>仅仅删除了欲重载模块的映像，在执行该模块时遇到<code>import</code>其他模块时，会直接跳过，直接找内存的模块。</p>
<h3>对象实例化</h3>
<p>若模块文件中存储的是某个类，那么在<code>reload()</code>该类时，<strong>已使用该类实例化的对象，其行为和属性不会发生改变</strong>。这是和我们一般期望中的会不太一样。</p>
<p>比如，下面一个类：</p>
<pre><code class="language-python"># CatClass.py
class Cat():
    def eat(self, food):
        print('this cat will eat '+ food)

</code></pre>
<p>对于如上的类实例化一个对象c：</p>
<pre><code class="language-python">&gt;&gt;&gt; c = CatClass.Cat()
&gt;&gt;&gt; c.eat('fish')
this cat will eat fish
</code></pre>
<p>再者，将该类模块文件进行修改如下</p>
<pre><code class="language-python"># CatClass.py
class Cat():
    def __init__(self):
        self.color = 'white'
    def eat(self, food):
        print('this '+ self.color +' cat will eat '+ food)
</code></pre>
<p>再次重载模块CatClass.py，原本已实例化的对象c不会因为Cat类的修改而有任何改变，但重载之后这个类的行为属性确实会发生变化的（第5、6行）：</p>
<pre><code class="language-python">&gt;&gt;&gt; reload(CatClass)
&lt;module 'CatClass from 'D:\project\python\CatClass.py'&gt;
&gt;&gt;&gt; c.eat('fish')
this cat will eat fish
&gt;&gt;&gt; c = CatClass.Cat()
&gt;&gt;&gt; c.eat('fish')
this white cat will eat fish
</code></pre>
<p>对于如上的现象，一个比较的通俗的说法是：c是从CatClass类中实例化来的对象，这里的实例化将CatClass类中的属性拷贝一份到c的内存中，且在c的classinfo中存储着CatClass的内存地址作为判断c是否为CatClass的实例的依据。
而在reload(CatClass)后，c对象所在的内存地址并没有发生变化且其对象的内容没有因为重载而得到修改，而<code>CatClass.Cat</code>引用的对象的地址却因为重载而发生变化，故c的行为与Cat修改后的不符，且c已不是Cat的实例对象了，如下：</p>
<pre><code class="language-python">&gt;&gt;&gt; CatClass.Cat
&lt;class CatClass.Cat at 0x0000000002D2C288&gt;
&gt;&gt;&gt; p = CatClass.Cat # 使用p保存CatClass.Cat的引用
&gt;&gt;&gt; c
&lt;CatClass.Cat instance at 0x0000000002C94D88&gt;
&gt;&gt;&gt; isinstance(c, CatClass.Cat)
True
&gt;&gt;&gt; reload(CatClass) # 加载修改后的模块文件CatClass.py
&lt;module 'CatClass' from 'D:\project\python\加载修改后的模块文件CatClass.py'&gt;
&gt;&gt;&gt; CatClass.Cat # Cat已重新加载
&lt;class CatClass.Cat at 0x0000000002D2C348&gt;
&gt;&gt;&gt; c # 此时c未被改动
&lt;CatClass.Cat instance at 0x0000000002C94D88&gt;
&gt;&gt;&gt; isinstance(c, CatClass.Cat)
False
&gt;&gt;&gt; isinstance(c, p)
True
&gt;&gt;&gt; p
&lt;class CatClass.Cat at 0x0000000002D2C288&gt;
&gt;&gt;&gt; c.__class__
&lt;class CatClass.Cat at 0x0000000002D2C288&gt;
</code></pre>
<p>更为直观的角度来看，在未重载模块时，c与Cat的关系如下图：</p>
<p><img src="${pageContext.request.contextPath}/\img\python\module_class.png" alt="实例化类的内存映射关系" /></p>
<p>修改并重载入后的内存映射关系如下图所示：
<img src="${pageContext.request.contextPath}/\img\python\module_class2.png" alt="修改并重载入后的内存映射关系" /></p>
<p>由此可以管窥已实例化对象的行为和我们期望中的不太一样的原因了。</p>
