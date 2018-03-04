<%@ page contentType="text/html; charset=UTF-8" %><p>自定义模板开发笔记整理，待更新。。。</p>
<!--more-->
<h2>K2组件自定义模板制作</h2>
<p>复制 components/com_k2 至 templates[某个模板]\html<br />
保留 tmpl 文件夹（也可能是其他视图的模板文件夹）及其路径即可</p>
<h2>k2模块自定义模板制作</h2>
<ol>
<li>复制 modules/mod_k2_content 至 templates[某个模板]\html\</li>
<li>重命名 /mod_k2_content/tmpl 文件夹为自定义模块模板名，如 zxwz</li>
<li>将 zxwz/Default/default.php 复制出</li>
<li>删除 Default/ 文件夹</li>
</ol>
