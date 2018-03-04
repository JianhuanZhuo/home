<%@ page contentType="text/html; charset=UTF-8" %><p>Spring MVC 框架下多文件上传方法的代码示例。这个份代码优点在于，可以使用 H5 的新属性<code>multiple</code>使得前端代码简洁；后台使用一个方法便可获得全部文件，简洁。</p>
<p>这应该是多文件上传最为优雅的方式了。</p>
<!--more-->
<pre><code class="language-html">&lt;form method=&quot;post&quot; action=&quot;importMultiEmail.htm&quot; enctype=&quot;multipart/form-data&quot;&gt;
    &lt;input name=&quot;file&quot; type=&quot;file&quot; multiple /&gt;
    &lt;input type=&quot;submit&quot; value=&quot;Upload&quot; /&gt;
&lt;/form&gt;
</code></pre>
<pre><code class="language-java">/**
 * upload multiple files interface.
 *
 * @param request http request object contains upload files
 * @return eml data which parsed from eml files
 */
@RequestMapping({&quot;/importMultiEmail&quot;})
public void uploads(DefaultMultipartHttpServletRequest request) {
    List&lt;MultipartFile&gt; files = request.getFiles(&quot;file&quot;);
    // 巴拉巴拉巴拉
}
</code></pre>
