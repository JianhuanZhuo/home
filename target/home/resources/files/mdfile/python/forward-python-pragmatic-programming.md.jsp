<%@ page contentType="text/html; charset=UTF-8" %><p>该文章转自阿里巴巴技术协会（ATA） 作者：空溟
相信用python的同学不少，本人也一直对python情有独钟，毫无疑问python作为一门解释性动态语言没有那些编译型语言高效，但是python简洁、易读以及可扩展性等特性使得它大受青睐。</p>
<!--more-->
<p>工作中很多同事都在用python，但往往很少有人关注它的性能和惯用法，一般都是现学现用，毕竟python不是我们的主要语言，我们一般只是使用它来做一些系统管理的工作。但是我们为什么不做的更好呢？python zen中有这样一句：There should be one-- and preferably only one --obvious way to do it.Although that way may not be obvious at first unless you're Dutch. 大意就是python鼓励使用一种最优的方法去完成一件事，这也是和ruby等的一个差异。所以一种好的python编写习惯个人认为很重要，本文就重点从性能角度出发对python的一些惯用法做一个简单总结，希望对大家有用~</p>
<p>提到性能，最容易想到的是降低复杂度，一般可以通过测量代码回路复杂度（cyclomatic complexitly）和Landau符号（大O）来分析, 比如dict查找是O(1)，而列表的查找却是O(n)，显然数据的存储方式选择会直接影响算法的复杂度。</p>
<h1>数据结构的选择</h1>
<h2>在列表中查找：</h2>
<p>对于已经排序的列表考虑用bisect模块来实现查找元素，该模块将使用二分查找实现</p>
<pre><code class="language-python">def find(seq, el) :
    pos = bisect(seq, el)
    if pos == 0 or ( pos == len(seq) and seq[-1] != el ) :
        return -1
    return pos - 1
</code></pre>
<p>而快速插入一个元素可以用:</p>
<pre><code class="language-python"> bisect.insort(list, element) 
</code></pre>
<p>这样就插入元素并且不需要再次调用 sort() 来保序，要知道对于长list代价很高.</p>
<h2>set代替列表：</h2>
<p>比如要对一个list进行去重，最容易想到的实现：</p>
<pre><code class="language-python">seq = ['a', 'a', 'b']
res = []
for i in seq:
    if i not in res:
        res.append(i)
</code></pre>
<p>显然上面的实现的复杂度是O(n2)，若改成：</p>
<pre><code class="language-python">seq = ['a', 'a', 'b']
res = set(seq)
</code></pre>
<p>复杂度马上降为O(n)，当然这里假定set可以满足后续使用。</p>
<p>另外，set的union，intersection，difference等操作要比列表的迭代快的多，因此如果涉及到求列表交集，并集或者差集等问题可以转换为set来进行，平时使用的时候多注意下，特别当列表比较大的时候，性能的影响就更大。</p>
<h2>使用collections模块替代内建容器类型：</h2>
<p>collections有三种类型：</p>
<ol>
<li>deque：增强功能的类似list类型</li>
<li>defaultdict：类似dict类型</li>
<li>namedtuple：类似tuple类型</li>
</ol>
<p>列表是基于数组实现的，而deque是基于双链表的，所以后者在中间or前面插入元素，或者删除元素都会快很多。</p>
<p>defaultdict为新的键值添加了一个默认的工厂，可以避免编写一个额外的测试来初始化映射条目，比dict.setdefault更高效，引用python文档的一个例子：</p>
<p>#使用profile stats工具进行性能分析</p>
<pre><code class="language-python">&gt;&gt;&gt; from pbp.scripts.profiler import profile, stats
&gt;&gt;&gt; s = [('yellow', 1), ('blue', 2), ('yellow', 3),
... ('blue', 4), ('red', 1)]
&gt;&gt;&gt; @profile('defaultdict')
... def faster():
... d = defaultdict(list)
... for k, v in s:
... d[k].append(v)
...
&gt;&gt;&gt; @profile('dict')
... def slower():
... d = {}
... for k, v in s:
... d.setdefault(k, []).append(v)
...
&gt;&gt;&gt; slower(); faster()
Optimization: Solutions
[ 306 ]
&gt;&gt;&gt; stats['dict']
{'stones': 16.587882671716077, 'memory': 396,
'time': 0.35166311264038086}
&gt;&gt;&gt; stats['defaultdict']
{'stones': 6.5733464259021686, 'memory': 552,
'time': 0.13935494422912598}
</code></pre>
<p>可见性能提升了快3倍。defaultdict用一个list工厂作为参数，同样可用于内建类型，比如long等。</p>
<p>除了实现的算法、架构之外，python提倡简单、优雅。所以正确的语法实践又很有必要，这样才会写出优雅易于阅读的代码。</p>
<h1>语法最佳实践：</h1>
<h2>字符串操作：</h2>
<p>优于python字符串对象是不可改变的，因此对任何字符串的操作如拼接，修改等都将产生一个新的字符串对象，而不是基于原字符串，因此这种持续的 copy会在一定程度上影响Python的性能：</p>
<ol>
<li>
<p>用join代替 '+' 操作符，后者有copy开销；</p>
</li>
<li>
<p>同时当对字符串可以使用正则表达式或者内置函数来处理的时候，选择内置函数。如str.isalpha()，str.isdigit()，str.startswith((‘x’, ‘yz’))，str.endswith((‘x’, ‘yz’))</p>
</li>
<li>
<p>字符格式化操作优于直接串联读取：</p>
</li>
</ol>
<pre><code class="language-python">     str = &quot;%s%s%s%s&quot; % (a, b, c, d)  # efficient
     str = &quot;&quot; + a + b + c + d + &quot;&quot;  # slow
