<%@ page contentType="text/html; charset=UTF-8" %><p>参考：
<a href="http://harpjs.com/">harp 官网</a></p>
<pre><code class="language-bash"># 下载全局安装 harp.js
npm install -g harp
# 查看版本
harp version

# 使用 harp 编译工程
harp compile
# 使用 harp 内置服务器预览
harp server
</code></pre>
<p>两个必须的 json 文件：</p>
<ol>
<li><code>_harp.json</code> 全局配置和变量，<code>globals</code> 下定义全局变量</li>
<li><code>_data.json</code> 配置，<code>index</code> 之类文件名下定义可用的变量</li>
</ol>
<p><code>_harp.json</code></p>
<pre><code class="language-json">{
    &quot;globals&quot;: {
        &quot;siteTitle&quot;: &quot;Learning Bootstrap 4&quot;
    }
}
</code></pre>
<p><code>_data.json</code></p>
<pre><code class="language-json">{
    &quot;index&quot;: {
        &quot;pageTitle&quot;: &quot;Home&quot;
    }
}
</code></pre>
<pre><code class="language-html">&lt;!DOCTYPE html&gt;
&lt;html lang=&quot;en&quot;&gt;
    &lt;head&gt;
        &lt;!-- Required meta tags always come first --&gt;
        &lt;meta charset=&quot;utf-8&quot;&gt;
        &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1, shrink-to-fit=no&quot;&gt;
        &lt;meta http-equiv=&quot;x-ua-compatible&quot; content=&quot;ie=edge&quot;&gt;
        &lt;!-- Bootstrap CSS --&gt;
        &lt;link rel=&quot;stylesheet&quot; href=&quot;https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css&quot; integrity=&quot;sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd&quot; crossorigin=&quot;anonymous&quot;&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;h1&gt;Hello, world!&lt;/h1&gt;

        &lt;!-- jQuery first, then Bootstrap JS. --&gt;
        &lt;script src=&quot;https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js&quot;&gt;&lt;/script&gt;
        &lt;script src=&quot;https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js&quot; integrity=&quot;sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7&quot; crossorigin=&quot;anonymous&quot;&gt;&lt;/script&gt;
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>
