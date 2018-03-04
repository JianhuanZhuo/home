<%@ page contentType="text/html; charset=UTF-8" %><p>去除 libs.useso.com 的字体库文件链接，提高主页访问速度。</p>
<!--more-->
<p>今天临近复试了，来对个人主页整理一下，发现在打开网站时其他都正常显示，就是有个文件一直加载不出来。</p>
<p>打开开发工具一看，是有个 CSS 外部链接 <code>http://libs.useso.com/js/font-awesome/4.2.0/fonts/fontawesome-webfont.ttf?v=</code>挂了，查看了急忙探查了一波，发现是 360 CDN挂了，导致这个链接一直加载不出来。</p>
<p>这个文件是做字体图标的，在我的网站中其实也没用到，果断不用了。</p>
<p>在 <code>layout\_partial\head.ejs</code> 中去除这个引用：</p>
<pre><code class="language-html">&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
  &lt;meta charset=&quot;utf-8&quot;&gt;
  &lt;%
  var title = page.title;

  if (is_archive()){
    title = 'Archives';

    if (is_month()){
      title += ': ' + page.year + '/' + page.month;
    } else if (is_year()){
      title += ': ' + page.year;
    }
  } else if (is_category()){
    title = 'Category: ' + page.category;
  } else if (is_tag()){
    title = 'Tag: ' + page.tag;
  }
  %&gt;
  &lt;title&gt;&lt;% if (title){ %&gt;&lt;%= title %&gt; | &lt;% } %&gt;&lt;%= config.title %&gt;&lt;/title&gt;
  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1, maximum-scale=1&quot;&gt;
  &lt;%- open_graph({twitter_id: theme.twitter, google_plus: theme.google_plus, fb_admins: theme.fb_admins, fb_app_id: theme.fb_app_id}) %&gt;
  &lt;% if (theme.rss){ %&gt;
    &lt;link rel=&quot;alternative&quot; href=&quot;&lt;%- theme.rss %&gt;&quot; title=&quot;&lt;%= config.title %&gt;&quot; type=&quot;application/atom+xml&quot;&gt;
  &lt;% } %&gt;
  &lt;% if (theme.favicon){ %&gt;
    &lt;link rel=&quot;icon&quot; href=&quot;&lt;%- theme.favicon %&gt;&quot;&gt;
  &lt;% } %&gt;
  &lt;%- css('css/style') %&gt;
  &lt;!-- 在此处注释该链接 -- &gt;
  &lt;link href=&quot;//fonts.useso.com/css?family=Source+Code+Pro&quot; rel=&quot;stylesheet&quot; type=&quot;text/css&quot;&gt;
  &lt;-- --&gt;
  &lt;!--[if lt IE 9]&gt;&lt;script src=&quot;//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.min.js&quot;&gt;&lt;/script&gt;&lt;![endif]--&gt;
  &lt;%- partial('google-analytics') %&gt;
&lt;/head&gt;
</code></pre>
