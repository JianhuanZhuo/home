<%@ page contentType="text/html; charset=UTF-8" %><p>在http协议进行网页传输时，很多时间为了效率考虑，需要对http主体内容进行压缩，然后进行传输，之前的时候我还不知道这回事，然后无法纠正的乱码搞了一下午，之后请教了少波，才知道要进行解码，解码方式如下：</p>
<pre><code class="language-java">//实际下载内容，使用BufferReader读取,使用指定编码,解压GZIP格式数据
reader = new BufferedReader(new InputStreamReader(
		new GZIPInputStream(connection.getInputStream()),getEncoding())); 
String line;
while((line = reader.readLine()) != null) {
	result += line;
}
</code></pre>
<p>上面描述的方式仅针对gzip压缩方式，其他的压缩也雷同，具体是用那种压缩方式应该查看报文头的压缩选项。</p>
