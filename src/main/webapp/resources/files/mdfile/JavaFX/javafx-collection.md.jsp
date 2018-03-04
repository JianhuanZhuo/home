<%@ page contentType="text/html; charset=UTF-8" %><h2>无法添加节点到 ObservableList 中，添加删除都报 UnsupportedOperationException 错误</h2>
<p>参考：<a href="https://stackoverflow.com/questions/2965747/why-do-i-get-an-unsupportedoperationexception-when-trying-to-remove-an-element-f">Why do I get an UnsupportedOperationException when trying to remove an element from a List?</a></p>
<p>由于在构建这个列表时，使用的是 <code>Arrays.asList()</code> 作为实现，该方法返回的是固定大小的列表，所以无法插入删除。</p>
<p>解决方式是，转换底层列表实现，如：</p>
<pre><code class="language-java">List&lt;String&gt; list = new LinkedList&lt;String&gt;(Arrays.asList(split));
</code></pre>
