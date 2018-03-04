<%@ page contentType="text/html; charset=UTF-8" %><p>在Python的学习与工作中，遇到的一些奇葩与崎岖，特此做一些错误调试笔录。当然，有一些在做笔记的时候就已经知道的可能会潜在的BUG就直接写在笔记里了。</p>
<!--more-->
<h2>只接受标量？</h2>
<blockquote>
<p>TypeError: only length-1 arrays can be converted to Python scalars</p>
</blockquote>
<p>在使用了<code>math</code>库中自带的<code>sin()</code>函数，该类函数只接受标量类型，但一般的数据处理中使用到比较多的是矢量，故可用<code>numpy.sin()</code>代替，它接受矢量。其他如开方<code>sqrt()</code>等的情况类似</p>
<pre><code class="language-python">y = math.sin(x) # 改为 numpy.sin(x)
</code></pre>
<h2>在使用pip安装时遇到指令错误？</h2>
<p>主要是安装时pip到的与本机的软件不兼容等原因，可以直接<strong>下载安装预编译的包</strong>的方法安装包。</p>
<ol>
<li>到<a href="http://www.lfd.uci.edu/~gohlke/pythonlibs/#scipy">这里</a>下载对应操作系统的预编译安装包，需要根据python版本是2.x还是3.x，系统是32位还是64位进行选择</li>
<li>使用pip包管理器进行安装，在命令行中输<code>pip install 下载scipy安装包的路径</code></li>
</ol>
<h2>urllib</h2>
<pre><code class="language-python">import urllib
fhand = urllib.urlopen('http://www.baidu.com').read()
</code></pre>
<p>如上一个简单的<code>urllib</code>的示例使用，发生了如下尴尬：</p>
<pre><code class="language-bash">Traceback (most recent call last):
  File &quot;D:\project\workspace\web\useUrllib.py&quot;, line 7, in &lt;module&gt;
    fhand = urllib.urlopen('http://www.baidu.com').read()
AttributeError: module 'urllib' has no attribute 'urlopen'
</code></pre>
<p>逛了stackoverflow，大神说要改成如下的方式进行访问，因为urllib的包做了一些修改，所以之前的方式就不适用了。</p>
<pre><code class="language-python">import urllib.request
fhand = urllib.request.urlopen('http://www.baidu.com').read()
</code></pre>
