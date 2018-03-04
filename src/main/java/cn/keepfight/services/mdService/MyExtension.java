package cn.keepfight.services.mdService;

import com.vladsch.flexmark.ast.Image;
import com.vladsch.flexmark.ast.Node;
import com.vladsch.flexmark.html.AttributeProvider;
import com.vladsch.flexmark.html.AttributeProviderFactory;
import com.vladsch.flexmark.html.HtmlRenderer;
import com.vladsch.flexmark.html.IndependentAttributeProviderFactory;
import com.vladsch.flexmark.html.renderer.AttributablePart;
import com.vladsch.flexmark.html.renderer.LinkResolverContext;
import com.vladsch.flexmark.util.html.Attributes;
import com.vladsch.flexmark.util.options.DataKey;
import com.vladsch.flexmark.util.options.MutableDataHolder;

import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * 图片渲染路径
 * Created by tom on 2018/2/11.
 */
public class MyExtension {

    public static final DataKey<Path> CONTENT_PATHS = new DataKey<>("CONTENT_PATHS", Paths.get(""));

    static class MDExtension implements HtmlRenderer.HtmlRendererExtension {

        @Override
        public void rendererOptions(MutableDataHolder options) {

        }

        @Override
        public void extend(HtmlRenderer.Builder rendererBuilder, String rendererType) {
            rendererBuilder.attributeProviderFactory(MDExtensionProvider.Factory());
        }

        static MDExtension create() {
            return new MDExtension();
        }
    }

    static class MDExtensionProvider implements AttributeProvider {
        @Override
        public void setAttributes(final Node node, final AttributablePart part, final Attributes attributes) {
            if (node instanceof Image && part == AttributablePart.LINK) {
                Path p = node.getDocument().get(CONTENT_PATHS);
                try {
                    URI uri = new URI(attributes.getValue("src"));
                    if (!uri.isAbsolute()) {
                        attributes.replaceValue("src", "${pageContext.request.contextPath}/" + p.resolve(Paths.get(attributes.getValue("src"))).normalize().toString());
                    }
                } catch (URISyntaxException e) {
                    e.printStackTrace();
                }
            }
        }

        static AttributeProviderFactory Factory() {
            return new IndependentAttributeProviderFactory() {
                @Override
                public AttributeProvider create(LinkResolverContext context) {
                    //noinspection ReturnOfInnerClass
                    return new MDExtensionProvider();
                }
            };
        }
    }

    public static void main(String[] args) throws MalformedURLException, URISyntaxException {
        Path md = Paths.get("C:/A/B/C");
        Path img = Paths.get("img/x.png");
        Path root = Paths.get("C:/A");
        Path root2 = Paths.get("C:/A/");
//        System.out.println(md.resolve(root));
//        System.out.println(root.resolve(md));
//        System.out.println(root.relativize(md));
//        System.out.println(md.relativize(root));
//
//        System.out.println(root.relativize(md).resolve(img));
//        System.out.println(root.relativize(md).resolve(img).normalize());
//        System.out.println(root.relativize(md).getParent().resolve(img).normalize());
//        System.out.println(root2.relativize(md).getParent().resolve(img).normalize());

//        System.out.println(Paths.get("http://pic4.zhimg.com/v2-000da5e75cb94f5d73810ec29648333b_b.jpg").isAbsolute());

        System.out.println(new URI("./xx"));
        System.out.println(new URI("./xx").isAbsolute());
        System.out.println(new URI("../xx").isAbsolute());
        System.out.println(new URI("http://pic4.zhimg.com/v2-000da5e75cb94f5d73810ec29648333b_b.jpg").isAbsolute());
        System.out.println(new URI("http://pic4.zhimg.com/v2-000da5e75cb94f5d73810ec29648333b_b.jpg").isAbsolute());
        System.out.println(new URI("\\img\\tools\\idea_svn_1.png").isAbsolute());
        System.out.println(new URI("/img/tools/idea_svn_1.png").isAbsolute());
    }
}
