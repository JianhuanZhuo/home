<%@ page contentType="text/html; charset=UTF-8" %><h2>表单样式</h2>
<p>只有正确设置输入框的 type 类型，才能被正确赋予正确的样式。支持的输入框控件包括：text、password、datetime、datetime-local、date、month、time、week、number、email、url、search、tel、color。</p>
<pre><code class="language-html">&lt;form&gt;
    &lt;div class=&quot;form-group&quot;&gt;
        &lt;label&gt;电子邮件：&lt;/label&gt;&lt;input type=&quot;email&quot; class=&quot;form-control&quot; placeholder=&quot;输入您的电子邮件&quot;&gt;
        &lt;label&gt;密码：&lt;/label&gt;&lt;input type=&quot;passwd&quot; class=&quot;form-control&quot; placeholder=&quot;输入您的密码&quot;&gt;
    &lt;/div&gt;
&lt;/form&gt;
</code></pre>
<h2>内联表单</h2>
<form class="inline-form">
小于 768px 则会排列。移动端
<h2>表单合组</h2>
<div class="input-group">
    <div class="input-group-addon">￥<div>
    <input type="text" class="form-control">
    <div class="input-group-addon">.00</div>
</div>
<h2>水平排列</h2>
<pre><code class="language-html">&lt;form class=&quot;form-horizontal&quot;&gt;
    &lt;div class=&quot;form-group&quot;&gt;
        &lt;!-- col-sm-2 是栅格系统的占位的大小 --&gt;
        &lt;!-- .form-horizontal .control-label 右对齐 --&gt;
        &lt;label class=&quot;col-sm-2 control-label&quot;&gt;电子邮件&lt;/label&gt;
        &lt;div class=&quot;col-sm-10&quot;&gt;
            &lt;input type=&quot;email&quot; class=&quot;form-control&quot; placeholder=&quot;请输入您的电子邮件&quot;&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/form&gt;
</code></pre>
<h2>复选框和单选框</h2>
<pre><code class="language-html">&lt;div class=&quot;checkbox&quot;&gt;
    &lt;!-- label 的目的是单击文本也可以选中该选项 --&gt;
    &lt;label&gt;
        &lt;input type=&quot;checkbox&quot;&gt; 音乐
    &lt;/label&gt;
&lt;/div&gt;
&lt;!-- disabled 用于禁用该选项 --&gt;
&lt;div class=&quot;checkbox disabled&quot;&gt;
    &lt;!-- label 的目的是单击文本也可以选中该选项 --&gt;
    &lt;label&gt;
        &lt;input type=&quot;checkbox&quot;&gt; 体育
    &lt;/label&gt;
&lt;/div&gt;
</code></pre>
<p>校验错误：
has-error:错误
has-success:成功
has-warning:警告</p>
<p>若 label 也同步该状态，添加 <code>control-label</code> 即可。</p>
<pre><code class="language-html">&lt;form&gt;
    &lt;div class=&quot;form-group has-error&quot;&gt;
        &lt;label class=&quot;control-label&quot;&gt;电子邮件：&lt;/label&gt;&lt;input type=&quot;email&quot; class=&quot;form-control&quot; placeholder=&quot;输入您的电子邮件&quot;&gt;
        &lt;label&gt;密码：&lt;/label&gt;&lt;input type=&quot;passwd&quot; class=&quot;form-control&quot; placeholder=&quot;输入您的密码&quot;&gt;
    &lt;/div&gt;
&lt;/form&gt;
</code></pre>
<h2>添加额外图标</h2>
<p>glyphicon-ok
glyphicon-warning-sign
glyphicon-remove</p>
<pre><code class="language-html">&lt;form&gt;
    &lt;div class=&quot;form-group has-error has-feekback&quot;&gt;
        &lt;label class=&quot;control-label&quot;&gt;电子邮件：&lt;/label&gt;&lt;input type=&quot;email&quot; class=&quot;form-control&quot; placeholder=&quot;输入您的电子邮件&quot;&gt;
        &lt;span class=&quot;glyphicon glyphicon-ok form-control-feedback&quot;&gt;&lt;/span&gt;
    &lt;/div&gt;
&lt;/form&gt;
</code></pre>
<h2>大小</h2>
<p>input-sm
input-lg</p>
<h2>图片</h2>
<pre><code class="language-html">&lt;img src=&quot;pic.png&quot; alt=&quot;图片&quot; class=&quot;img-rounded&quot;&gt;
&lt;img src=&quot;pic.png&quot; alt=&quot;图片&quot; class=&quot;img-circle&quot;&gt;
&lt;img src=&quot;pic.png&quot; alt=&quot;图片&quot; class=&quot;img-thumbnail&quot;&gt;
&lt;img src=&quot;pic.png&quot; alt=&quot;图片&quot; class=&quot;img-responsive&quot;&gt;
</code></pre>
