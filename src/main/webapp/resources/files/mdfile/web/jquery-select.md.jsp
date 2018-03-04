<%@ page contentType="text/html; charset=UTF-8" %><p><code>*</code>
<code>#id</code> id 不应该包含空白符
<code>.class</code>
<code>tag</code>
<code>div, span</code> 选择两种选择条件的结果交集
<code>a b</code> 后人，子孙元素，descendants
<code>a &gt; b</code> a 条件元素下的直接子元素 b
<code>E+F</code> 直接兄元素满足 E 的元素 F (immediately preceded by sibling E)
<code>E~F</code> 任意兄元素满足 E 的元素 F (preceded by any sibling E)</p>
<h3>属性选择器</h3>
<p><code>x[attr oper '']</code>
如：<code>a[href^='http://']</code> a 标签内的 href 属性其开头为 http 的元素。
<code>a[href!='http://']</code>
<code>input[type='text']</code> 自定义的方法选择
<code>div[title^='sub']</code> title 属性开头是 sub 的 div</p>
<p><code>a[href$='.pdf']</code> 选择 a 标签内的 href 属性其结尾为 .pdf 的元素。
<code>a[herf*='xx']</code> a 的 href 属性包含 xx
<code>a[href|=]</code>
<code>a[A~='X']</code> a 中的属性 A 等于 X 或者空格切分后有等于 X 的。
<code>a[X1][X2]</code> 同时满足 X1、X2 条件的</p>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-03-22-33-37.png" alt="" /></p>
<h3>位置过滤器</h3>
<p>注意到位置过滤器都不是 in css，所以执行速度会慢一点
<code>:first</code> 第一个元素
<code>:last</code>
<code>:even</code> 偶数
<code>:odd</code> 奇数
<code>:eq(n)</code> 第 n 个元素
<code>:gt(n)</code> gt 是 great than 的意思，索引大于 n 的元素，负数是从后往前数的
<code>:lt(n)</code> lt 是 less than 的意思，索引小于 n 的元素，负数是从后往前数的</p>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-03-22-32-32.png" alt="" /></p>
<h3>子元素过滤器</h3>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-03-22-35-07.png" alt="" /></p>
<h3>表单选择器</h3>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-03-22-47-26.png" alt="" /></p>
<h3>内容选择器</h3>
<blockquote>
<p>Note that by content we mean not only raw text but also child elements.---P43</p>
</blockquote>
<p><code>div:has(span)</code> 选择了包含 span 的 div
<code>div span</code> 选择了 div 下的 span</p>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-03-22-48-58.png" alt="" /></p>
<h3>其他选择器</h3>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-03-22-55-42.png" alt="" /></p>
<h3>自定义选择器</h3>
<pre><code class="language-js">// pointsHigherThan 是选择器名
$.expr[':'].pointsHigherThan = $.expr.createPseudo(function(filterParam) {
    var points = parseInt(filterParam, 10);
    return function(element, context, isXml) {
        // 测试并决定是否保留当前元素，每次仅测试一个元素
        return element.getAttribute('data-points') &gt; points;
    };
});

// 使用方式
var $elements = $('.levels li:pointsHigherThan(50)');
</code></pre>
<h3>使用上下文限制搜索范围</h3>
<pre><code class="language-js">// 选择器默认为 document
$('selectors', context)

// 可以使用 DOM 对象引用或者选择器字符串，下面两者等价
$('p', 'div')
$('div p')

// 选择 div 下的全部 a 和 span，更好的选择是使用上下文，至少在语义上表达更简洁一点
$('div a, div p')
$('a, p', 'div')
</code></pre>
