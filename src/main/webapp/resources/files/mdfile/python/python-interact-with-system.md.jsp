<%@ page contentType="text/html; charset=UTF-8" %><p>很实用的命令，这也是为什么很多人使用python作为脚本的原因</p>
<!--more-->
<p><code>sys.version</code>获取当前版本
<code>sys.platform</code>获取当前操作系统平台</p>
<pre><code class="language-bash">&gt;&gt;&gt; sys.platform, sys.version
('win32', '3.5.1 (v3.5.1:37a07cee5969, Dec  6 2015, 01:54:25) [MSC v.1900 64 bit (AMD64)]')
</code></pre>
<p><code>sys.path</code>这个是一个列表<code>list</code>，操作当前环境的下的Path变量，重启时将失效</p>
<p>这种在运行时的修改，将会持续影响导致<code>python</code>退出，也就是说在下次启动<code>python</code>时，需要再次的配置。这种机制有利有弊，搜索路径是<code>python</code>解释器一个比较关键的配置，它可以防止在，而每次启动都需要进行配置，如果是单个程序在运行时需要切换路径倒也不是十分麻烦，若某个路径是常用到的，那么</p>
<p><code>os.environ</code>获取全部环境变量。这和Windows下的set命令一样，不加参数。</p>
<p><code>os.system()</code>
<code>os.popen()</code>
调用系统程序
<code>subprocess.call('cmd')</code></p>
<p>指定程序与参数
<code>subprocess.call('cmd /C &quot;dir&quot;')</code></p>
<p>使用内置的shell运行程序
<code>subprocess.call('dir', shell=True)</code></p>
<p>注意的是，这里的只是做了**“尽可能”<strong>的可移植，如在windows下的dir命令就得改成ls才能列出目录下的文件
再者，在这种环境的下的调用是比较</strong>低效率**的，如一个文件的函数以这种系统的调用会比import调用来得慢。因为系统需要为这个调用新开辟一个进程来运行。
会导致调用者的阻塞，一个比较好的解决方式，Linux下使用一个&amp;指明并行(后台)运行，而windows下使用start的方式</p>
<p>os.startfile()
模拟双击打开文件的动作</p>
<p><code>os.startfile('webpage.html')</code>会使用windows下该类型文件的注册打开程序打开该文件。</p>
