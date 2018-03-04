<%@ page contentType="text/html; charset=UTF-8" %><h2>列表组件</h2>
<pre><code class="language-html">&lt;!-- 使用 div&gt;a 而不是 ul&gt;li 是因为这样可以带选择的样式 --&gt;
&lt;div class=&quot;list-group&quot;&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item active&quot;&gt;1.这是起始
    &lt;span class=&quot;badge&quot;&gt;10&lt;/span&gt;&lt;/a&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item disabled&quot;&gt;2.这是第二条数据&lt;/a&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item&quot;&gt;
        &lt;h4&gt;3.这是第三排信息&lt;/h4&gt;
        &lt;p class=&quot;list-group-item-text&quot;&gt;这里是相关内容详情！&lt;/p&gt;&lt;/a&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-success&quot;&gt;4.这是末尾&lt;/a&gt;
&lt;/div&gt;
</code></pre>
<h2>面板组件</h2>
<pre><code class="language-html">&lt;!-- 可以有情景类为：default、success、info、warning、danger、primary --&gt;
&lt;div class=&quot;panel panel-default&quot;&gt;
    &lt;div class=&quot;panel-heading&quot;&gt;
        &lt;h3 class=&quot;pane-title&quot;&gt;面板标题区域&lt;/h3&gt;
    &lt;/div&gt;
    &lt;div class=&quot;panel-body&quot;&gt;
        这里是详细内容区！
    &lt;/div&gt;
    &lt;div class=&quot;panel-footer&quot;&gt;
        这里是底部
    &lt;/div&gt;
&lt;/div&gt;
</code></pre>
<h2>响应式嵌入组件</h2>
<p>根据被嵌入内容的外部容器的宽度，自动创建一个固定的比例，从而让浏览器自动确定内容的尺寸，能够在各种设备上缩放。</p>
<pre><code class="language-html">&lt;!-- 16:9 响应式 embed-responsive-16by9 --&gt;
&lt;!-- 4:3 响应式 embed-responsive-4by3 --&gt;
&lt;div class=&quot;embed-responsive embed-responsive-16by9&quot;&gt;
    &lt;embed src=&quot;http://www.tudou.com/v/OUG5JBZ8udc/&amp;bid=05&amp;rpid=50797543&amp;resourceId=50797543_05_05_99/v.swf&quot; type=&quot;application/x-shockwave-flash&quot; allowscriptaccess=&quot;always&quot; allowfullscreen=&quot;true&quot; wmode=&quot;opaque&quot;&gt;&lt;/embed&gt;
&lt;/div
</code></pre>
