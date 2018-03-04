<%@ page contentType="text/html; charset=UTF-8" %><p>joomla 开发错误笔记整理，待更新。。。</p>
<!--more-->
<h2>安装错误</h2>
<p>出现：
COM_INSTALLER_MSG_INSTALL_WARNINSTALLUPLOADERROR
错误，</p>
<p>后来，我是用在线安装解决的</p>
<p>谷歌：
joomla extension Warning: File  not uploaded for security reasons!</p>
<p>原因与解决：
<a href="https://www.joomlacontenteditor.net/support/forum/error-installing-plugins-after-update-joomla-to-3-4-4">https://www.joomlacontenteditor.net/support/forum/error-installing-plugins-after-update-joomla-to-3-4-4</a></p>
<p>这是一个BUG，不过已经修复了。需要升级系统或下载补丁解决。
解压至：/administrator/components/com_jce/models/installer.php
不过，这个是另一个插件的</p>
<p>最后！！！
是因为akeeba的一个附带插件System - System Restore Points挂了。
所以需要在扩展中禁用它就可以了
。。。呵呵</p>
<p>一直挂的原因也可以是
post_max_size
设置得有点小，上传的取值是它和
upload_max_filesize
取最小值</p>
<h2>CSS错误</h2>
