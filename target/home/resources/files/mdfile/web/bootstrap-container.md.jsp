<%@ page contentType="text/html; charset=UTF-8" %><h2>meta</h2>
<p>// 屏幕宽度与设备一致，初始缩放比例，最大缩放比例，禁止用户缩放</p>
<pre><code class="language-html"> &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1, maxinum-scale=1, user-scalable=no&quot;&gt; 
</code></pre>
<h2>布局容器</h2>
<p>Bootstrap 需要为页面内容和栅格系统包裹一个 .container 容器。由于 padding 等属性的原因，这两种容器不能相互嵌套。
固定宽度：<code>&lt;div class=&quot;container&quot;&gt;</code> 带 margin 的
100%宽度：<code>&lt;div class=&quot;container-fluid&quot;&gt;</code> 无 margin 的</p>
<p>栅格系统中，屏幕大小最大可分配为 12 列。通过行列组合来创建页面布局。</p>
<ol>
<li>行必须包含</li>
</ol>
<pre><code class="language-html">// 三等分布局
&lt;div class=&quot;container&quot;&gt;
    &lt;div class=&quot;row&quot;&gt;
        &lt;div class=&quot;col-md-4&quot;&gt;4&lt;/div&gt;
        &lt;div class=&quot;col-md-4&quot;&gt;4&lt;/div&gt;
        &lt;div class=&quot;col-md-4&quot;&gt;4&lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;

// 9-3 布局
&lt;div class=&quot;container&quot;&gt;
    &lt;div class=&quot;row&quot;&gt;
        &lt;div class=&quot;col-md-9&quot;&gt;9&lt;/div&gt;
        &lt;div class=&quot;col-md-3&quot;&gt;3&lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;


// 用上四种，嵌套满 12 后换行
&lt;div class=&quot;container&quot;&gt;
    &lt;div class=&quot;row&quot;&gt;
        &lt;div class=&quot;col-lg-3 col-md-4 col-sm-6 col-xs-2&quot;&gt;9&lt;/div&gt;
        &lt;div class=&quot;col-lg-3 col-md-4 col-sm-6 col-xs-2&quot;&gt;9&lt;/div&gt;
        &lt;div class=&quot;col-lg-3 col-md-4 col-sm-6 col-xs-2&quot;&gt;9&lt;/div&gt;
        &lt;div class=&quot;col-lg-3 col-md-4 col-sm-6 col-xs-2&quot;&gt;9&lt;/div&gt;
        &lt;div class=&quot;col-lg-3 col-md-4 col-sm-6 col-xs-2&quot;&gt;9&lt;/div&gt;
        &lt;div class=&quot;col-lg-3 col-md-4 col-sm-6 col-xs-2&quot;&gt;9&lt;/div&gt;
        &lt;div class=&quot;col-lg-3 col-md-4 col-sm-6 col-xs-2&quot;&gt;9&lt;/div&gt;
        &lt;div class=&quot;col-lg-3 col-md-4 col-sm-6 col-xs-2&quot;&gt;9&lt;/div&gt;
        &lt;div class=&quot;col-lg-3 col-md-4 col-sm-6 col-xs-2&quot;&gt;9&lt;/div&gt;
        &lt;div class=&quot;col-lg-3 col-md-4 col-sm-6 col-xs-2&quot;&gt;9&lt;/div&gt;
        &lt;div class=&quot;col-lg-3 col-md-4 col-sm-6 col-xs-2&quot;&gt;9&lt;/div&gt;
        &lt;div class=&quot;col-lg-3 col-md-4 col-sm-6 col-xs-2&quot;&gt;9&lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;

// 8-3 布局，空一列
&lt;div class=&quot;container&quot;&gt;
    &lt;div class=&quot;row&quot;&gt;
        &lt;div class=&quot;col-md-8&quot;&gt;9&lt;/div&gt;
        &lt;div class=&quot;col-md-3 col-md-offset-1&quot;&gt;3&lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;

// 再嵌套一个
&lt;div class=&quot;container&quot;&gt;
    &lt;div class=&quot;row&quot;&gt;
        &lt;div class=&quot;col-md-9 row&quot;&gt;
            &lt;div class=&quot;col-md-8&quot;&gt;9&lt;/div&gt;
            &lt;div class=&quot;col-md-3 col-md-offset-1&quot;&gt;3&lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-md-3 col-md-offset-1&quot;&gt;3&lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;


// 位置移动
&lt;div class=&quot;container&quot;&gt;
    &lt;div class=&quot;row&quot;&gt;
        &lt;div class=&quot;col-md-9 col-md-push-3&quot;&gt;9&lt;/div&gt;
        &lt;div class=&quot;col-md-3 col-md-pull-9&quot;&gt;3&lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;
</code></pre>
