<%@ page contentType="text/html; charset=UTF-8" %><p>Eclipse 中 jar 包关联 JDK 源代码，在此做个记录</p>
<!--more-->
<p>1.点 “window”-&gt; &quot;Preferences&quot; -&gt; &quot;Java&quot; -&gt; &quot;Installed JRES&quot;</p>
<p>2.此时&quot;Installed JRES&quot;右边是列表窗格，列出了系统中的 JRE 环境，选择你的JRE，然后点边上的 &quot;Edit...&quot;， 会出现一个窗口(Edit JRE)</p>
<p>3.选中rt.jar文件的这一项：“c:\program files\java\jre_1.5.0_06\lib\rt.jar”
点 左边的“+” 号展开它，</p>
<p>4.展开后，可以看到“Source Attachment:(none)”，点这一项，点右边的按钮“Source Attachment...”, 选择你的JDK目录下的 “src.zip”文件</p>
<p>5.一路点&quot;ok&quot;,结束。</p>
<p>dt.jar是关于运行环境的类库,主要是swing的包
tools.jar 是关于一些工具的类库
rt.jar包含了jdk的基础类库，也就是你在 java doc里面看到的所有的类的class文件</p>
