<%@ page contentType="text/html; charset=UTF-8" %><p>文件，计算机中由操作系统管理的具有名字的存储区域。</p>
<h1>&lt;&lt;&lt;&lt;&lt;&lt;&lt; HEAD
这里记录关于文件操作及其他数据存储方法的一些笔记。</h1>
<p>这里记录关于文件操作的一些笔记。</p>
<blockquote>
<blockquote>
<blockquote>
<blockquote>
<blockquote>
<blockquote>
<blockquote>
<p>2e5f376e61f7f0fde18b3bdf5d76cf1fa922016f</p>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
<!--more-->
<h2>常见文件操作</h2>
<table>
<thead>
<tr><th>操作</th><th>description</th></tr>
</thead>
<tbody>
<tr><td>output.open('/tmp/spam', 'w')</td><td>创建输出文件，'w'表示写入</td></tr>
<tr><td>input.open('data', 'r')</td><td>创建输入文件，'r'表示读写</td></tr>
<tr><td>input.open('data')</td><td>与上行相同，'r'为默认值</td></tr>
<tr><td>sString = input.read()</td><td>将整个文件都到单一字符串中</td></tr>
<tr><td>aString = input.read(N)</td><td>读取<strong>之后的</strong>N个字节到一个字符串中</td></tr>
<tr><td>aString = input.readLine()</td><td>读取下一行到一个字符串中</td></tr>
<tr><td>aList   = input.readLines()</td><td>读取整个文件到字符串列表中</td></tr>
<tr><td>output.write(aString)</td><td>写如字节字符串到文件</td></tr>
<tr><td>output.writeLines(aList)</td><td>写列表内所有字符串到文件</td></tr>
<tr><td>output.close()</td><td>手动关闭（当文件收集完成时会替你关闭文件）</td></tr>
<tr><td>output.flush()</td><td>清空缓冲，强行写文件</td></tr>
<tr><td>anyFile.seek(N)</td><td>定位到N</td></tr>
</tbody>
</table>
<h3>open</h3>
<p>open()是一个常用内置函数，原型如下：</p>
<blockquote>
<p>open(file, mode='r', buffering=-1, encoding=None, errors=None, newline=None, closefd=True, opener=None)
打开一个文件并返回相应的文件对象，如果打开文件失败，则触发一个OSError</p>
</blockquote>
<h4>file</h4>
<p>file指定欲打开的路径名，可以是绝对路径，也可以是相对路径；</p>
<h4>mode</h4>
<p>mode，指定文件的具体操作模式，可由如下参数组合而成：</p>
<table>
<thead>
<tr><th>Character</th><th>Meaning</th></tr>
</thead>
<tbody>
<tr><td>'r'</td><td>读模式（默认值）</td></tr>
<tr><td>'w'</td><td>写模式</td></tr>
<tr><td>'x'</td><td>open for exclusive creation, failing if the file already exists</td></tr>
<tr><td>'a'</td><td>追加模式</td></tr>
<tr><td>'b'</td><td>二进制模式</td></tr>
<tr><td>'t'</td><td>文本模式（默认）</td></tr>
<tr><td>'+'</td><td>更新模式（同时读写）</td></tr>
<tr><td>'U'</td><td>universal newlines mode (deprecated)</td></tr>
</tbody>
</table>
<h4>buffering</h4>
<p>可选的整数参数，指定文件读取时的缓冲大小，如：</p>
<ul>
<li>传入0，表示关闭缓冲（仅允许在二进制模式('b')下使用）</li>
<li>传入1，表示使用行缓冲（仅允许在文本模式('t')下使用）</li>
<li>大于1，指定固定的大小的缓冲区</li>
</ul>
<p>默认情况下（不传入参数）：</p>
<ul>
<li>二进制文件使用固定大小的缓冲，该大小由io.DEFAULT_BUFFER_SIZE表示，一般为4096 or 8192 字节</li>
<li>文本文件使用行缓冲</li>
</ul>
<h4>encoding</h4>
<p>可选的编码名，encoding指定文件编码格式，默认下使用locale.getpreferredencoding()指定的编码格式。</p>
<p>PS：查阅codecs(Codec registry and base classes)可以获得更多关于Python编码支持的信息。</p>
<h4>errors</h4>
<p>可选的字符串，指定在读取文件时发生编码错误该执行何种策略。</p>
<p>可选的字符串如下：
&lt;&lt;&lt;&lt;&lt;&lt;&lt; HEAD</p>
<table>
<thead>
<tr><th>可选的字符串</th><th>解释</th></tr>
</thead>
<tbody>
<tr><td>'strict'</td><td>直接抛出ValueError异常，默认操作</td></tr>
<tr><td>'ignore'</td><td>忽略异常</td></tr>
<tr><td>'replace'</td><td>将异常处替换为标识符，如？</td></tr>
<tr><td>'surrogateescape'</td><td>will represent any incorrect bytes as code points in the Unicode Private Use Area ranging from U+DC80 to U+DCFF. These private code points will then be turned back into the same bytes when the surrogateescape error handler is used when writing data. This is useful for processing files in an unknown encoding.</td></tr>
<tr><td>'xmlcharrefreplace'</td><td>is only supported when writing to a file. Characters not supported by the encoding are replaced with the appropriate XML character reference &amp;#nnn;.</td></tr>
<tr><td>'backslashreplace'</td><td>replaces malformed data by Python’s backslashed escape sequences.</td></tr>
<tr><td>'namereplace'</td><td>(also only supported when writing) replaces unsupported characters with \N{...} escape sequences.</td></tr>
</tbody>
</table>
<h4>newline</h4>
<p>决定行结束符，可选参数:</p>
<ul>
<li>None</li>
<li>''</li>
<li>'\n'</li>
<li>'\r'</li>
<li>'\r\n'</li>
</ul>
<h4>closefd</h4>
<p>it will be append later...</p>
<h4>opener</h4>
<p>it will be append later...</p>
<h3>read file with generator</h3>
<p>读文件中一个比较快的例子是：</p>
<pre><code class="language-python">for line in open('file1.txt'):
	print(line)
