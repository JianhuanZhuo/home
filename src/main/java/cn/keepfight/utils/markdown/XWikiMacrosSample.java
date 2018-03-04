package cn.keepfight.utils.markdown;

import com.vladsch.flexmark.ast.Node;
import com.vladsch.flexmark.ast.NodeVisitor;
import com.vladsch.flexmark.ext.xwiki.macros.*;
import com.vladsch.flexmark.html.HtmlRenderer;
import com.vladsch.flexmark.parser.Parser;
import com.vladsch.flexmark.util.options.MutableDataHolder;
import com.vladsch.flexmark.util.options.MutableDataSet;

import java.util.Arrays;
import java.util.Map;

@SuppressWarnings({ "unchecked", "WeakerAccess" })
public class XWikiMacrosSample implements MacroVisitor {
    // Sample XWiki processing
    // NOTE: using raw text content of the node means that any nested macros will be taken as is
    // to handle nested macros would require more logic to allow nested macros to provide their content
    // to parent macros

    NodeVisitor visitor = new NodeVisitor(
            MacroVisitorExt.VISIT_HANDLERS(this)
    );

    @Override
    public void visit(final Macro node) {
        if (!node.isBlockMacro()) {
            // collect attributes
            final Map<String, String> attributes = node.getAttributes();
            String content = node.getMacroContentChars().toString();
            boolean isBlock = false;

            // use content, attributes, isBlock
        }
    }

    @Override
    public void visit(final MacroClose node) {

    }

    @Override
    public void visit(final MacroBlock node) {
        // collect attributes
        final Map<String, String> attributes = node.getAttributes();
        String content = node.getMacroContentChars().toString();
        boolean isBlock = true;

        // use content, attributes, isBlock
    }

    public static void main(String[] args) {
        MutableDataHolder options = new MutableDataSet();
        options.set(Parser.EXTENSIONS, Arrays.asList(MacroExtension.create()));

        Parser parser = Parser.builder(options).build();
        HtmlRenderer renderer = HtmlRenderer.builder(options).build();

        String markdown = "markdown content here";
        Node document = parser.parse(markdown);

        XWikiMacrosSample macroProcessor = new XWikiMacrosSample();
        macroProcessor.visitor.visitChildren(document);
    }
}
