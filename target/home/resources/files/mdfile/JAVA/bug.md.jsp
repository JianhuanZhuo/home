<%@ page contentType="text/html; charset=UTF-8" %><h2>运行 jar 包出现乱码</h2>
<p>程序在 eclipse 中运行没有乱码问题，但是打包后运行输出乱码
解决方法是添加 java 运行参数：</p>
<pre><code class="language-cmd">java  -Dfile.encoding=UTF-8  -jar jarname.jar
</code></pre>
<p>如果是 maven 程序，则需要在 <code>pom.xml</code> 中的 <code>properties</code> 中增加一行配置：</p>
<pre><code class="language-xml">&lt;properties&gt;
    &lt;argLine&gt;-Dfile.encoding=UTF-8&lt;/argLine&gt;
&lt;/properties&gt;
</code></pre>
