<%@ page contentType="text/html; charset=UTF-8" %><p>对于我这种文档强迫症而言，见到文档，第一件事其实是写目录和提纲的。</p>
<p>在Hexo中内置有对目录的支持，但一般的主题都没有这个配置，所以需要对其进行手动的配置。</p>
<!--more-->
<h3>添加布局</h3>
<p>打开<code>hexo\themes\landscape-plus\layout\_partial\article.ejs</code>，在<code>&lt;%- post.content %&gt;</code>这一行之前插入如下代码：</p>
<pre><code class="language-bash">&lt;div id=&quot;toc&quot; class=&quot;toc-article&quot;&gt;
    &lt;strong class=&quot;toc-title&quot;&gt;文章目录&lt;/strong&gt;
    &lt;%- toc(post.content) %&gt;
&lt;/div&gt;
</code></pre>
<ul>
<li>如上代码插入的位置，直接影响到目录显示的位置，一般而言目录都是显示在正文之前的，所以在<code>&lt;%- post.content %&gt;</code>之前插入是比较合理的。</li>
</ul>
<h3>添加样式</h3>
<p>打开<code>hexo\themes\landscape-plus\source\css\_partial\article.styl</code>文件，在任意处（建议在首行，以便查找）插入如下代码：</p>
<pre><code class="language-css">/*toc*/
.toc-article
  background #eee
  border 1px solid #bbb
  border-radius 10px
  margin 1.5em 0 0.3em 1.5em
  padding 1.2em 1em 0 1em
  max-width 28%
.toc-title
  font-size 120%
#toc
  line-height 1em
  font-size 0.9em
  float right
  .toc
    padding 0
    margin 1em
    line-height 1.8em
    li
      list-style-type none
  .toc-child 
    margin-left 1em
</code></pre>
<ul>
<li>如果看官懂<code>css</code>的，可以对如上代码进行修改，但现在的代码我觉得还是比较OK的了。</li>
<li><code>toc-article</code>指定了目录整个<div>的背景色、边框色、倒角半径、各种间距以及最大的宽度。</li>
<li><code>toc-title</code>指的就是“文章目录”那四个字的设置。</li>
<li><code>#toc.toc</code>指定了目录列表的一些细节</li>
<li><code>toc-child</code>指定了二级目录的设置</li>
</ul>
<h3>启用目录</h3>
<p>默认的对于新添加的文章是不启用目录的，需在md文件的标头中添加如下参数：</p>
<pre><code class="language-bash">toc: true
</code></pre>
<p>效果如下：
<img src="${pageContext.request.contextPath}/\img\Hexo\title1.png" alt="具体效果" /></p>
<h3>修改列表参数</h3>
<p>如上的图中可以看出，我的一篇文章中自行有添加序号，而上述的方法默认的给我添加了列表序号，这让我苦恼了好一阵子。</p>
<p>解决方法：
修改其中<code>toc()</code>函数的参数，设置<code>list_number</code>的参数为<code>false</code>，关闭列表即可。</p>
<pre><code class="language-bash">&lt;div id=&quot;toc&quot; class=&quot;toc-article&quot;&gt;
    &lt;strong class=&quot;toc-title&quot;&gt;文章目录&lt;/strong&gt;
    &lt;%- toc(post.content, {list_number: false}) %&gt;
&lt;/div&gt;
</code></pre>
<p><img src="${pageContext.request.contextPath}/\img\Hexo\title2.png" alt="修改之后" /></p>
<h3>添加list_num变量</h3>
<p>如果希望能默认使用列表，而特殊文章不使用的话，可以如下配置：</p>
<pre><code class="language-bash">&lt;div id=&quot;toc&quot; class=&quot;toc-article&quot;&gt;
  &lt;strong class=&quot;toc-title&quot;&gt;文章目录&lt;/strong&gt;
  &lt;% if (post.list_num){ %&gt;
    &lt;%- toc(post.content, {list_number: false}) %&gt;
  &lt;% } else { %&gt;
    &lt;%- toc(post.content) %&gt;
  &lt;% } %&gt;
&lt;/div&gt;
</code></pre>
<ul>
<li>注意第三行的<code>post.list_num</code>变量，它的意思是文章中定义有<code>list_num</code>的，不启用自动列表。</li>
</ul>
