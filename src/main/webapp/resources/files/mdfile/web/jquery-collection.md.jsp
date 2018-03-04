<%@ page contentType="text/html; charset=UTF-8" %><h2>集合操作</h2>
<pre><code class="language-js">// 获取长度
$('p').length

// 获取元素，返回一个 DOM 对象
var imgElement = $('img[alt]')[0];
var imgElement = $('p').get(2)

// 返回的是一个 jQuery 对象，下面等价
var $secondDiv = $($('p').get(2));
var $secondDiv = $('div').eq(1); // 推荐
var $secondDiv = $('div:eq(1)');

// 获取第一个元素
var $firstElem = $('p').first();
var $firstElem = $('p:first');

// 获取最后一个元素
var $lastElem = $('p').last();

// 转换为数组
var allLabeledButtons = $('label + button').toArray();

// 获取指定选择器的索引
var index = $('#main-menu &gt; li').index($('#blog-link'));
// 获取指定 jQuery 对象的索引
var index = $('#main-menu &gt; li').index($('#blog-link'));
// 获取指定 DOM 对象的索引
var index = $('#main-menu &gt; li').index(document.getElementById('blog-link'));
</code></pre>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-11-08-22.png" alt="" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-11-22-01.png" alt="" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-11-23-39.png" alt="" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-11-25-43.png" alt="" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-11-26-48.png" alt="" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-11-28-31.png" alt="" /></p>
<h3>基于节点关系的操作</h3>
<pre><code class="language-js">// 指定 id 的元素，其祖先中类型为 div 的数量
var count = $('#description').parents('div').length;
// 获得孩子数量
var count = $('#description').children().length;
// 获得孩子数量，包含文本元素
var count = $('#description').contents().length;

// 指定选择器对 $set 对象内的元素进行查找
$set.find('p cite');
</code></pre>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-16-10-55.png" alt="" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-16-12-09.png" alt="" /></p>
<h2>增删操作</h2>
<pre><code class="language-js">// 节点添加操作，这个操作是创建新的集合而非在原有的集合上进行操作
$('img[alt]').add('img[title]');
// 可以直接新建并添加元素
$('img[alt]').add('&lt;div&gt;Hi there!&lt;/div&gt;');
// 为节点添加 class
$('img[alt]')
    .addClass('red-border')
    .add('img[title]')
    .addClass('opaque');

// 从集合中去除某些操作的 not
$('img[title]').not('[title*=&quot;puppy&quot;]');
// not 操作接受参数类型有：(Selector|Element|Array|jQuery|Function)
$('img[title]').not(function(index){
    // 每次仅传入一个元素，使用 this 获得该元素。若返回 ture 则删除。
    return $(this).children().length &gt; 2 &amp;&amp; index % 2 === 0;
});
// filter() 是与 not() 相反操作的函数，它会 filter 集合元素
$('td').filter(function() {
    // 若返回 ture 则保留。
    return this.innerHTML.match(/^\d+$/);
});

// slice 是 zero-based 集合切取函数，下面是获取第 2、3 个元素
$('img, div.wrapper', 'div').slice(1, 3);

// 保留原集合中有孩子满足条件的元素
$('div').has('img[alt]');
// 貌似与下面这个等同
$('div').filter(':has(&quot;img[alt]&quot;)')

// 变换函数
var $allIDs = $('div').map(function(index, elem) {
    // this 关键字也可以使用，它指向了 elem
    return this.id;
});

// 遍历
$('img').each(function(i){
    this.alt = 'This is image[' + i + '] with an id of ' + this.id;
});

// 测试函数
var hasImage = $('*').is('img');

// end() 会作用于链式调用，获得最后一次过滤的前一个状态的全部元素
// 如下的 end() 的最后一次过滤是发生在 filter() 函数，获得 filter()
// 函数过滤之前的全部元素，是指 $('img')
// jQuery objects maintain an internal stack that keeps track of changes to the matched set of elements.  ---P76
$('img')
    .filter('[title]')
    .hide()
    .end()
    .addClass('my-class');

// addBack() 会作用于链式调用，即反向添加，
// 将上一次过滤之前的全部元素以某条件加入到当前集合中
$('div')
    .addClass('my-class')
    .find('img')
    // 过滤后获得子代 'img'
    .addClass('red-border')
    // 将上次的全部元素加入到当前集合中，以便一次性将子代和父代都添加指定类
    .addBack()
    .addClass('opaque');
</code></pre>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-17-15-48.png" alt="Method syntax: add" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-17-57-00.png" alt="Method syntax: not" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-18-13-17.png" alt="Method syntax: filter" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-19-19-19.png" alt="Method syntax: slice" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-19-49-45.png" alt="Method syntax: has" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-20-00-49.png" alt="Method syntax: map" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-20-05-33.png" alt="Method syntax: each" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-20-07-00.png" alt="Method syntax: is" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-20-11-46.png" alt="Method syntax: end" /></p>
<blockquote>
<p>jQuery objects maintain an internal stack that keeps track of changes to the matched set of elements.  ---P76</p>
</blockquote>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-04-20-17-44.png" alt="Method syntax: addBack" /></p>
