<%@ page contentType="text/html; charset=UTF-8" %><p>两种获得方式得到的结果不同：</p>
<pre><code class="language-java">System.out.println(httpUrlConnection.getHeaderFields().get(&quot;Set-Cookie&quot;));
System.out.println(httpUrlConnection.getHeaderField(&quot;Set-Cookie&quot;));
</code></pre>
<p>结果为：
<img src="${pageContext.request.contextPath}/\img\webHeadParser.png" alt="" /></p>
<p>结论：
第二种无法获得全部的数据</p>
<p>这一点虽然事小，但也是坑了很久。。。以此志。</p>
