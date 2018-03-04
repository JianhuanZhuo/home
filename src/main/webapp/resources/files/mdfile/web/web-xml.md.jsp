<%@ page contentType="text/html; charset=UTF-8" %><p>参考：
(Spring MVC 的 web.xml 配置详解)[http://blog.csdn.net/u010796790/article/details/52098258]</p>
<pre><code class="language-xml">&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;  
&lt;web-app version=&quot;3.0&quot; xmlns=&quot;http://java.sun.com/xml/ns/javaee&quot;  
         xmlns:xsi=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;  
         xsi:schemaLocation=&quot;http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd&quot;&gt;  

    &lt;!-- 在Spring框架中是如何解决从页面传来的字符串的编码问题的呢？
    下面我们来看看Spring框架给我们提供过滤器CharacterEncodingFilter  
     这个过滤器就是针对于每次浏览器请求进行过滤的，然后再其之上添加了父类没有的功能即处理字符编码。  
      其中encoding用来设置编码格式，forceEncoding用来设置是否理会 request.getCharacterEncoding()方法，设置为true则强制覆盖之前的编码格式。--&gt;  
    &lt;filter&gt;  
        &lt;filter-name&gt;characterEncodingFilter&lt;/filter-name&gt;  
        &lt;filter-class&gt;org.springframework.web.filter.CharacterEncodingFilter&lt;/filter-class&gt;  
        &lt;init-param&gt;  
            &lt;param-name&gt;encoding&lt;/param-name&gt;  
            &lt;param-value&gt;UTF-8&lt;/param-value&gt;  
        &lt;/init-param&gt;  
        &lt;init-param&gt;  
            &lt;param-name&gt;forceEncoding&lt;/param-name&gt;  
            &lt;param-value&gt;true&lt;/param-value&gt;  
        &lt;/init-param&gt;  
    &lt;/filter&gt;  
    &lt;filter-mapping&gt;  
        &lt;filter-name&gt;characterEncodingFilter&lt;/filter-name&gt;  
        &lt;url-pattern&gt;/*&lt;/url-pattern&gt;  
    &lt;/filter-mapping&gt;  
    &lt;!-- 项目中使用Spring 时，applicationContext.xml配置文件中并没有BeanFactory，要想在业务层中的class 文件中直接引用Spring容器管理的bean可通过以下方式--&gt;  
    &lt;!--1、在web.xml配置监听器ContextLoaderListener--&gt;  
    &lt;!--ContextLoaderListener的作用就是启动Web容器时，自动装配ApplicationContext的配置信息。因为它实现了ServletContextListener这个接口，在web.xml配置这个监听器，启动容器时，就会默认执行它实现的方法。  
    在ContextLoaderListener中关联了ContextLoader这个类，所以整个加载配置过程由ContextLoader来完成。  
    它的API说明  
    第一段说明ContextLoader可以由 ContextLoaderListener和ContextLoaderServlet生成。  
    如果查看ContextLoaderServlet的API，可以看到它也关联了ContextLoader这个类而且它实现了HttpServlet这个接口  
    第二段，ContextLoader创建的是 XmlWebApplicationContext这样一个类，它实现的接口是WebApplicationContext-&gt;ConfigurableWebApplicationContext-&gt;ApplicationContext-&gt;  
    BeanFactory这样一来spring中的所有bean都由这个类来创建  
     IUploaddatafileManager uploadmanager = (IUploaddatafileManager)    ContextLoaderListener.getCurrentWebApplicationContext().getBean(&quot;uploadManager&quot;);
     --&gt;  
    &lt;listener&gt;  
        &lt;listener-class&gt;org.springframework.web.context.ContextLoaderListener&lt;/listener-class&gt;  
    &lt;/listener&gt;  
    &lt;!--2、部署applicationContext的xml文件--&gt;  
    &lt;!--如果在web.xml中不写任何参数配置信息，默认的路径是&quot;/WEB-INF/applicationContext.xml，  
    在WEB-INF目录下创建的xml文件的名称必须是applicationContext.xml。  
    如果是要自定义文件名可以在web.xml里加入contextConfigLocation这个context参数：  
    在&lt;param-value&gt; &lt;/param-value&gt;里指定相应的xml文件名，如果有多个xml文件，可以写在一起并以“,”号分隔。  
    也可以这样applicationContext-*.xml采用通配符，比如这那个目录下有applicationContext-ibatis-base.xml，  
    applicationContext-action.xml，applicationContext-ibatis-dao.xml等文件，都会一同被载入。  
    在ContextLoaderListener中关联了ContextLoader这个类，所以整个加载配置过程由ContextLoader来完成。--&gt;  
    &lt;context-param&gt;  
        &lt;param-name&gt;contextConfigLocation&lt;/param-name&gt;  
        &lt;param-value&gt;classpath:spring/applicationContext.xml&lt;/param-value&gt;  
    &lt;/context-param&gt;  

    &lt;!--如果你的DispatcherServlet拦截&quot;/&quot;，为了实现REST风格，拦截了所有的请求，那么同时对*.js,*.jpg等静态文件的访问也就被拦截了。--&gt;  
    &lt;!--方案一：激活Tomcat的defaultServlet来处理静态文件--&gt;  
    &lt;!--要写在DispatcherServlet的前面， 让 defaultServlet先拦截请求，这样请求就不会进入Spring了，我想性能是最好的吧。--&gt;  
    &lt;servlet-mapping&gt;  
        &lt;servlet-name&gt;default&lt;/servlet-name&gt;  
        &lt;url-pattern&gt;*.css&lt;/url-pattern&gt;  
    &lt;/servlet-mapping&gt;  
    &lt;servlet-mapping&gt;  
        &lt;servlet-name&gt;default&lt;/servlet-name&gt;  
        &lt;url-pattern&gt;*.swf&lt;/url-pattern&gt;  
    &lt;/servlet-mapping&gt;  
    &lt;servlet-mapping&gt;  
        &lt;servlet-name&gt;default&lt;/servlet-name&gt;  
        &lt;url-pattern&gt;*.gif&lt;/url-pattern&gt;  
    &lt;/servlet-mapping&gt;  
    &lt;servlet-mapping&gt;  
        &lt;servlet-name&gt;default&lt;/servlet-name&gt;  
        &lt;url-pattern&gt;*.jpg&lt;/url-pattern&gt;  
    &lt;/servlet-mapping&gt;  
    &lt;servlet-mapping&gt;  
        &lt;servlet-name&gt;default&lt;/servlet-name&gt;  
        &lt;url-pattern&gt;*.png&lt;/url-pattern&gt;  
    &lt;/servlet-mapping&gt;  
    &lt;servlet-mapping&gt;  
        &lt;servlet-name&gt;default&lt;/servlet-name&gt;  
        &lt;url-pattern&gt;*.js&lt;/url-pattern&gt;  
    &lt;/servlet-mapping&gt;  
    &lt;servlet-mapping&gt;  
        &lt;servlet-name&gt;default&lt;/servlet-name&gt;  
        &lt;url-pattern&gt;*.html&lt;/url-pattern&gt;  
    &lt;/servlet-mapping&gt;  
    &lt;servlet-mapping&gt;  
        &lt;servlet-name&gt;default&lt;/servlet-name&gt;  
        &lt;url-pattern&gt;*.xml&lt;/url-pattern&gt;  
    &lt;/servlet-mapping&gt;  
    &lt;servlet-mapping&gt;  
        &lt;servlet-name&gt;default&lt;/servlet-name&gt;  
        &lt;url-pattern&gt;*.json&lt;/url-pattern&gt;  
    &lt;/servlet-mapping&gt;  
    &lt;servlet-mapping&gt;  
        &lt;servlet-name&gt;default&lt;/servlet-name&gt;  
        &lt;url-pattern&gt;*.map&lt;/url-pattern&gt;  
    &lt;/servlet-mapping&gt;  
    &lt;!--使用Spring MVC,配置DispatcherServlet是第一步。DispatcherServlet是一个Servlet,,所以可以配置多个DispatcherServlet--&gt;  
    &lt;!--DispatcherServlet是前置控制器，配置在web.xml文件中的。拦截匹配的请求，Servlet拦截匹配规则要自已定义，把拦截下来的请求，依据某某规则分发到目标Controller(我们写的Action)来处理。--&gt;  
    &lt;servlet&gt;  
        &lt;servlet-name&gt;DispatcherServlet&lt;/servlet-name&gt;&lt;!--在DispatcherServlet的初始化过程中，框架会在web应用的 WEB-INF文件夹下寻找名为[servlet-name]-servlet.xml 的配置文件，生成文件中定义的bean。--&gt;  
        &lt;servlet-class&gt;org.springframework.web.servlet.DispatcherServlet&lt;/servlet-class&gt;  
        &lt;!--指明了配置文件的文件名，不使用默认配置文件名，而使用dispatcher-servlet.xml配置文件。--&gt;  
        &lt;init-param&gt;  
            &lt;param-name&gt;contextConfigLocation&lt;/param-name&gt;  
            &lt;!--其中&lt;param-value&gt;**.xml&lt;/param-value&gt; 这里可以使用多种写法--&gt;  
            &lt;!--1、不写,使用默认值:/WEB-INF/&lt;servlet-name&gt;-servlet.xml--&gt;  
            &lt;!--2、&lt;param-value&gt;/WEB-INF/classes/dispatcher-servlet.xml&lt;/param-value&gt;--&gt;  
            &lt;!--3、&lt;param-value&gt;classpath*:dispatcher-servlet.xml&lt;/param-value&gt;--&gt;  
            &lt;!--4、多个值用逗号分隔--&gt;  
            &lt;param-value&gt;classpath:spring/dispatcher-servlet.xml&lt;/param-value&gt;  
        &lt;/init-param&gt;  
        &lt;load-on-startup&gt;1&lt;/load-on-startup&gt;&lt;!--是启动顺序，让这个Servlet随Servletp容器一起启动。--&gt;  
    &lt;/servlet&gt;  
    &lt;servlet-mapping&gt;  
        &lt;!--这个Servlet的名字是dispatcher，可以有多个DispatcherServlet，是通过名字来区分的。每一个DispatcherServlet有自己的WebApplicationContext上下文对象。同时保存的ServletContext中和Request对象中.--&gt;  
        &lt;!--ApplicationContext是Spring的核心，Context我们通常解释为上下文环境，我想用“容器”来表述它更容易理解一些，ApplicationContext则是“应用的容器”了:P，Spring把Bean放在这个容器中，在需要的时候，用getBean方法取出--&gt;  
        &lt;servlet-name&gt;DispatcherServlet&lt;/servlet-name&gt;  
        &lt;!--Servlet拦截匹配规则可以自已定义，当映射为@RequestMapping(&quot;/user/add&quot;)时，为例,拦截哪种URL合适？--&gt;  
        &lt;!--1、拦截*.do、*.htm， 例如：/user/add.do,这是最传统的方式，最简单也最实用。不会导致静态文件（jpg,js,css）被拦截。--&gt;  
        &lt;!--2、拦截/，例如：/user/add,可以实现现在很流行的REST风格。很多互联网类型的应用很喜欢这种风格的URL。弊端：会导致静态文件（jpg,js,css）被拦截后不能正常显示。 --&gt;  
        &lt;url-pattern&gt;/&lt;/url-pattern&gt; &lt;!--会拦截URL中带“/”的请求。--&gt;  
    &lt;/servlet-mapping&gt;  

    &lt;welcome-file-list&gt;&lt;!--指定欢迎页面--&gt;  
        &lt;welcome-file&gt;login.html&lt;/welcome-file&gt;  
    &lt;/welcome-file-list&gt;  
    &lt;error-page&gt; &lt;!--当系统出现404错误，跳转到页面nopage.html--&gt;  
        &lt;error-code&gt;404&lt;/error-code&gt;  
        &lt;location&gt;/nopage.html&lt;/location&gt;  
    &lt;/error-page&gt;  
    &lt;error-page&gt; &lt;!--当系统出现java.lang.NullPointerException，跳转到页面error.html--&gt;  
        &lt;exception-type&gt;java.lang.NullPointerException&lt;/exception-type&gt;  
        &lt;location&gt;/error.html&lt;/location&gt;  
    &lt;/error-page&gt;  
    &lt;session-config&gt;&lt;!--会话超时配置，单位分钟--&gt;  
        &lt;session-timeout&gt;360&lt;/session-timeout&gt;  
    &lt;/session-config&gt;  
&lt;/web-app&gt;  
</code></pre>
