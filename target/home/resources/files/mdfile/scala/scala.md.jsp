<%@ page contentType="text/html; charset=UTF-8" %><p>很早之前想学习一下 Spark，刚好毕设选题需要处理大规模数据（图），借而有机会能深入接触一下，然，Spark 的源码是由 Scala 语言编写的，虽然找到了 Java 调用的方法，但由于需要学习源码（优秀代码必须学习），故而找些 Scala 资料进行研究，顺便记一些笔记。</p>
<!--more-->
<h2>学习参考资料</h2>
<ol>
<li><a href="http://dblab.xmu.edu.cn/blog/spark/">林子雨大数据之Spark入门教程</a></li>
<li><a href="https://www.tutorialspoint.com/scala/">tutorialspoint.com 的 Scala 教程</a></li>
<li><a href="http://scala-lang.org">Scala 官网</a></li>
<li><a href="https://www.youtube.com/watch?v=grvvKURwGNg&amp;t=5036s">YouTuBe 上印度哥讲 Scala For Java Developer</a></li>
</ol>
<h3>REPL 环境</h3>
<p>REPL，即交互式解释器环境 Read Eval Print Loop。使用 Scala REPL 环境可以快速的运行 Scala 程序并及时得到运行反馈或结果，这对于。</p>
<pre><code>:cp &lt;path&gt;                 add a jar or directory to the classpath
:help [command]            print this summary or command-specific help
:history [num]             show the history (optional num is commands to show)
:h? &lt;string&gt;               search the history
:imports [name name ...]   show import history, identifying sources of names
:implicits [-v]            show the implicits in scope
:javap &lt;path|class&gt;        disassemble a file or class name
:load &lt;path&gt;               load and interpret a Scala file
:paste                     enter paste mode: all input up to ctrl-D compiled together
:power                     enable power user mode
:quit                      exit the interpreter
:replay                    reset execution and replay all previous commands
:reset                     reset the repl to its initial state, forgetting all session entries
:sh &lt;command line&gt;         run a shell command (result is implicitly =&gt; List[String])
:silent                    disable/enable automatic printing of results
:type [-v] &lt;expr&gt;          display the type of an expression without evaluating it
:warnings                  show the suppressed warnings from the most recent line which had any
</code></pre>
<p>如下是一些比较常用的命令说明</p>
<ol>
<li><code>:exit</code> 用于退出 REPL 环境；</li>
<li>使用 <code>:load</code> 命令像脚本语言一样可以加载 <code>*.scala</code> 文件；</li>
<li>使用 <code>:history</code> 命令可以像 Linux Shell 环境体验一样查看历史命令。</li>
</ol>
<h3>Hello World!</h3>
<p>下面用 Hello World! 验证 Scala 是否运行起来了。</p>
<pre><code class="language-bash">[tom@myheart-5 ~]$ scala
Welcome to Scala version 2.10.5 (Java HotSpot(TM) 64-Bit Server VM, Java 1.8.0_101).
Type in expressions to have them evaluated.
Type :help for more information.

scala&gt; println(&quot;Hello World!&quot;)
Hello World!

scala&gt; 
</code></pre>
