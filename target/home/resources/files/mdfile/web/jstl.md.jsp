<%@ page contentType="text/html; charset=UTF-8" %><p>title: JSTL
date : 2017/7/26</p>
<hr />
<pre><code class="language-jsp">&lt;%@ taglib prefix=&quot;c&quot; uri=&quot;http://java.sun.com/jsp/jstl/core&quot;%&gt;
</code></pre>
<p>一般使用 Bean 的方式给视图加数据，这些 Bean 对象称为 <strong>Data Transfer Objects (DTO)</strong></p>
<p>包装 <code>form</code> 表单</p>
<pre><code class="language-jsp">&lt;form:form method=&quot;POST&quot; modelAttribute=&quot;newProduct&quot; class=&quot;form-horizontal&quot;&gt;
        &lt;fieldset&gt;
            &lt;legend&gt;Add new product&lt;/legend&gt;
            &lt;div class=&quot;form-group&quot;&gt;
                &lt;label class=&quot;control-label col-lg-2 col-lg-2&quot; for=&quot;productId&quot;&gt;
                    &lt;spring:message code=&quot;addProduct.form.productId.label&quot;/&gt;
                &lt;/label&gt;
                &lt;div class=&quot;col-lg-10&quot;&gt;
                    &lt;form:input id=&quot;productId&quot; path=&quot;productId&quot; type=&quot;text&quot; class=&quot;form:input-large&quot;/&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/fieldset&gt;
&lt;/form&gt;
</code></pre>
<p><code>&lt;form:input&gt;</code> 中 <code>path</code> 指定 <code>&quot;newProduct&quot;</code> 的属性域。</p>
<h3>core:url</h3>
<pre><code class="language-jsp">&lt;div class=&quot;col-md-5&quot;&gt;
	&lt;img src=&quot;&lt;c:url value=&quot;/img/${product.productId}.png&quot;/&gt;&quot; alt=&quot;image&quot; style=&quot;width: 100%&quot; /&gt;
&lt;/div&gt;
</code></pre>
<h2>Multipart Requests</h2>
<p>添加依赖</p>
<pre><code class="language-xml">&lt;dependency&gt;
    &lt;groupId&gt;commons-fileupload&lt;/groupId&gt;
    &lt;artifactId&gt;commons-fileupload&lt;/artifactId&gt;
    &lt;version&gt;1.2.2&lt;/version&gt;
&lt;/dependency&gt;
&lt;dependency&gt;
    &lt;groupId&gt;org.apache.commons&lt;/groupId&gt;
    &lt;artifactId&gt;commons-io&lt;/artifactId&gt;
    &lt;version&gt;1.3.2&lt;/version&gt;
&lt;/dependency&gt;
</code></pre>
<p>在 <code>WebApplicationContextConfig</code> 中添加 Bean, 其中还可以继续添加一些属性, 如 <code>setMaxUploadSize</code> 等</p>
<pre><code class="language-java">@Bean
public CommonsMultipartResolver multipartResolver() {
    CommonsMultipartResolver resolver=new CommonsMultipartResolver();
    resolver.setDefaultEncoding(&quot;utf-8&quot;);
    return resolver;
}
</code></pre>
<p>添加 <code>org.springframework.web.multipart.MultipartFile</code> 类型的对象 <code>productImage</code> 作为 DTO 的属性</p>
<p>再在视图文件中添加如下 jsp 代码</p>
<pre><code class="language-jsp">&lt;div class=&quot;form-group&quot;&gt;
    &lt;label class=&quot;control-label col-lg-2&quot; for=&quot;productImage&quot;&gt; 
        &lt;spring:message code=&quot;addProduct.form.productImage.label&quot; /&gt;
    &lt;/label&gt;
    &lt;div class=&quot;col-lg-10&quot;&gt;
        &lt;form:input id=&quot;productImage&quot; path=&quot;productImage&quot; type=&quot;file&quot; class=&quot;form:input-large&quot; /&gt;
    &lt;/div&gt;
&lt;/div&gt;
</code></pre>
<p>此时由于表单中上传的不仅有字符串数据还有文件, 所以表单的类型应该修改编码类型为 <code>enctype=&quot;multipart/form-data&quot;</code>:</p>
<pre><code class="language-jsp">&lt;form:form method=&quot;POST&quot; modelAttribute=&quot;newProduct&quot; class=&quot;form-horizontal&quot; enctype=&quot;multipart/form-data&quot;&gt;
</code></pre>
<p>控制器获取文件的方法, 可以参考如下:</p>
<pre><code class="language-java">    @RequestMapping(value = &quot;/products/add&quot;, method = RequestMethod.POST)
    public String processAddNewProductForm(@ModelAttribute(&quot;newProduct&quot;) Product newProduct, BindingResult result, HttpServletRequest request) {

        String[] suppressedFields = result.getSuppressedFields();
        if (suppressedFields.length &gt; 0) {
            throw new RuntimeException(&quot;Attempting to bind disallowed fields: &quot; + StringUtils.arrayToCommaDelimitedString(suppressedFields));
        }

        MultipartFile productImage = newProduct.getProductImage();
        String rootDirectory = request.getSession().getServletContext().getRealPath(&quot;/&quot;);

        if (productImage != null &amp;&amp; !productImage.isEmpty()) {
            try {
                productImage.transferTo(new File(rootDirectory + &quot;resources\\images\\&quot; + newProduct.getProductId() + &quot;.png&quot;));
            } catch (Exception e) {
                throw new RuntimeException(&quot;Product Image saving failed&quot;, e);
            }
        }

        productService.addProduct(newProduct);
        return &quot;redirect:/market/products&quot;;
    }
</code></pre>
