<%@ page contentType="text/html; charset=UTF-8" %><p>对于全部新增特性，可以参考官网：<a href="http://www.oracle.com/technetwork/java/javase/8-whats-new-2157071.html">What's New in JDK 8</a></p>
<p>此短篇记录了新增的 <code>Iterable</code> 接口中的 <code>forEach()</code> 方法</p>
<!--more-->
<h2>forEach() method in Iterable interface</h2>
<p>这个方法为迭代器遍历元素提供更为便捷的方式，以 <code>default</code> 函数形式在 <code>java.lang.Iterable&lt;T&gt;</code> 中提供，也就是所有的 <code>Collection</code> 子类也可以使用这个新特性。</p>
<pre><code class="language-java">/**
 * Performs the given action for each element of the {@code Iterable}
 * until all elements have been processed or the action throws an
 * exception.  Unless otherwise specified by the implementing class,
 * actions are performed in the order of iteration (if an iteration order
 * is specified).  Exceptions thrown by the action are relayed to the
 * caller.
 *
 * @implSpec
 * &lt;p&gt;The default implementation behaves as if:
 * &lt;pre&gt;{@code
 *     for (T t : this)
 *         action.accept(t);
 * }&lt;/pre&gt;
 *
 * @param action The action to be performed for each element
 * @throws NullPointerException if the specified action is null
 * @since 1.8
 */
default void forEach(Consumer&lt;? super T&gt; action) {
    Objects.requireNonNull(action);
    for (T t : this) {
        action.accept(t);
    }
}
</code></pre>
<p>如下列举了几个遍历方法，结合 Lambda 表达式，给出最简洁的遍历方式为 <code>myList.forEach(System.out::println);</code>：</p>
<pre><code class="language-java">import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.function.Consumer;
import java.lang.Integer;

public class Java8ForEachExample {

	public static void main(String[] args) {
		
		//creating sample Collection
		List&lt;Integer&gt; myList = new ArrayList&lt;Integer&gt;();
		for(int i=0; i&lt;10; i++) myList.add(i);
		
		//traversing using Iterator
		Iterator&lt;Integer&gt; it = myList.iterator();
		while(it.hasNext()){
			Integer i = it.next();
			System.out.println(&quot;Iterator Value::&quot;+i);
		}
		
		//traversing through forEach method of Iterable with anonymous class
		myList.forEach(new Consumer&lt;Integer&gt;() {

			public void accept(Integer t) {
				System.out.println(&quot;forEach anonymous class Value::&quot;+t);
			}
		});
		
		//traversing with Consumer interface implementation
		MyConsumer action = new MyConsumer();
		myList.forEach(action);
		
		//最简洁的遍历方式
		myList.forEach(System.out::println);
	}

}

//Consumer implementation that can be reused
class MyConsumer implements Consumer&lt;Integer&gt;{

	public void accept(Integer t) {
		System.out.println(&quot;Consumer impl Value::&quot;+t);
	}
}
</code></pre>
