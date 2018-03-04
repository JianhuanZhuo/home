<%@ page contentType="text/html; charset=UTF-8" %><p>一般来说，DOM 对象的 js property 与对应的 attribute 标识符相同，但有些则不同，如：</p>
<ol>
<li><code>className</code> property 对应 <code>class</code> attribute</li>
<li><code>tabIndex</code> property 对应 <code>tabindex</code> attribute</li>
</ol>
<p>检测属性是否支持的方法：</p>
<pre><code class="language-js">if (&quot;required&quot; in document.createElement(&quot;input&quot;)) {
// Attribute supported
}
</code></pre>
<p>在 HTML 标签中添加自定义的 attribute，应该符合 <code>data-*</code> 这个格式。</p>
<pre><code class="language-html">&lt;img id=&quot;my-image&quot; src=&quot;image.gif&quot; alt=&quot;An image&quot; alt=&quot;A beautiful image&quot;
data-custom=&quot;some value&quot; /&gt;
</code></pre>
<p>使用如下方式可以访问该自定义 attribute。</p>
<pre><code class="language-js">// 单独读取
$('#my-image').attr('data-custom');

// 设置属性
$('[title]').attr('title', function(index, previousValue) {
    return previousValue + ' I am element ' + index +' and my name is ' + (this.id || 'unset');
});

// 集中设置属性
$('input').attr({
        value: '',
        title: 'Please enter a value'
    });

// 删除指定属性，仅在 JS DOM 上删除了 property，但不会删除 HTML 节点的 attribute
$('img').removeAttr('title alt');
</code></pre>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-07-21-16-26.png" alt="Method syntax: attr" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-07-21-22-37.png" alt="Method syntax: attr" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-07-21-34-32.png" alt="Method syntax: attr" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-07-21-38-40.png" alt="Method syntax: removeAttr" /></p>
<blockquote>
<p>Removing an attribute doesn’t remove any corresponding property from the JavaScript  DOM element, although it may cause its value to change.</p>
</blockquote>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-07-21-53-32.png" alt="Method syntax: prop" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-08-20-13-52.png" alt="Method syntax: data" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-20-19-48.png" alt="Method syntax: data" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-20-21-27.png" alt="Method syntax: data" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-20-30-42.png" alt="Method syntax: removeData" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-20-31-48.png" alt="Method syntax: jQuery.hasData" /></p>
<pre><code class="language-js">// 下面两个等价，采用驼峰式的命名，
$('.class').data('lastValue');
$('.class').data('last-value');
// 下面这个声明了一个自定义属性，但其为 undefined
$('#name').data('mandatory', undefined);

$('.class').data('last-value', 10);
// data 会保留属性类型，如下将得到 number 类型
console.log(typeof $('.class').data('last-value'));


&lt;input id=&quot;name&quot; name=&quot;name&quot; data-mandatory=&quot;true&quot; /&gt;
// 下面这个会得到一个 string 类型，因为它视为一个自然属性
console.log(typeof $('#name').attr('data-mandatory'));
// 下面这个会得到一个 boolean 类型，会自行解析
console.log(typeof $('#name').data('mandatory'));


// 允许以 key-value 对的方式进行添加，下面是指定对象添加自定义属性
$.data(document.getElementById('book'), 'price', 10);
$('#book').data('price', 10);

// 删除数据
$('#legal-age').removeData();
$('#legal-age').removeData(['foo', 'bar']);
$('#legal-age').removeData('foo bar');
$.removeData(document.getElementById('legal-age'));
</code></pre>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-20-26-46.png" alt="How data() searches for stored information." />
更新不同，</p>
<pre><code class="language-html">&lt;input id=&quot;level1&quot; type=&quot;text&quot; value=&quot;I'm a text!&quot; data-custom=&quot;foo&quot; /&gt;
</code></pre>
<pre><code class="language-js">// 两者都打印出 &quot;foo&quot; 字符串
console.log($('#level1').data('custom'));
console.log($('#level1').attr('data-custom'));

// 更新值，但这个函数只会更新 data 里的
$('#level1').data('custom', 'new value');

// 这里会打印出更新后的值，&quot;new value&quot;
console.log($('#level1').data('custom'));
// 然而这里却不会变
console.log($('#level1').attr('data-custom'));
</code></pre>
<p>再从下面的这个例子可以看出，两者的操作是完全独立的</p>
<pre><code class="language-js">// Both these lines print &quot;foo&quot;.
console.log($('#level1').data('custom'));
console.log($('#level1').attr('data-custom'));

// Sets the value of the data-custom attribute to &quot;new value&quot;
$('#level1').attr('data-custom', 'new value');

// Prints &quot;foo&quot; because it was stored in memory (after invoking data() as a getter the first time)
console.log($('#level1').data('custom'));
// Prints the value &quot;new value&quot;
console.log($('#level1').attr('data-custom'));
</code></pre>
