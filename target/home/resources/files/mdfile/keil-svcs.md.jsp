<%@ page contentType="text/html; charset=UTF-8" %><p>SVCS菜单是用来配置µVision的软件版本控制系统（SVCS）的。 SVCS命令可以添加到SVCS菜单中并执行。命令的输出会在命令执行结束后在 µVision的Build Output窗口中输出。</p>
<p>模板文件用以支持多种版本控制系统，详情参考 <a href="http://www.keil.com/support/man/docs/uv4/uv4_ui_svcs.htm">SVCS Menu</a> 一节。</p>
<p>当模板文件使用Microsoft Visual SourceSafe.SVCS时会如下面所示。SVCS菜单命令使用<a href="http://www.keil.com/support/man/docs/uv4/uv4_ut_keysequence.htm">key sequences</a>指定文件。SVCS菜单命令实际使用的文件依赖于选择的工程窗口条目或当前激活的编辑文件。</p>
<p><img src="${pageContext.request.contextPath}/\img\keiltranslation.png" alt="SVCS 菜单" /></p>
<p>在选择了µVision工程后，Microsoft SourceSafe要求执行设置当前工程（ Set Current Project ）的命令。记得从配置中去除SSUSER环境变量并用工作站的名字登陆。</p>
<h3>配置SVCS菜单</h3>
<p>SVCS - Configure Software Version Control打开配置对话框，你会看到类似下面的菜单。</p>
<p><img src="${pageContext.request.contextPath}/\img\keiltranslation2.png" alt="SVCS 菜单" /></p>
<table>
<thead>
<tr><th>条目</th><th>说明</th></tr>
</thead>
<tbody>
<tr><td>Template File</td><td>配置文件(*.SVCS)的名字。这个文件可以存储服务器中以便被开发团队中的其他成员使用。</td></tr>
<tr><td>User Name</td><td>SVCS登陆名。可以用键序列%U传递。</td></tr>
<tr><td>Project Ident</td><td>SVCS定义的工程标识名</td></tr>
<tr><td>Database</td><td>SVCS数据库的文件名或路径。数据库字符串可以用键序列%V传递。</td></tr>
<tr><td>Menu Content item list</td><td>在SVCS菜单中显示的菜单项。这些菜单项包括键序列。用字符&amp;前缀定义快捷键。</td></tr>
<tr><td><img src="/img/keiltranslation3.png"></td><td>添加一个新的菜单项。</td></tr>
<tr><td><img src="/img/keiltranslation4.png"></td><td>删除选中的菜单项。</td></tr>
<tr><td><img src="/img/keiltranslation5.png"></td><td>在列表中上移选中的菜单项。</td></tr>
<tr><td><img src="/img/keiltranslation6.png"></td><td>在列表中下移选中的菜单项。</td></tr>
<tr><td>Query for Comment</td><td>允许在运行时键入注释。这些注释将被使用键序列%Q保存在一个可以提交到SVCS的临时文件中。代码键入到 Arguments文本框中。</td></tr>
<tr><td>Query for Revision</td><td>允许在运行时键入版本号。用键序列%R来传递这个字符串给SVCS。代码键入到 Arguments文本框中。</td></tr>
<tr><td>Query for CheckPoint</td><td>允许在运行时键入检查点信息。用键序列%C来传递这个字符串给SVCS。代码键入到 Arguments文本框中。</td></tr>
<tr><td>Run Minimized</td><td>在最小窗口中执行应用。</td></tr>
<tr><td>Command</td><td>此处可键入调用程序的命令。你可以使用键序列中的环境变量传递一个参数。</td></tr>
<tr><td>Arguments</td><td>此处可键入程序参数。可以使用键序列将参数从µVision传给SVCS。</td></tr>
<tr><td>Environment</td><td>此处可键入在执行SVCS之前需要设置的环境变量. 此处可以使用键序列参数。</td></tr>
<tr><td>Initial Folder</td><td>通常，此处设置为µVision工程文件夹。</td></tr>
</tbody>
</table>
<h3>注意</h3>
<p><a href="http://www.keil.com/appnotes/docs/apnt_279.asp">Application Note 279: Using Git for Project Management with µVision 该文件说明了如何在 µVision</a>中使用Git，还有如何使用Software Packs建立一个用于工程版本控制的强大流程。</p>
<p>原文链接：<a href="http://www.keil.com/support/man/docs/uv4/uv4_ut_usingsvcsmenu.htm">http://www.keil.com/support/man/docs/uv4/uv4_ut_usingsvcsmenu.htm</a></p>
