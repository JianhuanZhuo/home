<%@ page contentType="text/html; charset=UTF-8" %><p>记录了 Maven 的安装、使用等入门方法。</p>
<!--more-->
<h2>Maven 基础</h2>
<h2>安装要点</h2>
<p>由于安装中缺少某步骤而引起的文件不存在的错误等。注意在安装 Maven 应至少包括如下步骤：</p>
<ol>
<li>在 Apache-Maven 下载页面下载二进制文件（<a href="http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip">国内下载镜像地址</a>），并解压至指定文件夹，如${maven_root}；</li>
<li>将 <code>${maven_root}\bin</code> 路径加入环境变量中；</li>
<li>使用 <code>mvn -v</code> 命令验证。</li>
</ol>
<p>还需注意的是 Maven 运行在 JDK1.5 以上版本的。</p>
<h2>Maven archetype 命令行运行龟速</h2>
<p>原因：生成项目骨架需要模板文件，默认下会到国外中央仓库下载约 4M 的 XML 文件。
解决方案：</p>
<ol>
<li>手动下载模板文件至 <code>~/.m2/</code> 下；并在 <code>mvn archetype:generate</code> 命令中添加参数 <code>-DachetypeCatalog=local</code></li>
<li>使用内置模板文件，在 <code>mvn archetype:generate</code> 命令中添加参数 <code>-DachetypeCatalog=internal</code></li>
</ol>
<h2>Maven引入依赖后自动下载并关联源码(Source)</h2>
<p>好多用 Maven 的时候会遇到这样一个棘手的问题：就是添加依赖后由于<strong>没有下载并关联源码</strong>，导致自动提示无法出现正确的方法名，而且不安装反编译器的情况下不能进入方法内部看具体实现 。</p>
<p>其实 eclipse 的 Maven 插件就提供了这个功能，但是可能有许多开发人员没关注这个功能，所以这个分享给那些不太清楚这个功能的同学，配置很简单，只需要勾选<code>windows-Preferences-Maven- Download Artifact Sources</code> 这个选项就可以了。</p>
<p>相应的，在 Idea 里有可以在 Maven 选项卡上找到这两个选项。</p>
<h2>常用命令</h2>
<pre><code class="language-bash">//查看 Maven 版本
mvn -v
//生成项目骨架
mvn archetype:generate -DarchetypeCatalog=internal
//编译
mvn install
//运行 Java 程序
mvn exec:java -Dexec.mainClass=cn.keepfight.App

//生成 eclipse 工程配置文件命令
mvn eclipse:eclipse

// 下载指定依赖
mvn dependency:get
</code></pre>
<h2>Maven 生命周期</h2>
<p>clean(pre-clean clean post-clean)
default(compile test package install depoly)
site(pre-site sit post-site site-deploy)</p>
<h2>编码错误</h2>
<p>提示如下错误：</p>
<pre><code class="language-bash">Using platform encoding (GBK actually) to copy filtered resources. 
</code></pre>
<p>需要为项目配置编码属性，在 pom.xml 的 project 节点中添加如下：</p>
<pre><code class="language-xml">&lt;properties&gt;
	&lt;project.build.sourceEncoding&gt;
		UTF-8
	&lt;/project.build.sourceEncoding&gt;
&lt;/properties&gt;
</code></pre>
<h2>pom.xml 指定属性</h2>
<p>在 <code>pom.xml</code> 文件中添加如下声明</p>
<pre><code class="language-xml">
	&lt;properties&gt;
		&lt;junit.version&gt;4.1&lt;/junit.version&gt;
	&lt;/properties&gt;
</code></pre>
<p>那么便可以在依赖中使用<code>${属性名}</code>引用该属性指定版本号，以便后期的版本修改</p>
<pre><code class="language-xml">
	&lt;dependency&gt;
		&lt;groupId&gt;junit&lt;/groupId&gt;
		&lt;artifactId&gt;junit&lt;/artifactId&gt;
		&lt;version&gt;${junit.version}&lt;/version&gt;
	&lt;/dependency&gt;
</code></pre>
<p>当然还可以指定一些 maven 使用的属性，比如：</p>
<pre><code class="language-xml">&lt;properties&gt;
    &lt;project.build.sourceEncoding&gt;UTF-8&lt;/project.build.sourceEncoding&gt;
