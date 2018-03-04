<%@ page contentType="text/html; charset=UTF-8" %><pre><code class="language-html">&lt;!-- 模态声明 --&gt;
&lt;!-- tabindex 用于取消焦点 --&gt;
&lt;!-- fade 添加淡入淡出效果 --&gt;
&lt;!-- show 表示默认显示 --&gt;
&lt;div class=&quot;modal fade&quot; id=&quot;mymodal&quot; tabindex=&quot;-1&quot;&gt;
    &lt;!-- 窗口声明 --&gt;
    &lt;!-- lg、sm 可用于调整大小 --&gt;
    &lt;div class=&quot;modal-dialog&quot;&gt;
        &lt;!-- 内容声明 --&gt;
        &lt;div class=&quot;modal-content&quot;&gt;
            &lt;!-- 头部 --&gt;
            &lt;div class=&quot;modal-header&quot;&gt;
                &lt;!-- 默认显示的情况下 data-dismiss 是无效的，需要默认关闭然后显示才能关闭 --&gt;
                &lt;button type=&quot;button&quot; class=&quot;close&quot; data-dismiss=&quot;modal&quot;&gt;
                    &lt;span&gt;&amp;times;&lt;/span&gt;
                &lt;/button&gt;
                &lt;h4 class=&quot;modal-title&quot;&gt;会员登录&lt;/h4&gt;
            &lt;/div&gt;
            &lt;!-- 主体 --&gt;
            &lt;!-- 主体可添加流体的栅格系统 --&gt;
            &lt;div class=&quot;modal-body&quot;&gt;
                &lt;p&gt;暂时无法登录会员&lt;/p&gt;
            &lt;/div&gt;
            &lt;!-- 注脚 --&gt;
            &lt;div class=&quot;modal-footer&quot;&gt;
                &lt;button type=&quot;button&quot; class=&quot;btn btn-default&quot;&gt;
                    注册
                &lt;/button&gt;
                &lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot;&gt;
                    登录
                &lt;/button&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;

&lt;!-- 下面这个用于弹窗的触发 --&gt;
&lt;button class=&quot;btn&quot; data-toggle=&quot;modal&quot; data-target=&quot;#mymodal&quot;&gt;点击弹窗&lt;/button&gt;
</code></pre>
