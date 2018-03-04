package cn.keepfight.services.mdService.MathBlock;

import com.vladsch.flexmark.Extension;
import com.vladsch.flexmark.ext.tables.TablesExtension;
import com.vladsch.flexmark.ext.tables.internal.TableJiraRenderer;
import com.vladsch.flexmark.ext.tables.internal.TableNodeRenderer;
import com.vladsch.flexmark.ext.tables.internal.TableParagraphPreProcessor;
import com.vladsch.flexmark.formatter.internal.Formatter;
import com.vladsch.flexmark.html.HtmlRenderer;
import com.vladsch.flexmark.parser.Parser;
import com.vladsch.flexmark.util.options.MutableDataHolder;

/**
 * Created by tom on 2018/2/16.
 */
public class MathExtension implements Parser.ParserExtension, HtmlRenderer.HtmlRendererExtension, Formatter.FormatterExtension {

    /**
     * FormatterExtension
     */
    @Override
    public void extend(Formatter.Builder builder) {

    }

    /**
     * HtmlRenderer
     */
    @Override
    public void rendererOptions(MutableDataHolder options) {

    }

    /**
     * HtmlRenderer
     */
    @Override
    public void extend(HtmlRenderer.Builder rendererBuilder, String rendererType) {
        rendererBuilder.nodeRendererFactory(new MathNodeRenderer.Factory());
    }


    /**
     * Parser
     */
    @Override
    public void parserOptions(MutableDataHolder options) {
    }

    /**
     * Parser
     */
    @Override
    public void extend(Parser.Builder parserBuilder) {
        parserBuilder.paragraphPreProcessorFactory(MathParagraphPreProcessor.Factory());
    }

    public static Extension create() {
        return new MathExtension();
    }
}
