<%@ page contentType="text/html; charset=UTF-8" %><p>使用可重用的模板解构页面</p>
<p>用到的依赖：</p>
<pre><code class="language-xml">&lt;dependency&gt;
    &lt;groupId&gt;org.apache.tiles&lt;/groupId&gt;
    &lt;artifactId&gt;tiles-extras&lt;/artifactId&gt;
    &lt;version&gt;3.0.5&lt;/version&gt;
&lt;/dependency&gt;
</code></pre>
<p>配置文件</p>
<pre><code class="language-java">@Configuration
public class TilesConfig {

    @Bean
       public UrlBasedViewResolver viewResolver() {
           UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
           viewResolver.setViewClass(TilesView.class);
           viewResolver.setOrder(-2);
           return viewResolver;
       }

       @Bean
       public TilesConfigurer tilesConfigurer() {
           TilesConfigurer tilesConfigurer = new TilesConfigurer();
           tilesConfigurer.setDefinitions(&quot;/WEB-INF/layouts/definitions/tiles.xml&quot;);
           tilesConfigurer.setCheckRefresh(true);

           return tilesConfigurer;
       }
}
</code></pre>
<p>tiles.xml 文件作为描述</p>
<pre><code class="language-xml">&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot; ?&gt;
&lt;!DOCTYPE tiles-definitions PUBLIC &quot;-//Apache Software Foundation//DTD Tiles Configuration 3.0//EN&quot; 
   &quot;http://tiles.apache.org/dtds/tiles-config_3_0.dtd&quot;&gt;

&lt;tiles-definitions&gt;
   
   &lt;definition name=&quot;baseLayout&quot; template=&quot;/WEB-INF/layouts/template/baseLayout.jsp&quot;&gt;
      &lt;put-attribute name=&quot;title&quot; value=&quot;Sample Title&quot; /&gt;
      &lt;put-attribute name=&quot;heading&quot; value=&quot;&quot; /&gt;
      &lt;put-attribute name=&quot;tagline&quot; value=&quot;&quot; /&gt;
      &lt;put-attribute name=&quot;navigation&quot; value=&quot;/WEB-INF/layouts/template/navigation.jsp&quot; /&gt;
      &lt;put-attribute name=&quot;content&quot; value=&quot;&quot; /&gt;
      &lt;put-attribute name=&quot;footer&quot; value=&quot;/WEB-INF/layouts/template/footer.jsp&quot; /&gt;
   &lt;/definition&gt;
   
   &lt;definition name=&quot;welcome&quot; extends=&quot;baseLayout&quot;&gt;
      &lt;put-attribute name=&quot;title&quot; value=&quot;Products&quot; /&gt;
      &lt;put-attribute name=&quot;heading&quot; value=&quot;Products&quot; /&gt;
      &lt;put-attribute name=&quot;tagline&quot; value=&quot;All the available products in our store&quot; /&gt;
      &lt;put-attribute name=&quot;content&quot; value=&quot;/WEB-INF/views/products.jsp&quot; /&gt;
   &lt;/definition&gt;
   
   &lt;definition name=&quot;products&quot; extends=&quot;baseLayout&quot;&gt;
      &lt;put-attribute name=&quot;title&quot; value=&quot;Products&quot; /&gt;
      &lt;put-attribute name=&quot;heading&quot; value=&quot;Products&quot; /&gt;
      &lt;put-attribute name=&quot;tagline&quot; value=&quot;All the available products in our store&quot; /&gt;
      &lt;put-attribute name=&quot;content&quot; value=&quot;/WEB-INF/views/products.jsp&quot; /&gt;
   &lt;/definition&gt;
   
   &lt;definition name=&quot;product&quot; extends=&quot;baseLayout&quot;&gt;
      &lt;put-attribute name=&quot;title&quot; value=&quot;Product&quot; /&gt;
      &lt;put-attribute name=&quot;heading&quot; value=&quot;Product&quot; /&gt;
      &lt;put-attribute name=&quot;tagline&quot; value=&quot;Details&quot; /&gt;
      &lt;put-attribute name=&quot;content&quot; value=&quot;/WEB-INF/views/product.jsp&quot; /&gt;
   &lt;/definition&gt;
   
   &lt;definition name=&quot;addProduct&quot; extends=&quot;baseLayout&quot;&gt;
      &lt;put-attribute name=&quot;title&quot; value=&quot;Products&quot; /&gt;
      &lt;put-attribute name=&quot;heading&quot; value=&quot;Products&quot; /&gt;
      &lt;put-attribute name=&quot;tagline&quot; value=&quot;Add Product&quot; /&gt;
      &lt;put-attribute name=&quot;content&quot; value=&quot;/WEB-INF/views/addProduct.jsp&quot; /&gt;
   &lt;/definition&gt;
   
   &lt;definition name=&quot;login&quot; extends=&quot;baseLayout&quot;&gt;
      &lt;put-attribute name=&quot;title&quot; value=&quot;Login&quot; /&gt;
      &lt;put-attribute name=&quot;heading&quot; value=&quot;Welcome to Web Store!&quot; /&gt;
      &lt;put-attribute name=&quot;tagline&quot; value=&quot;The one and only amazing web store&quot; /&gt;
      &lt;put-attribute name=&quot;content&quot; value=&quot;/WEB-INF/views/login.jsp&quot; /&gt;
   &lt;/definition&gt;
   
   &lt;definition name=&quot;cart&quot; extends=&quot;baseLayout&quot;&gt;
      &lt;put-attribute name=&quot;title&quot; value=&quot;Shopping Cart&quot; /&gt;
      &lt;put-attribute name=&quot;heading&quot; value=&quot;Cart&quot; /&gt;
      &lt;put-attribute name=&quot;tagline&quot; value=&quot;All the selected products in your cart&quot; /&gt;
      &lt;put-attribute name=&quot;content&quot; value=&quot;/WEB-INF/views/cart.jsp&quot; /&gt;
   &lt;/definition&gt;
      
