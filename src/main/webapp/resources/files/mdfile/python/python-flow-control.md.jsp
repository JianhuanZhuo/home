<%@ page contentType="text/html; charset=UTF-8" %><h3>1. if</h3>
<p>对于<code>if</code>语句的BNF表示如下：</p>
<pre><code>if_stmt ::=  &quot;if&quot; expression &quot;:&quot; suite
             ( &quot;elif&quot; expression &quot;:&quot; suite )*
             [&quot;else&quot; &quot;:&quot; suite]
</code></pre>
<!--more-->
<p>对于没学过编译原理的同学而言，<code>if</code>语句的组成可看作如下表达：</p>
<pre><code class="language-python">if condition1 :
	operation1	
	operation2
elif condition2 :
	operation3
.
.
.
elif condition2 :
	operation3
else :
	operation4
</code></pre>
<p>且存在如下限制：</p>
<ul>
<li>python以缩进标记语句块，所以<code>operation1</code>与<code>operation2</code>表示一个语句块。</li>
<li><code>elif</code>、<code>condition2</code>和<code>operation3</code>同一语句块，可选项，其嵌套数量为任意。</li>
<li><code>else</code>、<code>operation4</code>为同一语句块，可选项，但只能作为<code>if</code>语句的条件不成立时执行的语句块。</li>
</ul>
<p><code>if</code>语句，将通过逐一比较的方式精准的找到其中一个符合条件分支进行执行，并忽略其他其他分支，如果所有条件都不符合，则执行<code>else</code>部分，当然前提是<code>else</code>语句存在。</p>
<h3>2. while</h3>
<p><code>while</code>语句是表达循环最为简洁的一个语句了，它的结构如下：</p>
<pre><code>while_stmt ::=  &quot;while&quot; expression &quot;:&quot; suite
                [&quot;else&quot; &quot;:&quot; suite]
</code></pre>
<p>也可以看成：</p>
<pre><code class="language-python">while condition :
	operation1
else :
	operation2
</code></pre>
<p>且存在限制如下：</p>
<ul>
<li><code>else</code>和<code>operation2</code>为同一语句块，可选项。</li>
</ul>
<p>在C语言中，while语句在编译为汇编时，它与如下语句等价：</p>
<pre><code class="language-C">label :
	if(condition){
		operation1;
		goto label;
	}else{
		operation2;
	}
</code></pre>
<p>一个小小的例子：</p>
<pre><code class="language-python">i = 4
while i&gt;2 :
	print i
	i -=1
else : 
	print &quot;xx&quot;

</code></pre>
<p>输出结果为：</p>
<pre><code class="language-bash">4
3
xx
</code></pre>
<p>在一个C语言的老手来说，这个<code>else</code>分支显得十分的鸡肋，因为它的作用不大，仅是在循环条件不成立时执行，而循环条件不成立的话本来就会继续执行下一条语句的，把<code>else</code>要执行的东西放在<code>while</code>语句下面也是可以的。当然，也存在一点点小小的差别，那就是<strong>使用了<code>break</code>之后，<code>else</code>语句就不会被执行</strong>，如下</p>
<pre><code class="language-python">i = 4
while i&gt;2 :
	print i
	i -=1
	break
else : 
	print &quot;xx&quot;

</code></pre>
<p>输出结果为：</p>
<pre><code class="language-bash">4
</code></pre>
<p>与<code>break</code>对应的是<code>continue</code>，它表示循环继续执行下一次迭代。</p>
<p>如果某个程序需要一个大循环作为主函数，使用<code>while</code>语句是最直接的：</p>
<pre><code class="language-python">while True :
	entry
</code></pre>
<h3>3. for</h3>
<p><code>for</code>语句的结构如下：</p>
<pre><code>for_stmt ::=  &quot;for&quot; target_list &quot;in&quot; expression_list &quot;:&quot; suite
              [&quot;else&quot; &quot;:&quot; suite]
</code></pre>
<p>或者如下结构</p>
<pre><code class="language-python">for target_list in expression_list : 
	operation1
else :
	operation2
</code></pre>
<p>并存在如下限制：</p>
<ul>
<li><code>expression_list</code>必须是一个<strong>可迭代的</strong>的对象</li>
<li><code>else</code>和<code>operation2</code>是同一个语句块，可选项</li>
</ul>
<p>对于<code>expression_list</code>对象迭代出的每个子元素将会逐一执行一次<code>operation1</code>，在执行完全部的子元素后，后转而执行一次<code>else</code>语句，当然前提是<code>else</code>语句存在。
与<code>while</code>语句相同，在使用了<code>break</code>之后将直接跳出该<code>for</code>语句，不执行<code>else</code>语句。</p>
<p>如同Java的集合一样，对于<code>for</code>语句这种迭代方式，在集合被迭代过程中被修改时会变得很有意思。
举个例子如下：</p>
<pre><code class="language-python">collection = [1]
for i in collection :
    print i
    collection.append(i+1)
