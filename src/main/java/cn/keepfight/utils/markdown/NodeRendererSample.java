package cn.keepfight.utils.markdown;

import com.vladsch.flexmark.ast.*;
import com.vladsch.flexmark.ext.abbreviation.internal.AbbreviationOptions;
import com.vladsch.flexmark.ext.autolink.AutolinkExtension;
import com.vladsch.flexmark.html.CustomNodeRenderer;
import com.vladsch.flexmark.html.HtmlRenderer;
import com.vladsch.flexmark.html.HtmlWriter;
import com.vladsch.flexmark.html.renderer.*;
import com.vladsch.flexmark.parser.Parser;
import com.vladsch.flexmark.util.options.DataHolder;
import com.vladsch.flexmark.util.options.MutableDataHolder;
import com.vladsch.flexmark.util.options.MutableDataSet;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class NodeRendererSample {
    static class SampleExtension implements HtmlRenderer.HtmlRendererExtension {
        @Override
        public void rendererOptions(final MutableDataHolder options) {
            // add any configuration settings to options you want to apply to everything, here
        }

        @Override
        public void extend(final HtmlRenderer.Builder rendererBuilder, final String rendererType) {
            rendererBuilder.nodeRendererFactory(new SampleNodeRenderer.Factory());
        }

        static SampleExtension create() {
            return new SampleExtension();
        }
    }

    static class SampleNodeRenderer implements NodeRenderer {
        private final AbbreviationOptions options;

        public SampleNodeRenderer(DataHolder options) {
            this.options = new AbbreviationOptions(options);
        }

        @Override
        public Set<NodeRenderingHandler<?>> getNodeRenderingHandlers() {
            return new HashSet<NodeRenderingHandler<? extends Node>>(Arrays.asList(
                    new NodeRenderingHandler<HtmlBlock>(HtmlBlock.class, new CustomNodeRenderer<HtmlBlock>() {
                        @Override
                        public void render(HtmlBlock node, NodeRendererContext context, HtmlWriter html) {
                            SampleNodeRenderer.this.render(node, context, html);
                        }
                    }),
                    new NodeRenderingHandler<HtmlInline>(HtmlInline.class, new CustomNodeRenderer<HtmlInline>() {
                        @Override
                        public void render(HtmlInline node, NodeRendererContext context, HtmlWriter html) {
                            SampleNodeRenderer.this.render(node, context, html);
                        }
                    })
            ));
        }

        private void render(HtmlBlock node, NodeRendererContext context, HtmlWriter html) {
            html.line();

            if (context.getHtmlOptions().sourceWrapHtmlBlocks) {
                html.srcPos(node.getChars()).withAttr(AttributablePart.NODE_POSITION).tag("div").indent().line();
            }

            if (node.hasChildren()) {
                // inner blocks handle rendering
                context.renderChildren(node);
            } else {
                renderHtmlBlock(node, context, html, context.getHtmlOptions().suppressHtmlBlocks, context.getHtmlOptions().escapeHtmlBlocks);
            }

            if (context.getHtmlOptions().sourceWrapHtmlBlocks) {
                html.unIndent().tag("/div");
            }

            html.lineIf(context.getHtmlOptions().htmlBlockCloseTagEol);
        }

        private void render(HtmlCommentBlock node, NodeRendererContext context, HtmlWriter html) {
            renderHtmlBlock(node, context, html, context.getHtmlOptions().suppressHtmlCommentBlocks, context.getHtmlOptions().escapeHtmlCommentBlocks);
        }

        private void render(HtmlInnerBlock node, NodeRendererContext context, HtmlWriter html) {
            renderHtmlBlock(node, context, html, context.getHtmlOptions().suppressHtmlBlocks, context.getHtmlOptions().escapeHtmlBlocks);
        }

        private void render(HtmlInnerBlockComment node, NodeRendererContext context, HtmlWriter html) {
            renderHtmlBlock(node, context, html, context.getHtmlOptions().suppressHtmlCommentBlocks, context.getHtmlOptions().escapeHtmlCommentBlocks);
        }

        public void renderHtmlBlock(HtmlBlockBase node, NodeRendererContext context, HtmlWriter html, boolean suppress, boolean escape) {
            if (suppress) return;

            if (node instanceof HtmlBlock)
                html.line();

            if (escape) {
                html.text(node instanceof HtmlBlock ? node.getContentChars().normalizeEOL() : node.getChars().normalizeEOL());
            } else {
                html.rawPre((node instanceof HtmlBlock ? node.getContentChars().normalizeEOL() : node.getChars().normalizeEOL()));
            }

            if (node instanceof HtmlBlock)
                html.lineIf(context.getHtmlOptions().htmlBlockCloseTagEol);
        }

        private void render(HtmlInline node, NodeRendererContext context, HtmlWriter html) {
            renderInlineHtml(node, context, html, context.getHtmlOptions().suppressInlineHtml, context.getHtmlOptions().escapeInlineHtml);
        }

        private void render(HtmlInlineComment node, NodeRendererContext context, HtmlWriter html) {
            renderInlineHtml(node, context, html, context.getHtmlOptions().suppressInlineHtmlComments, context.getHtmlOptions().escapeInlineHtmlComments);
        }

        public void renderInlineHtml(HtmlInlineBase node, NodeRendererContext context, HtmlWriter html, boolean suppress, boolean escape) {
            if (suppress) return;

            if (escape) {
                html.text(node.getChars().normalizeEOL());
            } else {
                html.rawPre(node.getChars().normalizeEOL());
            }
        }

        public static class Factory implements NodeRendererFactory {
            @Override
            public NodeRenderer create(final DataHolder options) {
                return new SampleNodeRenderer(options);
            }
        }
    }


    static String commonMark(String markdown) {
        MutableDataHolder options = new MutableDataSet();
        options.set(Parser.EXTENSIONS, Arrays.asList(AutolinkExtension.create(), SampleExtension.create()));

        // change soft break to hard break
        options.set(HtmlRenderer.SOFT_BREAK, "<br/>");
        options.set(HtmlRenderer.ESCAPE_HTML, true);

        Parser parser = Parser.builder(options).build();
        Node document = parser.parse(markdown);
        HtmlRenderer renderer = HtmlRenderer.builder(options).build();
        final String html = renderer.render(document);
        return html;
    }

    public static void main(String[] args) {
        String html = commonMark("<script>alert('hello');</script> script tag\n" +
                "<tag> unknown tag\n" +
                "<img src=\"abc.png\" />");
        System.out.println(html);
    }
}
