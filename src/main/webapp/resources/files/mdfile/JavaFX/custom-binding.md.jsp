<%@ page contentType="text/html; charset=UTF-8" %><p>工程中需要使用到 <code>BigDecimal</code> 类进行高精度的运算，然而这个类的运算绑定需要自行定义。</p>
<!--more-->
<h2>使用底层绑定 API</h2>
<ol>
<li>继承一个 <code>javafx.beans.binding</code> 下的 <code>*Binding</code> 类。</li>
<li>调用 <code>bind()</code> 方法绑定所有依赖。</li>
<li>重写 <code>computeValue()</code> 方法。</li>
</ol>
<p>如下：为 <code>an_total_actu</code> Label 绑定依赖其他 Label 的计算结果：</p>
<pre><code class="language-java">an_total_actu.textProperty().bind(new ObjectBinding&lt;String&gt;(){
            {
                // 调用 bind() 方法绑定依赖的所有可监听项
                this.bind(an_count_bf.textProperty(),
                        an_total_annu.textProperty(),
                        an_total_rate.textProperty(),
                        an_total_pay.textProperty());
            }
            @Override
            protected String computeValue() {
                BigDecimal bf = FXUtils.getDecimal(an_count_bf.getText(), new BigDecimal(0L));
                BigDecimal annu = FXUtils.getDecimal(an_total_annu.getText(), new BigDecimal(0L));
                BigDecimal rate = FXUtils.getDecimal(an_total_rate.getText(), new BigDecimal(0L));
                BigDecimal pay = FXUtils.getDecimal(an_total_pay.getText(), new BigDecimal(0L));
                return annu.add(rate).subtract(bf).subtract(pay).toString();
            }
        });
</code></pre>
