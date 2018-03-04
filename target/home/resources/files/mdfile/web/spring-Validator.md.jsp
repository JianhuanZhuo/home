<%@ page contentType="text/html; charset=UTF-8" %><p>Java Bean Validation (JSR-303) is a Java specification that allows us to express validation constraints on objects via annotations.</p>
<p>可以参考链接：
<a href="https://docs.oracle.com/javaee/7/tutorial/partbeanvalidation.htm">The Java EE Tutorial : Bean Validation</a></p>
<p>用到的 maven 项目如下：</p>
<pre><code class="language-xml">&lt;dependency&gt;
    &lt;groupId&gt;org.hibernate&lt;/groupId&gt;
    &lt;artifactId&gt;hibernate-validator&lt;/artifactId&gt;
    &lt;version&gt;5.2.4.Final&lt;/version&gt;
&lt;/dependency&gt;
</code></pre>
<h2>标准验证</h2>
<p>使用如下方式对字段进行验证：</p>
<pre><code class="language-java">@Pattern(regexp=&quot;P[1-9]+&quot;, message=&quot;{Pattern.Product.productId.validation}&quot;)
private String productId;
</code></pre>
<p>上述中，使用 <code>@Pattern</code> 注解，以正则表达式 <code>regexp=&quot;P[1-9]+&quot;</code> 作为验证器，此外还可以使用 <code>javax.validation.constraints.*</code> 包内的其他注解，如 <code>@Size</code>, <code>@Min</code>,  <code>@Digits</code>, 和 <code>@NotNull</code> 等。</p>
<p>其中的 <code>message=&quot;{Pattern.Product.productId.validation}&quot;</code> 定义了一个键 key，它在后面会用于索引错误信息文件 <code>message.properties</code> 文件内的属性。</p>
<pre><code class="language-java">Pattern.Product.productId.validation = Invalid product ID. It should start with character P followed by number.
</code></pre>
<p>在添加产品时的控制器，添加提交产品对象的验证（添加一个 <code>@Valid</code> 注解），并在第一行代码做验证检查，如下</p>
<pre><code class="language-java">@RequestMapping(value = &quot;/products/add&quot;, method = RequestMethod.POST)
public String processAddNewProductForm(@ModelAttribute(&quot;newProduct&quot;) @Valid Product newProduct, BindingResult result, HttpServletRequest request) {
    if(result.hasErrors()) {
        return &quot;addProduct&quot;;
    }
    // ...
}	
</code></pre>
<p>在 jsp 页面中使用 <code>&lt;form:errors&gt;</code> 显示错误信息，其中的 <code>path</code> 表示该变量名，如果 <code>path</code> 为 <code>*</code> 则表示检索全部错误信息。</p>
<pre><code class="language-xml">&lt;form:input id=&quot;productId&quot; path=&quot;productId&quot; type=&quot;text&quot; class=&quot;form:input-large&quot; /&gt;
&lt;form:errors path=&quot;productId&quot; cssClass=&quot;text-danger&quot;/&gt;
</code></pre>
<p>在类 <code>WebApplicationContextConfig</code> 下添加如下方法，注意这里的 <code>messageSource()</code> 指向了 <code>message.properties</code> 文件。</p>
<pre><code class="language-java">@Bean(name = &quot;validator&quot;)
public LocalValidatorFactoryBean validator() {
    LocalValidatorFactoryBean bean = new LocalValidatorFactoryBean();
    bean.setValidationMessageSource(messageSource());
    return bean;
}

// 返回类型为 org.springframework.validation.Validator
@Override
public Validator getValidator(){
    return validator();
}
</code></pre>
<p>大概的过程是，我们在定义 DTO 对象时，添加了这些验证注解。而在传入时使用了 <code>@Valid</code> 注解通知 Spring MVC 对传入对象进行检验。由于 <code>newProduct</code> 对象是一个 form-back bean，所以校验后的信息会被存储在 <code>result</code> 对象中。</p>
<h2>自定义验证</h2>
<ol>
<li>定义一个注解 <code>@interface ProductId</code>，并定义消息文本</li>
<li>实现一个验证器 <code>ProductIdValidator</code></li>
<li>在需要验证的字段，添加 <code>@ProductId</code> 注解</li>
</ol>
<pre><code class="language-java">import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;

@Target({METHOD, FIELD, ANNOTATION_TYPE})
@Retention(RUNTIME)
@Constraint(validatedBy = ProductIdValidator.class)
@Documented
public @interface ProductId {
    // 失败消息 key
    String message() default &quot;{com.packt.webstore.validator.ProductId.message}&quot;;
    Class&lt;?&gt;[] groups() default {};
    public abstract Class&lt;? extends Payload&gt;[] payload() default {};
}
</code></pre>
<p>这里比较重要的一个注解是 <code>@Constraint</code>，每一个验证器都需要使用 <code>@Constraint</code> 注解，其中参数 <code>validatedBy</code> 指明该验证器的具体实现。</p>
<pre><code class="language-java">public class ProductIdValidator implements ConstraintValidator&lt;ProductId, String&gt; {

   // 自动连线获得产品服务
    @Autowired
    private ProductService productService;

    // 初始化
    @Override
    public void initialize(ProductId constraintAnnotation) {
        //  intentionally left blank; this is the place to initialize the constraint annotation for any sensible default values.
    }

    // 验证是否有效，这里验证该 value 是否应该存在于原来的产品中
    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        Product product;
        try {
            product = productService.getProductById(value);
        } catch (ProductNotFoundException e) {
            return true;
        }

        return product == null;
    }
}
</code></pre>
<h2>Spring 验证</h2>
<p>一般 Spring 验证用于，验证两个以上 field 的关系。</p>
<p>实现 <code>Validator</code> 接口，做了一个 <code>UnitsInStockValidator</code>， 其中将该类注解为 <code>@Component</code>。</p>
<pre><code class="language-java">import java.math.BigDecimal;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import com.packt.webstore.domain.Product;

@Component
public class UnitsInStockValidator implements Validator{

    public boolean supports(Class&lt;?&gt; clazz) {
        return Product.class.isAssignableFrom(clazz);
    }

    // 验证方法
    public void validate(Object target, Errors errors) {
        Product product = (Product) target;

        if (product.getUnitPrice() != null &amp;&amp; new BigDecimal(1000).compareTo(product.getUnitPrice()) &lt;= 0 &amp;&amp; product.getUnitsInStock() &gt; 99) {
            errors.rejectValue(&quot;unitsInStock&quot;, &quot;com.packt.webstore.validator.UnitsInStockValidator.message&quot;);
        }
    }
}
</code></pre>
<p>在控制器中，自动连线到组件，在 <code>InitBinder</code> 中初始化验证器</p>
<pre><code class="language-java">	@Autowired
	private ProductValidator productValidator;

	@InitBinder
	public void initialiseBinder(WebDataBinder binder) {
	      binder.setValidator(productValidator);
	      binder.setAllowedFields(&quot;productId&quot;,
	            &quot;name&quot;,
	            &quot;unitPrice&quot;,
	            &quot;description&quot;,
	            &quot;manufacturer&quot;,
	            &quot;category&quot;,
	            &quot;unitsInStock&quot;,
	            &quot;condition&quot;,
	            &quot;productImage&quot;,
	            &quot;language&quot;);
	}
</code></pre>
<h2>结合 Spring 和 Bean 验证</h2>
<p>P206</p>
