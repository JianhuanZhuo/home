<%@ page contentType="text/html; charset=UTF-8" %><h2>情景文本颜色</h2>
<p>有六个</p>
<ol>
<li>text-muted 柔和灰</li>
<li>text-primary 主要蓝</li>
<li>text-succes 成功绿</li>
<li>text-info 信息蓝</li>
<li>text-warning 警告黄</li>
<li>text-danger 危险红</li>
</ol>
<h2>情景背景颜色</h2>
<p>有五个</p>
<ol>
<li>bg-danger 危险红</li>
<li>bg-primary 主要蓝</li>
<li>bg-succes 成功绿</li>
<li>bg-info 信息蓝</li>
<li>bg-warning 警告黄</li>
</ol>
<h2>按钮和浮动</h2>
<pre><code class="language-html">// 关闭按钮
&lt;button class=&quot;close&quot;&gt;&lt;/button&gt;

// 三角符号
&lt;span class=&quot;caret&quot;&gt;&lt;/span&gt;

// 左浮动、右浮动
&lt;div class=&quot;pull-left&quot;&gt;左浮动&lt;/div&gt;
&lt;div class=&quot;pull-right&quot;&gt;右浮动&lt;/div&gt;

// 区块居中，也就是会 display=block
&lt;div class=&quot;center-block&quot;&gt;居中&lt;/div&gt;

// 清理浮动，用于解决左浮动，右不浮动，右的会被左浮动覆盖的问题
&lt;div class=&quot;pull-left&quot;&gt;左浮动&lt;/div&gt;
&lt;div class=&quot;clearfix&quot;&gt;&lt;/div&gt;
&lt;div class=&quot;&quot;&gt;右浮动&lt;/div&gt;

// 隐藏显示
&lt;div class=&quot;show&quot;&gt;显示&lt;/div&gt;
&lt;div class=&quot;hidden&quot;&gt;隐藏&lt;/div&gt;
</code></pre>
<h2>媒体查询</h2>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-02-11-43-52.png" alt="" /></p>
<pre><code class="language-html">//超小屏幕激活显示
&lt;div class=&quot;visible-xs-block a&quot;&gt;Bootstrap&lt;/div&gt;
//超小屏幕激活隐藏
&lt;div class=&quot;hidden-xs a&quot;&gt;Bootstrap&lt;/div&gt;
</code></pre>
<h2>徽章和标签</h2>
<pre><code class="language-html">&lt;h3&gt;标签 &lt;span class=&quot;label label-default&quot;&gt;new&lt;/span&gt;&lt;/h3&gt;
&lt;a href=&quot;#&quot;&gt;信息 &lt;span class=&quot;badge&quot;&gt;10&lt;/span&gt;&lt;/a&gt;
</code></pre>
