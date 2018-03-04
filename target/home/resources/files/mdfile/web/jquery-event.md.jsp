<%@ page contentType="text/html; charset=UTF-8" %><p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-10-55-06.png" alt="Method syntax: on" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-15-04-30.png" alt="Method syntax: one" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-15-05-47.png" alt="Method syntax: off" /></p>
<blockquote>
<p>Returning false from an event handler added using this jQuery method is the same as calling preventDefault() and stopPropagation(), whereas returning false in an event handler added using a native method is equivalent to only invoking preventDefault().</p>
</blockquote>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-15-03-19.png" alt="Events available for listening" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-16-21-11.png" alt="Browser-independent jQuery.Event properties" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-16-22-48.png" alt="Browser-independent jQuery.Event methods" /></p>
<pre><code class="language-js">$('#example')
    .on('click', function (event) {
        console.log('At ' + formatDate(new Date()) + ' BOOM once!');
    })
    .on('click', function (event) {
        console.log('At ' + formatDate(new Date()) + ' BOOM twice!');
    })
    // 绑定多个事件用空格分隔即可
    .on('mouseenter mouseleave', myFunctionHandler);

// 键值对式的一次性绑定多个事件，eventsHash
$('button').on({
    click: function(event) {
        console.log('Button clicked!');
    },
    mouseenter: myFunctionHandler,
    mouseleave: myFunctionHandler
});

// 事件委托
$('#my-list').on('mouseover', 'li', function(event) {
    console.log('List item: ' + ($(this).index() + 1));
});

// 使用 document 对象委托事件，但性能会受损
$(document).on('mouseover', '#my-list li', function(event) {
    console.log('List item: ' + ($(this).index() + 1));
});

// will remove all event listeners in namespace fred 
// (remember that in this case the period in front of the name doesn’t indicate a class selector).
$('*').off('.fred');
</code></pre>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-16-31-42.png" alt="Method syntax: trigger" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-16-36-35.png" alt="Method syntax: triggerHandler" /></p>
<pre><code class="language-js">// 对于如下已经绑定的事件
$('#foo').on('click', function(event, par1, par2, par3){
    console.log(par1, par2, par3);
});
// 编程触发事件，注意下面的这两个的参数传入方式不同的
$('#foo').trigger('click', 1, 2, 3); // 1 undefined undefined
$('#foo').trigger('click', [1, 2, 3]); // 1 2 3

// triggerHandler 函数不会导致冒泡
$('#address').triggerHandler('focus');
</code></pre>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-16-50-45.png" alt="Method syntax: specific event binding" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-16-51-24.png" alt="Method syntax: Specific event triggering" /></p>
<pre><code class="language-js">$('#btn')
    .on('click', function() {
        console.log('Button clicked');
    })
    .trigger('click');
// 上面与下面等价
$('#btn')
    .click(function() {
        console.log('Button clicked');
    })
    .click();

// 自定义事件
$('#btn').on('customEvent', function(){
    alert('customEvent');
});
// 事件触发
$('#anotherBtn').click(function() {
    $('#btn').trigger('customEvent');
});
</code></pre>
<h2>事件命名空间</h2>
<pre><code class="language-js">// 命名空间就是在事件的后面添加一个后缀
$('.my-class').on('click.editMode', myFunction);
// 命名空间允许多层次
$('.elements').on('click.myApp.myName', myFunction);

// 关闭命名空间的全部事件触发
$('*').off('.editMode');
// 触发命名空间内的全部事件
$('.elements, .other-elements').trigger('click.myApp');
</code></pre>