</code></pre>
<p>上述的代码中，在<code>print i</code>执行完成后，会在集合内再插入一个数，使得集合的大小增大，再次进行<code>for i in collection</code>的迭代时，又能得到一个子元素进行执行，这样不断的循环下去。
又如下：</p>
<pre><code class="language-python">collection = [1, 2, 3, 4, 5, 6, 7, 8]
for i in collection :
    print i
    collection.remove(i)
</code></pre>
<p>输出的结果为：</p>
<pre><code class="language-bash">1
3
5
7
</code></pre>
<p>由此可推测，python中的<code>for</code>语句的实现如下：</p>
<ol>
<li>使用一个内部指针，设为p</li>
<li>如果!(p&lt;collection.__len__())，跳至6</li>
<li>i=collection[p]</li>
<li>执行operation1</li>
<li>跳至2</li>
<li>不存在<code>else</code>语句则跳至8</li>
<li>执行operation2</li>
<li>其他</li>
</ol>
<p>很明显，修改被迭代的集合会导致迭代元素的不确定，而<strong>这个特性很容易导致程序的BUG</strong>，特此记下。</p>
<h4>3.1. else</h4>
<p>在<code>while</code>和<code>for</code>语句中多安排一个<code>else</code>，我认为主要的一个用途是“哨兵”。</p>
<p>比如说有一段代码，需要在指定集合中查询符合条件第一个元素，并返回：</p>
<pre><code class="language-python"># 获取f集合中比50大的一个数
# 若不存在，则返回-1
# 否则返回该数的平方
def getG50(f):
    for i in f:
        if(i&gt;50):
            break
    # 循环之后的尾部处理
    if i == len(f):
        return -1;

    i = i**2
    return i
</code></pre>
<p>注意如上的8~10行，这是在使用循环查询经常需要处理的“尾巴”，而<code>while</code>和<code>for</code>中的<code>else</code>部分就是做了上述“尾部”部分的简化处理，将第9、10行的跳出检查用<code>else</code>语句代替。</p>
<p>也就是<code>else</code>可以用来识别循环是用<code>break</code>跳出来的还是逻辑条件为假顺序执行下来的。</p>
<h3>4. try</h3>
<p><code>try</code>语句在面向对象语言中比较常见，它常常用于分割业务逻辑与程序异常，使得代码简洁和强壮的鲁棒性。
其结构的BNF表达如下：</p>
<pre><code>try_stmt  ::=  try1_stmt | try2_stmt
try1_stmt ::=  &quot;try&quot; &quot;:&quot; suite
               (&quot;except&quot; [expression [(&quot;as&quot; | &quot;,&quot;) identifier]] &quot;:&quot; suite)+
               [&quot;else&quot; &quot;:&quot; suite]
               [&quot;finally&quot; &quot;:&quot; suite]
try2_stmt ::=  &quot;try&quot; &quot;:&quot; suite
               &quot;finally&quot; &quot;:&quot; suite
</code></pre>
<h3>5. break and continue</h3>
<p>break和continue语句在流程控制中也十分常见，他们的BNF范式如下：</p>
<pre><code>break_stmt    ::=  &quot;break&quot;
continue_stmt ::=  &quot;continue&quot;
</code></pre>
<ul>
<li>也就是两个语句的构成直接由关键字<code>break</code>、<code>continue</code>构成。</li>
<li>这两个在使用虽然属于语句<code>statement</code>，但只能嵌套在<code>for</code>或<code>while</code>循环体中。</li>
<li><code>break</code>或<code>continue</code><strong>只跳出一次最近嵌套的</strong>循环体。</li>
<li><code>break</code>或<code>continue</code>在带有<code>finally</code>的<code>try</code>块内的话，<code>finally</code>块的内容将在<code>break</code>或<code>continue</code>生效之前执行，如下所示：</li>
</ul>
<pre><code class="language-python">while True:
    try:
        print &quot;try print&quot;
        break
        print &quot;break after&quot;
    except Exception, e:
        raise
    finally:
        print &quot;finally print&quot;
输出：
try print
finally print
</code></pre>
<p>说到这里，很当然的想到有和上面差不多结构的东西，如下：</p>
<pre><code class="language-python">try:
    while True:
        print &quot;try print&quot;
        break
        print &quot;break after&quot;
except Exception, e:
    raise
finally:
    print &quot;finally print&quot;
</code></pre>
<p>这里不同的是<code>try</code>块的嵌套方式，</p>
<ul>
<li>前者是在<code>try</code>块中发生<code>expection</code>时会由<code>while</code>循环内的<code>except</code>捕获，异常处理完成之后继续执行(循环)；</li>
<li>后者是异常<code>expection</code>由<code>while</code>循环之外的<code>except</code>捕获，在捕获时便已跳出循环，所以异常处理完成之时便执行循环下面的语句。</li>
</ul>
<p>当然，这些只是一些牢骚，两者的选择也只是在工程上的需求不同而已，但用不好也是有点麻烦的。</p>
