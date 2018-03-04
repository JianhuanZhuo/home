<%@ page contentType="text/html; charset=UTF-8" %><p>最近在给自己的网站写个博客系统，需要将之前写的 Markdown 渲染成 HTML，考虑到需要提取 Markdown 文本的内容做目录，所以不考虑用 JS 下的 MD2HTML，而是后台转。找到个老外推荐的解析库 pegdown。</p>
<!--more-->
<p>项目 github：<a href="https://github.com/sirthias/pegdown">https://github.com/sirthias/pegdown</a>
API 文档：<a href="http://sirthias.github.com/pegdown/api">http://sirthias.github.com/pegdown/api</a></p>
<h2>maven 引入</h2>
<pre><code class="language-xml">&lt;!-- https://mvnrepository.com/artifact/org.pegdown/pegdown --&gt;
&lt;!-- java markdown 预处理库--&gt;
&lt;dependency&gt;
    &lt;groupId&gt;org.pegdown&lt;/groupId&gt;
    &lt;artifactId&gt;pegdown&lt;/artifactId&gt;
    &lt;version&gt;1.6.0&lt;/version&gt;
&lt;/dependency&gt;
</code></pre>
<h2>用法</h2>
<p><code>pegdown</code> 用法比较简单：创建一个 <code>PegDownProcessor</code> 对象，调用 <code>markdownToHtml()</code> 方法就可以将传入 Markdown 转成 HTML 字符串。如果需要自定义渲染 HTML 链接，则在调用时提供一个 <code>LinkRenderer</code> 对象即可。</p>
<p>用户也可以解析 Markdown 后按自定义的格式 (如 XML) 输出：通过调用 <code>PegDownProcessor</code> 对象的 <code>parseMarkdown()</code> 方法返回该文档抽象语法树的根节点，之后仅需提供一个 <code>Visitor</code> 实现用来遍历该树并输出即可。具体可以参考库里的 <a href="https://github.com/sirthias/pegdown/blob/master/src/main/java/org/pegdown/ToHtmlSerializer.java">ToHtmlSerializer</a> 实现。</p>
<p>创建 <code>PegDownProcessor</code> 对象时可能会花几百毫秒来构造对象及其底下的依赖实现，不过创建完成后，之后的解析工作就会运行的比较快。<code>PegDownProcessor</code> 对象可以被重用，因为它是<strong>线程安全</strong>的。</p>
<h2>插件</h2>
<p>由于解析和序列化在这里不是一回事，所以有两种不同的插件机制，一个用于 parser，一个用于 ToHtmlSerializer。 大多数插件可能两种机制都实现，但也有插件只是实现了解析器 parser 插件接口。其中解析和序列化简单的来说：</p>
<ol>
<li>parse 解析: 是指将 Markdown 文本抽象成一个语法树的过程。</li>
<li>serialize 序列化：是指遍历语法树输出文本的过程。</li>
</ol>
<p>解析器有两个槽点：inline 和 block。为了方便使用，每个槽点都有自己的构造器 builder。你可以单独修改其中一个构造器的规则，或者传入实现 <code>InlinePluginParser</code> 接口或者 <code>BlockPluginParser</code> 接口的 <code>parser</code> 对象。</p>
<p>序列化插件则对应有个 <code>ToHtmlSerializerPlugin</code> 接口，它在解析器解析到 parser 生成的节点时，会调用该接口处理该节点。该接口接受一个 <code>node</code> 节点对象、 <code>visitor</code> 遍历对象（也就是说节点的子孙节点们都可以被该接口所渲染）、 <code>printer</code> 输出打印对象。该接口返回一个布尔值，如果为 <code>true</code> 则表示该节点已被处理，否则表示该接口不处理该节点，告诉解析器遍历其他接口找到一个能处理该节点的接口，如果遍历结束都没找到一个能处理的，这抛出异常。</p>
<p>这里有个比较简单的例子可以学习：<a href="http://github.com/sirthias/pegdown/blob/master/src/test/java/org/pegdown/PluginParser.java">PluginParser test class</a></p>
