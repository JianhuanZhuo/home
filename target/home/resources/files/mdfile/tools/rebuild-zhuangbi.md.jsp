<%@ page contentType="text/html; charset=UTF-8" %><p>此为基于openCV视觉的人脸捕捉打卡的工程复用笔记</p>
<!--more-->
<h2>环境搭载</h2>
<ul>
<li>
<p>JAVA 1.8环境安装
<a href="http://download.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-windows-x64.exe">下载链接</a></p>
</li>
<li>
<p>Ecplise（版本要与JAVA的相对应，版本位数）</p>
</li>
<li>
<p>Open CV 2.411</p>
<ul>
<li><a href="http://downloads.sourceforge.net/project/opencvlibrary/opencv-win/2.4.11/opencv-2.4.11.exe?r=&amp;ts=1462344099&amp;use_mirror=jaist">下载链接</a></li>
<li>解压即可用。</li>
</ul>
</li>
<li>
<p>Tencent优图SDK</p>
<ul>
<li><a href="https://github.com/TencentYouTu/java_sdk">下载地址</a></li>
</ul>
</li>
<li>
<p>Java串口驱动</p>
<ul>
<li><a href="http://fizzed.com/oss/rxtx-for-java">下载地址</a></li>
</ul>
</li>
</ul>
<h2>从github中拉取项目</h2>
<ol>
<li>打开eclipse &gt; File&gt; import&gt; git&gt; project from git&gt;Clone URI
<a href="https://github.com/JianhuanZhuo/zhuanbi.git">github链接</a></li>
</ol>
<p>工程文件夹如下图
<img src="${pageContext.request.contextPath}/\img\tools\rebuild1.jpg" alt="工程文件夹" /></p>
<h2>添加opencv库</h2>
<ol>
<li>右击工程名，点击BuildPath&gt;Add Libraries&gt; User Library&gt; Next&gt; User Libraries &gt; new</li>
<li>输入自定义库名：opencv，点击选中该库，Add External JARS.. &gt; 选择【opencv根目录】\build\java\opencv-2411.jar</li>
<li>双击库里的opencv-2411.jar，选中Native library location，双击，然后选择External Folder，&gt; 选择【opencv根目录】\build\java\x64</li>
<li>点OK返回</li>
<li>勾选opencv ，选择finish。</li>
</ol>
<h2>添加Java串口库</h2>
<ol>
<li>下载解压后复制RXTXcomm.jar到<JDK>\jre\lib\ext文件下</li>
<li>复制rxtxSerial.dll、rxtxParallel.dll到<JRE>\jre\bin文件下</li>
<li>右击工程，选中BuildPath&gt; Configure Build Path&gt; Add External JARs...选择【Java安装跟目录】\jdk1.8.0_91\jre\lib\ext\RXTXcomm.jar</li>
</ol>
<p><img src="${pageContext.request.contextPath}/\img\tools\rebuild2.jpg" alt="RXTXcomm.jar" /></p>
<h2>添加优图SDK</h2>
<ol>
<li>从优图github上下载，将压缩包中的dist中的文件（）解压至【Java安装跟目录】\jdk1.8.0_91\jre\lib\ext\</li>
<li>右击工程，选中BuildPath&gt; Configure Build Path&gt; Add External JARs...选择【Java安装跟目录】\jdk1.8.0_91\jre\lib\ext\youtu-java-sdk.jar和json.jar</li>
</ol>
<p>此时全部文件应该没有错误了吧，像下面一样
<img src="${pageContext.request.contextPath}/\img\tools\rebuild3.png" alt="工程文件夹" /></p>
<h2>备注</h2>
<ol>
<li>工程编码为UTF-8</li>
<li>主函数所在是zhuanbi/Hello.java</li>
</ol>
<h2>debug笔记</h2>
<h3>opencv版本不对</h3>
<p>出现如下错误：
Can't load IA 32-bit .dll on a AMD 64-bit platform
解决办法：
修改BuildPath</p>
<p><img src="${pageContext.request.contextPath}/\img\tools\rebuild4.png" alt="修改BuildPath" /></p>
<h3>相机打开失败</h3>
<p>运行代码时出现相机打开失败的
相机打开代码在zhuanbi\Hello.java，53~60行</p>
<p>解决方法：</p>
<ol>
<li>代码设置错误，可能因为使用多个摄像头，但上面的代码中参数写错了</li>
<li>打开设备管理，检查是否摄像头被禁用，若是，则启用</li>
</ol>
<h3>串口错误</h3>
<p>出现如下错误：
java.lang.UnsatisfiedLinkError: no rxtxSerial in java.library.path thrown while loading gnu.io.RXTXCommDriver
Exception in thread &quot;main&quot; java.lang.UnsatisfiedLinkError: no rxtxSerial in java.library.path</p>
<p>解决方法：</p>
<ol>
<li>可能因为没插好串口，所以检测不到串口</li>
<li>端口号错误，查看设备管理器中的端口，再修改：zhuanbi\Hello.java 中约第67行处：
<img src="${pageContext.request.contextPath}/\img\tools\rebuild5.png" alt="端口号错误" /></li>
<li>串口驱动文件rxtxSerial.dll、rxtxParallel.dll放置位置不对</li>
</ol>
