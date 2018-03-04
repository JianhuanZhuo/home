<%@ page contentType="text/html; charset=UTF-8" %><p>本文归纳了 JavaDoc 注释标记的使用规范及生成 JavaDoc 的相关命令。</p>
<!--more-->
<h1>注释格式</h1>
<p>JavaDoc 的注释分三段：</p>
<ol>
<li>标题</li>
<li>详细说明</li>
<li>特别说明</li>
</ol>
<p>先举个如下例子：</p>
<pre><code class="language-Java">/**  

 * show 方法的简述. 

 * ＜p＞show 方法的详细说明第一行＜br＞ * show 方法的详细说明第二行

 * @param b true 表示显示，false 表示隐藏

 * @return 没有返回值

 */ 

public voidshow(boolean b) { frame.show(b); }
</code></pre>
<h1>标记说明</h1>
<h1>JavaDoc 命令</h1>
<h1>其他</h1>
<p>也许你在查看别人代码时可能会看到 <code>//@TODO</code> 的这类东西，这个不属于 JavaDoc 部分的内容（至少你不会再 JavaDoc 内看到这些内容）。他们属于任务管理工具的标记。相类似的还有：</p>
<ul>
<li>FIXME</li>
<li>TODO</li>
<li>XXX</li>
</ul>
<p>除此之外，在Eclipse中还可自定义标签（不常见），用于日常任务的管理标记。</p>
