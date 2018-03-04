package cn.keepfight.utils.markdown;

import com.vladsch.flexmark.Extension;
import com.vladsch.flexmark.ast.*;
import com.vladsch.flexmark.ast.util.TextCollectingVisitor;
import com.vladsch.flexmark.ext.anchorlink.AnchorLink;
import com.vladsch.flexmark.ext.anchorlink.internal.AnchorLinkNodeRenderer;
import com.vladsch.flexmark.html.CustomNodeRenderer;
import com.vladsch.flexmark.html.HtmlRenderer;
import com.vladsch.flexmark.html.HtmlRenderer.HtmlRendererExtension;
import com.vladsch.flexmark.html.HtmlWriter;
import com.vladsch.flexmark.html.renderer.*;
import com.vladsch.flexmark.parser.Parser;
import com.vladsch.flexmark.profiles.pegdown.Extensions;
import com.vladsch.flexmark.profiles.pegdown.PegdownOptionsAdapter;
import com.vladsch.flexmark.util.options.DataHolder;
import com.vladsch.flexmark.util.options.MutableDataHolder;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class TitleExtract {
    static final DataHolder OPTIONS = PegdownOptionsAdapter.flexmarkOptions(
            Extensions.ALL & ~(Extensions.HARDWRAPS)
            , HeadingExtension.create()).toMutable()
            .set(HtmlRenderer.INDENT_SIZE, 2);

    static class HeadingExtension implements HtmlRendererExtension {
        @Override
        public void rendererOptions(final MutableDataHolder options) {
            // add any configuration settings to options you want to apply to everything, here
        }

        @Override
        public void extend(final HtmlRenderer.Builder rendererBuilder, final String rendererType) {
            rendererBuilder.nodeRendererFactory(new HeadingNodeRenderer.Factory());
        }

        static HeadingExtension create() {
            return new HeadingExtension();
        }
    }

    static class HeadingNodeRenderer implements NodeRenderer {
        public HeadingNodeRenderer(DataHolder options) {
        }

        @Override
        public Set<NodeRenderingHandler<?>> getNodeRenderingHandlers() {
            return new HashSet<NodeRenderingHandler<? extends Node>>(Arrays.asList(
                    new NodeRenderingHandler<AnchorLink>(AnchorLink.class, new CustomNodeRenderer<AnchorLink>() {
                        @Override
                        public void render(AnchorLink node, NodeRendererContext context, HtmlWriter html) {
                            HeadingNodeRenderer.this.render(node, context, html);
                        }
                    }),
                    new NodeRenderingHandler<Heading>(Heading.class, new CustomNodeRenderer<Heading>() {
                        @Override
                        public void render(Heading node, NodeRendererContext context, HtmlWriter html) {
                            HeadingNodeRenderer.this.render(node, context, html);
                        }
                    })
            ));
        }

        void render(final AnchorLink node, final NodeRendererContext context, final HtmlWriter html) {
            Node parent = node.getParent();

            if (parent instanceof Heading && ((Heading)parent).getLevel() == 1) {
                // render without anchor link
                context.renderChildren(node);
            } else {
                context.delegateRender();
            }
        }

        static boolean haveExtension(int extensions, int flags) {
            return (extensions & flags) != 0;
        }

        static boolean haveAllExtensions(int extensions, int flags) {
            return (extensions & flags) == flags;
        }

        void render(final Heading node, final NodeRendererContext context, final HtmlWriter html) {
            if (node.getLevel() == 1) {
                // render without anchor link
                final int extensions = context.getOptions().get(PegdownOptionsAdapter.PEGDOWN_EXTENSIONS);
                if (context.getHtmlOptions().renderHeaderId || haveExtension(extensions,Extensions.ANCHORLINKS) || haveAllExtensions(extensions,Extensions.EXTANCHORLINKS | Extensions.EXTANCHORLINKS_WRAP) ) {
                    String id = context.getNodeId(node);
                    if (id != null) {
                        html.attr("id", id);
                    }
                }

                if (context.getHtmlOptions().sourcePositionParagraphLines) {
                    html.srcPos(node.getChars()).withAttr().tagLine("h" + node.getLevel(), new Runnable() {
                        @Override
                        public void run() {
                            html.srcPos(node.getText()).withAttr().tag("span");
                            context.renderChildren(node);
                            html.tag("/span");
                        }
                    });
                } else {
                    html.srcPos(node.getText()).withAttr().tagLine("h" + node.getLevel(), new Runnable() {
                        @Override
                        public void run() {
                            context.renderChildren(node);
                        }
                    });
                }
            } else {
                context.delegateRender();
            }
        }

        public static class Factory implements DelegatingNodeRendererFactory {
            @Override
            public NodeRenderer create(final DataHolder options) {
                return new HeadingNodeRenderer(options);
            }

            @Override
            public Set<Class<? extends NodeRendererFactory>> getDelegates() {
                Set<Class<? extends NodeRendererFactory>> delegates = new HashSet<Class<? extends NodeRendererFactory>>();
                delegates.add(AnchorLinkNodeRenderer.Factory.class);
                return delegates;
            }
        }
    }

    private static String findTitle(Node root) {
        if (root instanceof Heading) {
            Heading h = (Heading) root;
            if (h.getLevel() == 1 && h.hasChildren()) {
                TextCollectingVisitor collectingVisitor = new TextCollectingVisitor();
                return collectingVisitor.collectAndGetText(h);
            }
        }

        if (root instanceof Block && root.hasChildren()) {
            Node child = root.getFirstChild();
            while (child != null) {
                String title = findTitle(child);
                if (title != null) {
                    return title;
                }
                child = child.getNext();
            }
        }

        return null;
    }

    public static void main(String[] args) {
        Parser parser = Parser.builder(OPTIONS).build();
        HtmlRenderer renderer = HtmlRenderer.builder(OPTIONS).build();

        // You can re-use parser and renderer instances
        Node document = parser.parse("\n" +
                "# Plugin commit-message-length-validator\n" +
                "\n" +
                "Vendor\n" +
                ":  Gerrit Code Review\n" +
                "\n" +
                "Version\n" +
                ":  v2.15-rc2\n" +
                "\n" +
                "commitmessage.maxSubjectLength\n" +
                ":       Maximum length of the commit message's subject line.  Defaults\n" +
                "        to 50 if not specified or less than 0.\n" +
                "\n" +
                "## About\n" +
                "\n" +
                "This plugin checks the length of a commit's commit message subject and body, and reports warnings and errors to the git client if the lentghts are exceeded.\n" +
                "\n" +
                "## Documentation\n" +
                "\n" +
                "* [Commit Message Length Configuration](config.md)\n" +
                "* More Items\n" +
                "\n" +
                "");

        String title = findTitle(document);
        System.out.println("Title: " + title + "\n");
        String html = renderer.render(document);  // "<p>This is <em>Sparta</em></p>\n"

        System.out.println(html);
    }
}
