<%@ page contentType="text/html; charset=UTF-8" %><p>拦截器需要实现接口 <code>HandlerInterceptor</code> 并注册。也可以继承 <code>org.springframework.web.servlet.handler.HandlerInterceptorAdapter</code> 就不用实现每个方法了。</p>
<pre><code class="language-java">public class ProcessingTimeLogInterceptor implements HandlerInterceptor {
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        long startTime = System.currentTimeMillis();
        request.setAttribute(&quot;startTime&quot;, startTime);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
        // to do something...
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception exceptionIfAny){
        // NO operation.
    }
}
</code></pre>
<p>其中 <code>preHandle</code> 是在请求得到路由之前执行的，它的返回值是一个布尔类型，表示是否放行（是否继续执行路径路由等）</p>
<p>注册方法为：</p>
<pre><code class="language-java">public class WebApplicationContextConfig extends WebMvcConfigurerAdapter {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {     
        // 直接添加一个实例 instance 
        registry.addInterceptor(new ProcessingTimeLogInterceptor());
        
        // 使用内置的拦截器，用于多语言
        LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
        localeChangeInterceptor.setParamName(&quot;language&quot;);
        registry.addInterceptor(localeChangeInterceptor);
        
        // 提供特殊匹配模式
        registry.addInterceptor(promoCodeInterceptor())
        .addPathPatterns(&quot;/**/market/products/specialOffer&quot;);
    }
}
</code></pre>
<p>一些比较有用的用法是做权限控制，对于不合法的访问做重定向</p>
<pre><code class="language-java">    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException{
        String givenPromoCode = request.getParameter(&quot;promo&quot;);
        // 检查是否合法，并重定向
        if (promoCode.equals(givenPromoCode)) {
        response.sendRedirect(request.getContextPath() + &quot;/&quot; + offerRedirect);
        } else {
        response.sendRedirect(errorRedirect);
        }

        return false;
    }
</code></pre>
<h2>多语言转换</h2>
<ol>
<li>添加一个内置的国际化拦截器</li>
<li>抽取硬代码文本至 <code>.properties</code> 配置文件</li>
<li>在 .jsp 页面中配置</li>
<li>定义一个语言 resolver</li>
<li>语言切换链接</li>
</ol>
<h3>注册内置的国际化拦截器</h3>
<pre><code class="language-java">public class WebApplicationContextConfig extends WebMvcConfigurerAdapter {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {     
        // 使用内置的拦截器，用于多语言
        LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
        localeChangeInterceptor.setParamName(&quot;language&quot;);
        registry.addInterceptor(localeChangeInterceptor);
    }
}
</code></pre>
<h3>抽取硬代码文本至 <code>.properties</code> 配置文件</h3>
<p>添加 message 文件夹，并以 <code>_nl</code> 为后缀表示不同语言的文本
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-07-31-19-32-31.png" alt="" /></p>
<pre><code class="language-java">// 这个是 messages.properties 文件内的文本内容
addProduct.form.productId.label = New Product ID
addProduct.form.name.label = Name

// 这个是 messages_nl.properties 文件内的文本内容，表示 nl 语言的版本
addProduct.form.productId.label = Nieuw product ID
addProduct.form.name.label = Naam
</code></pre>
<h3>语言切换链接</h3>
<pre><code class="language-xml">&lt;section&gt;
    &lt;div class=&quot;pull-right&quot; style=&quot;padding-right: 50px&quot;&gt;
        &lt;a href=&quot;?language=en&quot;&gt;English&lt;/a&gt;|&lt;a href=&quot;?language=nl&quot;&gt;Dutch&lt;/a&gt;
    &lt;/div&gt;
&lt;/section&gt;
</code></pre>
<h3>定义一个语言 resolver</h3>
<pre><code class="language-java">public class WebApplicationContextConfig extends WebMvcConfigurerAdapter {
    @Bean
    public LocaleResolver localeResolver(){
        SessionLocaleResolver resolver = new SessionLocaleResolver();
        resolver.setDefaultLocale(new Locale(&quot;en&quot;));
        
        return resolver;
    }
}
</code></pre>
<h3>在 .jsp 页面中配置</h3>
<p>在 .jsp 页面中使用 <code>&lt;spring:message&gt;</code> 引用该字符串。</p>
<h3>过程描述</h3>
<p>那么一个过程是这样的：
页面请求链接发完服务器后，由注册的拦截器拦截，并判定是否存在与拦截器相符的参数，这里是 <code>localeChangeInterceptor.setParamName(&quot;language&quot;);</code> 定义的 <code>&quot;language&quot;</code> 作为参数名，如果该参数存在参数值，则使用该参数值指定下一步的本地化参数。</p>
<p>这里对应 <code>&lt;a href=&quot;?language=en&quot;&gt;English&lt;/a&gt;|&lt;a href=&quot;?language=nl&quot;&gt;Dutch&lt;/a&gt;</code> 中链接的参数。</p>
<p>之后，拦截器会引用一个 <code>LocaleResolver</code> 渲染器，如上，如果没有使用参数 <code>language</code> 指定本地化语言 <code>Locale</code>，则使用默认的 <code>resolver.setDefaultLocale(new Locale(&quot;en&quot;));</code>。</p>
<p>在页面渲染时，由 <code>&lt;spring:message&gt;</code> 引用这些字符串，而页面渲染默认的仅引用默认的配置文件，即不带后缀的 <code>messages.properties</code>，而指定某个本地化 <code>Locale</code> 则引用相对应的文件。</p>
<p>这里比较神奇的是，在选择完语言后，之后的语言都使用了已选择的特定性本地化了。</p>
