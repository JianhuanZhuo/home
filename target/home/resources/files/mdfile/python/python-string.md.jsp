<%@ page contentType="text/html; charset=UTF-8" %><p><code>string</code>这种内建类型十分常用，这里记录下我在使用字符串时的一些心得。</p>
<!--more-->
<h2>1. construction</h2>
<p>在<code>python</code>中，有如下三种方式创建字符串：</p>
<pre><code class="language-python">'Alpha'
&quot;Bravo&quot;
str(3)      # str()方法，将其他类型的变量转换为str对象
</code></pre>
<ul>
<li>对于使用双引号的方式，有一点需要注意的是在单引号中嵌套双引号，或在单引号中嵌套双引号，将使用前者作为字符串的表示符号，而后者则作为字符串的内容。</li>
<li>可以使用连续三个单引号或三个双引号表示多行的字符串，其中换行符将被转义为<code>\n</code>，注意到这里的换行符是<strong>与平台无关</strong>的<code>\n</code>。</li>
</ul>
<pre><code class="language-bash">&gt;&gt;&gt; mystr = 'one\'two'
&gt;&gt;&gt; mystr
&quot;one'two&quot;
&gt;&gt;&gt; mystr = &quot;one\&quot;two&quot;
&gt;&gt;&gt; mystr
'one&quot;two'
&gt;&gt;&gt; mystr = &quot;one'two&quot;
&gt;&gt;&gt; mystr
&quot;one'two&quot;
&gt;&gt;&gt; mystr = 'one&quot;two'
&gt;&gt;&gt; mystr
'one&quot;two'