</code></pre>
<p>上述的例子中<code>in</code>关键字在获取<code>open('file1.txt')</code>中的一个元素赋值给<code>line</code>时调用了其迭代器，其实现类似于<code>for line in open('file1.txt').readline()</code>，即打开该文件后读一行，赋值给<code>line</code>，执行循环体的动作，再读一行，赋值给<code>line</code>，执行循环体的动作。这样的内存效率是比较高的。</p>
<p>上述与下面的例子不同，下面的例子中是直接使用<code>readlines()</code>将文件全部读入，存储在内存后供<code>in</code>迭代，故内存效率没有上面的例子高。</p>
<pre><code class="language-python">for line in open('file1.txt').readlines():
	print(line)
</code></pre>
<h2>pickle</h2>
<p>对于网络传输与数据(对象)存储，在存储与传输过程中不修改数据(对象)的情况下，使用<code>pickle</code>是一个更为明智的选择。</p>
<blockquote>
<p>pickle愿意为“泡菜”，持久存储的意思。</p>
</blockquote>
<p><code>pickle</code>是一个十分强大的数据格式化和解析工具，它可以使我们直接在文件中存储几乎所有的Python对象。它能将数据腌制（序列化）后像泡菜一样存在菜缸（文件）中。</p>
<pre><code class="language-python">&gt;&gt;&gt; fp = open('pickle.txt', 'wb')
&gt;&gt;&gt; pickle.dump('xabc', fp)
&gt;&gt;&gt; fp.close()
</code></pre>
<p>如上有一个需要注意的细节是：
pickle生成的是二进制编码，所以在写文件和读文件时都需要附加‘b’标志：
写文件：
ktestFile = open('pickle.txt', 'wb')
读文件：
testFile = open('pickle.txt', 'rb')
否则open函数默认以文本方式打开文件，报出类似<code>write() argument must be str, not bytes</code>的错误</p>
<p>需要文件中取出数据时，使用<code>pickle.load()</code>方法即可：</p>
<pre><code class="language-python">&gt;&gt;&gt; fp = open('pickle.txt', 'rb')
&gt;&gt;&gt; pickle.load(fp)
'xabc'
</code></pre>
<p>对于烦杂的文件打开关闭，我们大可以使用<code>with</code>环境管理器，帮助我们打理文件的操作：</p>
<pre><code class="language-python">import pickle

