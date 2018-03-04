<%@ page contentType="text/html; charset=UTF-8" %><p>title: CSS 笔记
date : 2017/8/18</p>
<hr />
<h3>文字居中</h3>
<pre><code class="language-css">/*文字左右居中*/
text-align:center;

/*垂直居中，需要设置行高和容器一样就可以*/
line-height: 200px;
</code></pre>
<h2>边距计算</h2>
<p>在绘制边界时，边界会增大 div  width 和 height 的实际大小。
使用 CSS3 可以指定绘制方式：</p>
<pre><code class="language-css">/* 这个属性表示在绘制边界时在元素内部绘制 */
box-sizing:border-box;
</code></pre>
<h2>定位</h2>
<p>position 定位如果有重叠的时候，z-index愈大，就显示在最上面</p>
<h2>CSS实现文字过长显示省略号</h2>
<p>这里需要注意的是，框住文字的父容器需要有一定的宽度，</p>
<pre><code class="language-css">/*溢出则隐藏*/
overflow: hidden;
/*隐藏方式为使用省略号*/
text-overflow: ellipsis;
/*强制不换行*/
white-space: nowrap;
</code></pre>
<h2>js 时间戳</h2>
<p>JavaScript 获取当前时间戳：
第一种方法：</p>
<pre><code class="language-js">var timestamp = Date.parse(new Date());
</code></pre>
<p>结果：1280977330000</p>
<p>第二种方法：</p>
<pre><code class="language-js">var timestamp = (new Date()).valueOf();
</code></pre>
<p>结果：1280977330748</p>
<p>第三种方法：</p>
<pre><code class="language-js">var timestamp=new Date().getTime()；
</code></pre>
<p>结果：1280977330748</p>
<p>第一种：获取的时间戳是把毫秒改成000显示，
第二种和第三种是获取了当前毫秒的时间戳。</p>
