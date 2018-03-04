<%@ page contentType="text/html; charset=UTF-8" %><p>由于 CSS 文件是记录有节点渲染样式的文本文件，不是 Java 代码，所以是在运行时进行动态解析的，我们可以对该类文件进行编译，以期提高运行时性能，JavaFX 提供将 CSS 文件编译为二进制文件的机制，即 BSS。</p>
<p>使用 javafxpackager 命令完成此项工作：</p>
<blockquote>
<p>javafxpackager -createbss -srcfiles mycss.css -outdir bss</p>
</blockquote>
