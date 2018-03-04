package cn.keepfight.services.mdService.YamlFrontMatter;

import cn.keepfight.services.mdService.YamlFrontMatter.internal.YamlFrontMatterBlockParser;
import cn.keepfight.services.mdService.YamlFrontMatter.internal.YamlFrontMatterNodeFormatter;
import com.vladsch.flexmark.Extension;
import com.vladsch.flexmark.formatter.internal.Formatter;
import com.vladsch.flexmark.parser.Parser;
import com.vladsch.flexmark.util.options.MutableDataHolder;

/**
 * Extension for YAML-like metadata.
 * <p>
 * Create it with {@link #create()} and then configure it on the builders
 * ({@link Parser.Builder#extensions(Iterable)},
 * {@link com.vladsch.flexmark.html.HtmlRenderer.Builder#extensions(Iterable)}).
 * </p>
 * <p>
 * The parsed metadata is turned into {@link YamlFrontMatterNode}. You can access the metadata using {@link AbstractYamlFrontMatterVisitor}.
 * </p>
 */
public class YamlFrontMatterExtension implements Parser.ParserExtension, Formatter.FormatterExtension {
    private YamlFrontMatterExtension() {
    }

    @Override
    public void rendererOptions(final MutableDataHolder options) {

    }

    @Override
    public void extend(final Formatter.Builder builder) {
        builder.nodeFormatterFactory(new YamlFrontMatterNodeFormatter.Factory());
    }

    @Override
    public void extend(Parser.Builder parserBuilder) {
        parserBuilder.customBlockParserFactory(new YamlFrontMatterBlockParser.Factory());
    }

    @Override
    public void parserOptions(final MutableDataHolder options) {

    }

    public static Extension create() {
        return new YamlFrontMatterExtension();
    }
}
