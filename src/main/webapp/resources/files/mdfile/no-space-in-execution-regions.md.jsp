<%@ page contentType="text/html; charset=UTF-8" %><h3>移植FreeRTOS，出现No space in execution regions溢出错误。</h3>
<p>在出现了如下的错误，意思大概为没有足够空间存放某某</p>
<pre><code class="language-bash">.\Objects\FreeRTOS.axf: Error: L6406E: No space in execution regions with .ANY selector matching hal_cm.o(.data).
</code></pre>
<p><img src="${pageContext.request.contextPath}/\img\nospace1.png" alt="no space!" /></p>
<p>在网站找了许多帖子，认为是变量定义太多，内存都不够用了。试了比较多的方法，都不灵。
去FreeRTOS的官方网站，发现了下面帖子：
<img src="${pageContext.request.contextPath}/\img\nospace2.png" alt="just overflow of RAM" />
上面的帖子的意思是，虽然看起来是溢出了，但主要是堆的长度定得有些大，需要在配置文件中降低它的值。</p>
<p>修改了之后，无报错。</p>
