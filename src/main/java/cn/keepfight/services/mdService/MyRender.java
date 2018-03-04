package cn.keepfight.services.mdService;

import com.vladsch.flexmark.ast.Document;
import com.vladsch.flexmark.html.HtmlWriter;
import com.vladsch.flexmark.html.renderer.NodeRendererContext;
import com.vladsch.flexmark.html.renderer.NodeRenderingHandler;
import com.vladsch.flexmark.html.renderer.PhasedNodeRenderer;
import com.vladsch.flexmark.html.renderer.RenderingPhase;

import java.util.Set;

/**
 * Created by tom on 2018/2/11.
 */
public class MyRender implements PhasedNodeRenderer {
    @Override
    public Set<RenderingPhase> getRenderingPhases() {
        return null;
    }

    @Override
    public void renderDocument(NodeRendererContext context, HtmlWriter html, Document document, RenderingPhase phase) {

    }

    @Override
    public Set<NodeRenderingHandler<?>> getNodeRenderingHandlers() {
        return null;
    }
}