longstr = &quot;&quot;&quot;one two one two one two
one two one two
one two
&quot;&quot;&quot;
&gt;&gt;&gt; longstr
'one two one two one two\none two one two\none two\n'
</code></pre>
<ul>
<li>如果字符串内部既包含'又包含&quot;可以用转义字符\来标识<code>'I\'m \&quot;OK\&quot;!'</code></li>
<li>如果字符串里面有很多字符都需要转义，Python允许用r''表示''内部的字符串默认不转义<code>r'\\\t\\'</code>表示<code>\\\t\\</code></li>
</ul>
<p><strong>Note:</strong></p>
<blockquote>
<p>在Python中，在模块/.py文件中以三双引号<code>&quot;&quot;&quot;</code>开头有其他的意思，它表示作为该模块/文件的说明文档。在函数与类中也有相同的情况。</p>
</blockquote>
<h3>1.1. think in construction</h3>
<p>对于如下的语句，<code>python</code>解释器做了什么？</p>
<pre><code class="language-python">str1 = 'something there'
</code></pre>
<p>个人理解，解释将作如下两件事情：</p>
<ul>
<li>在内存中创建了一个<code>'something there'</code>的字符串；</li>
<li>在内存中创建了一个名为str1的变量，并把它指向<code>'something there'</code>。</li>
</ul>
<p>那么对如下的赋值的理解应该是：</p>
<ul>
<li>在<code>python</code>中<code>str</code>数据类型的变量仅存储有对象的引用，那么<code>str1</code>中只有对字符串<code>'something there'</code>的引用</li>
<li>对<code>str2</code>进行赋值为<code>str</code>时，只将<code>'something there'</code>的引用赋值给<code>str2</code></li>
</ul>
<pre><code class="language-python">str2 = str1
</code></pre>
<h3>1.2. 常见的字符串常量和表达式</h3>
<table>
<thead>
<tr><th>操作</th><th>解释</th></tr>
</thead>
<tbody>
<tr><td>s1 = ''</td><td>空字符串</td></tr>
<tr><td>s2 = &quot;spam's&quot;</td><td>双引号</td></tr>
<tr><td>block = &quot;&quot;&quot;...&quot;&quot;&quot;</td><td>三重引号块</td></tr>
<tr><td>s3 = r'\temp\spam'</td><td>Raw字符串</td></tr>
<tr><td>s4 = u'spam'</td><td>Unicode字符串</td></tr>
<tr><td>s1 + s2</td><td>合并字符串</td></tr>
<tr><td>s2 * 3</td><td>重复字符串</td></tr>
<tr><td>s2[i]</td><td>索引</td></tr>
<tr><td>s2[i:j]</td><td>分片</td></tr>
<tr><td>s2[i:j:k]</td><td>带步进的分片</td></tr>
<tr><td>len(s1)</td><td>求长度</td></tr>
<tr><td>&quot;a %s parrot&quot; % type</td><td>字符串格式化</td></tr>
<tr><td>s2.find('pa')</td><td>搜索</td></tr>
<tr><td>s2.rstrip()</td><td>移除空格</td></tr>
<tr><td>s2.replace('pa', 'xx')</td><td>替换</td></tr>
<tr><td>s1.split(',')</td><td>用展位符分隔</td></tr>
<tr><td>s1.isdigit()</td><td>内容测试</td></tr>
<tr><td>s1.lower()</td><td>短信息转换</td></tr>
<tr><td>for x in s2</td><td>迭代</td></tr>
<tr><td>'spam' in s2</td><td>成员关系测试</td></tr>
</tbody>
</table>
<h3>1.3. 字符串反斜线字符</h3>
<table>
<thead>
<tr><th>转义</th><th>意义</th></tr>
</thead>
<tbody>
<tr><td>\newline</td><td>忽视（连续）</td></tr>
<tr><td>\</td><td>反斜线（保留\）</td></tr>
<tr><td>'</td><td>单引号（保留'）</td></tr>
<tr><td>&quot;</td><td>双引号（保留&quot;）</td></tr>
<tr><td>\a</td><td>响铃</td></tr>
<tr><td>\b</td><td>倒退</td></tr>
<tr><td>\f</td><td>换页</td></tr>
<tr><td>\n</td><td>换行</td></tr>
<tr><td>\r</td><td>返回</td></tr>
<tr><td>\t</td><td>水平制表符</td></tr>
<tr><td>\v</td><td>垂直制表符</td></tr>
<tr><td>\N{id}</td><td>Unicode数据库ID</td></tr>
<tr><td>\uhhhh</td><td>Unicode16位的十六进制值</td></tr>
<tr><td>\uhhhh...</td><td>Unicode32位的十六进制值</td></tr>
<tr><td>\xhh</td><td>十六进制值</td></tr>
<tr><td>\ooo</td><td>八进制值</td></tr>
<tr><td>\0</td><td>Null（不是字符串结尾）</td></tr>
<tr><td>\other</td><td>不转义（保留）</td></tr>
</tbody>
</table>
<h2>2. access element</h2>
<p>使用如下方法访问字符串的元素</p>
<pre><code class="language-python">first_letter  = the_string[0]
second_letter = the_string[1]
third_letter  = the_string[2]
</code></pre>
<h2>3. string operation</h2>
<p>在<code>string</code>类型中，如下是一个比较有意思的用法</p>
<pre><code class="language-python">print('spam'*3)
print('Spam'+'Spbm'+'Spcm')

结果是：
spamspamspam
SpamSpbmSpcm
</code></pre>
<h3>3.1 rearching and replacing</h3>
<p>返回第一个匹配子字符串的下标偏移量，若目标字符串中不匹配这样的字符串，返回<code>-1</code></p>
<p>这里的可以使用<code>in</code>操作符进行子串匹配，但有所不同的是它只返回<code>True</code>与<code>False</code>，这个可窥<code>python</code>语言优美与功能强大的一斑。</p>
<ul>
<li>与<code>find()</code>相关的<code>str.rfind(sub[, start[, end]])</code>，它将返回最右匹配子字符串的下标偏移量。</li>
<li>在<code>python</code>还有一个更加强大的工具，<code>re</code>模块，可以使用正则表达式匹配字符串。</li>
</ul>
<p>在子字符串寻找后进行替换，可以使用<code>str.replace(old, new[, count])</code>函数，它将使用<code>new</code>字符串替换字符串中所有的<code>old</code>子字符串，并可选的使用一个count参数限制替换次数。</p>
<h3>3.2. slice string</h3>
<p><code>python</code>中的高级特性，<strong>切片</strong>，对字符串的某一部分进行节选：
一个简单的例子为：</p>
<pre><code class="language-python">old_word = 'hello word'
new_word = old_word[1:len(old_word)]
print new_word

