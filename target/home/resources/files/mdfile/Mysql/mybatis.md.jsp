<%@ page contentType="text/html; charset=UTF-8" %><p>原始 DAO 开发方式
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
    &lt;selectKey keyP
    roperty=&quot;id&quot; order=&quot;BEFORE&quot; resultType=&quot;java.lang.String&quot;&gt;
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
<h2>BUG: 同一sql配置文件中id重复</h2>
<p>参考：<a href="http://blog.csdn.net/nich002/article/details/8817238">mybatis学习笔记--常见的错误</a></p>
<blockquote>
<p>Mapped Statements collection already contains value</p>
</blockquote>
<pre><code class="language-xml">&lt;!-- 按code码得到一个对象--&gt;  
&lt;select id=&quot;getByCode&quot; resultType=&quot;Geography&quot;  
    parameterType=&quot;java.lang.String&quot;&gt;  
    select * from Geography where code = ${code}  
&lt;/select&gt;  
  
&lt;!-- 按地名getByName得到一个对象--&gt;  
&lt;select id=&quot;getByCode&quot; resultType=&quot;Geography&quot;  
    parameterType=&quot;java.lang.String&quot;&gt;  
    select * from Geography where fullName = ${fullName}  
&lt;/select&gt;  
</code></pre>
<h2>多参数</h2>
<pre><code class="language-xml">&lt;!-- public List&lt;XXXBean&gt; getXXXBeanList(String xxId, String xxCode); --&gt;
&lt;!-- 由于是多参数那么就不能使用parameterType，改用#｛index｝是第几个就用第几个的索引，索引从0开始 --&gt;
&lt;select id=&quot;getXXXBeanList&quot; resultType=&quot;XXBean&quot;&gt;
　　select t.* from tableName where id = #{0} and name = #{1}  
&lt;/select&gt;  
</code></pre>
<p>参考：
<a href="https://stackoverflow.com/questions/24968088/how-can-i-pass-multiple-parameters-and-use-them">pass multiple parameters and use them?</a></p>
<pre><code class="language-java">@Mapper
public interface MyMapper {
    void update(@Param(&quot;a&quot;) A a, @Param(&quot;b&quot;) B b);
    ...
}
</code></pre>
<pre><code class="language-xml">&lt;update id=&quot;update&quot; &gt; 
   UPDATE SOME WHERE x=#{a.x} AND y=#{b.y}
&lt;/update&gt;
</code></pre>
<h2>resultMap 嵌套引用</h2>
<pre><code class="language-xml">    &lt;resultMap id=&quot;result_user&quot; type=&quot;UserDao&quot;&gt;
        &lt;id property=&quot;id&quot; column=&quot;id&quot; /&gt;
    &lt;/resultMap&gt;
    
    &lt;resultMap id=&quot;resultSelectAllTest&quot; type=&quot;OperatorDao&quot;&gt;
        &lt;id property=&quot;id&quot; column=&quot;id&quot; /&gt;
        &lt;result property=&quot;account&quot; column=&quot;serial&quot; /&gt;
        &lt;!-- 这里的引用了上面的 resultMap --&gt;
        &lt;!-- 使用列前缀避免 id 与 user.id 冲突 --&gt;
        &lt;association property=&quot;userDao&quot; resultMap=&quot;result_user&quot; columnPrefix=&quot;user_&quot; /&gt;
    &lt;/resultMap&gt;

    &lt;!--List&lt;UserDao&gt; selectAllTest() throws Exception;--&gt;
    &lt;!--&lt;select id=&quot;selectAllTest&quot; resultType=&quot;OperatorDao&quot;&gt;--&gt;
    &lt;select id=&quot;selectAllTest&quot; resultMap=&quot;resultSelectAllTest&quot;&gt;
        SELECT id, serial, cid user_id
        FROM orders
    &lt;/select&gt;
</code></pre>
<h2>不同 mapper 文件引用同一个 ResultMap</h2>
<p>参考：<a href="https://stackoverflow.com/questions/13501069/reusing-mybatis-resultmap-in-multiple-mapper-xml">Reusing MyBatis ResultMap in multiple mapper.xml
</a></p>
<pre><code class="language-xml">&lt;!-- ProjectMapper.xml 中定义了某一个 resultMap，该 resultMap id 为 ProjectMap --&gt;
&lt;mapper namespace=&quot;com.mybatisapp.mappers.ProjectMapper&quot;&gt;
    &lt;resultMap id=&quot;ProjectMap&quot; type=&quot;com.model.Project&quot;&gt;
        &lt;id column=&quot;id&quot; jdbcType=&quot;BIGINT&quot; property=&quot;id&quot; /&gt;
        &lt;result column=&quot;name&quot; jdbcType=&quot;VARCHAR&quot; property=&quot;name&quot; /&gt;     
    &lt;resultMap&gt;
&lt;/mapper&gt;
</code></pre>
<pre><code class="language-xml">&lt;!-- 在另一个文件 ClientWithProjectsMapper.xml 中可以使用它的命名空间引用这个 resultMap 定义 --&gt;
&lt;select id=&quot;selectProjectsByClient&quot; parameterType=&quot;int&quot;  resultMap=&quot;com.mybatisapp.mappers.ProjectMapper.ProjectMap&quot;&gt;
    select * from blahblah
&lt;/select&gt;
</code></pre>
<p>这里需要注意的一点是，<code>ProjectMapper.xml</code> 必须是 mybatis 定义文件中已定义的。</p>
