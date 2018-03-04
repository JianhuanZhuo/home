<%@ page contentType="text/html; charset=UTF-8" %><p><code>$</code> 与 <code>jQuery</code> 等价</p>
<p>使用如下方式等待网页加载完成，而不是 <code>window.load = function(){//..}</code></p>
<pre><code class="language-js">jQuery(document).ready(function(){
    //...
});

//简短版本为：
$(function(){
    //...
})
</code></pre>
<pre><code class="language-js">// 创建一个 &lt;img&gt; DOM 对象，并绑定相应属性
$('&lt;img&gt;', {
    src:    'images/pic.png',
    alt: 'Little Bear',
    click: function() {
        // 由于这个函数仅在 click 事件中触发，故与顺序无关
        alert($(this).attr('title'));
    },
    title:'I woof in your general direction'
})
// 追加到由 'body' 选择器指定的对象
.appendTo('body');
</code></pre>
