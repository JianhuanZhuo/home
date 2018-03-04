<%@ page contentType="text/html; charset=UTF-8" %><p>如需要下列的一项样式，直接在 ul 上加类即可。
栏目式： nav-tabls
胶囊式： nav-pills
垂直式： nav-stacked
两端对齐：nav-justified</p>
<pre><code class="language-html">&lt;ul class=&quot;nav&quot;&gt;
    &lt;li class=&quot;active&quot;&gt;&lt;a href=&quot;#&quot;&gt;首页&lt;/a&gt;&lt;/li&gt;
    &lt;li class=&quot;disabled&quot;&gt;&lt;a href=&quot;#&quot;&gt;咨询&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;
        &lt;a href=&quot;#&quot; data-toggle=&quot;dropdown&quot;&gt;
            下拉菜单
            &lt;span class=&quot;caret&quot;&gt;&lt;/span&gt;
        &lt;/a&gt;
        &lt;ul class=&quot;dropdown-menu&quot;&gt;
            &lt;li&gt;&lt;a href=&quot;#&quot;&gt;菜单一&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href=&quot;#&quot;&gt;菜单二&lt;/a&gt;&lt;/li&gt;
        &lt;/ul&gt;
    &lt;/li&gt;
    &lt;li&gt;&lt;a href=&quot;#&quot;&gt;关于&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
</code></pre>
<h2>导航组件</h2>
<pre><code class="language-html">&lt;!-- navbar-fixed-top 用于永远固定在顶部 --&gt;
&lt;!-- navbar-fixed-bottom 用于永远固定在底部 --&gt;
&lt;!-- navbar-static-top 静态导航，和页面等宽的导航条，去掉了圆角 --&gt;
&lt;nav class=&quot;navbar narbar-default&quot;&gt;
    &lt;div class=&quot;container&quot;&gt;
        &lt;div class=&quot;navbar-header&quot;&gt;
            &lt;a href=&quot;&quot; class=&quot;navbar-brand&quot;&gt;&lt;/a&gt;
        &lt;/div&gt;
        &lt;ul class=&quot;nav navbar-nav&quot;&gt;
            &lt;li class=&quot;active&quot;&gt;&lt;a href=&quot;#&quot;&gt;首页&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href=&quot;&quot;&gt;资讯&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href=&quot;&quot;&gt;产品&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href=&quot;&quot;&gt;关于&lt;/a&gt;&lt;/li&gt;
        &lt;/ul&gt;
        &lt;!-- navbar-righ 对齐至右边 --&gt;
        &lt;!-- 使用 form 将表单组件嵌套进导航中，导航内的 form 使用 navbar-form 类 --&gt;
        &lt;form action=&quot;&quot; class=&quot;navbar-form navbar-right&quot;&gt;
            &lt;div class=&quot;input-group&quot;&gt;
                &lt;input type=&quot;text&quot; class=&quot;form-control&quot;&gt;
                &lt;span class=&quot;input-group-btn&quot;&gt;
                    &lt;button type=&quot;submit&quot; class=&quot;btn btn-default&quot;&gt;提交&lt;/button&gt;
                &lt;/span&gt;
            &lt;/div&gt;
        &lt;/form&gt;
        &lt;!-- 导航中使用按钮 --&gt;
        &lt;button class=&quot;btn btn-default navbar-btn&quot;&gt;按钮&lt;/button&gt;
        &lt;!-- 导航中使用一段文本 --&gt;
        &lt;p class=&quot;navbar-text&quot;&gt;我是一段文本&lt;/p&gt;

        &lt;!-- 非导航链接，一般需要置入文本区域内 --&gt;
        &lt;p&gt;&lt;a href=&quot;#&quot; class=&quot;navbar-link&quot;&gt;非导航链接&lt;/a&gt;&lt;/p&gt;
    &lt;/div&gt;
&lt;/nav&gt;
</code></pre>
<h2>面包屑</h2>
<pre><code class="language-html">&lt;ol class=&quot;breadcrumb&quot;&gt;
    &lt;li&gt;&lt;a href=&quot;#&quot;&gt;首页&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href=&quot;#&quot;&gt;产品列表&lt;/a&gt;&lt;/li&gt;
    &lt;li class=&quot;active&quot;&gt;韩版 2015 羊毛大衣&lt;/li&gt;
&lt;/ol&gt;
</code></pre>
<h2>分页组件</h2>
<pre><code class="language-html">&lt;!-- 分页导航项 --&gt;
&lt;ul class=&quot;pagination&quot;&gt;
    &lt;li class=&quot;disabled&quot;&gt;&lt;a href=&quot;#&quot;&gt;&amp;laquo;&lt;/a&gt;&lt;/li&gt;
    &lt;li class=&quot;active&quot;&gt;&lt;a href=&quot;#&quot;&gt;1&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href=&quot;#&quot;&gt;2&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href=&quot;#&quot;&gt;3&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href=&quot;#&quot;&gt;&amp;raquo;&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;!-- 上下页效果 --&gt;
&lt;ul class=&quot;pager&quot;&gt;
    &lt;li&gt;&lt;a href=&quot;#&quot;&gt;上一页&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href=&quot;#&quot;&gt;下一页&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;!-- 两边对齐的上下页效果 --&gt;
&lt;!-- 其中再加 disabled 可禁用 --&gt;
&lt;ul class=&quot;pager&quot;&gt;
    &lt;li class=&quot;previous&quot;&gt;&lt;a href=&quot;#&quot;&gt;上一页&lt;/a&gt;&lt;/li&gt;
    &lt;li class=&quot;next&quot;&gt;&lt;a href=&quot;#&quot;&gt;下一页&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
</code></pre>
