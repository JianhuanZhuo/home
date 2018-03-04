<%@ page contentType="text/html; charset=UTF-8" %><p>业务逻辑的业务对象实现一个可串行接口</p>
<h2>控制器</h2>
<h3>RequestMapping</h3>
<p>对整个控制器类加一个 <code>RequestMapping</code> 则表示在路由到这个类的路径上需要前缀一个 <code>RequestMapping</code> 的参数。</p>
<pre><code class="language-java">@Controller
@RequestMapping(&quot;/xx&quot;)
public class ProductController {
</code></pre>
<p>如果 <code>RequestMapping</code> 的参数值什么都不写的话，表示匹配任何路径。即路由到该类下，匹配其他路径都不成功的都会被路由到此，当然，优先级也比较低。
该机制适合用来做 404 页面</p>
<pre><code class="language-java">    @RequestMapping
    public String lostPage(){
        return &quot;lostPage&quot;;
    }
</code></pre>
<p>在 <code>RequestMapping</code> 的参数值上通配一个变量，称为 <code>URI template varibale</code></p>
<pre><code class="language-java">	@RequestMapping(&quot;/products/{category}&quot;)
	public String getProductsByCategory(Model model, @PathVariable(&quot;category&quot;) String productCategory) {
	   model.addAttribute(&quot;products&quot;, productService.getProductsByCategory(productCategory));
	   return &quot;products&quot;;
	}
</code></pre>
<ol>
<li>路径中的实际量以 <code>/</code> 和 <code>.</code> 作为分割，也就是上面的例子中输入 <code>/products/xx.yy</code> 或 <code>/products/xx/kk</code> 都只会将 <code>xx</code> 赋值给变量 <code>productCategory</code></li>
<li>如果在方法参数中出现未加参数值的 <code>URI template variable</code>，如 <code>@PathVariable String cy</code> 那么变量 <code>cy</code> 会尝试获得路径中带变量的那一部分，当然没有的话就会挂掉。</li>
<li>使用 <code>@RequestMapping(&quot;/products/{category}/xx&quot;)</code> 进行匹配也是允许的</li>
</ol>
<h3>参数</h3>
<p>使用 <code>RequestParam</code> 添加请求参数</p>
<pre><code class="language-java">    @RequestMapping(&quot;/product&quot;)
    public String getProductById(@RequestParam(&quot;id&quot;) String productId, Model model) {
        model.addAttribute(&quot;product&quot;, productService.getProductById(productId));
        return &quot;product&quot;;
    }
</code></pre>
<h3>redirect 写法</h3>
<pre><code class="language-java">	@RequestMapping(&quot;/update/stock&quot;)
	public String updateStock(Model model) {
	   productService.updateAllStock();
	   return &quot;redirect:/products&quot;;
	}
</code></pre>
<p>此外，相似的有 <code>forward</code> 用法。</p>
<h3>ModelAndView</h3>
<h2>视图字符串提取</h2>
<p>在 <code>WebApplicationContextConfig</code> 中配置，其中 <code>resource.setBasename</code> 的参数为属性文件 <code>messages.properties</code> 的文件名</p>
<pre><code class="language-java">@Configuration
@EnableWebMvc
@ComponentScan(&quot;com.packt.webstore&quot;)
public class WebApplicationContextConfig extends WebMvcConfigurerAdapter {
    @Bean
    public MessageSource messageSource() { 
       ResourceBundleMessageSource resource = new ResourceBundleMessageSource();
       resource.setBasename(&quot;messages&quot;);
       return resource;    
    }
}
</code></pre>
<p>在页面中引入 <code>spring</code> 由此即可在页面中以 <code>spring：message</code> 的方式引用</p>
<pre><code class="language-jsp">&lt;%@ taglib prefix=&quot;spring&quot; uri=&quot;http://www.springframework.org/tags&quot; %&gt;
&lt;label&gt;&lt;spring:message code=&quot;addProduct.form.description.label&quot;/&gt;&lt;/label&gt;
</code></pre>
<h2>静态资源配置</h2>
<p>在 <code>WebApplicationContextConfig</code> 中注册资源处理器</p>
<pre><code class="language-java">public class WebApplicationContextConfig extends WebMvcConfigurerAdapter {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(&quot;/img/**&quot;)
                .addResourceLocations(&quot;/resources/images/&quot;);
    }
}
</code></pre>
<p>其中，<code>registry</code> 对象的 <code>addResourceHandler</code> 方法的参数值为匹配的路径名，<code>addResourceLocations</code> 方法的参数值为资源所在的物理位置。</p>
