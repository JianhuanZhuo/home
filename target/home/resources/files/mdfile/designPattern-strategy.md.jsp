<%@ page contentType="text/html; charset=UTF-8" %><h3>策略模式【strategy】</h3>
<p>定义了算法家族，分别封装了起来，让它们之间可以互相替换，此模式让算法的变化不会影响到算法的用户。</p>
<p>需要用到多种的应付策略，那么就选择不同的算法类型作为应付策略。</p>
<blockquote>
<p>前提是，你需要知道有哪些策略【或者说，当前遇到的问题】，和你<strong>需要什么策略</strong>。</p>
</blockquote>
<p>上述这一点可以结合着工厂模式</p>
<p>这些具体的实现算法完成的是同一件事情。但实现不同。主要的特点是，减少了算法实现与使用者的耦合。</p>
<pre><code class="language-java">
package 策略模式;
/**
 * 策略模式的客户端
 * 以西游取经为例
 *	@author	ZhuoJianHuan
 *	@date	2015年4月1日
 */
public class TravelToWest {
    public static void main(String[] args) {
		
		// TODO 在不同的环境中选择不同的策略
		System.out.println(&quot;前方出现了猪妖！&quot;);
		MethodToSubdue methodToSubdue = new MethodToSubdue(new subduePigMonsters());
		methodToSubdue.subdue();
		
          System.out.println(&quot;前方出现了金鱼怪！&quot;);
		methodToSubdue = new MethodToSubdue(new subdueFishMonsters());
		methodToSubdue.subdue();

          System.out.println(&quot;前方出现了狮子怪！&quot;);
		methodToSubdue = new MethodToSubdue(new subdueLionMonsters());
		methodToSubdue.subdue();
	}
}


/**
 * 环境角色
 * 它将持有具体而可变的策略，使得算法与用户分离。
 *	@author	ZhuoJianHuan
 *	@date	2015年4月1日
 */
class MethodToSubdue{
	private SubdueMonsters method;
	
	public MethodToSubdue(SubdueMonsters method) {
		// TODO Auto-generated constructor stub
		this.method = method;
	}
	
	public void subdue() {
		this.method.subdue();
	}
}


/**
 * 抽象策略角色
 * 降妖策略抽象类
 *	@author	ZhuoJianHuan
 *	@date	2015年4月1日
 */
abstract class SubdueMonsters{
	/**
	 * 降妖方法。
	 */
	public abstract void subdue(); 
}

/**
 * 具体策略角色
 * 降服猪妖的策略
 *	@author	ZhuoJianHuan
 *	@date	2015年4月1日
 */
class subduePigMonsters extends SubdueMonsters{

     @Override
	public void subdue() {
		// TODO 
		System.out.println(&quot;使用美人计，降服了猪妖！&quot;);
	}
}
/**
 * 具体策略角色
 * 降服狮子怪的策略
 *	@author	ZhuoJianHuan
 *	@date	2015年4月1日
 */
class subdueLionMonsters extends SubdueMonsters{
    
     @Override
	public void subdue() {
		// TODO 
		System.out.println(&quot;变成苍蝇，降服狮子怪！&quot;);
	}
}
class subdueFishMonsters extends SubdueMonsters{
     
     @Override
	public void subdue() {
		// TODO 
		System.out.println(&quot;请来观音，降服金鱼怪！&quot;);
	}
}

</code></pre>
