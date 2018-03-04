<%@ page contentType="text/html; charset=UTF-8" %><h2>解决IDEA自动重置LanguageLevel和JavaCompiler版本的问题</h2>
<p>参考：(stop IntelliJ IDEA to switch java language level)[https://stackoverflow.com/questions/27037657/stop-intellij-idea-to-switch-java-language-level-every-time-the-pom-is-reloaded]</p>
<p>解决办法：在 <code>pom.xml</code> 中指定 <code>maven-compiler-plugin</code> 的版本，该版本会同时影响 <code>LanguageLevel</code> 和 <code>JavaCompiler</code> ，修改后默认就成了这里设置的版本。</p>
<pre><code class="language-xml">&lt;build&gt;
    &lt;plugins&gt;
        &lt;plugin&gt;
            &lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;
            &lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;
            &lt;version&gt;3.5.1&lt;/version&gt;
            &lt;configuration&gt;
                &lt;source&gt;1.8&lt;/source&gt;
                &lt;target&gt;1.8&lt;/target&gt;
            &lt;/configuration&gt;
        &lt;/plugin&gt;
    &lt;/plugins&gt;
&lt;/build&gt;
</code></pre>
