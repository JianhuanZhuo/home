<%@ page contentType="text/html; charset=UTF-8" %><p>之前在需要使用PHP的Socket进行数据发送，但Socket在发送单个字节数据时显得有些麻烦，PHP有<code>sprintf()</code>这一类的函数进行字符串的“合成”呢？</p>
<pre><code class="language-php">	$bufToSend = pack(&quot;C*&quot;, 0x01, 0xfe);
	socket_write($socket, $bufToSend)
</code></pre>
<p>将数据包装为字符串，这样就可以使用Socket发送了</p>
