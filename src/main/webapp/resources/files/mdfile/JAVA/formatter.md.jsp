<%@ page contentType="text/html; charset=UTF-8" %><p>Java 1.5 新增一个有意思的类 <code>java.util.Formatter</code>，用于格式化文本输出。</p>
<!--more-->
<p>该类定位为格式化器工具。</p>
<h3>构造函数</h3>
<pre><code class="language-java">Formatter() 
Formatter(Appendable a) 
Formatter(Appendable a, Locale l) 
Formatter(File file) 
Formatter(File file, String csn) 
Formatter(File file, String csn, Locale l) 
Formatter(Locale l) 
Formatter(OutputStream os) 
Formatter(OutputStream os, String csn) 
Formatter(OutputStream os, String csn, Locale l) 
Formatter(PrintStream ps) 
Formatter(String fileName) 
Formatter(String fileName, String csn) 
Formatter(String fileName, String csn, Locale l) 
</code></pre>
<p>格式化器有如上 13 个构造函数，虽多但都表示指定某些参数初始化，其中</p>
<ol>
<li><code>Appendable a</code> \ <code>File file</code> \ <code>OutputStream os</code> \ <code>PrintStream ps</code> \ <code>String fileName</code> 用于指定输出</li>
<li><code>Locale l</code> \  <code>String csn</code> 用于指定输入所需的语言和字符集</li>
<li>不指定的构造函数 <code>Formatter()</code> 使用默认参数并新建一个 <code>StringBuilder</code> 作为输出，调用格式化器的 <code>toString()</code> 方法可获得格式化后的结果。</li>
</ol>
<h3>基本方法</h3>
<pre><code class="language-java">// 获得输入信息
Locale locale() 
Appendable out() 
// 流操作
void close() 
void flush() 
IOException ioException() 
</code></pre>
<p>此处需要注意的是，每次操作都会检查已正确打开输出流，若无输出或未能正常打开则会抛出 <code>java.util.FormatterClosedException</code></p>
<h3>格式化</h3>
<p>Formatter format(Locale l, String format, Object... args)
Formatter format(String format, Object... args)</p>
<p>若格式化字符串 <code>format</code> 写不正确或抛出</p>
<blockquote>
<p>%[argument_index$][flags][width][.precision]conversion</p>
</blockquote>
<table>
<thead>
<tr><th>参数</th><th>说明</th></tr>
</thead>
<tbody>
<tr><td>argument_index</td><td>使用 args 列表中参数的下标，后面带 <code>$</code> 作为分割，无参数则省去</td></tr>
<tr><td>flags</td><td>类型标识</td></tr>
<tr><td>width</td><td>十进制整数，指明写入输出流的最小字符宽度</td></tr>
<tr><td>precision</td><td>精度，非负十进制整数</td></tr>
<tr><td>conversion</td><td>一个格式化方式字符，若为时间则还需在前面加一个<code>t</code>或<code>T</code></td></tr>
</tbody>
</table>
<p><code>conversion</code> 类似于 C 语言中 sprintf 所使用的标志约定，但这里将它增强了，这里分了几种种类：</p>
<ol>
<li>General - 一般类型</li>
<li>Character - 可能表示为字符的类型，如：char、Character、byte、Byte、short 和 Short。int 类型仅 Character.isValidCodePoint(int) 为真时可使用。</li>
<li>Integral - 整型数，如：byte、Byte、short、Short、int、Integer、long、Long 和 BigInteger。</li>
<li>Floating Point - 浮点数，如：float、Float、double、Double and BigDecimal。</li>
<li>Date/Time - 时间数，如：long、Long、Calendar、Date 和 TemporalAccessor。</li>
</ol>
<h3>转义表</h3>
<table>
<thead>
<tr><th>转义符</th><th>可用参数类型</th><th>说明</th></tr>
</thead>
<tbody>
<tr><td><code>b</code></td><td>General</td><td>参数 arg 空转义为&quot;false&quot;，若为 Boolean 或 boolean 类型，转义为 <code>String.valueOf(arg)</code>，否则转义为 &quot;true&quot;</td></tr>
<tr><td><code>h</code></td><td>General</td><td>参数 arg 空转义为 &quot;null&quot;，否则转义为 <code>Integer.toHexString(arg.hashCode)</code></td></tr>
<tr><td><code>s</code></td><td>General</td><td>参数 arg 空转义为 &quot;null&quot;，若对象实现 <code>Formattable</code> 接口则调用 <code>arg.formatTo</code>，否则转义为 <code>arg.toString()</code></td></tr>
<tr><td><code>c</code></td><td>Character</td><td>转义为 Unicode 字符</td></tr>
<tr><td><code>d</code> <code>o</code> <code>x</code></td><td>Integral</td><td>分别转义为十、八、十六进制整型数</td></tr>
<tr><td><code>e</code> <code>g</code></td><td>Floating</td><td>转义为科学表示法的十进制数</td></tr>
<tr><td><code>f</code></td><td>Floating</td><td>转义为十进制浮点数</td></tr>
</tbody>
</table>
<p>其中在转换时时间的转义表如下：</p>
<table>
<thead>
<tr><th>转义符</th><th>说明</th></tr>
</thead>
<tbody>
<tr><td><code>l</code> <code>k</code> <code>I</code> <code>H</code></td><td>12、24小时制小时，后两个带 <code>0</code></td></tr>
<tr><td><code>M</code> <code>S</code> <code>L</code> <code>N</code></td><td>分、秒、毫秒、纳秒</td></tr>
<tr><td><code>s</code></td><td>秒级时间戳</td></tr>
<tr><td><code>Q</code></td><td>毫秒级时间戳</td></tr>
<tr><td><code>B</code> <code>b</code></td><td>月份名，小写为单词简写</td></tr>
<tr><td><code>m</code></td><td>月份</td></tr>
<tr><td><code>A</code> <code>a</code></td><td>星期名，小写为单词简写</td></tr>
<tr><td><code>d</code> <code>e</code></td><td>日期</td></tr>
<tr><td><code>j</code></td><td>该年第几天</td></tr>
</tbody>
</table>
