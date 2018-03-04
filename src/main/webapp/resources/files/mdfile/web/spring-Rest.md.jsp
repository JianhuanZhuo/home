<%@ page contentType="text/html; charset=UTF-8" %><p>参考：</p>
<ol>
<li><a href="http://wiselyman.iteye.com/blog/2002446">Spring4.0系列3-@RestController</a></li>
</ol>
<pre><code class="language-java">import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = &quot;rest/cart&quot;)
public class CartRestController {

    @Autowired
    private CartService cartService;

    // 这里的 @RequestBody 注解会将请求发来的 JSON 附带信息转为一个 Java 对象。
    @RequestMapping(method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.CREATED)
    public void create(@RequestBody CartDto cartDto) {
        cartService.create(cartDto);
    }

    // 返回一个 Cart 对象将自动转换为一个 JSON 字符串
    // 而 Java 对象转 JSON 则是 @RestController 注解的事情了
    @RequestMapping(value = &quot;/{cartId}&quot;, method = RequestMethod.GET)
    public Cart read(@PathVariable(value = &quot;cartId&quot;) String cartId) {
        return cartService.read(cartId);
    }

    // 对于无返回值的，返回一个状态表示 OK
    @RequestMapping(value = &quot;/{cartId}&quot;, method = RequestMethod.PUT)
    @ResponseStatus(value = HttpStatus.OK)
    public void update(@PathVariable(value = &quot;cartId&quot;) String cartId, @RequestBody CartDto cartDto) {
        cartDto.setId(cartId);
        cartService.update(cartId, cartDto);
    }
}
</code></pre>
