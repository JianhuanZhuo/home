<%@ page contentType="text/html; charset=UTF-8" %><p>3.8版本
4.x版本</p>
<p>在创建的时候，添加库，添加 Junit 测试库</p>
<pre><code>fail(&quot;Not yet implemented!&quot;)
</code></pre>
<p>重构为局部变量</p>
<p>Refactor -&gt; Extract Local Variable...</p>
<pre><code>int expectedValue = 2;
int trueValue = demo.add(1, 2);
</code></pre>
<p>JUnit 4.x 最初由 Erich Gamma 和 Kent Beck 编写
XP--敏捷编程</p>
<p>JUnit3.8 的测试方法必须以 <code>test</code> 为开头，通过反射生成测试方法的。</p>
<p>初始化方法，销毁方法</p>
<p>JUnit3.8</p>
<pre><code class="language-java">@Override
protected void setUp() throws Exception{
	System.out.println(&quot;SetUp...&quot;);
	demo = new Demo();
}

@Override
protected void TearDown throws Exception(){
	System.out.println(&quot;TearDown...&quot;);
	demo = null;
}
</code></pre>
<p>JUnit4.x</p>
<pre><code class="language-java">@Before
public void setUp() throws Exception{
	System.out.println(&quot;SetUp...&quot;);
	demo = new Demo();
}

@After
public void TearDown throws Exception(){
	System.out.println(&quot;TearDown...&quot;);
	demo = null;
}
</code></pre>
<p><code>@Before</code> <code>@After</code> 每测一个 <code>@Test</code> 都会执行的</p>
<p><code>@BeforeClass</code> <code>@AfterClass</code> 每次执行一次，可能会违反测试的独立性，方法必须是静态的</p>
<p>希望得到时间
<code>@Test(expected=Exception.class)</code>;</p>
<p><code>@Test(timeout=100)</code></p>
<p><code>@Ignore</code> 忽略这个测试</p>
<p>断言方法：
3.8 assertXXX() 测试类都是继承 Assert 类
4.x 是静态导入了 Assert 类</p>
<p>same --- 相同，对象地址相同
Equal --- 内容相同</p>
<p>复杂数据库的</p>
<p>模拟环境：EasyMock、JMock
利用一部分类进行测试，资源受限时。</p>
<p>记录--回放的工作模式</p>
