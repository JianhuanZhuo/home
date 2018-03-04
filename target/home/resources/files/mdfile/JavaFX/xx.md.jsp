<%@ page contentType="text/html; charset=UTF-8" %><p>使用这类代码进行测试：</p>
<pre><code class="language-java">String msg = &quot;getClass().getClassLoader().getResource(\&quot;cn\&quot;):\n&quot;+getClass().getClassLoader().getResource(&quot;cn&quot;).toURI().toString();

msg+=&quot;getClass().getProtectionDomain().getCodeSource().getLocation()\n&quot;;
msg+=getClass().getProtectionDomain().getCodeSource().getLocation()+&quot;\n&quot;;

msg+=&quot;new File(\&quot;.\&quot;).getCanonicalFile()\n&quot;;
msg+=new File(&quot;.&quot;).getCanonicalFile();

Files.write(Paths.get(&quot;D:\\duke.txt&quot;), msg.getBytes());
</code></pre>
<p>在使用IDEA直接运行获得的结果为：</p>
<pre><code>getClass().getClassLoader().getResource(&quot;cn&quot;):
file:/D:/picture/qsmanagerclient/target/classes/cn

getClass().getProtectionDomain().getCodeSource().getLocation()
file:/D:/picture/qsmanagerclient/target/classes/

new File(&quot;.&quot;).getCanonicalFile()
D:\picture\qsmanagerclient
</code></pre>
<p>运行在 javapackager 的结果为：</p>
<pre><code>getClass().getClassLoader().getResource(&quot;cn&quot;):
jar:file:/D:/picture/qsmanagerclient/target/fxp/bundles/AppLoader/app/qsmanager-client-1.0-SNAPSHOT-jar-with-dependencies.jar!/cn

getClass().getProtectionDomain().getCodeSource().getLocation()
file:/D:/picture/qsmanagerclient/target/fxp/bundles/AppLoader/app/qsmanager-client-1.0-SNAPSHOT-jar-with-dependencies.jar

new File(&quot;.&quot;).getCanonicalFile()
D:\picture\qsmanagerclient\target\fxp\bundles\AppLoader\app
</code></pre>
