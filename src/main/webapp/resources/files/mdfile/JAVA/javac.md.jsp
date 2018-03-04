<%@ page contentType="text/html; charset=UTF-8" %><p>参考：
<a href="http://blog.csdn.net/huagong_adu/article/details/6929817">如何用javac 和java 编译运行整个Java工程</a>
<a href="http://jeffchen.iteye.com/blog/395671">JAVAC 命令详解</a></p>
<h2>javac 语法格式</h2>
<p>javac [ options ] [ sourcefiles ] [ @files ]</p>
<p>参数可按任意次序排列。</p>
<p>options 命令行选项。
sourcefiles 一个或多个要编译的源文件（例如 MyClass.java）。
@files 一个或多个对源文件进行列表的文件。</p>
<p>有两种方法可将源代码文件名传递给 javac：
如果源文件数量少，在命令行上列出文件名即可。
如果源文件数量多，则将源文件名列在一个文件中，名称间用空格或回车行来进行分隔。然后在 javac 命令行中使用该列表文件名，文件名前冠以 @ 字符。</p>
<h2>javac 帮助说明</h2>
<pre><code>D:\picture\qsmanagerclient&gt;javac -help
用法: javac &lt;options&gt; &lt;source files&gt;
其中, 可能的选项包括:
  -g                         生成所有调试信息
  -g:none                    不生成任何调试信息
  -g:{lines,vars,source}     只生成某些调试信息
  -nowarn                    不生成任何警告
  -verbose                   输出有关编译器正在执行的操作的消息
  -deprecation               输出使用已过时的 API 的源位置
  -classpath &lt;路径&gt;            指定查找用户类文件和注释处理程序的位置
  -cp &lt;路径&gt;                   指定查找用户类文件和注释处理程序的位置
  -sourcepath &lt;路径&gt;           指定查找输入源文件的位置
  -bootclasspath &lt;路径&gt;        覆盖引导类文件的位置
  -extdirs &lt;目录&gt;              覆盖所安装扩展的位置
  -endorseddirs &lt;目录&gt;         覆盖签名的标准路径的位置
  -proc:{none,only}          控制是否执行注释处理和/或编译。
  -processor &lt;class1&gt;[,&lt;class2&gt;,&lt;class3&gt;...] 要运行的注释处理程序的名称; 绕过默认的搜索进程
  -processorpath &lt;路径&gt;        指定查找注释处理程序的位置
  -parameters                生成元数据以用于方法参数的反射
  -d &lt;目录&gt;                    指定放置生成的类文件的位置
  -s &lt;目录&gt;                    指定放置生成的源文件的位置
  -h &lt;目录&gt;                    指定放置生成的本机标头文件的位置
  -implicit:{none,class}     指定是否为隐式引用文件生成类文件
  -encoding &lt;编码&gt;             指定源文件使用的字符编码
  -source &lt;发行版&gt;              提供与指定发行版的源兼容性
  -target &lt;发行版&gt;              生成特定 VM 版本的类文件
  -profile &lt;配置文件&gt;            请确保使用的 API 在指定的配置文件中可用
  -version                   版本信息
  -help                      输出标准选项的提要
  -A关键字[=值]                  传递给注释处理程序的选项
  -X                         输出非标准选项的提要
  -J&lt;标记&gt;                     直接将 &lt;标记&gt; 传递给运行时系统
  -Werror                    出现警告时终止编译
  @&lt;文件名&gt;                     从文件读取选项和文件名
</code></pre>