输出结果为：
ello word
</code></pre>
<p><code>python</code>中的切片与<code>R</code>、<code>Matlab</code>中的数组选择很类似，便于元素截取与操作，它的格式基本如下：
切片对象[start:end:step]</p>
<ul>
<li><strong>start</strong>表示切片的起始位置，可省略，省略默认为0</li>
<li><strong>end</strong>表示切片的结束位置（此位置上的元素不取），可省略，省略默认为-0，即start到最后全部元素
<ul>
<li>start、end的大小可为<strong>负</strong>，负表示倒数（从后往前数）。</li>
</ul>
</li>
<li><strong>step</strong>表示切片时从起始到结束元素的间隔，可省略，省略默步长认为1</li>
<li>切片方法对<code>tuple</code>、<code>list</code>也同样适用</li>
</ul>
<h4>3.2.1 profix and postfix</h4>
<p>这里记录对字符串取其子段的方法，这么做的原因有很多，如果是需要对指定一些字符（如删除前后端空白）进行取舍的话，上一节的方式便不是那么的使用了。</p>
<p><code>str.strip([chars])</code>
参数<code>chars</code>是前后删除字符的集合，可选项，默认为空白符。</p>
<pre><code class="language-bash">&gt;&gt;&gt; '   spacious   '.strip()
'spacious'
&gt;&gt;&gt; 'www.example.com'.strip('cmowz.')
'example'
</code></pre>
<ul>
<li>需要的是如果传入参数，那么空格将作为删除字符之一，除非空格也被显性的传入了。</li>
</ul>
<pre><code class="language-bash">&gt;&gt;&gt; 'www.example.com '.strip('cmowz.')
'example.com '
</code></pre>
<h4>3.2.2. 序列赋值</h4>
<p>在需要对字符串作“粉碎”时，有一个更好的做法是使用序列赋值：</p>
<pre><code class="language-python">&gt;&gt;&gt; s = &quot;Spam&quot;
&gt;&gt;&gt; a, b, c, d = s
&gt;&gt;&gt; a, b, c, d
('S', 'p', 'a', 'm')
</code></pre>
<p>在序列赋值时，是将字符串<code>s</code>以字符的方式全数切开的，所以需要都对应数量的变量接收切分结果，否则会导致报错：</p>
<pre><code class="language-python">&gt;&gt;&gt; a, b, c = s
SyntaxError: multiple statements found while compiling a single statement
</code></pre>
<p>但是，在字符串处理中如上的情况是十分常见的，如：程序接收某段字符串，需要使用c1，c2获取字符串的前两个字符，其他的字符划分到c3中，那么可取的做法是：</p>
<pre><code class="language-python">&gt;&gt;&gt; (c1, c2), c3 = s[:2], s[2:]
&gt;&gt;&gt; c1, c2, c3
('S', 'p', 'am')
</code></pre>
<h2>3.3. 字符串方法调用</h2>
<p>如下是字符串的常用方法，已按字典顺序排列：</p>
<table>
<thead>
<tr><th>函数</th><th>解释</th></tr>
</thead>
<tbody>
<tr><td>str.capitalize()</td><td></td></tr>
<tr><td>str.casefold()</td><td></td></tr>
<tr><td>str.center(width[, fillchar])</td><td></td></tr>
<tr><td>str.count(sub[, start[, end]])</td><td></td></tr>
<tr><td>str.encode(encoding=&quot;utf-8&quot;, errors=&quot;strict&quot;)</td><td></td></tr>
<tr><td>str.endswith(suffix[, start[, end]])</td><td></td></tr>
<tr><td>str.expandtabs(tabsize=8)</td><td></td></tr>
<tr><td>str.find(sub[, start[, end]])</td><td></td></tr>
<tr><td>str.format()</td><td></td></tr>
<tr><td>str.format_map(mapping)</td><td></td></tr>
<tr><td>str.index(sub[, start[, end]])</td><td></td></tr>
<tr><td>str.isalnum()</td><td>返回布尔值，内容检查，是否是数字或字母</td></tr>
<tr><td>str.isalpha()</td><td>返回布尔值，内容检查，是否是字母</td></tr>
<tr><td>str.isdecimal()</td><td></td></tr>
<tr><td>str.isdigit()</td><td>返回布尔值，内容检查，是否是数字</td></tr>
<tr><td>str.isidentifier()</td><td></td></tr>
<tr><td>str.islower()</td><td>返回布尔值，内容检查，是否是小写</td></tr>
<tr><td>str.isnumeric()</td><td></td></tr>
<tr><td>str.isprintable()</td><td></td></tr>
<tr><td>str.isspace()</td><td>返回布尔值，内容检查，是否是空白符</td></tr>
<tr><td>str.istitle()</td><td></td></tr>
<tr><td>str.isupper()</td><td></td></tr>
<tr><td>str.join(iterable)</td><td>返回一个替换后字符串，将str插入iterable中去</td></tr>
<tr><td>str.ljust(width[, fillchar])</td><td></td></tr>
<tr><td>str.lower()</td><td>返回修改后的字符串，将字符串中的字母小写</td></tr>
<tr><td>str.lstrip([chars])</td><td></td></tr>
<tr><td>str.maketrans()</td><td></td></tr>
<tr><td>str.maketrans(x[, y[, z]])</td><td></td></tr>
<tr><td>str.partition(sep)</td><td></td></tr>
<tr><td>str.replace(old, new[, count])</td><td>子串替换，返回一个替换后的字符串</td></tr>
<tr><td>str.rfind(sub[, start[, end]])</td><td></td></tr>
<tr><td>str.rindex(sub[, start[, end]])</td><td></td></tr>
<tr><td>str.rjust(width[, fillchar])</td><td></td></tr>
<tr><td>str.rpartition(sep)</td><td></td></tr>
<tr><td>str.rsplit(sep=None, maxsplit=-1)</td><td></td></tr>
<tr><td>str.rstrip([chars])</td><td></td></tr>
<tr><td>str.split(sep=None, maxsplit=-1)</td><td>返回分割后的字符串数组，指定sep子串作分割标准分割字符串，默认分隔符为空格，可选的指定最大分割数maxsplit</td></tr>
<tr><td>str.splitlines([keepends])</td><td></td></tr>
<tr><td>str.startswith(prefix[, start[, end]])</td><td></td></tr>
<tr><td>str.strip([chars])</td><td></td></tr>
<tr><td>str.swapcase()</td><td></td></tr>
<tr><td>str.title()</td><td></td></tr>
<tr><td>str.translate()</td><td></td></tr>
<tr><td>str.translate(table)</td><td></td></tr>
<tr><td>str.upper()</td><td></td></tr>
<tr><td>str.upper()</td><td></td></tr>
<tr><td>str.zfill(width)</td><td></td></tr>
</tbody>
</table>
<h3>3.3.1 字符串比较</h3>
<p>用&quot;==&quot; 符号比较两个字符串</p>
<p>注意：</p>
<ol>
<li>== 用来判断两个对象的值是否相等</li>
<li>is 相等代表两个对象的 id 相同（从底层来看的话，可以看作引用同一块内存区域）</li>
</ol>
<h2>4. Format String Syntax</h2>
<p>字符串格式化语法<code>Format String Syntax</code>
在Python中使用 % 符号对字符串的值进行格式化。</p>
<ol>
<li>在%操作符的左侧放置一个需要进行格式化的字符串，这个字符串带有一个或多个嵌入的转换目标，都以%开头（例如 %d 或其他参考4.2.节）</li>
<li>在%操作符右侧放置一个对象（多个，在括号内），这些对象将会插入到左侧想让Python进行格式化字符串的（或多个）转换目标的位置上去。</li>
</ol>
<h3>4.1 转换格式</h3>
<p>一般的转换格式如下：
%[(name)][flags][width][.precision]code
其中：</p>
<table>
<thead>
<tr><th>参数</th><th>解释</th></tr>
</thead>
<tbody>
<tr><td>name</td><td>字典的键</td></tr>
<tr><td>flags</td><td>标志位，(-)左对齐，(+)正负号，补零(0)</td></tr>
<tr><td>width</td><td>宽度，所占字符显示的宽度</td></tr>
<tr><td>precision</td><td>精度，或者说小数点后的位数</td></tr>
</tbody>
</table>
<h3>4.2. 字符串格式化代码</h3>
<table>
<thead>
<tr><th>代码</th><th>意义</th></tr>
</thead>
<tbody>
<tr><td>%s</td><td>字符串（或任意对象）</td></tr>
<tr><td>%r</td><td>s，但使用repr，而不是str</td></tr>
<tr><td>%c</td><td>字符</td></tr>
<tr><td>%d</td><td>十进制（整数）</td></tr>
<tr><td>%i</td><td>整数</td></tr>
<tr><td>%u</td><td>无符号整数</td></tr>
<tr><td>%o</td><td>八进制整数</td></tr>
<tr><td>%x</td><td>十六进制整数</td></tr>
<tr><td>%X</td><td>x，但打印大写(A-Z)</td></tr>
<tr><td>%e</td><td>浮点指数</td></tr>
<tr><td>%E</td><td>e，但打印大写</td></tr>
<tr><td>%f</td><td><strong>浮点十进制</strong></td></tr>
<tr><td>%g</td><td>浮点e或f</td></tr>
<tr><td>%G</td><td>浮点E或f</td></tr>
<tr><td>%%</td><td>常量%</td></tr>
</tbody>
</table>
<h3>4.3. 基于字典的字符串格式化</h3>
<p>这里先提供一个比较和蔼可亲的例子：</p>
<pre><code class="language-python">&gt;&gt;&gt; '%(n)d and %(x)d' % {'x':1, 'n':2}
'2 and 1'
</code></pre>
<p>如上的例子中可以看到几点不一样的：</p>
<ul>
<li>在格式化中使用到了 4.1. 提到的字典的键；</li>
<li>% 操作符后带字典而非元组；</li>
<li>在 % 操作符左侧的转换目标使用格式化中的字典进行插入。</li>
</ul>
<h2>5. Encode</h2>
<p>在字符串的处理中不免需要面对字符串<strong>编码</strong><code>encode</code>格式的问题。
<code>python</code>提供了<code>ord()</code>函数获取字符的整数表示，<code>chr()</code>函数把编码转换为对应的字符</p>
<pre><code class="language-bash">&gt;&gt;&gt; ord('A')
65
&gt;&gt;&gt; ord('中')
20013
&gt;&gt;&gt; chr(66)
'B'
&gt;&gt;&gt; chr(25991)
'文'
</code></pre>
<p>字符串通过<code>encode()</code>方法可以编码为指定的bytes，但需注意的是：</p>
<ul>
<li><code>ASCII</code>码是的<code>UTF-8</code>等<code>Unicode</code>字符串集的子集，ASCII字符可以使用<code>Unicode</code>表示</li>
<li>非<code>ASCII</code>字符或非<code>ACSII</code>字符与<code>ASCII</code>字符的混合字符串不能表示为<code>ASCII编</code>码形式</li>
<li>在<code>bytes</code>中，无法显示为ASCII字符的字节，用<code>\x##</code>显示。</li>
</ul>
<pre><code class="language-bash">&gt;&gt;&gt; 'python'.encode('ascii')
b'python'
&gt;&gt;&gt; '学习'.encode('utf-8')
b'\xe5\xad\xa6\xe4\xb9\xa0'
&gt;&gt;&gt; '学习python'.encode('utf-8')
b'\xe5\xad\xa6\xe4\xb9\xa0python'
&gt;&gt;&gt; '学习python'.encode('ascii')
Traceback (most recent call last):
  File &quot;&lt;pyshell#5&gt;&quot;, line 1, in &lt;module&gt;
    '学习python'.encode('ascii')
UnicodeEncodeError: 'ascii' codec can't encode characters in position 0-1: ordinal not in range(128)
&gt;&gt;&gt; 
</code></pre>
<h3>5.1. Decode</h3>
<p>与编码<code>encode</code>对应的是<strong>解码</strong><code>decode</code>。我们从网络或磁盘上读取了字节流，那么读到的数据就是<code>bytes</code>，这些数据需要进行解码才能转变成便于阅读的字符串：</p>
<pre><code class="language-bash">&gt;&gt;&gt; b'\xe4\xb8\xad\xe6\x96\x87'.decode('utf-8')
'中文'
</code></pre>
