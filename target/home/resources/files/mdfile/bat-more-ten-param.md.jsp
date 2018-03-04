<%@ page contentType="text/html; charset=UTF-8" %><p>批处理文件参数的数目实际上是无限的。
然而，命令行长度却有限制。每个参数，包括分隔符和命令本身，都至少需要2个字符。因此，如果在命令行长度被限制为256，那么实际的数目是256/2=127，便会有在一个时间中批处理文件只能访问10个参数的奇怪规则，语法％n用于访问参数n，其中“n”就是一个单一的数字。其中参数％0表示批处理文件命令字段本身。
想访问超出第10个之外参数，需要使用SHIFT指令。SHIFT指令的每次调用都会左移所有参数一次，原来最左边的参数则不可访问。但最左边的参数在使用SHIFT指令之前保存到环境变量就不会丢失。
例如，一个批处理文件，文件名为DEMO，可以用12个参数，然后可以通过环境变量的方式引用调用：</p>
<pre><code class="language-bash">DEMO A B C D E F G H I J K L
</code></pre>
<p>然后通过参考％P12％的问候，在批处理文件中使用。</p>
<pre><code class="language-bash">set P1=％1
set P2=％2
SHIFT
SHIFT
SHIFT
set P3 =％0
set P4 =％1
set P5 =％2
.
.
.
set P11=％8
set P12=％9
</code></pre>