&lt;/properties&gt;
</code></pre>
<p>用于解决maven打包编译出现File encoding has not been set问题</p>
<h2>eclipse 中 不存在 REPO 变量</h2>
<p>在初次导入时，需要手动添加一个 Classpath Variables 变量</p>
<h2>依赖冲突</h2>
<p>假设当前项目依赖传递如下：</p>
<blockquote>
<p>A  依赖 B， B 依赖 C, C 依赖 D (D.x1 版本)
A  依赖 F， F 依赖 D (D.x2 版本)</p>
</blockquote>
<p>那么 Maven 将以短路优先的原则进行依赖选择，即 D.x2 版本离 A 项目最近。</p>
<p>若路径长度相同，则以先声明的优先的原则进行依赖选择</p>
<h2>指定 JDK 默认版本</h2>
<p>在 settings.xml 配置文件中的约 180 行处 <code>profile</code> 节点加入如下</p>
<pre><code class="language-xml">	
	&lt;profile&gt;
		&lt;id&gt;jdk-1.8&lt;/id&gt;
		&lt;activation&gt;
			&lt;activeByDefault&gt;true&lt;/activeByDefault&gt;
			&lt;jdk&gt;1.8&lt;/jdk&gt;
		&lt;/activation&gt;
		&lt;properties&gt;
			&lt;maven.compiler.source&gt;1.8&lt;/maven.compiler.source&gt;
			&lt;maven.compiler.target&gt;1.8&lt;/maven.compiler.target&gt;
			&lt;maven.compiler.compilerVersion&gt;1.8&lt;/maven.compiler.compilerVersion&gt;
		&lt;/properties&gt;
	&lt;/profile&gt;
</code></pre>
<h2>运行 Tomcat 服务器</h2>
<p>如下，加入 tomcat 的 Maven 插件，运行 <code>mvn tomcat7:run</code> 即可。</p>
<pre><code class="language-xml">&lt;build&gt;
	&lt;plugins&gt;
		&lt;plugin&gt;
			&lt;groupId&gt;org.apache.tomcat.maven&lt;/groupId&gt;
			&lt;artifactId&gt;tomcat7-maven-plugin&lt;/artifactId&gt;
			&lt;version&gt;2.1&lt;/version&gt;
                &lt;configuration&gt;
                    &lt;port&gt;80&lt;/port&gt;
                    &lt;path&gt;/mgr&lt;/path&gt;
                    &lt;uriEncoding&gt;UTF-8&lt;/uriEncoding&gt;
                    &lt;finalName&gt;mgr&lt;/finalName&gt;
                    &lt;server&gt;tomcat7&lt;/server&gt;
                &lt;/configuration&gt;
		&lt;/plugin&gt;
	&lt;/plugins&gt;
&lt;/build&gt;
</code></pre>
<p>path  是访问应用的路径
port 是tomcat 的端口号
uriEncoding  URL按UTF-8进行编码，这样就解决了中文参数乱码。
Server 指定tomcat名称。</p>
<table>
<thead>
<tr><th>命令</th><th>描述</th></tr>
</thead>
<tbody>
<tr><td>tomcat:deploy</td><td>部署一个web war包</td></tr>
<tr><td>tomcat:reload</td><td>重新加载web war包</td></tr>
<tr><td>tomcat:start</td><td>启动tomcat</td></tr>
<tr><td>tomcat:stop</td><td>停止tomcat</td></tr>
<tr><td>tomcat:undeploy</td><td>停止一个war包</td></tr>
<tr><td>tomcat:run</td><td>启动嵌入式tomcat ，并运行当前项目</td></tr>
</tbody>
</table>
<h2>使用阿里云仓库</h2>
<pre><code class="language-xml">&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;
&lt;settings xmlns=&quot;http://maven.apache.org/POM/4.0.0&quot; xmlns:xsi=&quot;http://www.w3.org/2001/XMLSchema-instance&quot; xsi:schemaLocation=&quot;http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd&quot;&gt;
	&lt;mirrors&gt;
		&lt;!--给定仓库的下载镜像。  --&gt;
		&lt;mirror&gt;
			&lt;!--该镜像的唯一标识符。id用来区分不同的mirror元素。  --&gt;
			&lt;id&gt;nexus-aliyun&lt;/id&gt;
			&lt;!--镜像名称  --&gt;
			&lt;name&gt;Nexus aliyun&lt;/name&gt;
			&lt;!--该镜像的URL。构建系统会优先考虑使用该URL，而非使用默认的服务器URL。  --&gt;
			&lt;url&gt;http://maven.aliyun.com/nexus/content/groups/public&lt;/url&gt;
			&lt;!--被镜像的服务器的id。例如，如果我们要设置了一个Maven中央仓库（http://repo1.maven.org/maven2）的镜像，--&gt;
			&lt;!--就需要将该元素设置成central。这必须和中央仓库的id central完全一致。 --&gt;
			&lt;mirrorOf&gt;*&lt;/mirrorOf&gt;
		&lt;/mirror&gt;
	&lt;/mirrors&gt;
	&lt;profiles&gt;  
