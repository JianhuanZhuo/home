package cn.keepfight.utils.markdown;

import com.vladsch.flexmark.ast.*;
import com.vladsch.flexmark.formatter.internal.Formatter;
import com.vladsch.flexmark.parser.Parser;
import com.vladsch.flexmark.util.options.DataHolder;
import com.vladsch.flexmark.util.options.MutableDataSet;
import com.vladsch.flexmark.util.sequence.PrefixedSubSequence;
import com.vladsch.flexmark.util.sequence.SegmentedSequence;

import java.util.Arrays;

public class FormatterWithMods {
    static final DataHolder OPTIONS = new MutableDataSet();

    static final MutableDataSet FORMAT_OPTIONS = new MutableDataSet();
    static {
        // copy extensions from Pegdown compatible to Formatting
        FORMAT_OPTIONS.set(Parser.EXTENSIONS, OPTIONS.get(Parser.EXTENSIONS));
    }

    static final Parser PARSER = Parser.builder(OPTIONS).build();
    static final Formatter RENDERER = Formatter.builder(FORMAT_OPTIONS).build();

    static class LinkNodeVisitor {
        NodeVisitor visitor = new NodeVisitor(
                new VisitHandler<Link>(Link.class, new Visitor<Link>() {
                    @Override
                    public void visit(Link node) {
                        LinkNodeVisitor.this.visit(node);
                    }
                }),
                new VisitHandler<Reference>(Reference.class, new Visitor<Reference>() {
                    @Override
                    public void visit(Reference node) {
                        LinkNodeVisitor.this.visit(node);
                    }
                }),
                new VisitHandler<Image>(Image.class, new Visitor<Image>() {
                    @Override
                    public void visit(Image node) {
                        LinkNodeVisitor.this.visit(node);
                    }
                })
        );

        public void replaceUrl(Node node) {
            visitor.visit(node);
        }

        private void visit(Link node) {
            visit((LinkNodeBase) node);
        }

        private void visit(Reference node) {
            visit((LinkNodeBase) node);
        }

        private void visit(Image node) {
            visit((LinkNodeBase) node);
        }

        private void visit(LinkNodeBase node) {
            if (node.getPageRef().endsWith("replace.com")) {
                node.setUrlChars(PrefixedSubSequence.of("http://replaced.com", node.getPageRef().subSequence(0,0)));
                node.setChars(SegmentedSequence.of(Arrays.asList(node.getSegmentsForChars()), node.getChars()));
            }
        }
    }

    // use the PARSER to parse and RENDERER to parse pegdown indentation rules and render CommonMark
    public static void main(String[] args) {
        final String original = "#Heading\n" +
                "-----\n" +
                "paragraph text \n" +
                "[Not Changed](https://example.com#23)\n" +
                "lazy continuation\n" +
                "[Changed](https://replace.com#abc)\n" +
                "\n" +
                "[reference not changed]: https://example.com#23\n" +
                "[reference changed]: https://replace.com#abc\n" +
                "\n" +
                "";
        System.out.println("original\n");
        System.out.println(original);

        Node document = PARSER.parse(original);
        LinkNodeVisitor visitor = new LinkNodeVisitor();
        visitor.replaceUrl(document);

        String commonmark = RENDERER.render(document);

        System.out.println("\n\nCommonMark\n");
        System.out.println(commonmark);
    }
}
