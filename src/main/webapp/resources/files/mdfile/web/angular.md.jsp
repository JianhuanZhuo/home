<%@ page contentType="text/html; charset=UTF-8" %><p>title: angular.js
date : 2017/8/1</p>
<hr />
<p>数据驱动</p>
<p>声明式</p>
<p>Separate your concerns
解耦</p>
<p>dependencies injection
依赖注入</p>
<p>Extensible
可拓展性</p>
<p>Test first, test again, keep testing</p>
<p><code>{{name}}</code> 与 <code>&lt;span ng-bind=&quot;name&quot;&gt;&lt;/span&gt;</code> 语义相同。</p>
<h2>AngularJS 工作流程</h2>
<ol>
<li>当 HTML 和 JS 代码加载完成后，AngularJS 会开始查找 <code>ng-app</code> 指示器以确定 AngularJS 作用域。</li>
<li>AngularJS 会遍历带 ng-app 节点的子孙节点，查找相关的指示器并绑定数据，如 <code>ng-controller</code> 和 <code>ng-repeat</code> 等都是在这个阶段完成的。</li>
<li>为 HTML 内的模型引用添加监听器。</li>
</ol>
