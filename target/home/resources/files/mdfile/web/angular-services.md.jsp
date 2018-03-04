<%@ page contentType="text/html; charset=UTF-8" %><p>title: Angular 服务
date : 2017/8/3</p>
<hr />
<h2>数据收集</h2>
<p>使用 <code>ng-module</code> 绑定输入到指定模型。</p>
<pre><code class="language-html">&lt;input type=&quot;password&quot; value=&quot;x&quot; ng-model=&quot;ctrl.user.password&quot;&gt;
</code></pre>
<p>注意到，设置 <code>value</code> 属性无效果可以看出，AngularJS 是将 module 内的值赋值给 input 后再进行双向绑定的，以确保数据一致性。</p>
<h2>表单</h2>
<p>由于数据都是实时绑定的，也就没有提交一说了，指示器 <code>ng-submit</code> 仅用于指定触发提交动作的处理函数而已。</p>
<pre><code class="language-html">&lt;form ng-submit=&quot;ctrl.submit()&quot;&gt;
    &lt;input type=&quot;text&quot; ng-model=&quot;ctrl.user.username&quot;&gt;
    &lt;input type=&quot;password&quot; ng-model=&quot;ctrl.user.password&quot;&gt;
    &lt;input type=&quot;submit&quot; value=&quot;Submit&quot;&gt;
&lt;/form&gt;
</code></pre>
<p>AngularJS 提供了表单的验证机制：</p>
<pre><code class="language-html">  &lt;form ng-submit=&quot;ctrl.submit()&quot; name=&quot;myForm&quot;&gt;
    &lt;input type=&quot;text&quot;
           ng-model=&quot;ctrl.user.username&quot;
           name=&quot;uname&quot;
           ng-disabled=&quot;myForm.uname.$valid&quot;
           required
           ng-minlength=&quot;4&quot;&gt;
    &lt;input type=&quot;password&quot;
           ng-model=&quot;ctrl.user.password&quot;
           required&gt;
    &lt;input type=&quot;submit&quot;
           value=&quot;Submit&quot;
           ng-disabled=&quot;myForm.$invalid&quot;&gt;
  &lt;/form&gt;
</code></pre>
<h3>验证器 Indicators</h3>
<p>除了 <code>ng-minlength</code> 之外，还有其他的验证器可用：</p>
<table>
<thead>
<tr><th>验证器</th><th>说明</th></tr>
</thead>
<tbody>
<tr><td>required</td><td>确保表单项有输入</td></tr>
<tr><td>ng-required</td><td>？？P56</td></tr>
<tr><td>ng-minlength</td><td>设置最小输入限制</td></tr>
<tr><td>ng-maxlength</td><td>设置最大输入限制</td></tr>
<tr><td>ng-pattern</td><td>正则表达式验证器</td></tr>
<tr><td>type=&quot;email&quot;</td><td>内置的邮件验证器</td></tr>
<tr><td>type=&quot;number&quot;</td><td>内置数字验证器</td></tr>
<tr><td>type=&quot;date&quot;</td><td>内置日期验证器</td></tr>
<tr><td>type=&quot;url&quot;</td><td>内置 URL 验证器</td></tr>
</tbody>
</table>
<h3>表单状态</h3>
<p>注意这里的 <code>ng-minlength</code> 如果 input 标签无 <code>required</code> 且在输入为空时，无法验证（验证通过，BUG）。
除了 <code>invalid</code> 之外，还有其他可以使用的辅助变量：</p>
<table>
<thead>
<tr><th>序号</th><th>辅助变量</th><th>说明</th></tr>
</thead>
<tbody></tbody>
</table>
<ol>
<li>| invalid | 表单输入无效</li>
<li>| valid | 表单输入有效</li>
<li>| pristine | 质朴的，表单未被玷污，即用户未输入过。</li>
<li>| dirty | 嗯，被玷污过</li>
<li>| error | 表单错误</li>
</ol>
<h3>表单项</h3>
<p>使用 <code>表单名.表单项名</code> 访问该表单项，故而访问表单的辅助变量属性。其中对于不同验证器的错误可以单独访问，如访问 <code>uname</code> 表单项中的 <code>required</code> 验证器是否被满足，则可以使用 <code>myForm.uname.$error.required</code>。</p>
