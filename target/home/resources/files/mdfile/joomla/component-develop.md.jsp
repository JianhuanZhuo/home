<%@ page contentType="text/html; charset=UTF-8" %><p>joomla 组件开发笔记整理，待更新。。。</p>
<!--more-->
<p>访问方式：
You can use the URL of the component, or a Menu in order to navigate to the component. In this article we will discuss using the URL.</p>
<p>1	user access	<yoursite>/joomla/index.php?option=com_&lt;component_name&gt;
2	administrator access	<yoursite>/joomla/administrator/index.php?option=com_&lt;component_name&gt;
Hello World! example: localhost/joomla/index.php?option=com_helloworld</p>
<h3>目录</h3>
<p>Components are stored in a directory within your Joomla! installation, specifically at:</p>
<p>前台显示组件放置位置：
htdocs/&lt;path_to_joomla&gt;/components/com_&lt;component_name&gt;/ .</p>
<p>后台显示组件放置位置：
htdocs/&lt;path_to_joomla&gt;/administator/components/com_&lt;component_name&gt;/ .</p>
<h3>基本文件</h3>
<p>A basic component will contain the following files within its directoryː</p>
<p>A html file that is just a security file with a background colorː index.html
A php file that represents the controller itselfː controller.php
A php file that loads the controller classː &lt;component_name&gt;.php
A php file that represents the model itselfː models/&lt;component_name&gt;.php
Another html file for background controlː models/index.html
A php file containing the default viewː views/&lt;component_name&gt;/tmpl/default.php
A xml file for adding a menu item typeː views/&lt;component_name&gt;/tmpl/default.xml
Another html file for background controlː views/&lt;component_name&gt;/tmpl/index.html
Another html file for background controlː views/&lt;component_name&gt;/index.html
A php file for displaying the viewː views/&lt;component_name&gt;/view.html.php</p>
<h3>JEXEC</h3>
<p>一般为文件开头：</p>
<pre><code>&lt;?php
	// No direct access to this file
	// 限制直接访问
    defined('_JEXEC') or die('Restricted Access');
</code></pre>
<h3>组件名</h3>
<p>小写后去特殊符号的字符串</p>
<h3>控制器调用</h3>
<pre><code>// his would try to call a function insert() of our controller (which we would actually have to implement in HelloWorldController ).
http://localhost/index.php?option=com_helloworld&amp;task=insert

</code></pre>
<h3>2.x 与 3.x</h3>
<p>Please check Joomla version</p>
<p>In 3.X</p>
<p>$controller  = JControllerLegacy::getInstance('HelloWorld');
In 2.X</p>
<p>$controller = JController::getInstance('HelloWorld');</p>
