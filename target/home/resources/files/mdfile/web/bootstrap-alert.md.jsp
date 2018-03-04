<%@ page contentType="text/html; charset=UTF-8" %><h2>巨幕组件</h2>
<pre><code class="language-html">&lt;!-- 在固定的范围内，有圆角 --&gt;
&lt;div class=&quot;container&quot;&gt;
    &lt;div class=&quot;jumbotron&quot;&gt;
        &lt;h2&gt;网站标题&lt;/h2&gt;
        &lt;p&gt;这是一个学习性的网站！&lt;/p&gt;
        &lt;p&gt;&lt;a href=&quot;#&quot; class=&quot;btn btn-default&quot;&gt;更多内容&lt;/a&gt;&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;

&lt;!-- 100%全屏，没有圆角 --&gt;
&lt;div class=&quot;jumbotron&quot;&gt;
    &lt;div class=&quot;container&quot;&gt;
        &lt;h2&gt;网站标题&lt;/h2&gt;
        &lt;p&gt;这是一个学习性的网站！&lt;/p&gt;
        &lt;p&gt;&lt;a href=&quot;#&quot; class=&quot;btn btn-default&quot;&gt;更多内容&lt;/a&gt;&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;
</code></pre>
<h2>缩略图组件</h2>
<pre><code class="language-html">&lt;div class=&quot;thumbnail&quot;&gt;
    &lt;img src=&quot;img/pic.png&quot; alt=&quot;&quot;&gt;
    &lt;div class=&quot;caption&quot;&gt;
        &lt;h3&gt;图文并茂&lt;/h3&gt;
        &lt;p&gt;这是一个图片结合文字的缩略图&lt;/p&gt;
        &lt;p&gt;&lt;a href=&quot;#&quot; class=&quot;btn btn-default&quot;&gt;进入&lt;/a&gt;&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;
</code></pre>
<h2>警告框</h2>
<pre><code class="language-html">&lt;div class=&quot;alert alert-success&quot;&gt;
    Bootstrap
    &lt;!-- 可选的链接主要是样式要匹配而已 --&gt;
    &lt;a href=&quot;#&quot; class=&quot;alert-link&quot;&gt;这是个链接&lt;/a&gt;
    &lt;!-- 可选的关闭按钮 --&gt;
    &lt;button class=&quot;close&quot; data-dismiss=&quot;alert&quot;&gt;&lt;span&gt;&amp;times;&lt;/span&gt;&lt;/button&gt;
&lt;/div&gt;
</code></pre>
