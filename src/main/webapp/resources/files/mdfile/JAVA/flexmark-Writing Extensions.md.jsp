<%@ page contentType="text/html; charset=UTF-8" %><p>原文链接<a href="https://github.com/vsch/flexmark-java/wiki/Writing-Extensions">https://github.com/vsch/flexmark-java/wiki/Writing-Extensions</a></p>
<p>扩展 <code>Extension</code> 需要继承其他解析器 <code>parser</code> 或 HTML 渲染器 <code>renderer</code>，或两者兼而有之。 扩展需要在构造器内配置才能使用，由于扩展是可选的，它们位于单独的工件中，所以在使用时还需要添加其他 <code>pom</code> 依赖关系。</p>
<p>创建扩展的最好方法是山寨现有扩展，修改副本源代码并测试。</p>
<!--more-->
<h2>解析流程</h2>
<p>解析按照不同的步骤进行，并且在每个步骤中用户都可以添加自定义处理。</p>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\JAVA\img\2018-02-07-22-11-32.png" alt="" /></p>
<ol>
<li>
<p>源文件中的文本被分解成许多块节点，块解析器决定当前行是否作为新建块的起始。任何无块解析器声明的行都会被核心的段落解析器 <code>ParagraphParser</code> 默认声明。</p>
<p>块解析器可以声明当前由段落解析器累积的行，并能替换段落解析器作为当前激活的解析器。</p>
</li>
</ol>
<p>The inline parser instance is available to blocks at this time to allow them to use the API to help process the text. Processors that require inline processing of their contents should be run after the core reference link paragraph processor, otherwise some link refs will not be recognized because they are not defined yet. A custom processor factory should return ReferencePreProcessorFactory.class from getAfterDependents(). Similarly, if a paragraph processor needs to run before another pre-processor then it should return the processor's factory class from getBeforeDependents().</p>
<ol start="2">
<li>
<p>在处理段落块时会以删去那些不应作为文本的引导行（前置行）。例如，链接引用将从段落中删除。只有需要删除完整的行时才应该在这一步处理，删除段落中的部分文本则应该在下一步完成。</p>
<p>内联分析器实例在这里也是可用的，以便使用 API ​​来帮助处理文本。需要内联处理其内容的处理器应在核心引用链接段落处理器之后运行，否则某些链接引用将不会被识别，因为它们尚未定义。定制的处理器工厂应该从 <code>getAfterDependents()</code> 返回 <code>ReferencePreProcessorFactory.class</code>。同样，如果一个段落处理器需要在另一个预处理器之前运行，那么它应该从 <code>getBeforeDependents()</code> 返回处理器的工厂类。</p>
<p>任何循环依赖都将导致构造器在准备阶段抛出 <code>IllegalStateException()</code> 异常。</p>
<p>段落预处理会被分成多个预处理阶段以以便遵守依赖关系。</p>
<p>段落预处理器可以调用 <code>affectsGlobalStat()</code> 方法来告知哪些文档属性会受到处理结果的影响。例如，<code>ReferencePreProcessorFactory</code> 就这样做了，因为定义引用链接会影响 <code>REFERENCES</code> 节点存储库。</p>
<p>由于全局处理器可以处理文档中的所有段落，所以在依赖开始处理段落之前，全局处理器是各自预处理阶段中唯一的处理器。</p>
<p>在同一阶段中的非全局处理器将在每个段落块上按顺序运行，直到段落不再发生更改。这意味着同一阶段的非全局处理器可以混合内容，而全局处理器对每个段落都只运行一次。依赖全局处理器的非全局处理器将在所有全局依赖完成处理后的第一个可用阶段运行。</p>
<p>一个阶段内的预处理器的顺序将基于处理器之间的依赖关系以及不受其相应扩展的注册顺序限制的位置。</p>
<p>☠：最好使用块解析器而不是段落预处理器来实现所需的定制。只有在如果不使用内联分析器 API 则无法正确解析的情况下才能使用后者。因为在块分析过程中使用内联分析器 API 存在严重的性能问题。</p>
</li>
<li>
<p>块预处理是严格定制的处理器，块预处理可以添加，替换或删除块节点。任何其他节点也可以添加到 AST (抽象语法树) 中，但此时没有创建内嵌块。</p>
<p>节点的创建和删除应通过 <code>BlockParserTracker</code> 和 <code>BlockTracker</code> 接口的实现传递给 <code>ParserState</code> 实例。 这是允许更新内部解析器优化结构以便块预处理进一步正确进行的必要步骤。</p>
</li>
<li>
<p>在内联处理期间，每个块都有机会处理包含在节点或文本节点的内联元素。在此步骤中有两种自定义类型：链接引用处理和分隔符处理。分隔符是一组使用开始和结束字符确定其跨度的文本。分隔符可以嵌套，但具有最小和最大嵌套深度限制。</p>
<p>链接引用处理器负责处理可能是链接引用的自定义元素， 他们由 <code>![</code> 或 <code>[</code> 分隔并由 <code>]</code> 终止。链接引用处理器决定括号是否可以嵌套，<code>!</code> 是否应作为文本或其节点的一部分来处理，并决定是否解析额外的链接引用文本作为其节点。处理时包括 <code>![]</code> 或 <code>[]</code> 的全部文本都会被输入到解析器，以便在处理内部的空白时给予最大的灵活性。</p>
<p>脚注 <code>[^ footnote]</code> 和 Wiki 链接 <code>[[wiki链接]]</code> 扩展使用了这种扩展机制。</p>
</li>
</ol>
<p>For node post processors this hierarchy is determined during a single traversal of the AST to build all the node tracking structures. If the extension determines inheritance by looking back at the getParent() function of a node this becomes very inefficient on large documents.</p>
<ol start="5">
<li>
<p>后处理步骤主要针对最终的 AST 进行修改。后处理器有两种：节点和文档。尽管 <code>PostProcessor</code> 接口可用于两种类型，但一个后处理器只能对应其中一种。</p>
<ul>
<li>
<p>节点后处理：节点后处理器使用祖先排除标准来指定后处理的节点类别。对于符合条件的 AST 节点都会调用处理器的 <code>process(NodeTracker, Node)</code> 函数。</p>
<p>对 AST 的任何修改都必须传递给 <code>NodeTracker</code> 实例，该实例负责更新用于优化节点选择的内部结构。</p>
<p>具体而言，在 AST 层次结构中每添加或移动新节点将需要更新其祖先列表，以便进一步后处理节点。这些通知函数应在特定的更改层次结构更改完成后调用，以消除中间 AST 更改的不必要更新。</p>
<p>新增或移入孩子节点的节点都需要调用 <code>nodeAddedWithChildren(Node)</code> 方法通知，而不是每个节点都回调一次 <code>nodeAdded(Node)</code>。类似地，应该通过 <code>nodeAddedWithDescendants(Node)</code> 来传达至更深的节点。</p>
<p>完整的节点删除应该使用 <code>nodeRemoved()</code> 函数通知全部子孙节点后再执行删除。</p>
<p>所有节点移除函数的执行会将节点连同其所有后代全部移除，因为没有父节点的任何野节点都从 AST 中移除。</p>
</li>
<li>
<p>文档后处理：文档后处理器由调用 <code>processDocument(Document)</code> 成员函数执行，并且返回的文档将可以用作进一步处理。</p>
<p>文档处理器负责通过递归遍历 AST 来找到目标节点。出于这个原因，文档后处理器应该只用在单个节点上无法处理的情况。</p>
<p>尽管扩展遍历 AST 比创建，维护和访问解析器中的优化结构要快，但是在大文档上却是一个非常慢的过程。</p>
<p>对于基于 AST 中的祖先类型排除节点的扩展，这种性能增益尤其如此。对于节点后处理，这个层次结构是在 AST 的单次遍历期间确定的，以构建所有的节点跟踪结构。如果扩展通过调用 <code>getParent()</code> 函数来确定节点层次，则在大型文档上变得非常低效。</p>
</li>
</ul>
</li>
<li>
<p>HTML 渲染步骤。渲染最终的 AST。扩展需要为其自定义的节点提供默认渲染器。可以通过替换默认渲染器或属性提供器覆盖默认渲染器的 HTML 元素属性来定制渲染。<code>LinkResolvers</code> 负责将 markdown 元素中的链接文本转换为渲染后的 URL。</p>
</li>
<li>
<p>文件包含支持 (Include File Support) 允许扩展将其自定义的引用定义元素从包含文档复制到包含文档，以便任何包含的自定义元素需要定义这些引用将在呈现前正确解析。这是一个可选的步骤，应该在解析文档之后并在呈现之前由应用程序执行。 请参阅 <a href="https://github.com/vsch/flexmark-java/wiki/Usage#include-markdown-and-html-file-content">Include Markdown and HTML File Content</a></p>
</li>
</ol>
<h2>源文本跟踪</h2>
<p>为了跟踪 AST 中节点对应的源位置，所有的解析都是使用 <code>CharSequence</code> 的扩展类 <code>BasedSequence</code> 来执行的，并且用起始和结束偏移来包装文档的原始源字符序列以表示它自己的内容。 <code>subSequence()</code> 函数则返回另一个具有原始基本序列和新的开始/结束偏移的 <code>BasedSequence</code> 实例。</p>
<p>通过这种方式解析定位的字符串，可以使用 <code>BasedSequence.getStartOffset()</code> 和 <code>BasedSequence.getEndOffset()</code> 来获取字符串的源位置。同时这种解析并不比使用 <code>CharSequence</code> 更复杂，因为存储在 AST 中的任何字符串都必须是以 <code>subSequence()</code> 存储原始源文本。</p>
<p>美中不足的是，从 AST 中解析非转义的文本会有点复杂，因为添加到 AST 的必须是转义原始文本。为此，<code>Escaping</code> 工具类中的所有方法都带一个接收 <code>BasedSequence</code> 和一个 <code>ReplacedTextMapper</code> 参数的方法，并返回一个其内容可以使用 <code>ReplacedTextMapper</code> 对象的方法映射到原始源的修改序列。因此程序允许解析编码文本，并能够提取解码对象放置在AST中。请参阅 flexmark-ext-autolink <a href="https://github.com/vsch/flexmark-java/blob/master/flexmark-ext-autolink/src/main/java/com/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor.java">utolinkNodePostProcessor</a> 中的实现，了解如何在工作扩展中实现这一点。</p>
<p>同样，使用正则表达式匹配时，不能简单地使用 <code>group()</code> 返回的字符串，而必须使用组的开始/结束偏移量从输入中提取一个子序列。最好的办法是从原始序列中取一个 <code>subSequence()</code> 来创建 <code>matcher()</code>。核心解析器实现中关于这方面的例子非常丰富。</p>
<p>内核中的源文本跟踪通过引导标签扩展和前缀从分析行中移除，并将这些部分结果串联在一起进行内联解析，这也必须跟踪原始源位置。这是通过额外的BasedSequence实现类来解决的：<code>PrefixedSubSequence</code> 对应部分使用的标签；<code>SegmentedSequence</code> 对应用于级联序列的。结果几乎是整个解析过程中源位置的透明传播。</p>
<p>如果 AST 中有任何错误或错误的设置，那么应该通过测试来捕获这些设置，其中测试也会去验证生成的 AST。</p>
<h2>配置选项</h2>
<p>使用通用配置接口可以轻松配置解析器，渲染器和扩展。 它包含各种组件定义的 <code>DataKey&lt;T&gt;</code> 实例。每个数据键都定义了值的类型和默认值。 <code>DynamicDefaultKey&lt;T&gt;</code> 不会返回在构造函数中生成的默认值，而是在每次请求默认值时调用默认值工厂方法生成。如果用户希望默认值是 <code>DataHolder</code> 中另一个键的当前值，那么此函数很有用。</p>
<p>这些值通过 <code>DataHolder</code> 和 <code>MutableDataHolder</code> 接口访问，前者是只读容器。由于数据键为数据提供唯一的标识符，因此不会出现选项冲突。</p>
<p><code>Parser.EXTENSIONS</code> 选项了包含一组用于 <code>Parser</code> 和 <code>HtmlWriter</code> 的扩展。这允许用一组特定配置选项配置解析器和渲染器。</p>
<p>要配置解析器或渲染器需要将数据容器传递给 <code>builder()</code> 方法。</p>
<pre><code class="language-java">public class SomeClass {
    static final MutableDataHolder OPTIONS = new MutableDataSet()
            .set(Parser.REFERENCES_KEEP, KeepType.LAST)
            .set(HtmlRenderer.INDENT_SIZE, 2)
            .set(HtmlRenderer.PERCENT_ENCODE_URLS, true)
            .set(Parser.EXTENSIONS, Arrays.asList(TablesExtension.create()));

    static final Parser PARSER = Parser.builder(OPTIONS).build();
    static final HtmlRenderer RENDERER = HtmlRenderer.builder(OPTIONS).build();
}
</code></pre>
<h2>修改 commonmark-java 的扩展 API</h2>
<ol>
<li>
<p><code>PhasedNodeRenderer</code> 和 <code>ParagraphPreProcessor</code> 接口添加了关联的 <code>Builder</code> 方法来扩展解析器。</p>
<p><code>PhasedNodeRenderer</code> 允许扩展为 HTML 文档的各个部分生成 HTML 代码。各个阶段按照渲染文档的顺序列出：</p>
<ul>
<li>
<p>HEAD_TOP</p>
</li>
<li>
<p>HEAD</p>
</li>
<li>
<p>HEAD_CSS</p>
</li>
<li>
<p>HEAD_SCRIPTS</p>
</li>
<li>
<p>HEAD_BOTTOM</p>
</li>
<li>
<p>BODY_TOP</p>
</li>
<li>
<p>BODY</p>
</li>
<li>
<p>BODY_BOTTOM</p>
</li>
<li>
<p>BODY_LOAD_SCRIPTS</p>
</li>
<li>
<p>BODY_SCRIPTS</p>
</li>
</ul>
<p><code>BODY</code> 阶段使用<code>NodeRenderer::render(Node ast)</code> 方法生成标准 HTML 代码。文档中的每个节点都会调用这个方法。</p>
<p>其他阶段仅在 <code>Document</code> 根节点上被调用，且仅适用实现 <code>PhasedNodeRenderer</code> 接口的自定义渲染器。 <code>PhasedNodeRenderer::render(Node ast, RenderingPhase phase)</code>。</p>
<p>扩展可以在任何渲染阶段调用 <code>context.render(ast)</code> 和 <code>context.renderChildren(ast)</code>。 这些函数会像处理 <code>BODY</code> 渲染阶段一样处理节点。 <code>FootnoteExtension</code> 扩展在 <code>BODY_BOTTOM</code> 阶段渲染页面内引用的脚注。同样，<code>Table of Contents</code> 扩展使用 <code>BODY_TOP</code> 阶段在文档的顶部插入目录。</p>
<p><code>HEAD...</code> 阶段不被任何扩展使用，但可用于生成完整的 HTML 文档，CSS 样式表和脚本。</p>
</li>
<li>
<p><code>CustomBlockParserFactory</code>, <code>BlockParserFactory</code> 和 <code>BlockParser</code> 用于扩展处理文档分区的块解析，然后解析这些块以边进行内联和后处理。</p>
</li>
<li>
<p>??? <code>ParagraphPreProcessor</code> 和 <code>ParagraphPreProcessorFactory</code> 接口允许在解析器关闭时自定义块元素的预处理。这由 <code>ParagraphParser</code> 完成从段落中提取前置参考定义 (leading reference definition)。从解析器中删除了 <code>ParagraphParser</code> 块的特殊处理，而是添加了一个通用的机制，允许任何BlockParser执行类似的功能，并允许添加自定义预处理器来处理除内置引用定义之外的元素。</p>
</li>
<li>
<p><code>BlockPreProcessor</code> 和 <code>BlockPreProcessorFactory</code> 接口允许在 <code>ParagraphPreProcessor</code> 实例运行后执行内联分析之前对块进行预处理。如果你想用一个自定义的标准节点来取代一个标准节点，这个标准节点根据上下文或子元素而不是内联元素信息。目前这个机制没有被使用。将来可能会被删除，如果它不被证明是有用的。</p>
</li>
</ol>
<h2>渲染器</h2>
<p>渲染器 <code>Builder()</code> 现在有一个  <code>indentSize(int)</code> 方法来设置分层标记的缩进大小。 与在选项中设置 <code>HtmlRenderer.INDENT_SIZE</code> 数据键作用相同。</p>
<p><code>HtmlWriter</code> 类允许使用链式调用。</p>
<p>现在所有的方法都返回这个方法，因此可以使用方法链接。 此外，使用Runnable的tag（）和indentedTag（）方法将自动关闭标签，并在run（）方法执行后取消缩进。 这使得在呈现的输出中更容易看到HTML层次结构。</p>
<p>您可以从当前渲染上下文获取渲染器子上下文，并设置不同的 <code>html writer</code> 而无需修改链接渲染设置。 当需要从节点捕获 HTML 时，使用 <code>TextCollectingAppendable</code> 并将其传入 <code>NodeRendererContext.getSubContext()</code> 方法。 <code>TocExtension</code> 使用它来获取标题文本 html，而无需在标题中嵌入任何链接。</p>
