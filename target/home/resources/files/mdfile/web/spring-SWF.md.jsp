<%@ page contentType="text/html; charset=UTF-8" %><p>用到的依赖：</p>
<pre><code class="language-xml">&lt;dependency&gt;
    &lt;groupId&gt;org.springframework.webflow&lt;/groupId&gt;
    &lt;artifactId&gt;spring-webflow&lt;/artifactId&gt;
    &lt;version&gt;2.4.2.RELEASE&lt;/version&gt;
&lt;/dependency&gt;
</code></pre>
<p>在 <code>WEB-INF/flows/checkout/</code> 文件定义 <code>checkout-flow.xml</code> 流定义文件。
一个 flow definition file 流定义文件由一系列的 state 状态组成。每个状态都有唯一的 ID。状态有五种：</p>
<ol>
<li>start-state : 入口状态，只有一个，若无定义则是第一个 state。</li>
<li>action-state : 定义文件可以有多个 action-state，执行动作，一般用于与后台交互，SWF 使用 Spring Expression Language 与后台服务 bean 交互。</li>
<li>view-state : 与 action-state 相对，是与用户界面交互的。</li>
<li>decision-state : 流分支点，根据 test-condition 测试条件跳转状态。</li>
<li>subflow-state : 子流，用于流复用。</li>
<li>end-state : 可以有多个，表示流的结束。</li>
</ol>
<p>变量定义，它会创建一个 <code>com.packt.webstore.domain.Order</code> 实例，并赋值给 order 变量：</p>
<pre><code class="language-xml">&lt;var name=&quot;order&quot; class=&quot;com.packt.webstore.domain.Order&quot; /&gt;
</code></pre>
