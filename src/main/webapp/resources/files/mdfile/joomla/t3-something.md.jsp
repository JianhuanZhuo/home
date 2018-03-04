<%@ page contentType="text/html; charset=UTF-8" %><p>T3 模板开发笔记整理。</p>
<!--more-->
<h2>关闭侧边栏的方式</h2>
<p>开关选项在 模板管理器-&gt;编辑风格-&gt;Add-ons</p>
<h2>模板的位置定义</h2>
<p>位置定义在 templateDetails.xml</p>
<h2>添加一个位置</h2>
<p>在某个位置添加一句，</p>
<pre><code>&lt;jdoc:include type=&quot;modules&quot; name=&quot;&lt;?php $this-&gt;_p('home-1') ?&gt;&quot; style=&quot;raw&quot; /&gt;
</code></pre>
<p>修改'home-1'为想要的位置标签（可以自定义，但要添加到templateDetails.xml）</p>
<h2>设置风格</h2>
<p>在 Assignment 选项中给指定的菜单选定风格</p>
<h2>实现菜单居中</h2>
<p>通过给父元素设置 float，然后给父元素设置 position:relative 和 left:50%，子元素设置 position:relative 和 left:-50% 来实现水平居中</p>
<p>具体做法：
在 templates\t3_bs3_blank\less\navbar.less 最后添加</p>
<pre><code class="language-less">// 建欢 在这里修改以使得菜单居中
.t3-megamenu{
  ul{
    position:relative;
    left:50%;
    li{
      position:relative;
      left:-50%;
    }
  }
}
// 修改字体
// 加上如下内容使得菜单宽一点
@media (min-width: 768px){
  .t3-megamenu &gt; ul &gt; li{
    font-size:18px;
    padding-left:0px;
    padding-right:0px;
    a{
      padding:8px;
    }
  }
}
@media (min-width: 992px){
  .t3-megamenu &gt; ul &gt; li{
    font-size:18px;
    padding-left:5px;
    padding-right:5px;
  }      
}
@media (min-width: 1200px){
  .t3-megamenu &gt; ul &gt; li{
    font-size:24px;
    padding-left:5px;
    padding-right:5px;
  }
}

最后关闭开发模式时记得编译


// 建欢 在这里修改以使得菜单居中
.t3-megamenu{
  ul{
    position:relative;
    left:50%;
    li{
      position:relative;
      left:-50%;
      // 修改字体
      color: #ffffff;
// 加上如下内容使得菜单宽一点
@media (min-width: 768px){
  
    font-size:18px;
    padding-left:0px;
    padding-right:0px;
    a{
      padding:8px;
    }
    @media (min-width: 992px){
 
    font-size:18px;
    padding-left:5px;
    padding-right:5px;
     
}
@media (min-width: 1200px){

    font-size:24px;
    padding-left:5px;
    padding-right:5px;
  }

  
}
    }
  }
}


.t3-mainnav{
  background-color: #F4C600;
}
</code></pre>
<p>仅需复制
\modules\mod_slideshowck\themes\default
文件夹为其他一个文件夹
修改文件夹名即可</p>
<h2>t3 模板保存地点</h2>
<p>joomla\templates\t3_bs3_blank\tpls
在 save as 一个 t3 模板时就会在这个路径下生成一个新的文件
自定义也可能在
joomla\templates\t3_bs3_blank\local\tpls</p>
<h2>新建菜单</h2>
<p>在主菜单中的菜单项新建即可</p>
<p>添加导航栏的项目，就在 Main Menu 下添加</p>
<p>逻辑关系为：</p>
<p>菜单1
-菜单项1
-菜单项2
-菜单项3
-菜单项4</p>
<p>菜单2
-菜单项1
-菜单项2
-菜单项3
-菜单项4<br />
菜单3
-菜单项1
-菜单项2
-菜单项3
-菜单项4</p>
<h2>左边那个是触发silde的</h2>
<p>Home 前面那个小方块</p>
