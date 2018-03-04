<%@ page contentType="text/html; charset=UTF-8" %><p>在使用 JavaFx 做弹出面板时，直接抛出了 <code>ClassCastExceptions</code> 异常的解决方案。</p>
<!--more-->
<p>我在一次准备做一个使用 <code>Dialog</code> 原生类做简单弹出面板的的时候，代码没有任何问题，但它直接报错。</p>
<p>细查代码没问题，于是查找其官方文档：</p>
<p>我在 <a href="https://docs.oracle.com/javase/8/javafx/api/javafx/scene/control/Dialog.html">JavaFx</a> API上找到如下说明</p>
<blockquote>
<p>Critical note: It is critical that all developers who choose to create their own dialogs by extending the Dialog class understand the importance of the result converter property. A result converter must always be set, whenever the R type is not Void or ButtonType. If this is not heeded, developers will find that they get ClassCastExceptions in their code, for failure to convert from ButtonType via the result converter.</p>
</blockquote>
<p>如上说的，需要设置一个结果转换器 <code>result converter</code>，否则将直接抛 <code>ClassCastExceptions</code> 异常。
也就是需要在运行弹出面板之前设置一个转换器，将面板内容以转换器的形式返回。</p>
