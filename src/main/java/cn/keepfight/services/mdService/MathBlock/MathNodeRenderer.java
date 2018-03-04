package cn.keepfight.services.mdService.MathBlock;

import com.vladsch.flexmark.html.CustomNodeRenderer;
import com.vladsch.flexmark.html.HtmlWriter;
import com.vladsch.flexmark.html.renderer.NodeRenderer;
import com.vladsch.flexmark.html.renderer.NodeRendererContext;
import com.vladsch.flexmark.html.renderer.NodeRendererFactory;
import com.vladsch.flexmark.html.renderer.NodeRenderingHandler;
import com.vladsch.flexmark.util.options.DataHolder;
import com.vladsch.flexmark.util.sequence.BasedSequence;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by tom on 2018/2/16.
 */
public class MathNodeRenderer implements NodeRenderer {

    @Override
    public Set<NodeRenderingHandler<?>> getNodeRenderingHandlers() {
        return new HashSet<NodeRenderingHandler<?>>(Arrays.asList(
                new NodeRenderingHandler<MathBlock>(MathBlock.class, new CustomNodeRenderer<MathBlock>() {
                    @Override
                    public void render(MathBlock node, NodeRendererContext context, HtmlWriter html) {
                        MathNodeRenderer.this.render(node, context, html);
                    }
                }),
                new NodeRenderingHandler<MathNode>(MathNode.class, new CustomNodeRenderer<MathNode>() {
                    @Override
                    public void render(MathNode node, NodeRendererContext context, HtmlWriter html) {
                        MathNodeRenderer.this.render(node, context, html);
                    }
                })
        ));
    }


    private void render(final MathBlock node, final NodeRendererContext context, final HtmlWriter html) {
//        html.tagIndent("div", new Runnable() {
//            @Override
//            public void run() {
//                context.renderChildren(node);
//            }
//        });
        html.tagLineIndent("div", () -> {
            for (BasedSequence sequence : node.getContentLines())
                html.append(sequence);
        });
    }

    private void render(final MathNode node, final NodeRendererContext context, HtmlWriter html) {
        String tag = "div";
        html.srcPos(node.getText()).withAttr().tag("div");
        html.append(node.getText());
        html.tagLine("/" + tag);
    }

    public static class Factory implements NodeRendererFactory {
        @Override
        public MathNodeRenderer create(final DataHolder options) {
            return new MathNodeRenderer();
        }
    }
}
