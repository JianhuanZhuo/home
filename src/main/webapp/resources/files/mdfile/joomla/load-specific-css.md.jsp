<%@ page contentType="text/html; charset=UTF-8" %><p>Joomla 样式表加载笔记整理。</p>
<!--more-->
<h3>4.7 加载特定样式表</h3>
<p>您可以加载自定义的样式表，在templates/t3_bs3_blank/less文件夹中创建.less文件。</p>
<p>然后在templates/t3_bs3_blank/tpls下打开需要加载less的php文件。</p>
<p>语法：</p>
<pre><code class="language-php">&lt;?php $this-&gt;addCss(‘path-to-.less-file’) ?&gt;
</code></pre>
<p>提示：为了便于管理，可以在less文件夹中新建自定义文件夹，只需要在引用的时候加载正确路径即可。或者是将
<img src="http://cdn.camad.cn/images/t3v3doc/part-4/11.png" alt="" /></p>
<h3>“local”文件夹结构</h3>
<p><img src="http://cdn.camad.cn/images/t3v3doc/part-5-1/1.png" alt="" /></p>
<h3>CSS与JS自定义</h3>
<p>要新建CSS和JS文件，请先创建其父目录。</p>
<p>CSS文件：{root}/templates/{template-name}/local/css/</p>
<p>JS文件：{root}/templates/{template-name}/local/js/</p>
<p>然后复制etc/assets.xml文件到local/etc/文件夹中，在local/etc/assets.xml中定义CSS和JS</p>
<p><img src="http://cdn.camad.cn/images/t3v3doc/part-5-1/2.png" alt="" /></p>