data = {
    'a': [1, 2.0, 3, 4+6j],
    'b': (&quot;character string&quot;, b&quot;byte string&quot;),
    'c': {None, True, False}
}

# 写文件
with open('data.pickle', 'wb') as f:
    pickle.dump(data, f)

# 读文件
with open('data.pickle', 'rb') as f:
    data = pickle.load(f)
</code></pre>
<h2>eval()</h2>
<p>当然，与<code>pickle</code>类似的还有一个转换方法，那就是使用<code>eval()</code>方法：</p>
<pre><code class="language-python">&gt;&gt;&gt; aTuple = (132, 'Hello', {'a':1, 'b':2})
&gt;&gt;&gt; b = str(aTuple)
&gt;&gt;&gt; b
&quot;(132, 'Hello', {'b': 2, 'a': 1})&quot;
&gt;&gt;&gt; c = eval(b)
&gt;&gt;&gt; c
(132, 'Hello', {'b': 2, 'a': 1})
&gt;&gt;&gt; type(c)
&lt;class 'tuple'&gt;
</code></pre>
<p><code>eval()</code>的实现原理在于执行该字符串（如上例中的b），这样可能带来很大的风险：字符串可能中含有某些危险的命令，在执行时给用户带来极大的危害。</p>
<h2>Json</h2>
<p>it will append later...</p>
<h2>shelve</h2>
<p>it will append later...</p>
<h2>struct</h2>
<p>在Python对于二进制数据的打包操作，可以使用<code>struct</code>模块</p>
<p>能够构造和解析打包的二进制数据，它能将文件中的字符串解读为二进制文件。</p>
<p>打包二进制数据：</p>
<pre><code class="language-python">&gt;&gt;&gt; fp = open('pickle.txt', 'wb')
&gt;&gt;&gt; import struct
&gt;&gt;&gt; b = struct.pack('&gt;i4sh', 7, 'spam'.encode('utf-8'), 8)
&gt;&gt;&gt; b
b'\x00\x00\x00\x07spam\x00\x08'
&gt;&gt;&gt; fp.write(b)
10
&gt;&gt;&gt; fp.close()
</code></pre>
<p>解析：</p>
<pre><code class="language-python">&gt;&gt;&gt; with open('pickle.txt', 'rb') as f:
	data = f.read()
	print('data: ', data)
	values = struct.unpack('&gt;i4sh', data)
	print('values:', values)

	
