<%@ page contentType="text/html; charset=UTF-8" %><h2>无法启动</h2>
<p>在启动时遇到了这个错误： <code>Caused by: java.lang.NoClassDefFoundError: javafx/beans/property/ObjectProperty</code></p>
<p>才发现是因为代码中用到了 JavaFX 的代码，所以挂掉了。</p>
