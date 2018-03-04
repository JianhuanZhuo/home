<%@ page contentType="text/html; charset=UTF-8" %><h2>jquery 属性</h2>
<p>jQuery 可用的属性如下：</p>
<table>
<thead>
<tr><th>属性</th><th>说明</th></tr>
</thead>
<tbody>
<tr><td>$.fx.off</td><td>开启或关闭特效</td></tr>
<tr><td>$.fx.interval</td><td>改变动画速率</td></tr>
<tr><td>$.support</td><td>支持的特性，平台测试结果数据集，jq 1.9 后弃用了</td></tr>
</tbody>
</table>
<h2>与其他库兼容</h2>
<p>[Function syntax: $.noConflict]</p>
<pre><code class="language-js">// 放弃 `$` 符号的抚养权。
$.noConflict();

// 放弃 $ 和 jQuery 的抚养权
$.noConflict(true);

// 再放弃抚养权之前可以先另起一个别名，以继续使用 jQuery 的功能
var $j = jQuery;
// 将新的别名绑定到 window 顶级域中
window.$j = $.noConflict(true);

// closure 闭包操作
// 这里定义了一个匿名函数，在匿名函数中，使用 $ 作为参数，并在随后立即使用 jQuery 调用，
//使得函数内的区域可以安全的使用 $
(function($) {
// Function body here
})(jQuery);
</code></pre>
<p>Immediately-Invoked Function Expression (IIFE)
立即执行函数表达式</p>
<h2>JS 对象操作</h2>
<p>[Function syntax: $.trim]
[Function syntax: $.each]
[Function syntax: $.grep]
[Function syntax: $.map]
[Function syntax: $.inArray]
[Function syntax: $.makeArray]
[Function syntax: $.unique]
[Function syntax: $.merge]</p>
<pre><code class="language-js">// 头尾去空函数 
$.trim()
// 需要注意的是，他会自动转化传入参数为 String 对象类型，所以很容易出现 &quot;[object Object]&quot; 的毛病
var trimmedString = $.trim($('#some-field').val());

// 使用 each 函数进行迭代
var anArray = ['one', 'two', 'three'];
$.each(anArray, function(i, value) {
    // Do something here
    });
var anObject = {one:1, two:2, three:3};
$.each(anObject, function(name, value) {
    // Do something here
    });

// 使用 grep 函数进行过滤操作
var bigNumbers = $.grep(originalArray, function(value) {
        return value &gt; 100;
    });

// 使用 map 函数进行映射操作
var oneBased = $.map(
        [0, 1, 2, 3, 4],
        function(value) {
            return value + 1;
        }
    );

// map 函数允许扁平映射
// 下述例子中返回值为：['t', 'h', 'i', 's', 't', 'h', 'a', 't']
var characters = $.map(
        ['this', 'that'],
        function(value) {
            return value.split('');
        }
    );

// 使用 inArray 函数检查数组内是否存在特定的值
var index = $.inArray(2, [1, 2, 3, 4, 5]);

// 使用 makeArray 转换对象为数组
var arr = $.makeArray({a: 1, b: 2});
var sortedArgs = $.makeArray(document.getElementsByTagName('img')).sort();

// 使用 unique 函数去除重复元素
// $.unique() works only with arrays of DOM elements

// 使用 merge 函数融合两个数组，下述结果为：[1, 2, 3, 4, 5, 5, 6, 7, 8, 9]
var arr1 = [1, 2, 3, 4, 5];
var arr2 = [5, 6, 7, 8, 9];
var arr3 = $.merge(arr1, arr2);

// 使用 extend 浅拷贝方法
var target =  {a: 1, b: 2, c: 3};
var source1 = {c: 4, d: 5, e: 6};
var source2 = {c: 7, e: 8, f: 9};
// Merges the three objects putting all the properties into the first
// 这方法会修改 target 参数的内容，若不想修改应该使用 merge 方法
$.extend(target, source1, source2);
// target 的内容变成：{a: 1, b: 2, c: 7, d: 5, e: 8, f: 9}

// 使用 extend 深拷贝方法
var target = {a: 1, b: 2};
var source1 = {b: {foo: 'bar'}, c: 3};
var source2 = {b: {hello: 'world'}, d: 4};
$.extend(true, target, source1, source2);
// target 的内容变成：{a: 1, b: {foo: bar, hello: world}, c: 3, d: 4}

// P248
$.param()
</code></pre>
<h2>JSON</h2>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-10-13-52-53.png" alt="Function syntax: $.parseJSON" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-10-13-54-05.png" alt="Function syntax: $.parseXML" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-10-13-54-35.png" alt="Function syntax: $.parseHTML" /></p>
<h2>其他工具函数</h2>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-10-13-56-50.png" alt="Function syntax: $.contains" />
// P256 $.proxy
[Function syntax: $.proxy]</p>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-10-14-00-58.png" alt="Function syntax: $.globalEval" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-10-14-02-50.png" alt="Function syntax: $.error" /></p>
<pre><code class="language-js">function isPrime(number) {
    if (typeof number !== 'number') {
        $.error('The argument provided is not a number');
    }
    // Remaining code here...
}
</code></pre>