</code></pre>
<h2>善用模块</h2>
<p>善用list comprehension(列表解析) &amp;generator（生成器） &amp; decorators（装饰器），熟悉itertools等模块：
<strong>列表解析</strong>，我觉得是python2中最让我印象深刻的特性，举例1：</p>
<pre><code class="language-python">      &gt;&gt;&gt; # the following is not so Pythonic  
      &gt;&gt;&gt; numbers = range(10)
      &gt;&gt;&gt; i = 0 
      &gt;&gt;&gt; evens = [] 
      &gt;&gt;&gt; while i &lt; len(numbers): 
      &gt;&gt;&gt;    if i %2 == 0: evens.append(i) 
      &gt;&gt;&gt;    i += 1 
      &gt;&gt;&gt; [0, 2, 4, 6, 8] 

      &gt;&gt;&gt; # the good way to iterate a range, elegant and efficient
      &gt;&gt;&gt; evens = [ i for i in range(10) if i%2 == 0] 
      &gt;&gt;&gt; [0, 2, 4, 6, 8] 
</code></pre>
<p>举例2：</p>
<pre><code class="language-python">def _treament(pos, element):
    return '%d: %s' % (pos, element)
f = open('test.txt', 'r')
if __name__ == '__main__':
    #list comps 1
    print sum(len(word) for line in f for word in line.split())
    #list comps 2
    print [(x + 1, y + 1) for x in range(3) for y in range(4)]
    #func
    print filter(lambda x: x % 2 == 0, range(10))
    #list comps3
    print [i for i in range(10) if i % 2 == 0]
    #list comps4 pythonic
    print [_treament(i, el) for i, el in enumerate(range(10))]

