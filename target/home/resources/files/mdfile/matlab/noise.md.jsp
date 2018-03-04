<%@ page contentType="text/html; charset=UTF-8" %><h2>title: 噪声
date: 2016/2/6 22:04:35
tags: [Matlab, DIP]</h2>
<p>可以说噪声是在产生与处理图像的过程中产生的随机误差，需要使用概率统计方法来认识。</p>
<p>{% blockquote 图像噪声 %}
图像中各种妨碍人们对其信息接受的因素称为图像噪声。
{% endblockquote %}</p>
<!--more-->
<h2>imnoise生成噪声模型</h2>
<p>噪声带有随机性，在弄清噪声为何物之前，需要学会的是模仿噪声，在<code>Matlab</code>中提供一个生成噪声的函数<code>imnoise()</code>，该函数的原型如下：</p>
<pre><code class="language-matlab">g = imnoise(f, type, parameters)
</code></pre>
<blockquote>
<p>需要说明的是，在处理时图像将被转换为[0,1]double类型，而噪声会直接被加至原图像，那么限制均值、方差的意义之一在于保证噪声不会<strong>溢出</strong>图像能表示的范围。</p>
</blockquote>
<p>函数<code>imnoise()</code>表示在图像<code>f</code>中添加指定类型<code>type</code>的噪声，噪声的可用类型说明如下：</p>
<table>
<thead>
<tr><th>type</th><th>description</th><th>备注</th></tr>
</thead>
<tbody>
<tr><td>'gaussian'</td><td>Gaussian white noise with constant mean and variance</td><td>高斯噪声</td></tr>
<tr><td>'localvar'</td><td>Zero-mean Gaussian white noise with an intensity-dependent variance</td><td>局部噪声</td></tr>
<tr><td>'poisson'</td><td>Poisson noise</td><td>柏松噪声</td></tr>
<tr><td>'salt &amp; pepper'</td><td>&quot;On and Off&quot; pixels</td><td>椒盐噪声</td></tr>
<tr><td>'speckle'</td><td>Multiplicative noise</td><td>乘性噪声</td></tr>
</tbody>
</table>
<h4>1. 'gaussian'</h4>
<p>使用<code>imnoise()</code>函数生成高斯噪声如下：</p>
<pre><code class="language-matlab">imnoise(f, 'gaussian', m, var)
</code></pre>
<ul>
<li>m 指定均值，默认值为0</li>
<li>var 指定方差，默认值为0.01</li>
</ul>
<h4>2. 'localvar'</h4>
<p>使用<code>imnoise()</code>函数生成局部噪声如下：</p>
<pre><code class="language-matlab">imnoise(f, 'localvar', v)
</code></pre>
<ul>
<li>v 指定局部方差均值，均值设定为0</li>
</ul>
<h4>3. 'poisson'</h4>
<p>使用<code>imnoise()</code>函数生成柏松噪声如下：</p>
<pre><code class="language-matlab">imnoise(f, 'poisson')
</code></pre>
<h4>4. 'salt &amp; pepper'</h4>
<p>使用<code>imnoise()</code>函数生成椒盐噪声如下：</p>
<pre><code class="language-matlab">imnoise(f, 'gaussian', d)
</code></pre>
<ul>
<li>d 指定噪声密度，默认为0.05</li>
</ul>
<p>其中d为约数，即大概值，它表示图像中将有d*numl(f)个像素受影响。</p>
<h4>5. 'speckle'</h4>
<p>使用<code>imnoise()</code>函数生成柏松噪声如下：</p>
<pre><code class="language-matlab">imnoise(f, 'speckle'， var)
</code></pre>
<ul>
<li>var 指定乘性噪声图像的系数，默认为0.04。</li>
</ul>
