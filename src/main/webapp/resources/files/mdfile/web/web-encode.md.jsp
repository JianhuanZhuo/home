<%@ page contentType="text/html; charset=UTF-8" %><p>在获取网页的爬虫数据时会存在网页编码的问题，原则上来说如果只是存储数据的话，编码的问题不会存在，但如果需要解析其中的内容，那么编码的识别是避免不了的，下面仅作一个简单的示例：</p>
<pre><code class="language-java">URL url;
	URLConnection rulConnection;
	try {
		url = new URL(&quot;http://www.baidu.com&quot;);
		rulConnection = url.openConnection();
		HttpURLConnection httpUrlConnection = (HttpURLConnection) rulConnection;
		InputStream inStrm = httpUrlConnection.getInputStream();
		

		byte[] b = new byte[1024];
		int c = inStrm.read(b);
		while (-1 != c) {
			//new String(b, &quot;UTF-8&quot;);这种会出现读不到1024时会有字符被转为字符串
			//java内部编码使用utf-16，需要先用网页的编码解析从网页获取的bytes数组
			System.out.print(new String(b, 0, c, &quot;UTF-8&quot;));
			c = inStrm.read(b);
		}
	} catch (MalformedURLException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}

</code></pre>