&lt;profile&gt;  
    &lt;id&gt;downloadSources&lt;/id&gt;  
    &lt;properties&gt;  
        &lt;downloadSources&gt;true&lt;/downloadSources&gt;  
        &lt;downloadJavadocs&gt;true&lt;/downloadJavadocs&gt;             
    &lt;/properties&gt;  
&lt;/profile&gt;  
&lt;/profiles&gt;  
	&lt;activeProfiles&gt;  
		&lt;activeProfile&gt;downloadSources&lt;/activeProfile&gt;  
	&lt;/activeProfiles&gt;
&lt;/settings&gt;
</code></pre>
<h2>在 pom.xml 调用 bash 脚本</h2>
<p>相关插件：<a href="http://www.mojohaus.org/exec-maven-plugin/exec-mojo.html">exec:exec</a></p>
<p>简单的样例如下：</p>
<pre><code class="language-xml">&lt;plugin&gt;
  &lt;groupId&gt;org.codehaus.mojo&lt;/groupId&gt;
  &lt;artifactId&gt;exec-maven-plugin&lt;/artifactId&gt;
  &lt;executions&gt;
    &lt;execution&gt;&lt;!-- Run our version calculation script --&gt;
      &lt;id&gt;Version Calculation&lt;/id&gt;
      &lt;phase&gt;generate-sources&lt;/phase&gt;
      &lt;goals&gt;
        &lt;goal&gt;exec&lt;/goal&gt;
      &lt;/goals&gt;
      &lt;configuration&gt;
        &lt;executable&gt;${basedir}/scripts/calculate-version.sh&lt;/executable&gt;
      &lt;/configuration&gt;
    &lt;/execution&gt;
  &lt;/executions&gt;
&lt;/plugin&gt;
</code></pre>
<p>其中，这里的 <code>calculate-version.sh</code> 需要执行权限。也就是新建一个 <code>x.sh</code> 文件后需要 <code>chmod +x x.sh</code> 才行，否则会报 permissions enforced 错误。</p>
<h2>使用 mvn exec 运行 Java 项目</h2>
<p>做了下面的配置后，使用如下方式运行：</p>
<pre><code class="language-bash">mvn exec:java@id
</code></pre>
<pre><code class="language-xml">&lt;build&gt;
    &lt;plugins&gt;
        &lt;plugin&gt;
            &lt;groupId&gt;org.codehaus.mojo&lt;/groupId&gt;
            &lt;artifactId&gt;exec-maven-plugin&lt;/artifactId&gt;
            &lt;version&gt;1.2.1&lt;/version&gt;
            &lt;executions&gt;
                &lt;execution&gt;
                    &lt;id&gt;first-execution&lt;/id&gt;
                    &lt;goals&gt;
                        &lt;goal&gt;java&lt;/goal&gt;
                    &lt;/goals&gt;
                    &lt;configuration&gt;
                        &lt;mainClass&gt;com.mycompany.FooServer&lt;/mainClass&gt;
                    &lt;/configuration&gt;
                &lt;/execution&gt;
                &lt;execution&gt;
                    &lt;id&gt;second-execution&lt;/id&gt;
                    &lt;goals&gt;
                        &lt;goal&gt;java&lt;/goal&gt;
                    &lt;/goals&gt;
                    &lt;configuration&gt;
                        &lt;mainClass&gt;com.mycompany.BarServer&lt;/mainClass&gt;
						&lt;arguments&gt;
							&lt;argument&gt;参数1&lt;/argument&gt;
							&lt;argument&gt;参数2&lt;/argument&gt;
						&lt;/arguments&gt;
                    &lt;/configuration&gt;
                &lt;/execution&gt;
            &lt;/executions&gt;
        &lt;/plugin&gt;
     &lt;/plugins&gt;
 &lt;/build&gt;
</code></pre>
<h2>maven 引用本地 jar</h2>
<p>下面的 <code>&lt;scope&gt;</code> 键必须指定为 <code>system</code></p>
<pre><code class="language-xml">&lt;dependency&gt;
    &lt;groupId&gt;xx&lt;/groupId&gt;
    &lt;artifactId&gt;xx&lt;/artifactId&gt;
    &lt;version&gt;1.0-SNAPSHOT&lt;/version&gt;
    &lt;scope&gt;system&lt;/scope&gt;
    &lt;systemPath&gt;${project.basedir}../../xx/target/xx-1.0-SNAPSHOT.jar&lt;/systemPath&gt;
&lt;/dependency&gt;
</code></pre>
