<%@ page contentType="text/html; charset=UTF-8" %><p>你有没有发现自己在使用 IDE 或其他编辑器编辑文件时，有时会出现一个对话框通知您的文件系统上打开的文件之一已经改变，需要重新加载？ 或者像 NetBeans IDE 一样，应用程序在不通知您的情况下也会悄悄更新文件。
下面用一个免费编辑器 <a href="http://sourceforge.net/projects/jedit/">jEdit</a> 的对话框来展示这个通知如何作用：</p>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\JAVA\img\2018-02-07-17-39-18.png" alt="" /></p>
<p>为了实现这个称为文件更改通知 <code>file change notification</code> 的功能，程序必须能够检测到文件系统上相关目录发生了什么。 一种方法是轮询文件系统寻找变化，但这种方法效率不高。 它无法扩展应用到需要监听数百文件或目录的应用程序。</p>
<!--more-->
<p><code>java.nio.file</code> 包提供了一个 <code>Watch Service API</code> 文件更改通知接口。这个接口使您能够使用监听服务注册一个或多个目录，并在注册时，告诉服务目标事件类型：文件创建，文件删除或文件修改。 当服务检测到目标事件时，就会转发事件给已注册的处理程序。</p>
<h2>监听服务概述</h2>
<p><code>WatchService API</code> 相当低级，允许自定义该接口。用户可以直接使用低级接口，也可以在此机制之上创建更高级的接口，以便适合特定需求。</p>
<p>以下是使用监听服务所需的基本步骤：</p>
<ol>
<li>为文件系统创建一个 WatchService 监听器。</li>
<li>将所有要监听的目录注册到监听器。注册目录时，指定要通知的事件类型。每次注册目录都会返回一个对应的 <code>WatchKey</code> 实例。</li>
<li>实现一个无限循环来等待传入的事件。当事件发生时，键会被置号，并放入观察者的队列中。</li>
<li>从观察者队列中检索到键并获得文件名称。</li>
<li>检索键的每个未决事件（可能有多个事件）并根据需要进行处理。</li>
<li>重置键，并重新等待事件。</li>
<li>关闭服务：当线程退出或关闭时（通过调用其关闭的方法），监听服务将退出。</li>
</ol>
<p><code>WatchKeys</code> 是线程安全的，可以和 <code>java.nio.concurrent</code> 包一起使用。可以指定一个线程池​​专门用来监听。</p>
<h2>创建监听服务并注册事件</h2>
<p>第一步是通过使用 <code>FileSystem</code> 类中的 <code>newWatchService</code> 方法创建一个新的 <code>WatchService</code> 实例，如下所示：</p>
<pre><code class="language-java">WatchService watcher = FileSystems.getDefault().newWatchService();
</code></pre>
<p>接下来，向监听服务注册一个或多个对象，这里任何实现 <code>Watchable</code> 接口的对象都可以被注册。 <code>Path</code> 类实现 <code>Watchable</code> 接口，因此每个要监听的目录都可以被注册为一个 <code>Path</code> 对象。</p>
<p>与任何Watchable一样，<code>Path</code> 类实现了两个注册方法。这里使用两个参数的方法，<code>register(WatchService, WatchEvent.Kind &lt;?&gt; ...)</code>。 （三参数的方法采用 <code>WatchEvent.Modifier</code>，目前尚未实现。）</p>
<p>使用监听服务注册对象时，可以指定要监听的事件的类型。支持的 <code>StandardWatchEventKinds</code> 事件类型如下：</p>
<ol>
<li><code>ENTRY_CREATE</code> - 创建一个目录条目。</li>
<li><code>ENTRY_DELETE</code> - 目录条目被删除。</li>
<li><code>ENTRY_MODIFY</code> - 目录条目被修改。</li>
<li><code>OVERFLOW</code> - 表示事件可能已经丢失或丢弃。不必注册 <code>OVERFLOW</code> 事件来接收它。</li>
</ol>
<p>以下代码片段演示为 <code>Path</code> 实例如何注册三种事件类型：</p>
<pre><code class="language-java">import static java.nio.file.StandardWatchEventKinds.*;

