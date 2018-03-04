<%@ page contentType="text/html; charset=UTF-8" %><p>参考：stackoverflow(具体忘了是哪个链接了)</p>
<h2>问题</h2>
<p>之前使用了最新 <code>3.4.3</code> 的 <code>tess4j</code> <code>maven</code> 版本，报了 <code>UnsatisfiedLinkError</code>，下载好了 <code>chi_sim.traineddata</code> 也设置好了 <code>instance.setLanguage(&quot;chi_sim&quot;)</code> 和 <code>instance.setDatapath(tessDataFolder.getAbsolutePath());</code></p>
<p>但始终报 <code>UnsatisfiedLinkError</code> 错误，网上说是没有装好 <code>vs2015</code> 的编译器，因为这个版本是 <code>vs13</code> 编译的，需要自己下载 <code>*.dll</code> 文件，搞了半天没折腾出来。最后换个版本就搞定了。。。。</p>
<h2>解决方案</h2>
<p>使用 <code>3.0.0</code> 版本的 <code>tess4j</code>，这个版本自带有 <code>.dll</code> 模块</p>
<pre><code class="language-xml">
        &lt;dependency&gt;
            &lt;groupId&gt;net.sourceforge.tess4j&lt;/groupId&gt;
            &lt;artifactId&gt;tess4j&lt;/artifactId&gt;
            &lt;version&gt;3.0.0&lt;/version&gt;
        &lt;/dependency&gt;

</code></pre>
