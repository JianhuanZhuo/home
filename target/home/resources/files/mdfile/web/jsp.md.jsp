<%@ page contentType="text/html; charset=UTF-8" %><pre><code class="language-xml">&lt;web-app&gt;
    &lt;!--config page as welcome file--&gt;
    &lt;welcome-file-list&gt;
        &lt;welcome-file&gt;/another_page.html&lt;/welcome-file&gt;
    &lt;/welcome-file-list&gt;
&lt;/web-app&gt;
</code></pre>
<p>WEB 虚拟路径
web-context-root</p>
<p>change tomcat server port
conf/server.xml</p>
<pre><code class="language-xml">&lt;Connector port=&quot;8080&quot;
  protocol=&quot;HTTP/1.1&quot;
  connectionTimeOut=&quot;20000&quot;
  redirectPort=&quot;8443&quot;
/&gt;
</code></pre>
<h2>过滤器</h2>
<p>生命周期：</p>
<ol>
<li>实例化，加载 web.XML</li>
<li>初始化：<code>init()</code></li>
<li>过滤：<code>doFilter()</code></li>
<li>销毁：<code>destroy()</code></li>
</ol>
<pre><code class="language-java">import java.io.IOException;

public class FistFilter implements Filter{
    @Override
    public void destroy(){

    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException{
        
    }

    @Override
    public void init(FilterConfig config) throws ServletException{
        
    }
}
</code></pre>
<h3>过滤器配置</h3>
<pre><code class="language-xml">&lt;filter&gt;
    &lt;filter-name&gt;Filter的名字&lt;/filter-name&gt;
    &lt;!--完整的类名，其中包括包名--&gt;
    &lt;filter-class&gt;Filter的类名称&lt;/filter-class&gt;
    &lt;init-param&gt;
        &lt;description&gt;描述信息&lt;/description&gt;
        &lt;param-name&gt;参数名&lt;/param-name&gt;
        &lt;param-value&gt;参数值&lt;/param-value&gt;
    &lt;/init-param&gt;
&lt;/filter&gt;
&lt;filter-mapping&gt;
    &lt;!--与上面的filter-name必须相同--&gt;
    &lt;filter-name&gt;Filter的名字&lt;/filter-name&gt;
    &lt;url-pattern&gt;URL&lt;/url-pattern&gt;
    &lt;!--可以是零或多个，值为：REQUEST|INCLUDE|FORWARD|ERROR--&gt;
    &lt;!--未设定时默认为REQUEST--&gt;
    &lt;dispatcher&gt;&lt;/dispatcher&gt;
&lt;/filter-mapping&gt;
</code></pre>
<h3>过滤器链</h3>
<p>服务器会按照 web.xml 中过滤器定义的先后顺序组装成一条链。
以嵌套的模式进行过滤并返回</p>
<h3>过滤器的分类</h3>
<ol>
<li>REQUEST 用户直接访问页面时，Web容器将会调用过滤器</li>
<li>INCLUDE 目标资源是通过 RequestDispatcher 的 forward 访问时，该过滤器将被调用。</li>
<li>FORWARD 目标资源是通过 RequestDispatcher 的 include 访问时，该过滤器将被调用。</li>
<li>ERROR 目标直接是通过声明式异常处理机制调用时，过滤器将被调用。</li>
</ol>
<pre><code class="language-java">@Override
public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException{
    HttpServletRequest req = (HttpServletRequest) request;
    HttpServletResponse resp = (HttpServletResponse) response;
    // 重定向
    resp.sendRedirect(req.getContextPath()+&quot;/main.jsp&quot;);

    // 转发
    req.getRequestDispatcher(&quot;main.jsp&quot;).forward(request, response);   
}
</code></pre>
<h3>配置错误跳转界面</h3>
<pre><code class="language-xml">&lt;web-app&gt;
    &lt;error-page&gt;
        &lt;error-code&gt;404&lt;/error-code&gt;
        &lt;location&gt;error.jsp&lt;/location&gt;
    &lt;/error-page&gt;
&lt;/web-app&gt;
</code></pre>
<h3>Servlet3.0 加入 ASYNC 异步处理的支持</h3>
<h3>@WebFilter</h3>
<p>使用注解的方式注册一个过滤器</p>
<pre><code class="language-java">@WebFilter(servletNames={&quot;SimpleServlet&quot;}, filterName=&quot;SimpleFilter&quot;)
public class LessThanSixFilter implements Filter{...}
</code></pre>
<p><img src="${pageContext.request.contextPath}/\img\web\jsp\webfilter.png" alt="webfilter 常用属性" /></p>
<h3>过滤器的一般应用场景</h3>
<ol>
<li>对用户请求进行统一认证</li>
<li>编码转换</li>
<li>对用户发送的数据进行过滤替换</li>
<li>转换图像格式</li>
<li>对响应的内容进行压缩</li>
</ol>
<p>在过滤器里，编码转换：</p>
<pre><code class="language-java">request.setCharacterEncoding(&quot;UTF-8&quot;);
</code></pre>
<p>但一般来说，字符集设置 charset=UTF-8 会放在 web.xml 这里
然后</p>
<pre><code class="language-java">request.setCharacterEncoding(config.getInitParameter(&quot;charSet&quot;));
</code></pre>
