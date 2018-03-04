<%@ page contentType="text/html; charset=UTF-8" %><p>类 <code>TextFormatter</code> 用于对 <code>TextField</code> 的输入格式化。</p>
<!--more-->
<p>参考：<a href="http://docs.oracle.com/javase/8/javafx/api/javafx/scene/control/TextFormatter.html">JavaFX 8 API Class TextFormatter<V></a></p>
<p>类 <code>TextFormatter</code> 是一种格式化工具，它使用了两种不同的机制对类 <code>TextInputControl</code> 输入文本的格式进行描述。</p>
<ol>
<li>过滤器 (<code>getFilter()</code>)，它将解释和修改用户文本输入，使得文本输入满足指定的格式。它还可以指定一个默认值初始化输入。</li>
<li>值转换器 (<code>getValueConverter()</code>)，它提供 <strong>V</strong> 类型值的指定显示格式。如何控件可编辑且值被用户所修改，那么对应的显示文本也会被更新。</li>
</ol>
