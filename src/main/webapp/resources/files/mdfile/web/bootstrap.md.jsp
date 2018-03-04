<%@ page contentType="text/html; charset=UTF-8" %><p>全局改写为字体大小为 15 px，行高 20px， 行距 1/2 行高</p>
<h2>标题</h2>
<p>bt 会把标题也加样式，</p>
<pre><code class="language-css">.h1, h1{
    /**/...
}
</code></pre>
<p>也就是支持普通的样式，.h1~.h6</p>
<pre><code class="language-html">&lt;span class=&quot;h1&quot;&gt;标题1&lt;/span&gt;
</code></pre>
<p>h1~h6 还可以嵌入一个 <code>&lt;small&gt;</code> 作为小标题</p>
<pre><code class="language-html">&lt;h1&gt;大标题&lt;small&gt;小标题&lt;/small&gt;&lt;/h1&gt;
</code></pre>
<h2>内联文本元素</h2>
<p>标记：<code>&lt;mark&gt;</code> 元素或者 <code>.mark</code> 类
删除：<code>&lt;del&gt;</code>
无用：<code>&lt;s&gt;</code>
插入：<code>&lt;ins&gt;</code>
下划线：<code>&lt;u&gt;</code></p>
<p>加粗：<code>&lt;strong&gt;</code>
倾斜：<code>&lt;em&gt;</code></p>
<h2>对齐</h2>
<pre><code class="language-html">&lt;p class=&quot;text-left&quot;&gt;xxx&lt;/p&gt;
&lt;p class=&quot;text-center&quot;&gt;xxx&lt;/p&gt;
&lt;p class=&quot;text-right&quot;&gt;xxx&lt;/p&gt;
&lt;p class=&quot;text-nowrap&quot;&gt;xxx&lt;/p&gt;不换行
</code></pre>
<h2>大小写</h2>
<pre><code class="language-html">&lt;p class=&quot;text-lowercase&quot;&gt;xxx&lt;/p&gt;
&lt;p class=&quot;text-uppercase&quot;&gt;xxx&lt;/p&gt;
&lt;p class=&quot;text-capitalize&quot;&gt;xxx&lt;/p&gt;
</code></pre>
<h2>引用文本</h2>
<p>引用</p>
<blockquote>xxx</blockquote>
反向引用
<blockquote class="blockquote-reverse">xxx</blockquote>
<h2>列表排版</h2>
<p>// 移除默认样式</p>
<ul class="list-unstyled"></ul>
<p>// 设置成内联</p>
<ul class="list-line">
<p>// 水平排列描述列表</p>
<dl class="dl-horizontal">
    <dt>
    <dd>
<h2>代码</h2>
<p>// 内联代码
<code>&lt;section&gt;</code></p>
<p>// 用户输入
press <kbd>ctrl + ,</kbd></p>
<p>// 代码块</p>
<div class="row">
