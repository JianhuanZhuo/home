<%@ page contentType="text/html; charset=UTF-8" %><h2>CSS class 操作</h2>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-20-46-28.png" alt="Method syntax: addClass" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-20-47-56.png" alt="Method syntax: removeClass" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-20-55-06.png" alt="Method syntax: toggleClass" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-20-58-20.png" alt="Method syntax: hasClass" /></p>
<pre><code class="language-js">// 添加类
$('.some-class').addClass('hidden');
// 删除类
$('#text').removeClass('hidden');

// 按钮点击转换类状态
$('.share-widget').click(function() {
        $('.socials', this).toggleClass('hidden');
    });
// 函数独立判断，转换类状态
$('p').toggleClass(function(index) {
        return (index % 2 === 0) ? 'hidden' : '' ;
    });

if (aValue === 10) {
    $('p').addClass('hidden');
} else {
    $('p').removeClass('hidden');
}
// 上面的代码与下面等价
$('p').toggleClass('hidden', aValue === 10);

// 类存在测试，is 是等价的做法
$('p:first').hasClass('surprise-me');
$('p:first').is('.surprise-me');
</code></pre>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-00-06.png" alt="Method syntax: css" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-04-28.png" alt="Method syntax: css" /></p>
<pre><code class="language-js">// 直接应用
$('.expandable').css('width', '+=20');

// 直接对 .expandable 应用 width 的样式，其值动态设定
$('.expandable').css('width', function(index, currentWidth) {
        return parseInt(currentWidth, 10) + 20 * index;
    });

// 直接应用一组 CSS 样式，其中还可以混合动态值设定
$('p').css({
        margin: '1em',
        color: '#FFFFFF',
        opacity: function (index, currentValue) {
            return 1 - ((index % 10) / 10);
        }
    });

// Retrieves the object with the property-value pairs
var styles = $('.special').css([
        'font-size', 'color', 'text-decoration'
    ]);
// 打印出上面获得的全部属性
for(var property in styles) {
        console.log(property + ': ' + styles[property]);
    }
</code></pre>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-07-51.png" alt="Method syntax: width and height" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-08-15.png" alt="Method syntax: width and height" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-11-39.png" alt="Additional jQuery dimension-related methods" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-12-03.png" alt="" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-12-37.png" alt="Method syntax: offset" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-12-55.png" alt="Method syntax: offset" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-13-22.png" alt="Method syntax: position" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-13-40.png" alt="" /></p>
<pre><code class="language-js">$('div').width(500);
$('div').css('width', 500);
</code></pre>
<h2>节点内容操作</h2>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-15-52.png" alt="Method syntax: html" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-16-07.png" alt="Method syntax: html" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-20-04.png" alt="Method syntax: append" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-23-44.png" alt="Method syntax: prepend" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-27-28.png" alt="Method syntax: before" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-27-52.png" alt="Method syntax: after" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-33-45.png" alt="Method syntax: wrap" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-38-43.png" alt="Method syntax: wrapAll" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-39-50.png" alt="Method syntax: wrapInner" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-40-19.png" alt="Method syntax: unwrap" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-48-01.png" alt="Method syntax: remove" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-48-20.png" alt="Method syntax: empty" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-49-59.png" alt="Method syntax: clone" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-50-31.png" alt="Method syntax: replaceWith" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-21-59-10.png" alt="Method syntax: replaceAll" /></p>
<pre><code class="language-js">//对于某 HTML 节点
&lt;div id=&quot;message&quot;&gt;&lt;/div&gt;
// 使用 html 设置内容
$('#message').html('&lt;p&gt;Your current balance is &lt;b&gt;1000$&lt;/b&gt;&lt;/p&gt;');
// 结果可获得：
&lt;div id=&quot;message&quot;&gt;&lt;p&gt;Your current balance is &lt;b&gt;1000$&lt;/b&gt;&lt;/p&gt;&lt;/div&gt;

// 使用 text 则会返回全部的内容的字符，包括空格之类的
var text = $('#the-list').text();

// 在已选定的节点内的子节点列表中追加内容
$('p').append('&lt;b&gt;some text&lt;b&gt;');
// 若追加的内容是已存在于页面的节点，那么这些节点则会被移动
$('p.append-to').append($('a.append'));

// 移动前
&lt;a href=&quot;http://www.manning.com&quot; class=&quot;append&quot;&gt;Text&lt;/a&gt;
&lt;p class=&quot;append-to&quot;&gt;&lt;/p&gt;
// 移动后
&lt;p class=&quot;append-to&quot;&gt;
    &lt;a href=&quot;http://www.manning.com&quot; class=&quot;append&quot;&gt;Text&lt;/a&gt;
&lt;/p&gt;

// 混合追加内容
$('#message').append(
        '&lt;p&gt;This&lt;/p&gt;',
        [
            '&lt;p&gt;is&lt;/p&gt;',
            $('&lt;p&gt;').text('my')
        ],
        $('&lt;p&gt;text&lt;/p&gt;')
    );

// 自建一个节点后添加到页面内
var $newParagraph = $('&lt;p&gt;&lt;/p&gt;').text(
        $('#description').text() + ' ' + $('#adv').text()
    );
$('#box').after($newParagraph);

// 向上包装，对于如下的例子
&lt;a class=&quot;surprise&quot;&gt;A text&lt;/a&gt;
&lt;a&gt;Hi there!&lt;/a&gt;
&lt;a class=&quot;surprise&quot;&gt;Another text&lt;/a&gt;
// 使用如下包装器，将符合条件的节点包装入新建的元素中
$('a.surprise').wrap('&lt;div class=&quot;hello&quot;&gt;&lt;/div&gt;');
// 得到结果如下
&lt;div class=&quot;hello&quot;&gt;&lt;a class=&quot;surprise&quot;&gt;A text&lt;/a&gt;&lt;/div&gt;
&lt;a&gt;Hi there!&lt;/a&gt;
&lt;div class=&quot;hello&quot;&gt;&lt;a class=&quot;surprise&quot;&gt;Another text&lt;/a&gt;&lt;/div&gt;

// 动态更换内容
var newContent = '&lt;p&gt;Wow, this new content is awesome!&lt;/p&gt;';
$('#content')
    .empty()
    .html(newContent);

// 简单的方法
&lt;img src=&quot;image1.jpg&quot; alt=&quot;A ball&quot; /&gt;
$('img[alt]').each(function(){
        $(this).replaceWith('&lt;span&gt;' + $(this).attr('alt') + '&lt;/span&gt;');
    });
// 结果
&lt;span&gt;A ball&lt;/span&gt;

// 反向替换
$('img[alt]').each(function(){
        $('&lt;span&gt;' + $(this).attr('alt') + '&lt;/span&gt;').replaceAll(this);
    });
</code></pre>
<h2>表单元素处理</h2>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-22-07-38.png" alt="Method syntax: val" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-08-22-16-24.png" alt="Method syntax: val" /></p>
<pre><code class="language-js">// 获取指定元素的值
$('input[type=&quot;radio&quot;][name=&quot;radio-group&quot;]:checked').val();

// 获取整排的值
var checkboxValues = 
    $('input[type=&quot;checkbox&quot;][name=&quot;checkboxgroup&quot;]:checked').map(function() {
            return $(this).val();
        })
    .toArray();

// 值设定，match any of the input strings
$('input[type=&quot;checkbox&quot;], select').val(['one', 'two', 'three']);
</code></pre>
