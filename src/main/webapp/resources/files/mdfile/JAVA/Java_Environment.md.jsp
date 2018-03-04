<%@ page contentType="text/html; charset=UTF-8" %><p>配置环境变量有：</p>
<pre><code class="language-bash">JAVA_HOME=F:\Java\jdk1.8.121_64b
CLASSPATH=.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;
</code></pre>
<p>在 PATH 路径中添加</p>
<pre><code class="language-bash">%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin;
</code></pre>
