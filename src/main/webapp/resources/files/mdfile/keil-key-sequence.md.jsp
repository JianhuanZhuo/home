<%@ page contentType="text/html; charset=UTF-8" %><p>μVision中的Key Sequence 中文。</p>
<blockquote>
<p>注：这里的Key Sequence 译作“键序列”，可能有些欠妥。</p>
</blockquote>
<!--more-->
<p>使用键序列来传递µVision参数给外部程序。键序列是键代码和文件代码的组合。键序列用于如<strong>Tools</strong>,<strong>SVCS</strong>, <strong>Options for Target — User</strong>对话框或命令行等的场合。下面是一些使用规则：</p>
<ul>
<li>命令行中用到键代码时，需要重复它。如：使用到符号 $, #, %, @, ~, ^时，用$$, ##, %%, @@, ~~, ^^代替。</li>
<li>文件夹名中包含了一些特殊字符(空格, ~, 或者 #)时，使用双引号括起来。</li>
</ul>
<p>下面的表格中列出了键代码和文件代码：</p>
<table>
<thead>
<tr><th>Key Code 键代码</th><th>说明</th></tr>
</thead>
<tbody>
<tr><td>%</td><td>带扩展的文件名 (PROJECT1.UVPROJ)</td></tr>
<tr><td>#</td><td>带完整路径的文件名 (C:\MYPROJECT\PROJECT1.UVPROJ)</td></tr>
<tr><td>@</td><td>无路径和扩展的文件名 (PROJECT1)</td></tr>
<tr><td>$</td><td>文件的路径名。 路径名以反斜杠结束。 比如说， $P 会得到 C:\MYPROJECT.</td></tr>
<tr><td>!</td><td>相对于当前文件夹的相对路径，带拓展的文件名 (.\SRC\TEST.C)</td></tr>
<tr><td>~ 1</td><td>当前光标位置所在的行号</td></tr>
<tr><td>^ 1</td><td>当前光标位置所在的列号</td></tr>
</tbody>
</table>
<table>
<thead>
<tr><th>File Code文件代码</th><th>说明</th></tr>
</thead>
<tbody>
<tr><td>$D</td><td>在设别数据库中选择的设备名。</td></tr>
<tr><td>E</td><td>焦点所在文件的文件名。</td></tr>
<tr><td>F</td><td>依赖于具体的上下文，这个文件代码将返回：<ul><li>在工程窗口中选择的文件</li><li>当激活状态的编辑文件</li><li>当前构建进程正在编译的文件</li></ul></td></tr>
<tr><td>H</td><td>HEX文件名 (PROJECT1.H86).</td></tr>
<tr><td>$J</td><td>编译包含的文件夹。编译基础文件夹在 Project — Manage — Project Items — Folder/Extensions - ARMCC Folder中有列出。这个路径由Options for Target - Code Generation - ARM Compiler决定。</td></tr>
<tr><td>K</td><td>开发工具根目录的绝对路径(C:\Keil)，这个不是在键代码中定义的。</td></tr>
<tr><td>L</td><td>连接器输出文件。通常这个可执行文件是用于调试的。 (PROJECT1).</td></tr>
<tr><td>$M</td><td>CPU版本号</td></tr>
<tr><td>P</td><td>当前工程文件名</td></tr>
<tr><td>X</td><td>µVision可执行程序文件(C:\Keil\UV4\UV4.EXE).。Works for For Key Code %, # @.</td></tr>
<tr><td>$X</td><td>在Options for Target — Target — XTAL中定义的晶振时钟频率（MHz）</td></tr>
<tr><td>^X</td><td>在Options for Target — Target — XTAL中定义的晶振时钟频率（kHz）</td></tr>
</tbody>
</table>
<table>
<thead>
<tr><th>使用SVCS时用到的文件代码</th><th>说明</th></tr>
</thead>
<tbody>
<tr><td>Q 2</td><td>临时文件名 (Comment).</td></tr>
<tr><td>R 2</td><td>版本号(Revision).</td></tr>
<tr><td>C 2</td><td>检查点字符串 (Check Point).</td></tr>
<tr><td>I 2</td><td>工程识别字符串 (Project Ident).</td></tr>
<tr><td>U 2</td><td>用户名(User Name).</td></tr>
<tr><td>V 2</td><td>数据库文件名字符串(Database).</td></tr>
</tbody>
</table>
<table>
<thead>
<tr><th>使用合并工具时的文件代码</th><th>说明</th></tr>
</thead>
<tbody>
<tr><td>.</td><td>A merge tool gives you the opportunity to merge the application-specific configuration settings from the previous version into the current version. Specify a merge tool with Tools - Configure Merge Tool.</td></tr>
<tr><td>$current</td><td>Is the file as copied from the PACK with default configuration options.</td></tr>
<tr><td>$previous</td><td>备份文件的文件名，增加数字？。Is the back-up file filename.increment number</td></tr>
</tbody>
</table>
<h3>环境变量</h3>
<p>你可以通过环境变量传递路径给外部程序。这是相应的对话框文档中明确描述的。环境变量必须用花括号（{}）括起来举个例子，你用下面的方式定义了一个环境变量：</p>
<pre><code class="language-bash">SET ProgramFiles(x86)=C:\Program Files (x86).
</code></pre>
<p>你可以在对话框中用下面的方式使用环境变量</p>
<pre><code class="language-bash">{ProgramFiles(x86)}
</code></pre>
<h3>需要注意的：</h3>
<ul>
<li>组合中只能用文件代码F。</li>
<li>组合中只能用键代码%。</li>
<li>你可以在 Start External Tools 和 Using the SVCS Menu章节找到一些例子。</li>
</ul>
<p>原文链接： <a href="http://www.keil.com/support/man/docs/uv4/uv4_ut_keysequence.htm">http://www.keil.com/support/man/docs/uv4/uv4_ut_keysequence.htm</a></p>
