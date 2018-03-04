<%@ page contentType="text/html; charset=UTF-8" %><h2>title: Matlab的帮助信息
date: 2016/1/29 13:31:14
tags: Matlab</h2>
<h3>document</h3>
<p>我们知道现在的成熟的GUI软件基本上有一个获取使用帮助的功能，那就是<code>F1</code>帮助键，在<code>F1</code>到<code>F12</code>中，帮助键就直接拿下了第一个位置，说明了其常用和关键。</p>
<!--more-->
<p>在默认情况下，按下F1会直接打开帮助浏览器，跳出如下界面：
<img src="${pageContext.request.contextPath}/\img\matlab\gethelp1.png" alt="图1. 帮助浏览器" />
在输入框中输入想寻求帮助的关键字，点击<code>Search</code>即可。</p>
<p>搜索到的相关文章将会高亮关键字，以供用户阅读。</p>
<p>指定函数的帮助页面将提供如下帮助：</p>
<ul>
<li>函数说明</li>
<li>函数使用语法及其说明</li>
<li>函数使用示例</li>
<li>函数输出参数及其说明</li>
<li>函数输出参数及其说明</li>
<li>其他相关说明信息</li>
<li>相关的其他函数</li>
</ul>
<p><img src="${pageContext.request.contextPath}/\img\matlab\gethelp2.png" alt="图2. 函数帮助页面" /></p>
<blockquote>
<p>这里的页面中会显示帮助页面所在的分组或类等上下文关系，用户可以回溯查看，得到更多的帮助信息。</p>
</blockquote>
<p>选中想要查询的函数名，按下<code>F1</code>进行查询，应该是比较有效的查询方式了。</p>
<p>在代码开发或其他Matlab任务运行期间，常开帮助浏览器会是一个好习惯。</p>
<h3>console</h3>
<p>在<code>Command Window</code>中键入<code>doc</code>也能打开帮助浏览器，但用户还可以键入<code>doc</code>+file_name，此处的file_name是指帮助浏览器中显示名为file_name的函数的参考页面，所以键入如下命令，将直接打开上述图2的帮助窗口：</p>
<pre><code class="language-bash">$ doc imread
</code></pre>
<h5>help</h5>
<p>使用<code>help</code>指令也是很常见的，与<code>doc</code>不同的是，<code>help</code>会将结果作为标准输出在Command Window输出。
键入如下命令(这命令有点意思)可查看<code>help</code>命令的相关信息</p>
<pre><code class="language-bash">$ help help
</code></pre>
<p><code>help</code>如单词本身所言，会列出全部基本<code>primary</code>信息的文章\话题<code>topic</code>。每个话题都在MATLAB搜索路径中对应一个文件夹名。</p>
<p>使用<code>help name</code>可以显示用name指定的函数相关帮助信息，像函数<code>function</code>、操作符<code>operator symbol</code>、方法<code>method</code>、类<code>class</code>或工具<code>toolbox</code>等，name还可以是带路径的。</p>
<p>有些类需要指定包名，事件<code>event</code>、属性<code>property</code>和某些方法<code>method</code>需要指定类名。那么就用<code>.</code>进行连接即可，方式如下：</p>
<ul>
<li>help CLASSNAME.NAME</li>
<li>help PACKAGENAME.CLASSNAME</li>
<li>help PACKAGENAME.CLASSNAME.NAME</li>
</ul>
<p>注意，Matlab中的帮助文档是以“标识符”进行组织的，所以这里的NAME既是目录名也是一个函数名。那么有个问题是如果一个NAME出现在多个目录下，会怎么样？Matlab出于效率考虑，会在找到第一个NAME之后放弃查找，直接返回该NAME的相关帮助信息。</p>
<p>有些需要注意的地方：</p>
<ul>
<li>某些函数是以大写表示特殊，但在打码时，我们习惯使用小写。但这无需担心，因为help命令会忽略大小写进行查找。</li>
</ul>
<pre><code class="language-bash">help close           % help for the CLOSE function
help database/close  % help for CLOSE in the Database Toolbox
help database        % list of functions in the Database Toolbox 
                     % and help for the DATABASE function
help containers.Map.isKey   % help for isKey method
</code></pre>
<blockquote>
<p>如果提示太长了，那么help打出来的信息会直接“刷屏”，你可以先键入<code>more on</code>，再输入<code>help</code>。</p>
</blockquote>
<h5>Ways to Get Function Help</h5>
<p>Each MATLAB® function has supporting documentation that includes examples and describes the function inputs, outputs, and calling syntax. This table describes ways to access that documentation.</p>
<table>
<thead>
<tr><th>Type of Help</th><th>How to Access</th><th>Example or Icon</th></tr>
</thead>
<tbody>
<tr><td>Reference page in Help browser</td><td>Use the doc command.<br/>— or —<br/>Select a function name in the Editor, Command Window, or Help browser; right-click; and then select Help on Selection.</td><td>doc mean</td></tr>
<tr><td>Function syntax hints in Command Window</td><td>After you type an open parenthesis for function inputs, pause or press <strong>Ctrl + F1</strong>.</td><td>mean(</td></tr>
<tr><td>Abbreviated help text in Command Window</td><td>Use the help command.</td><td>help mean</td></tr>
<tr><td>Function browser in Command Window</td><td>Click the function icon to the left of the command prompt.</td><td><img src="/img/matlab/gethelp3.png"></td></tr>
<tr><td>Complete documentation in Help browser</td><td>Click the Help button on the quick access toolbar or on the Home tab.<br/>— or —<br/>Enter search terms in the Search Documentation box.</td><td><img src="/img/matlab/gethelp4.png"></td></tr>
</tbody>
</table>
<h3>help folder</h3>
<p>帮助浏览器中的全部帮助页面都是静态html页面，它们可在<code>MATLAB\MATLAB Production Server\R2015a\help\matlab</code>中找到并依照进行所属分组进行分类。</p>
<h3>website</h3>
<p>在Matlab，查找<a href="http://www.mathworks.com">http://www.mathworks.com</a>
就是去matlab官网MathWorks查找函数的帮助文档</p>
<p>mathworks网站中包含了一个大数据库，这个数据库有大量的帮助材料、有用的函数与其他资源，<strong>而这些内容可能为包含到本地文件中</strong>。</p>
<p>如上小节所说help浏览器实际上是使用了本地文件的，这就出现了帮助文件可能过期的问题，那么久需要将帮助的源改为在线的最新帮助了。操作如下：</p>
<ul>
<li>Perference &gt; MATLAB &gt; Help 进行帮助页面的配置界面</li>
<li>Documentation Location 中修改为Web, on mathworks.com</li>
</ul>
<p>也可点击 help 窗口左上方，的齿轮按钮以后，弹出设置窗口然后在那里面更改。</p>
<blockquote>
<p>当然这也意味着你没法享受本地存取的访问速度了。</p>
</blockquote>
<h3>contribute</h3>
<p>我认为，学习是为了致用，而贡献<code>contribute</code>是最直接的方式。</p>
