<%@ page contentType="text/html; charset=UTF-8" %><h2>参考</h2>
<ol>
<li><a href="http://www.mybatis.org/generator">官网：Running MyBatis Generator With Maven</a></li>
<li><a href="http://blog.csdn.net/isea533/article/details/42102297">MyBatis Generator 详解</a></li>
<li><a href="http://www.jianshu.com/p/e09d2370b796">Mybatis Generator 最完整配置详解</a></li>
</ol>
<p>maven 插件</p>
<pre><code class="language-xml">&lt;plugin&gt;
    &lt;groupId&gt;org.mybatis.generator&lt;/groupId&gt;
    &lt;artifactId&gt;mybatis-generator-maven-plugin&lt;/artifactId&gt;
    &lt;version&gt;1.3.2&lt;/version&gt;
    &lt;configuration&gt;
        &lt;verbose&gt;true&lt;/verbose&gt;
        &lt;overwrite&gt;true&lt;/overwrite&gt;
    &lt;/configuration&gt;
&lt;/plugin&gt;
</code></pre>
<p>该插件会读 <code>${mybatis.generator.configurationFile}</code> 参数指定的配置文件，该值默认为 <code>${basedir}/src/main/resources/generatorConfig.xml</code>，根据配置生成对应的代码。</p>
<p>如下是一个简单的实例：</p>
<pre><code class="language-xml">&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot; ?&gt;
&lt;!DOCTYPE generatorConfiguration PUBLIC &quot;-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN&quot; &quot;http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd&quot; &gt;
&lt;generatorConfiguration&gt;
    &lt;classPathEntry
        location=&quot;D:\repo\mysql\mysql-connector-java\5.1.6\mysql-connector-java-5.1.6.jar&quot; /&gt;
    &lt;context id=&quot;context1&quot; targetRuntime=&quot;MyBatis3&quot;&gt;

        &lt;!-- 生成的Java文件的编码 --&gt;
        &lt;property name=&quot;javaFileEncoding&quot; value=&quot;UTF-8&quot;/&gt;
        &lt;!-- 格式化java代码 --&gt;
        &lt;property name=&quot;javaFormatter&quot; value=&quot;org.mybatis.generator.api.dom.DefaultJavaFormatter&quot;/&gt;
        &lt;!-- 格式化XML代码 --&gt;
        &lt;property name=&quot;xmlFormatter&quot; value=&quot;org.mybatis.generator.api.dom.DefaultXmlFormatter&quot;/&gt;
        &lt;!-- 指明数据库的用于标记数据库对象名的符号， --&gt;
        &lt;!-- 比如ORACLE就是双引号，MYSQL默认是`反引号； --&gt;
        &lt;property name=&quot;beginningDelimiter&quot; value=&quot;`&quot;/&gt;
        &lt;property name=&quot;endingDelimiter&quot; value=&quot;`&quot;/&gt;


        &lt;!-- 指定连接数据库的URL、用户名、密码等信息 --&gt;
        &lt;jdbcConnection driverClass=&quot;com.mysql.jdbc.Driver&quot;
            connectionURL=&quot;jdbc:mysql://xxxxxxx:8406/CL_DEMO?useUnicode=true&amp;amp;characterEncoding=UTF-8&quot;
            userId=&quot;root&quot; password=&quot;password&quot; /&gt;

        &lt;!-- 默认false，会把JDBC DECIMAL 和 NUMERIC 类型解析为 Integer --&gt;
        &lt;!-- true，把JDBC DECIMAL 和 NUMERIC 类型解析为java.math.BigDecimal --&gt;
		&lt;javaTypeResolver&gt;
			&lt;property name=&quot;forceBigDecimals&quot; value=&quot;true&quot; /&gt;
		&lt;/javaTypeResolver&gt;

        &lt;!-- targetPackage 指定生成数据模型对象的包名，如 com.xxx.xxx.model --&gt;
        &lt;!-- targetProject 指定存放 model 的目录 --&gt;
        &lt;javaModelGenerator targetPackage=&quot;xxx.account.model&quot;
            targetProject=&quot;D:\workspace\项目名\src\main\java&quot; &gt;
            &lt;property name=&quot;enableSubPackages&quot; value=&quot;true&quot; /&gt;
            &lt;!-- 这个属性意味字符串属性的设置都会被 trim --&gt;
            &lt;property name=&quot;trimStrings&quot; value=&quot;true&quot; /&gt;
        &lt;/javaModelGenerator&gt;
        &lt;!-- sqlMapGenerator 存放映射文件的路径。 --&gt;
        &lt;sqlMapGenerator targetPackage=&quot;xxxx.account.persistence&quot;
            targetProject=&quot;D:\workspace\项目名\包名\src\main\resources&quot; &gt;
            &lt;&gt;
        &lt;javaClientGenerator targetPackage=&quot;xxxx.account.persistence&quot;
            targetProject=&quot;D:\\workspace\项目名\src\main\java&quot; type=&quot;XMLMAPPER&quot;/&gt;

        &lt;!-- 配置需要生成的表 --&gt;
        &lt;table schema=&quot;CL_DEMO&quot; tableName=&quot;tb_user&quot; /&gt;
        &lt;table schema=&quot;CL_DEMO&quot; tableName=&quot;tb_role&quot; /&gt;
        &lt;table schema=&quot;CL_DEMO&quot; tableName=&quot;tb_permission&quot; /&gt;
        &lt;table schema=&quot;CL_DEMO&quot; tableName=&quot;tb_role_user&quot; /&gt;
        &lt;table schema=&quot;CL_DEMO&quot; tableName=&quot;tb_permission_role&quot; /&gt;
    &lt;/context&gt;
&lt;/generatorConfiguration&gt;
</code></pre>
<p>使用如下命令执行生成操作</p>
<pre><code class="language-bash">mvn mybatis-generator:generate
</code></pre>
