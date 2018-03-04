<%@ page contentType="text/html; charset=UTF-8" %><p>title : mybatis 学习笔记
date  : 2017/5/25</p>
<hr />
<p>原始 DAO 开发方式
mybatis 的 mapper 借口，代理开发方法</p>
<p>mybatis 配置文件 sqlMapConfig.xml
mybatis 核心：
输入映射
输出映射
mybatis 的动态 SQL</p>
<p>缓存
延迟加载</p>
<ol>
<li>SqlMapConfig.xml 配置信息、Mapper映射器</li>
<li>SqlSessionFactory 工厂方法</li>
<li>SqlSession（会话），操作数据库（发出SQL的增删改查）</li>
<li>Executor 执行器，SQLSession 内部通过执行器操作操作数据库</li>
<li>mapped statement（底层分装酷）</li>
<li>mysql</li>
</ol>
<p>mybatis-3.2.7.jar
再加入MySQL的驱动包
依赖于 log4j</p>
<p>config environment in 05/3:00</p>
<p>config sql statement in mapper file</p>
<p>convention of naming mapper file.</p>
<p>namespace for &quot;locate&quot;</p>
<pre><code class="language-xml">&lt;!--you can specify sql statement in this mapper--&gt;
&lt;mapper namespace=&quot;test&quot;&gt;
    &lt;!--select data by this select statement--&gt;
    &lt;!--#{} for spaceholder, parametertype for types declear, id2 for param id, resultType for object class which result maps--&gt;
    &lt;select id=&quot;&quot; parameterType=&quot;int&quot; resultType=&quot;cn.keepfight.po.Persion&quot;&gt;
        select * from user where id=#{id2}
    &lt;/select&gt;
&lt;/mapper&gt;
</code></pre>
<p>load mapper config file in sqlMapConfig.xml</p>
<pre><code class="language-xml">&lt;mappers&gt;
    &lt;mapper resource=&quot;sqlmap/User.xml&quot;/&gt;
&lt;/mappers&gt;
</code></pre>
<p>// get config file stream</p>
<p>// build factory</p>
<p>// factory open a session</p>
<p>// session execute select</p>
<p>// session free</p>
<p>为简单拼接
${}</p>
<p><code>selectOne()</code> and <code>selectList()</code></p>
<p>insert user</p>
<pre><code class="language-xml">&lt;!--insert user--&gt;
&lt;!--parameterType : pojo--&gt;
&lt;!--#{} specify property name of pojo, mybatis get property by OGNL--&gt;
&lt;!--never end with semicolon--&gt;
&lt;insert id=&quot;insertUser&quot; parameterType=&quot;cn.keepfight.po.User&quot;&gt;
    insert into user(username, birthday, sex, address) values(#{username}, #{birthday}, #{sex}, #{address})
&lt;/insert&gt;
</code></pre>
<p>主键的返回。<code>last_insert_ID()</code></p>
<pre><code class="language-xml">&lt;!--insert user--&gt;
&lt;!--parameterType : pojo--&gt;
&lt;!--#{} specify property name of pojo, mybatis get property by OGNL--&gt;
&lt;!--never end with semicolon--&gt;
&lt;insert id=&quot;insertUser&quot; parameterType=&quot;cn.keepfight.po.User&quot;&gt;
    insert into user(username, birthday, sex, address) values(#{username}, #{birthday}, #{sex}, #{address})

    &lt;!--get last insert id--&gt;
    &lt;selectKey keyProperty=&quot;id&quot; order=&quot;AFTER&quot; resultType=&quot;int&quot;&gt;
        SELECT LAST_INSERT_ID()
    &lt;selectKey&gt;
&lt;/insert&gt;
</code></pre>
<p>UUID() 生成ID</p>
<pre><code class="language-xml">&lt;!--insert user--&gt;
&lt;!--parameterType : pojo--&gt;
&lt;!--#{} specify property name of pojo, mybatis get property by OGNL--&gt;
&lt;!--never end with semicolon--&gt;
&lt;insert id=&quot;insertUser&quot; parameterType=&quot;cn.keepfight.po.User&quot;&gt;
    &lt;!--get last insert id--&gt;
    &lt;selectKey keyProperty=&quot;id&quot; order=&quot;BEFORE&quot; resultType=&quot;java.lang.String&quot;&gt;
        SELECT UUID()
    &lt;selectKey&gt;

    insert into user(id, username, birthday, sex, address) values(#{id}, #{username}, #{birthday}, #{sex}, #{address})

&lt;/insert&gt;
</code></pre>
<h2>mapper 文件转义</h2>
<p>在写如下代码时，其中的小于 <code>&lt;</code> 会被识别为 标签的起始符号</p>
<pre><code class="language-xml">&lt;select id=&quot;selectMonday&quot; resultType=&quot;SheetGameRec&quot;&gt;
    select ColumnName
    from Table
    where ColumnName &lt; 2
    order by ColumnName;
&lt;/select&gt;
</code></pre>
<p>解决方法：添加 <code>&lt;![CDATA[ &lt; 2 ]]&gt;</code> 元标示</p>
<pre><code class="language-xml">&lt;select id=&quot;selectMonday&quot; resultType=&quot;SheetGameRec&quot;&gt;
    select ColumnName
    from Table
    where ColumnName &lt;![CDATA[ &lt; 2 ]]&gt;
    order by ColumnName;
&lt;/select&gt;
</code></pre>
