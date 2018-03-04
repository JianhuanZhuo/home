<%@ page contentType="text/html; charset=UTF-8" %><h2>绑定</h2>
<p><code>x.bind(y);</code> 意为 x 的值将取决于 y 的值，所以此时再对 x 进行直接赋值是不合逻辑的。试想，如果 y 的值为 2，而此时再对 x 赋值为 1，那么 <strong>x 的值将取决于 y 的值</strong> 就不成立了。</p>
<h3>自定义绑定</h3>
<p>考虑如下的需求：</p>
<blockquote>
<p>有属性 <code>ObjectProperty&lt;BigDecimal&gt; numProp</code> 表示某数量，这个数量与某界面上输入框 <code>TextField num</code> 相关联，当然，这里的绑定是 numProp 的值取决于 num 的输入。</p>
</blockquote>
<ul>
<li>上面的一个转换点是 numProp 是泛化的对象属性，需要将字符串属性转化为自定义的对象属性。</li>
</ul>
<pre><code class="language-java">numProp.bind(new ObjectBinding&lt;BigDecimal&gt;() {
    {
        // 绑定依赖
        bind(num.textProperty());
    }
    @Override
    protected BigDecimal computeValue() {
        try {
            // 值转换
            return new BigDecimal(num.getText());
        }catch (Exception e){
            return new BigDecimal(0);
        }
    }
});
</code></pre>
<h3>三段式绑定 Ternary Operation</h3>
<p>这个三段式</p>
<pre><code class="language-java">filteredData.predicateProperty().bind(
        new When(justAdd.selectedProperty())
                .&lt;Predicate&lt;ProductModel&gt;&gt;then(s -&gt; s.getNum().equals(new BigDecimal(0)))
                .otherwise((s -&gt; true))
);
</code></pre>
<h3>解除绑定：</h3>
<p>解除绑定可以使用 <code>unbind()</code> 解除该属性的全部绑定，或者使用 <code>unbindBidirectional(Object other)</code> 解除指定绑定。
当然解除绑定和绑定一样是单向操作的，<code>x.bind(y);</code> 意为 x 的值将取决于 y 的值，那么 <code>x.unbind();</code> 仅表示 x 的值将不再取决于其他的值。</p>
<pre><code class="language-java">StringProperty x = new SimpleStringProperty(&quot;xx&quot;);
StringProperty y = new SimpleStringProperty(&quot;yy&quot;);

x.bind(y);

y.set(&quot;yy2&quot;);
System.out.println(x.get());
x.unbind();
y.set(&quot;yy3&quot;);
System.out.println(x.get());
</code></pre>
<p>输出为:</p>
<pre><code>yy2
yy2
</code></pre>
