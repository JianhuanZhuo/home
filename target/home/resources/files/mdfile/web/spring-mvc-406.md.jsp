<%@ page contentType="text/html; charset=UTF-8" %><p>参考：<a href="https://stackoverflow.com/questions/16335591/spring-mvc-json-406-not-acceptable">Spring MVC + JSON = 406 Not Acceptable</a> 的高分答案</p>
<p>在 <code>pom.xml</code> 中引入下列 <code>Jackson</code> 包的即可，会自动引入一个转换器。</p>
<pre><code class="language-xml">&lt;dependency&gt;
    &lt;groupId&gt;com.fasterxml.jackson.core&lt;/groupId&gt;
    &lt;artifactId&gt;jackson-core&lt;/artifactId&gt;
    &lt;version&gt;2.8.8&lt;/version&gt;
&lt;/dependency&gt;
&lt;dependency&gt;
    &lt;groupId&gt;com.fasterxml.jackson.core&lt;/groupId&gt;
    &lt;artifactId&gt;jackson-annotations&lt;/artifactId&gt;
    &lt;version&gt;2.8.8&lt;/version&gt;
&lt;/dependency&gt;
&lt;dependency&gt;
    &lt;groupId&gt;com.fasterxml.jackson.core&lt;/groupId&gt;
    &lt;artifactId&gt;jackson-databind&lt;/artifactId&gt;
    &lt;version&gt;2.8.8&lt;/version&gt;
&lt;/dependency&gt;
</code></pre>
