package cn.keepfight.services.mdService;

import cn.keepfight.services.mdService.MathBlock.MathExtension;
import cn.keepfight.services.mdService.YamlFrontMatter.AbstractYamlFrontMatterVisitor;
import cn.keepfight.services.mdService.YamlFrontMatter.YamlFrontMatterExtension;
import com.vladsch.flexmark.ast.Document;
import com.vladsch.flexmark.ext.autolink.AutolinkExtension;
import com.vladsch.flexmark.ext.footnotes.FootnoteExtension;
import com.vladsch.flexmark.ext.tables.TablesExtension;
import com.vladsch.flexmark.html.HtmlRenderer;
import com.vladsch.flexmark.parser.Parser;
import com.vladsch.flexmark.util.options.MutableDataSet;
import org.apache.commons.io.FileUtils;

import java.io.IOException;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import static cn.keepfight.services.mdService.MyExtension.CONTENT_PATHS;

/**
 * MarkDown 文件处理器
 * <p>
 * Created by tom on 2018/2/10.
 */
public class MDProcessor {
    private static MDProcessor instance;

    public static MDProcessor getInstance() {
        if (instance == null) {
            instance = new MDProcessor();
        }
        return instance;
    }

    /**
     * 解析器
     */
    private Parser parser;

    /**
     * 格式化渲染器
     */
    private HtmlRenderer renderer;

    private MDProcessor() {
        MutableDataSet options = new MutableDataSet();

        options.set(Parser.EXTENSIONS, Arrays.asList(
                YamlFrontMatterExtension.create(),
                TablesExtension.create(),
                FootnoteExtension.create(),
                MyExtension.MDExtension.create(),
                AutolinkExtension.create(),
                MathExtension.create()
        ));

        parser = Parser.builder(options).build();
        renderer = HtmlRenderer.builder(options).build();
    }

    public MDRes toHtml(Path mdSource, Path currentPathToResource) throws IOException {
        Document document = parser.parse(FileUtils.readFileToString(mdSource.toFile()));
        document.set(CONTENT_PATHS, currentPathToResource);
        AbstractYamlFrontMatterVisitor visitor = new AbstractYamlFrontMatterVisitor();
        visitor.visit(document);
        return new MDRes(renderer.render(document), visitor.getData());
    }

    public static class MDRes {
        String htmlStr;
        Map<String, List<String>> metaList;

        public MDRes(String htmlStr, Map<String, List<String>> metaList) {
            this.htmlStr = htmlStr;
            this.metaList = metaList;
        }

        public String getHtmlStr() {
            return htmlStr;
        }

        public void setHtmlStr(String htmlStr) {
            this.htmlStr = htmlStr;
        }

        public Map<String, List<String>> getMetaList() {
            return metaList;
        }

        public void setMetaList(Map<String, List<String>> metaList) {
            this.metaList = metaList;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;

            MDRes mdRes = (MDRes) o;

            if (htmlStr != null ? !htmlStr.equals(mdRes.htmlStr) : mdRes.htmlStr != null) return false;
            return metaList != null ? metaList.equals(mdRes.metaList) : mdRes.metaList == null;
        }

        @Override
        public int hashCode() {
            int result = htmlStr != null ? htmlStr.hashCode() : 0;
            result = 31 * result + (metaList != null ? metaList.hashCode() : 0);
            return result;
        }

        @Override
        public String toString() {
            return "MDRes{" +
                    "htmlStr='" + htmlStr + '\'' +
                    ", metaList='" + metaList + '\'' +
                    '}';
        }
    }

    public static void main(String[] args) throws IOException {
//        Path p = Paths.get("C:\\Users\\tom\\IdeaProjects\\home\\BlogMarkdownSource\\weixin\\shortcut.md");
//        System.out.println(MDProcessor.getInstance().toHtml(p));

//        DataHolder OPTIONS = PegdownOptionsAdapter.flexmarkOptions(
//                Extensions.ALL
//        );
//
//        MutableDataSet renderOptions = new MutableDataSet();
//
//        // copy extensions from Pegdown compatible to Formatting
//        renderOptions.set(Parser.EXTENSIONS, OPTIONS.get(Parser.EXTENSIONS));
//
////        Parser parser = Parser.builder(OPTIONS).build();
////        Formatter renderer = Formatter.builder(renderOptions).build();
//
//        Parser parser = Parser.builder(options).build();
//        HtmlRenderer renderer = HtmlRenderer.builder(options).build();
//
//
//        Node document = parser.parse(FileUtils.readFileToString(new File("C:\\Users\\tom\\IdeaProjects\\home\\BlogMarkdownSource\\weixin\\shortcut.md")));
//        String html = renderer.render(document);
//        AbstractYamlFrontMatterVisitor visitor = new AbstractYamlFrontMatterVisitor();
//        visitor.visit(document);
//        System.out.println(html);
    }
}
