<%@ page contentType="text/html; charset=UTF-8" %><h1>Install Hexo</h1>
<p>comments</p>
<h2>install Node.js</h2>
<p>offcial websit:<a href="http://nodejs.org">nodejs.org</a></p>
<!--more-->
<h2>config your github</h2>
<h2>install Hexo</h2>
<ol>
<li>install Hexo with node.js</li>
</ol>
<pre><code class="language-bash">$ npm install -g hexo
</code></pre>
<ol start="2">
<li>initial a blog directory under some folder like &quot;D:/blog&quot;</li>
</ol>
<pre><code class="language-bash">$ hexo init
[info] Copying data
[info] You are almost done! Don't forget to run `npm install` before you start b
logging with Hexo!
</code></pre>
<ol start="3">
<li>install it's dependence!</li>
</ol>
<pre><code class="language-bash">$ npm install
</code></pre>
<h2>run Hexo and glance it locally</h2>
<ol>
<li>run you Hexo</li>
</ol>
<pre><code class="language-bash">$ hexo server
[info] Hexo is running at http://localhost:4000/. Press Ctrl+C to stop.
</code></pre>
<ol start="2">
<li>preview blog pages by access localhost:4000</li>
</ol>
<h2>create a new post</h2>
<pre><code class="language-bash">$ hexo new &quot;My New Post&quot;
[info] File created at d:\blog\source\_posts\My-New-Post.md
</code></pre>
<h3>generate static files</h3>
<p>generate static files like html or css by using this command under ./public/</p>
<pre><code class="language-bash">$ hexo generate
</code></pre>
<p>as opposited to generate, those files can be clean by using:</p>
<pre><code class="language-bash">$ hexo clean
</code></pre>
<h3>depoly</h3>
<p>before , you can find those in _config.yml under the root directory like:</p>
<pre><code># Deployment
## Docs: http://hexo.io/docs/deployment.html
deploy:
  type:
</code></pre>
<p>correct it like this:</p>
<pre><code># Deployment
## Docs: http://hexo.io/docs/deployment.html
deploy:
  type: github
  repository: git@github.com:jianhuanzhuo/jianhuanzhuo.github.io.git
  branch: master
</code></pre>
<p>obviously, the address of repository must be replaced by your github.</p>
<hr />
<h2>maintain your blog</h2>
<hr />
<h2>Notice</h2>
<h3>搭建 hexo，在执行 hexo deploy 后,出现 error deployer not found:github 的错误</h3>
<ol>
<li>安装 hexo-deployer-git</li>
</ol>
<pre><code class="language-bash">$ npm install hexo-deployer-git --save 
</code></pre>
<ol start="2">
<li>hexo 更新到3.0之后，deploy的type 的github需要改成git</li>
</ol>
<h3>出现fatal: Not a git repository (or any of the parent directories): .git错误</h3>
<p>重新初始化一下</p>
<pre><code class="language-bash">$ git init
</code></pre>
<h3>使用图片</h3>
<p>在blog\source目录下添加图片后直接使用的，但建议在source目录中新建<code>img</code>目录，然后使用<code>\img\imgName/ext</code>进行引用。</p>
<h3>卸载Hexo</h3>
<p>3.0.0版本执行npm uninstall hexo-cli -g，之前版本执行npm uninstall hexo -g</p>
<h3>安装旧版本Hexo</h3>
<p>先卸载当前版本，以2.8.3为例，执行npm install <a href="mailto:hexo@2.8.3">hexo@2.8.3</a> -g，再初始化并安装依赖和插件</p>
<h3>无法访问本地预览</h3>
<p>端口被占用了，换一个
我之前也曾经遇到过这种问题
在_config.yml中配置端口不顶用，
在运行<code>hexo s</code>指令时加了一个参数，如下</p>
<pre><code class="language-bash">hexo server -i 127.0.0.9 -p 80
</code></pre>
<p>指定了IP和端口，然后在浏览器中输入<code>127.0.0.9</code>即可，因为<code>80</code>是浏览器的默认端口，所以不用输入。
后面我又觉得每次都要输入<code>127.0.0.9</code>有点麻烦，所以我在C:\Windows\System32\drivers\etc\hosts中加入<code>127.0.0.9 blog.me</code>的本地域名，指定域名blog.me解析为127.0.0.9，(所以我再也无法访问韩国的那个博客网站了) ，如下，然后指定只需要在浏览器中输入blog.me即可访问本地博客了。</p>
<pre><code class="language-bash"># Copyright (c) 1993-2009 Microsoft Corp.
#
# This is a sample HOSTS file used by Microsoft TCP/IP for Windows.
#
# This file contains the mappings of IP addresses to host names. Each
# entry should be kept on an individual line. The IP address should
# be placed in the first column followed by the corresponding host name.
# The IP address and the host name should be separated by at least one
# space.
#
# Additionally, comments (such as these) may be inserted on individual
# lines or following the machine name denoted by a '#' symbol.
#
# For example:
#
#      102.54.94.97     rhino.acme.com          # source server
#       38.25.63.10     x.acme.com              # x client host

# localhost name resolution is handled within DNS itself.
#	127.0.0.1       localhost
#	::1             localhost
	127.0.0.9		blog.me
</code></pre>
<h3>_config.yml 文件配置注释</h3>
<pre><code class="language-bash"># Hexo Configuration
## Docs: http://hexo.io/docs/configuration.html
## Source: https://github.com/hexojs/hexo/

# Site
title: ascend another story to see a thousand miles	# 站名，主标题
subtitle: JianhuanZhuo's Blog   # 副标题
description:
author: jianhuanzhuo            # 作者名
language:
timezone:                       # 时区

# URL
## If your site is put in a subdirectory, set url as 'http://yoursite.com/child' and root as '/child/'
url: http://yoursite.com
root: /
permalink: :year/:month/:day/:title/
permalink_defaults:

# Directory
source_dir: source
public_dir: public
tag_dir: tags
archive_dir: archives
category_dir: categories
code_dir: downloads/code
i18n_dir: :lang
skip_render:

# Writing
new_post_name: :title.md # File name of new posts
default_layout: post
titlecase: false # Transform title into titlecase
external_link: true # Open external links in new tab
filename_case: 0
render_drafts: false
post_asset_folder: false
relative_link: false
future: true
highlight:
  enable: true
  line_number: true
  auto_detect: true
  tab_replace:

# Category &amp; Tag
default_category: uncategorized
category_map:
tag_map:

# Date / Time format
## Hexo uses Moment.js to parse and display date
## You can customize the date format as defined in
## http://momentjs.com/docs/#/displaying/format/
date_format: YYYY-MM-DD
time_format: HH:mm:ss

# Pagination
## Set per_page to 0 to disable pagination
per_page: 10
pagination_dir: page

# Extensions
## Plugins: http://hexo.io/plugins/
## Themes: http://hexo.io/themes/
theme: landscape               #Hexo主题

# Deployment
## Docs: http://hexo.io/docs/deployment.html
deploy:
 	type: git
	repository: git@github.com:JianhuanZhuo/JianhuanZhuo.github.io.git
	branch: master
</code></pre>