&lt;/tiles-definitions&gt;
</code></pre>
<p>baseLayout.jsp 文件</p>
<pre><code class="language-jsp">&lt;%@ taglib prefix=&quot;c&quot; uri=&quot;http://java.sun.com/jsp/jstl/core&quot;%&gt;
&lt;%@ taglib prefix=&quot;spring&quot; uri=&quot;http://www.springframework.org/tags&quot;%&gt;
&lt;%@ taglib prefix=&quot;tiles&quot; uri=&quot;http://tiles.apache.org/tags-tiles&quot;%&gt;

&lt;!DOCTYPE html&gt;
&lt;html lang=&quot;en&quot;&gt;
&lt;head&gt;
    &lt;meta charset=&quot;utf-8&quot;&gt;
    &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;
    &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;

    &lt;title&gt;&lt;tiles:insertAttribute name=&quot;title&quot; /&gt;&lt;/title&gt;

    &lt;link rel=&quot;stylesheet&quot; href=&quot;http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css&quot;&gt;

    &lt;script src=&quot;https://ajax.googleapis.com/ajax/libs/angularjs/1.5.1/angular.min.js&quot;&gt;&lt;/script&gt;

    &lt;script src=&quot;/webstore/resources/js/controllers.js&quot;&gt;&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
   &lt;section class=&quot;container&quot;&gt;
      &lt;div class=&quot;pull-right&quot; style=&quot;padding-right: 50px&quot;&gt;
         &lt;a href=&quot;?language=en&quot;&gt;English&lt;/a&gt;|&lt;a href=&quot;?language=nl&quot;&gt;Dutch&lt;/a&gt;
         &lt;a href=&quot;&lt;c:url value=&quot;/logout&quot; /&gt;&quot;&gt;Logout&lt;/a&gt;
      &lt;/div&gt;
   &lt;/section&gt;

   &lt;div class=&quot;container&quot;&gt;
      &lt;div class=&quot;jumbotron&quot;&gt;
         &lt;div class=&quot;header&quot;&gt;
            &lt;ul class=&quot;nav nav-pills pull-right&quot;&gt;
               &lt;tiles:insertAttribute name=&quot;navigation&quot; /&gt;
            &lt;/ul&gt;
            &lt;h3 class=&quot;text-muted&quot;&gt;Web Store&lt;/h3&gt;
         &lt;/div&gt;

         &lt;h1&gt;
            &lt;tiles:insertAttribute name=&quot;heading&quot; /&gt;
         &lt;/h1&gt;
         &lt;p&gt;
            &lt;tiles:insertAttribute name=&quot;tagline&quot; /&gt;
         &lt;/p&gt;
      &lt;/div&gt;

      &lt;div class=&quot;row&quot;&gt;
         &lt;tiles:insertAttribute name=&quot;content&quot; /&gt;
      &lt;/div&gt;
      &lt;div class=&quot;footer&quot;&gt;
         &lt;tiles:insertAttribute name=&quot;footer&quot; /&gt;
      &lt;/div&gt;
   &lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
</code></pre>