Path dir = ...;
try {
    WatchKey key = dir.register(watcher,
                           ENTRY_CREATE,
                           ENTRY_DELETE,
                           ENTRY_MODIFY);
} catch (IOException x) {
    System.err.println(x);
}
</code></pre>
<h2>事件处理</h2>
<p>事件处理循环中的事件顺序如下：</p>
<ol>
<li>获取一个监听键。提供了三种方法：
<ul>
<li><code>poll()</code> - 返回队列中的键（如果可用）。如果不可用，立即返回空值。</li>
<li><code>poll(long，TimeUnit)</code> - 返回一个队列中的键（如果有）。如果队列中的键不能立即可用，程序将等待指定的时间。<code>TimeUnit</code> 指定的时间所采用的单位。</li>
<li><code>take()</code> - 返回一个队列中的键。如果队列中没有可用的键，则此方法等待。</li>
</ul>
</li>
<li>处理键的未决事件。您可以从pollEvents方法中获取WatchEvents列表。</li>
<li>使用kind方法检索事件的类型。无论键注册了什么事件，都可能收到OVERFLOW事件。你可以选择处理溢出或忽略它，但你应该测试它。</li>
<li>检索与事件关联的文件名。文件名称作为事件的上下文存储，所以使用上下文方法来检索它。</li>
<li>键事件处理完毕后，需要通过调用reset将键恢复到准备就绪状态。如果此方法返回false，则该键不再有效，并且循环可以退出。这一步非常重要。如果您未能调用重置，则此键不会收到任何进一步的事件。</li>
</ol>
<p>监听键有一个状态。其状态可能是以下之一：</p>
<ol>
<li><code>Ready</code> 表示键已准备好接受事件。首次创建时，键处于就绪状态。</li>
<li><code>Signaled</code> 指示一个或多个事件正在队列中。一旦键被置号，它将不再处于就绪状态，除非调用了复位方法 <code>reset()</code>。</li>
<li><code>Invalid</code> 无效表示键不再有效。发生以下事件之一时会导致此状态：
<ul>
<li>过程通过调用 <code>cancel()</code> 方法显式的取消了键。</li>
<li>目录不可访问。</li>
<li>监听服务已关闭。</li>
</ul>
</li>
</ol>
<p>下面是一个事件处理循环的电子邮件示例：监听某个目录，并等待新的文件出现。当新文件可用时，则通过调用 <code>probeContentType(Path)</code> 方法检查它是否是文本文件。</p>
<pre><code class="language-java">for (;;) {

    // 等待键置号
    WatchKey key;
    try {
        key = watcher.take();
    } catch (InterruptedException x) {
        return;
    }

    for (WatchEvent&lt;?&gt; event: key.pollEvents()) {
        WatchEvent.Kind&lt;?&gt; kind = event.kind();

        // 虽然这个键仅注册了 ENTRY_CREATE 事件，但是丢失或者被弃用，OVERFLOW 事件也会发生。
        if (kind == OVERFLOW) {
            continue;
        }

        // 事件内容是文件路径
        WatchEvent&lt;Path&gt; ev = (WatchEvent&lt;Path&gt;)event;
        Path filename = ev.context();

        // 检查新文件是否为文本文件
        try {
            // 分解文件名
            Path child = dir.resolve(filename);
            if (!Files.probeContentType(child).equals(&quot;text/plain&quot;)) {
                System.err.format(&quot;New file '%s'&quot; +
                    &quot; is not a plain text file.%n&quot;, filename);
                continue;
            }
        } catch (IOException x) {
            System.err.println(x);
            continue;
        }

        // 输出文件名
        System.out.format(&quot;Emailing file %s%n&quot;, filename);
        // 其他...
    }

    // 重置该键，如果你想继续接收监听消息，这一步十分关键。
    // 如果键无效，目录无法访问，那么应该退出这个循环。
    boolean valid = key.reset();
    if (!valid) {
        break;
    }
}
</code></pre>
<h2>检索文件名</h2>
<p>文件名可以从事件上下文中检索：</p>
<pre><code class="language-java">WatchEvent&lt;Path&gt; ev = (WatchEvent&lt;Path&gt;)event;
Path filename = ev.context();
</code></pre>
<p>当你编译上述代码时，可能会报如下错误：</p>
<pre><code class="language-txt">Note: Email.java uses unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
</code></pre>
<p>解决方式：</p>
<pre><code class="language-java">@SuppressWarnings(&quot;unchecked&quot;)
static &lt;T&gt; WatchEvent&lt;T&gt; cast(WatchEvent&lt;?&gt; event) {
    return (WatchEvent&lt;Path&gt;)event;
}
</code></pre>
<p>如果你对 <code>@SuppressWarnings</code> 语法不熟悉的话，可以看下注解。</p>
