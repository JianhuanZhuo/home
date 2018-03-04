<%@ page contentType="text/html; charset=UTF-8" %><p>在写笔记或记录时，常常看到一些比较nice的演示视频与视频资料，在这里介绍一个在Hexo中比较简单的视频插入方法（以优酷视频为例）。</p>
<!--more-->
<h2>示例说明</h2>
<p>需要说明几点，</p>
<ol>
<li>此方法只能插入外部链接，</li>
<li>如果需要插入自己的视频，需要先将视频上传到优酷中，再进行链接。</li>
<li>此方法插入视频，使用的视频将是（只能是）公开的（可下载传播）。</li>
</ol>
<h2>插入代码</h2>
<p>这里将演示<a href="youku.com">优酷视频</a>插入示例（其他视频网站类似）：</p>
<p>找到所需的视频，如果需要使用自己的视频，需要事先<a href="http://www.youku.com/v/upload">上传视频</a></p>
<p>选择分享功能，找到链接代码：
<img src="${pageContext.request.contextPath}/\img\Hexo\video2.png" alt="链接代码" /></p>
<p>在需要插入的Markdown文件中插入链接：
<img src="${pageContext.request.contextPath}/\img\Hexo\video1.png" alt="Markdown代码" /></p>
<h2>效果演示</h2>
<iframe height=498 width=510 src="http://player.youku.com/embed/XNTM5NzQ3NzQ4" frameborder=0 allowfullscreen></iframe>
<h2>其他</h2>
<p>在Hexo中有一些插件，支持视频的插入，如：</p>
<ul>
<li><a href="https://github.com/m80126colin/hexo-tag-owl">hexo-tag-owl</a></li>
<li><a href="https://github.com/geekplux/hexo-tag-video">hexo-tag-video</a></li>
</ul>
<p>但是他们也都只能插入Youtube或者youku之类的分享出来的视频，在响应式上还需另寻更佳的方案。</p>
