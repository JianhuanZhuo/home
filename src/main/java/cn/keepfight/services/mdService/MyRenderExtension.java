package cn.keepfight.services.mdService;

import com.vladsch.flexmark.ext.footnotes.internal.FootnoteNodeRenderer;
import com.vladsch.flexmark.html.HtmlRenderer;
import com.vladsch.flexmark.util.options.MutableDataHolder;

/**
 * Created by tom on 2018/2/11.
 */
public class MyRenderExtension implements HtmlRenderer.HtmlRendererExtension {
    @Override
    public void rendererOptions(MutableDataHolder options) {

    }

    @Override
    public void extend(HtmlRenderer.Builder rendererBuilder, String rendererType) {
        rendererBuilder.nodeRendererFactory(new FootnoteNodeRenderer.Factory());
    }
}
