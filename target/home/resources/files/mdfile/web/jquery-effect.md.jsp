<%@ page contentType="text/html; charset=UTF-8" %><p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-17-53-39.png" alt="Method syntax: hide" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-17-53-06.png" alt="Method syntax: hide continue" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-17-54-13.png" alt="The properties and the values, in alphabetic order, allowed in the options parameter" /></p>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-17-57-56.png" alt="Method syntax: show" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-17-58-16.png" alt="Method syntax: toggle" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-21-28-14.png" alt="Method syntax: fadeIn fadeOut" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\2017-08-09-21-48-53.png" alt="Method syntax: fadeToggle" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-09-21-53-31.png" alt="Method syntax: fadeTo" /></p>
<pre><code class="language-js">$('.icon-roll').click(function() {
    var $icon = $(this);
    $icon
        .closest('.module')
        .find('.body')
        .toggle('slow', function() {
            $icon.text($(this).is(':hidden') ? '+' : '-');
        });
});

// stop 停止状态，第一个布尔可以决定是否清除接下来的其他动画，第二个布尔决定是否马上完成当前的那个动画
// finish 立刻到动画全部执行完成的那个状态

// 自定义动画，将自身的高度和宽度都加倍，简单的可用 transform: scale(2) 表示
// each 后的函数同时进行的，因为 animate 函数不会阻塞
$('.animated-elements').each(function() {
    var $this = $(this);
        $this.animate({
                width: $this.width() * 2,
                height: $this.height() * 2
            },
            2000
        );
    });

// 下面两个动画同时触发，加入动画队列，因为 animate 函数不会阻塞
// 但由于是同一个对象的不同动画，所以动画的播放还是有次序队列的
$('#test-subject').animate({left: '+=256'}, 'slow');
$('#test-subject').animate({top: '+=256'}, 'slow');

</code></pre>
<p>[Method syntax: queue]
[Method syntax: dequeue]
[Method syntax: clearQueue]
[Method syntax: delay]</p>
<pre><code class="language-js">// queue 里的函数是可选的带一个 next 参数，他是表示下一个函数
$images
    .queue('chain', function(next) {
            console.log('First: ' + $(this).attr('alt'));
            next();
        })
    .queue('chain', function() {
            console.log('Fourth: ' + $(this).attr('alt'));
        });
</code></pre>