data:  b'\x00\x00\x00\x07spam\x00\x08'
values: (7, b'spam', 8)
</code></pre>
<p>在上处，需要注意的是：
b = struct.pack('&gt;i4sh', 7, 'spam', 8)
会报如下错误：
struct.error: argument for 's' must be a bytes object</p>
<h3>数据构造格式</h3>
<p>it will append later</p>
<h1>|Character|Byte order|Size|Alignment|
|---|---|---|---|
| @ |native|native|native|
| = |native|standard|none|
| &lt; |little-endian|standard|none|
| &gt; |big-endian|standard|none|
| ! |network(=big-endian)|standard|none|</h1>
<table>
<thead>
<tr><th>可选的字符串</th><th>解释</th></tr>
</thead>
<tbody>
<tr><td>'strict'</td><td>直接抛出ValueError异常，默认操作</td></tr>
<tr><td>'ignore'</td><td>忽略异常</td></tr>
<tr><td>'replace'</td><td>将异常处替换为标识符，如？</td></tr>
<tr><td>'surrogateescape'</td><td>will represent any incorrect bytes as code points in the Unicode Private Use Area ranging from U+DC80 to U+DCFF. These private code points will then be turned back into the same bytes when the surrogateescape error handler is used when writing data. This is useful for processing files in an unknown encoding.</td></tr>
<tr><td>'xmlcharrefreplace'</td><td>is only supported when writing to a file. Characters not supported by the encoding are replaced with the appropriate XML character reference &amp;#nnn;.</td></tr>
<tr><td>'backslashreplace'</td><td>replaces malformed data by Python’s backslashed escape sequences.</td></tr>
<tr><td>'namereplace'</td><td>(also only supported when writing) replaces unsupported characters with \N{...} escape sequences.</td></tr>
</tbody>
</table>
<h4>newline</h4>
<p>决定行结束符，可选参数:</p>
<ul>
<li>None</li>
<li>''</li>
<li>'\n'</li>
<li>'\r'</li>
<li>'\r\n'</li>
</ul>
<h4>closefd</h4>
<p>it will be append later...</p>
<h4>opener</h4>
<p>it will be append later...</p>
<h2>pickle</h2>
<p>pickle愿意为“泡菜”，持久存储的意思。</p>
<blockquote>
<blockquote>
<blockquote>
<blockquote>
<blockquote>
<blockquote>
<blockquote>
<p>2e5f376e61f7f0fde18b3bdf5d76cf1fa922016f</p>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
<table>
<thead>
<tr><th>Format</th><th>C Type</th><th>Python</th><th>type</th><th>Standard</th><th>size</th><th>Notes</th></tr>
</thead>
<tbody>
<tr><td>x</td><td>pad</td><td>byte</td><td>no</td><td colspan="5">value</td></tr>
<tr><td>c</td><td>char</td><td>bytes</td><td>of</td><td>length</td><td>1</td><td colspan="3">1</td></tr>
<tr><td>b</td><td>signed char</td><td>integer</td><td>1</td><td>(1),(3)</td></tr>
<tr><td>B</td><td>unsigned char</td><td>integer</td><td>1</td><td>(3)</td></tr>
<tr><td>?</td><td>_Bool</td><td>bool</td><td>1</td><td>(1)</td></tr>
<tr><td>h</td><td>short integer</td><td>2</td><td>(3)</td></tr>
<tr><td>H</td><td>unsigned short</td><td>integer</td><td>2</td><td>(3)</td></tr>
<tr><td>i</td><td>int</td><td>integer</td><td>4</td><td>(3)</td></tr>
<tr><td>I</td><td>unsigned int</td><td>integer</td><td>4</td><td>(3)</td></tr>
<tr><td>l</td><td>long</td><td>integer</td><td>4</td><td>(3)</td></tr>
<tr><td>L</td><td>unsigned long</td><td>integer</td><td>4</td><td>(3)</td></tr>
<tr><td>q</td><td>long</td><td>long</td><td>integer</td><td>8</td><td>(2),</td><td>(3)</td></tr>
<tr><td>Q</td><td>unsigned long</td><td>long</td><td>integer</td><td>8</td><td>(2),</td><td>(3)</td></tr>
<tr><td>n</td><td>ssize_t</td><td colspan="3">integer</td><td>(4)</td></tr>
<tr><td>N</td><td>size_t</td><td colspan="3">integer</td><td>(4)</td></tr>
<tr><td>f</td><td>float</td><td>float</td><td>4</td><td>(5)</td></tr>
<tr><td>d</td><td>double</td><td>float</td><td>8</td><td>(5)</td></tr>
<tr><td>s</td><td>char[]</td><td colspan="5">bytes</td></tr>
<tr><td>p</td><td>char[]</td><td colspan="5">bytes</td></tr>
<tr><td>P</td><td>void</td><td>*</td><td colspan="3">integer</td><td>(6)</td></tr>
</tbody>
</table>
