<%@ page contentType="text/html; charset=UTF-8" %><p>httpclient 用于 Java 做 http 请求。</p>
<!-- more -->
<p>参考：<a href="https://hc.apache.org/httpcomponents-client-ga/tutorial/pdf/httpclient-tutorial.pdf">httpclient-tutorial.pdf</a></p>
<h2>添加依赖</h2>
<pre><code class="language-xml">&lt;!--apache httpclient--&gt;
&lt;!-- 核心组件 --&gt;
&lt;dependency&gt;
    &lt;groupId&gt;org.apache.httpcomponents&lt;/groupId&gt;
    &lt;artifactId&gt;httpclient&lt;/artifactId&gt;
    &lt;version&gt;4.5.2&lt;/version&gt;
&lt;/dependency&gt;

&lt;!-- 多媒体传输组件 --&gt;
&lt;dependency&gt;
    &lt;groupId&gt;org.apache.httpcomponents&lt;/groupId&gt;
    &lt;artifactId&gt;httpmime&lt;/artifactId&gt;
    &lt;version&gt;4.5.2&lt;/version&gt;
&lt;/dependency&gt;
</code></pre>
<h2>使用</h2>
<pre><code class="language-java">// 1. 实例化一个 httpclient 对象，相当于整个 httpclient 的上下文容器
CloseableHttpClient httpclient = HttpClients.createDefault();
// 2. 实例化一个 httpget 对象，这个是一个方法
//HttpGet httpget = new HttpGet(&quot;http://localhost/&quot;);
// 2. 实例化一个 httppost 对象，并添加实体
HttpPost httppost = new HttpPost(&quot;http://localhost/action.do&quot;);

// 2.1. 添加 txt 文本文件实体
File file = new File(&quot;somefile.txt&quot;);
httppost.setEntity(new FileEntity(file, ContentType.create(&quot;text/plain&quot;, &quot;UTF-8&quot;)));

// 2.2. 添加表单实体
List&lt;NameValuePair&gt; formparams = new ArrayList&lt;&gt;();
formparams.add(new BasicNameValuePair(&quot;param1&quot;, &quot;value1&quot;));
formparams.add(new BasicNameValuePair(&quot;param2&quot;, &quot;value2&quot;));
// 这里使用 UrlEncodedFormEntity 可以自动编码表单
httppost.setEntity(new UrlEncodedFormEntity(formparams, Consts.UTF_8));

// 3. 执行这个方法
try (CloseableHttpResponse response = httpclient.execute(httppost)){
    // 获取 http 实体
    HttpEntity entity = response.getEntity();
    if (entity != null) {
        InputStream instream = entity.getContent();
        Header type = entity.getContentType();
        Header header = entity.getContentEncoding();
        long len = entity.getContentLength();
        try {
            // do something useful
        } finally {
            instream.close();
        }
    }
} catch (IOException e) {
    e.printStackTrace();
}


</code></pre>
<h3>方法</h3>
<p>支持的方法有：
支持方法有： GET, HEAD, POST, PUT, DELETE, TRACE 和 OPTIONS。
HttpGet ,
HttpHead ,  HttpPost ,  HttpPut ,  HttpDelete ,  HttpTrace , and  HttpOptions</p>
<h3>URI</h3>
<p>包含
可以使用</p>
<pre><code class="language-java">// 直接使用使用 URI 地址的方式
HttpGet httpget = new HttpGet(&quot;http://www.google.com/search?hl=en&amp;q=httpclient&amp;btnG=Google+Search&amp;aq=f&amp;oq=&quot;);

// 使用 URIBuilder 构建一个 URI
URI uri = new URIBuilder()
            .setScheme(&quot;http&quot;)
            .setHost(&quot;www.google.com&quot;)
            .setPath(&quot;/search&quot;)
            .setParameter(&quot;q&quot;, &quot;httpclient&quot;)
            .setParameter(&quot;btnG&quot;, &quot;Google Search&quot;)
            .setParameter(&quot;aq&quot;, &quot;f&quot;)
            .setParameter(&quot;oq&quot;, &quot;&quot;)
            .build();
HttpGet httpget = new HttpGet(uri);
</code></pre>
<h3>响应</h3>
<pre><code class="language-java">// 分别输出协议版本（HTTP/1.1）、 状态码（200）、原因语句（OK）
System.out.println(response.getProtocolVersion());
System.out.println(response.getStatusLine().getStatusCode());
System.out.println(response.getStatusLine().getReasonPhrase());
System.out.println(response.getStatusLine().toString());
// 添加消息头
response.addHeader(&quot;Set-Cookie&quot;, &quot;c2=b; path=\&quot;/\&quot;, c3=c; domain=\&quot;localhost\&quot;&quot;);
// 获得消息头
Header[] hs = response.getHeaders(&quot;Set-Cookie&quot;);
</code></pre>
<h2>HTTP 实体</h2>
<p>存在于 GET 和 POST 方法，除了   204 No Content ,  304 Not Modified ,  205 Reset Content
之外要都有实体。</p>
<p>实体分为三种类型：</p>
<ol>
<li>streamed：流。从流中接收实体，<code>not repeatable</code>。</li>
<li>self-contained：自包含。存在于内存的、与连接无关的 <code>repeatable</code>。</li>
<li>wrapping：包装。包含另一个实体的包装。</li>
</ol>
<p><code>repeatable</code> 指的可以读多次。</p>
<p>HttpEntity#getContent() method, which returns an  java.io.InputStream</p>
<p>output stream to the  HttpEntity#writeTo(OutputStream) method</p>
<pre><code class="language-java">
</code></pre>
<p>HttpEntity#getContentType() and  HttpEntity#getContentLength()
HttpEntity#getContentEncoding()</p>
<pre><code class="language-java">entity = new BufferedHttpEntity(entity);
</code></pre>
<h2>上下文复用</h2>
<h2>拦截器</h2>
<pre><code class="language-java">CloseableHttpClient httpclient = HttpClients.custom()
        // 在 httpclient 中添加拦截器
        .addInterceptorLast(new HttpRequestInterceptor() {
                public void process(final HttpRequest request, final HttpContext context)                              throws HttpException, IOException {
                    // 在拦截器中可以操作 request 和 context
                    // 自定义的数据，从 context.getAttribute 获得
                    AtomicInteger count = (AtomicInteger) context.getAttribute(&quot;count&quot;);
                    request.addHeader(&quot;Count&quot;, Integer.toString(count.getAndIncrement()));
                }
            })
        .build();

AtomicInteger count = new AtomicInteger(1);
HttpClientContext localContext = HttpClientContext.create();
localContext.setAttribute(&quot;count&quot;, count);
HttpGet httpget = new HttpGet(&quot;http://localhost/&quot;);
for (int i = 0; i &lt; 10; i++) {
    CloseableHttpResponse response = httpclient.execute(httpget, localContext);
    try {
        HttpEntity entity = response.getEntity();
    } finally {
        response.close();
    }
}
</code></pre>