output：
24
[(1, 1), (1, 2), (1, 3), (1, 4), (2, 1), (2, 2), (2, 3), (2, 4), (3, 1), (3, 2), (3, 3), (3, 4)]
[0, 2, 4, 6, 8]
[0, 2, 4, 6, 8]
['0: 0', '1: 1', '2: 2', '3: 3', '4: 4', '5: 5', '6: 6', '7: 7', '8: 8', '9: 9']
</code></pre>
<p>没错，就是这么优雅简单。</p>
<p><strong>生成器表达式</strong>在python2.2引入，它使用'lazy evaluation'思想，因此在使用内存上更有效。引用python核心编程中计算文件中最长的行的例子：</p>
<pre><code class="language-python">f = open('/etc/motd, 'r')
longest = max(len(x.strip()) for x in f)
f.close()
return longest
</code></pre>
<p>这种实现简洁而且不需要把文件文件所有行读入内存。</p>
<p>python在2.4引入<strong>装饰器</strong>，又是一个让人兴奋的特性，简单来说它使得函数和方法封装（接收一个函数并返回增强版本的函数）更容易阅读、理解。'@'符号是装饰器语法，你可以装饰一个函数，记住调用结果供后续使用，这种技术被称为memoization的，下面是用装饰器完成一个cache功能：</p>
<pre><code class="language-python">import time
import hashlib
import pickle
from itertools import chain
cache = {}
def is_obsolete(entry, duration):
    return time.time() - entry['time'] &gt; duration

def compute_key(function, args, kw):
    #序列化/反序列化一个对象,这里是用pickle模块对函数和参数对象进行序列化为一个hash值
    key = pickle.dumps((function.func_name, args, kw))
    #hashlib是一个提供MD5和sh1的一个库，该结果保存在一个全局字典中
    return hashlib.sha1(key).hexdigest()

def memoize(duration=10):
    def _memoize(function):
        def __memoize(*args, **kw):
            key = compute_key(function, args, kw)

            # do we have it already
            if (key in cache and
                not is_obsolete(cache[key], duration)):
                print 'we got a winner'
                return cache[key]['value']

            # computing
            result = function(*args, **kw)
            # storing the result
            cache[key] = {'value': result,-
                            'time': time.time()}
            return result
        return __memoize
    return _memoize

@memoize()
def very_very_complex_stuff(a, b, c):
    return a + b + c

print very_very_complex_stuff(2, 2, 2)
print very_very_complex_stuff(2, 2, 2)


@memoize(1)
def very_very_complex_stuff(a, b):
    return a + b

print very_very_complex_stuff(2, 2)
time.sleep(2)
print very_very_complex_stuff(2, 2)
</code></pre>
<p>运行结果：</p>
<p>6</p>
<p>we got a winner</p>
<p>6</p>
<p>4</p>
<p>4</p>
<p>装饰器在很多场景用到，比如参数检查、锁同步、单元测试框架等，有兴趣的人可以自己进一步学习。</p>
<h2>善用自省能力（属性和描述符）：</h2>
<p>自从使用了python，真的是惊讶原来自省可以做的这么强大简单，关于这个话题，限于内容比较多，这里就不赘述，后续有时间单独做一个总结，学习python必须对其自省好好理解。</p>
<h1>编码小技巧：</h1>
<ol>
<li>在python3之前版本使用xrange代替range，因为range()直接返回完整的元素列表而xrange()在序列中每次调用只产生一个整数元素，开销小。（在python3中xrange不再存在，里面range提供一个可以 遍历任意长度的范围的iterator）</li>
<li>if done is not None比语句if done != None更快;</li>
<li>尽量使用&quot;in&quot;操作符，简洁而快速: for i in seq: print i</li>
<li>'x &lt; y &lt; z'代替'x &lt; y and y &lt; z'；</li>
<li>while 1要比while True更快, 因为前者是单步运算，后者还需要计算；</li>
<li>尽量使用build-in的函数，因为这些函数往往很高效，比如add(a,b)要优于a+b;</li>
<li>在耗时较多的循环中，可以把函数的调用改为内联的方式，内循环应该保持简洁。</li>
<li>使用多重赋值来swap元素<code>x, y = y, x # elegant and efficient</code>而不是<code>temp = x; x = y; y = temp</code></li>
<li>三元操作符（python2.5后）：V1 if X else V2，避免使用(X and V1) or V2，因为后者当V1=&quot;&quot;时，就会有问题。</li>
<li>python之switch case实现：因为switch case语法完全可用if else代替，所以python就没 有switch case语法，但是我们可以用dictionary或lamda实现：</li>
</ol>
<pre><code class="language-python">switch case结构：
switch (var)
{
    case v1: func1();
    case v2: func2();
    ...
    case vN: funcN();
    default: default_func();
}
</code></pre>
<p>dictionary实现：</p>
<pre><code class="language-python">values = {
           v1: func1,
           v2: func2,
           ...
           vN: funcN,
         }
values.get(var, default_func)()
</code></pre>
<p>lambda实现：</p>
<pre><code class="language-python">{
  '1': lambda: func1,
  '2': lambda: func2,
  '3': lambda: func3
}[value]()
</code></pre>
<p>用try…catch来实现带Default的情况，个人推荐使用dict的实现方法。</p>
<p>这里只总结了一部分python的实践方法，希望这些建议可以帮助到每一位使用python的同学，优化性能不是重点，高效解决问题，让自己写的代码更加易于维护，更加pythonic！</p>
