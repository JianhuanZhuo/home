<%@ page contentType="text/html; charset=UTF-8" %><p><a href="http://v3.bootcss.com/components/#glyphicons">图标参考链接</a></p>
<pre><code class="language-html">&lt;i class=&quot;glyphicon glyphicon-star&quot;&gt;&lt;/i&gt;
&lt;span class=&quot;glyphicon glyphicon-star&quot;&gt;&lt;/span&gt;
</code></pre>
<h2>下拉组件</h2>
<ol>
<li>默认下拉则加 open，</li>
<li>向上 则改为 dropup</li>
<li>居右下拉则在 ul 加 dropdown-menu-right</li>
<li>标题</li>
</ol>
<pre><code class="language-html">&lt;div class=&quot;dropdown&quot;&gt;
    &lt;button class=&quot;btn btn-default&quot; data-toggle=&quot;dropdown&quot;&gt;
        下拉按钮
        &lt;span class=&quot;caret&quot;&gt;&lt;/span&gt;
    &lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu&quot;&gt;
        &lt;li class=&quot;dropdown-header&quot;&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;首页&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;咨询&lt;/a&gt;&lt;/li&gt;
        &lt;li class=&quot;divider&quot;&gt;&lt;/li&gt;
        &lt;li class=&quot;disabled&quot;&gt;&lt;a href=&quot;#&quot;&gt;产品&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;关于&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;
</code></pre>
<h2>按钮组组件</h2>
<ol>
<li>改变大小，加 <code>btn-group-sm</code></li>
<li>改成垂直的，则改类型 <code>btn-group</code> 为 <code>btn-group-vertical</code></li>
<li>设置两端对齐按钮组，使用 <code>&lt;a&gt;</code> 标签，并组标签 <code>div</code> 中使用类 <code>btn-group-justified</code></li>
</ol>
<pre><code class="language-html">&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-default&quot;&gt;左&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-default&quot;&gt;中&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-default&quot;&gt;右&lt;/button&gt;
&lt;/div&gt;
</code></pre>
<h2>嵌套下拉分组</h2>
<ol>
<li>这里的下拉组件类型改为 <code>btn-group</code> 而不是 <code>dropdown</code>。</li>
<li>为解决下拉作为最后一个元素的圆角问题，添加类 <code>dropdown-toggle</code>。</li>
<li><code>btn-group</code> 类型的下拉菜单可以将按钮内容另出</li>
</ol>
<pre><code class="language-html">&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-default&quot;&gt;左&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-default&quot;&gt;中&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-default&quot;&gt;右&lt;/button&gt;
    &lt;div class=&quot;btn-group&quot;&gt;
        &lt;button class=&quot;btn btn-default&quot;&gt;下拉菜单&lt;/button&gt;
        &lt;button class=&quot;btn btn-default dropdown-toggle&quot; data-toggle=&quot;dropdown&quot;&gt;
            
        &lt;span class=&quot;caret&quot;&gt;&lt;/span&gt;
        &lt;/button&gt;
        &lt;ul class=&quot;dropdown-menu&quot;&gt;
            &lt;li&gt;&lt;a href=&quot;#&quot;&gt;首页&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href=&quot;#&quot;&gt;资讯&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href=&quot;#&quot;&gt;产品&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href=&quot;#&quot;&gt;关于&lt;/a&gt;&lt;/li&gt;
        &lt;/ul&gt;
    &lt;/div&gt;
&lt;/div&gt;
</code></pre>
