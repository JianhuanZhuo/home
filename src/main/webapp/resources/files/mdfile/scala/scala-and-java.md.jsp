<%@ page contentType="text/html; charset=UTF-8" %><p>想起了 C 和其他最大部分语言中标识符 identitor 的组合有一个比较：</p>
<blockquote>
<p>标识符不允许数字开头。</p>
</blockquote>
<p>如果您学过编译原理可能知道，这是因为在做代码扫描刚好扫到一个数字开头的词时，无法直接得出即将扫描到的单词是一个数字还是标识符。上世纪的计算机科学家们就直接规定标识符不允许数字开头。而且与操作符相关的字符，如<code>+</code>、<code>-</code>、<code>*</code> 都列入禁用名单。</p>
<p>这很明显是将编译器的不足强行限制在使用编译器的人的头上，不过数字开头本身会给人一种不伦不类的奇怪体验，而且下划线或字母开头的组合所能容纳的标识符组合足够用了，所以这并不会带来太多的问题。</p>
<blockquote>
<p>Let the trouble of compiler to be your troble!</p>
</blockquote>
<p>在 Scala 中允许使用括号<code>([])</code>和点<code>.</code>之外的所有可打印字符。</p>
<blockquote>
<p>All other characters in \u0020-\u007F and Unicode categories Sm [Symbol/Math] ... expect parentheses ([]) and periods.</p>
</blockquote>
<p>当然如果就是想用类似于 <code>a.c</code> 这一包含了特殊字符的整体作为一个标识符也是可以，使用 ` 将所需表示的标识符括起来即可。这个用法一开始应该是为了兼容 JVM 中关键字的冲突吧，我们知道 Java 和 Scala 是可以相互调用的，但彼此的关键字不同，极可能会造成一些编译错误，比如 Scala 要 Java 中的一个接口，接口名刚好就叫 <code>val</code>，那就很尴尬了。比如说：</p>
<pre><code class="language-scala">scala&gt; val `a.c`=2
a.c: Int = 2

scala&gt; val `val` = &quot;this is a key word!&quot;
val: String = this is a key word!

scala&gt; var $ = 31.22
$: Double = 31.22
</code></pre>
<p>不过可以用不代表鼓励用，写出适用于大部分编程语言的标识符可读性才会高一些。</p>
<h2>类型</h2>
<p>Scala 的类型可以说本质上还是 Java 类型系统，一个比较直接的证据是 Scala 是 JVM 语言。</p>
<p>在每个变量声明前都需要使用 <code>var</code> 或 <code>val</code> 指明其是否可变，即是否可被重写覆盖。</p>
<p>对于其中的 <code>val</code> 可以简单的看成 Java 中的 <code>final</code> 关键字即可。曾经 Venkat Subramaniam 吐槽过，他在写 Java 并发相关书籍的时候，不得不为每个涉及多线程的成员变量全部加上 <code>final</code> 关键字。而 Scala 中 <code>val</code> 的出现是为了更显式的提醒编程人员使用 <code>final</code> 类型变量以便更高的用于并发编程。</p>
<p><code>var</code> 的存在则不那么重要了，因为非 <code>val</code> 即 <code>var</code>，还被各种 Scala 教程所嫌弃，鼓励不用 <code>var</code>。其实这样还不如全部变量默认为 <code>val</code> 在需要使用 <code>var</code> 时再声明 <code>var</code>。</p>
<h3>数字类型</h3>
<p>Scala 的数字类型与 Java 相同，</p>
<table>
<thead>
<tr><th>Name</th><th>Desciption</th><th>Size</th><th>Min Max</th></tr>
</thead>
<tbody>
<tr><td>Byte</td><td>Signed integer</td><td>1 byte</td><td>-127</td><td>128</td></tr>
<tr><td>Short</td><td>Signed integer</td><td>2 byte</td><td>-32768</td><td>32767</td></tr>
<tr><td>Int</td><td>Signed integer</td><td>4 byte</td><td>-2^31</td><td>2^31-1</td></tr>
<tr><td>Long</td><td>Signed integer</td><td>8 byte</td><td>-2^63</td><td>2^63-1</td></tr>
<tr><td>Float</td><td>Signed float point</td><td>4 byte</td><td>n/a</td><td>n/a</td></tr>
<tr><td>Double</td><td>Signed float point</td><td>8 byte</td><td>n/a</td><td>n/a</td></tr>
</tbody>
</table>
<p>Scala 不允许高精度到低精度的自动转换，允许低精度到高精度的自动转换。</p>
<pre><code class="language-scala">scala&gt; val s:Short=20
s: Short = 20

scala&gt; val l:Long=s
l: Long = 20

scala&gt; val b:Byte=s
&lt;console&gt;:8: error: type mismatch;
 found   : Short
 required: Byte
       val b:Byte=s
</code></pre>
<p>如下是数字类型字面量表示法：
表示法 | 类型 | 描述
---|---|---
5 | Int | 整形数字默认为 Int 类型
0x0f | Int | 带 <code>0x</code> 前缀为 16 进制数字
5l | Long | 带 <code>l</code> 后缀表示长整形
5.0 | Double | 小数默认为 Double 类型
5f | Float | 带 <code>f</code> 后缀表示单精度浮点
5d | Double | 带 <code>d</code> 后缀表示双精度浮点</p>
<h3>字符串类型</h3>
<p>Scala 字符串类型 <code>String</code> 内建于 Java 的字符串类 <code>java.lang.String</code>。这点很重要！源码 <code>scala.Predef.scala</code> 90 行处可见端倪：</p>
<pre><code class="language-scala">type String          = java.lang.String
</code></pre>
<p>有些不同的是，如 <code>==</code> 比较符的使用是检查其内容是否相同，而非判断是否引用同一个对象。
多行赋值，使用 <code>&quot;&quot;&quot; 可跨行的内容 &quot;&quot;&quot;</code></p>
<pre><code class="language-scala">scala&gt; &quot;xx&quot; * 2
res0: String = xxxx
scala&gt; val longString = &quot;&quot;&quot;
     | this is a long String,
     | need multi-line
     | &quot;&quot;&quot;
longString: String = 
&quot;
this is a long String,
need multi-line
&quot;
</code></pre>
<p>字符串插补 String Interpolation，这是一个比较魔性的功能，在字符串字面量前添加 <code>s</code> 表示。
以前学习网页静态模板时见过，作为占位符，用于向静态模板添加动态数据，达到视图与逻辑分离的效果。
如下是几个比较魔化的例子：</p>
<pre><code class="language-scala">scala&gt; val pi = 3.1416
pi: Double = 3.1416

scala&gt; s&quot;Pi is $pi&quot; // 在字符串中插入变量值
res1: String = Pi is 3.1416

scala&gt; s&quot;Pi is ${pi}...&quot; // 添加&quot;{&quot;和&quot;}&quot;区别标识符
res3: String = Pi is 3.1416...

scala&gt; s&quot;Pi is ${pi+1}... and ${&quot;bla&quot;*3}&quot; //支持运算
res7: String = Pi is 4.1416... and blablabla

</code></pre>
