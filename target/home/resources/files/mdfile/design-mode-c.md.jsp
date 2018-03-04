<%@ page contentType="text/html; charset=UTF-8" %><h3>装饰模式 decorator</h3>
<p>动态地给一个对象添加一些额外的职责，就增加功能来说，装饰模式比生成子类更为灵活。</p>
<p>字面上理解：</p>
<ul>
<li>装饰指不常用到，但在特殊场景下可有，故为装饰。</li>
</ul>
<p>装饰模式将利用SetComponent来对对象进行包装的。这样每个对象的实现与如何实现这个对象分开了。每个装饰对象只关心自己的对象，不需要关心如何被添加到对象链当中去。</p>
<p>那么很明显，装饰模式的特点是，</p>
<blockquote>
<p>将装饰用的功能从类中去除了，分开了类的核心职责和装饰功能。</p>
</blockquote>
<pre><code class="language-java">
//Component类
abstract class Component{
	public abstract void operation();
}

//ConcreteComponent类
class ConcreteComponent : Component{
	//具体的类
	//这个是一个可以被修饰的Component的子类
	public override void operation(){
		Console.WriteLine(&quot;具体对象的操作&quot;);
	}
}
//Decorator类
abstract class Decorator : Component{
	protected Component component;
	public void SetComponent(Component Component){
		this.component	= component;
	}
	public override void operation(){
		if(component != null){
			component.operation();
		}
	}
}
//ConcreteDecoratorA类
class ConcreteDecoratorA : Decorator{
	//本类特有属性
	private String addState;
	public override void operation(){
		//TODO 首先运行原Component的operation()
		//而该类继承了Decorator类，所以是运行Decorator类的operation
		//如果该类的对象无使用SetComponent()，该函数为空
		base.operation();
		//TODO 再执行本类的特有功能
		addState = &quot;New State&quot;;
		Console.WriteLine(&quot;具体装饰对象A的操作&quot;);
	}
}
//ConcreteDecoratorB类
class ConcreteDecoratorB : Decorator{
public override void operation(){
//TODO 首先运行原Component的operation()
		base.operation();
		//TODO 之后执行了自己独有的方法，相当于一个装饰，可有可无，但有了会好看一些
		AddBehaviour();
		Consloe.WriteLine(&quot;具体装饰对象的操作&quot;);
	}
//本类独有的方法
	public void AddBehaviour(){
		
	}
}
static void Main(string[] args){
	
	ConcreteComponent c		= new ConcreteComponent();
	ConcreteDecoractorA d1	= new ConcreteDecoractorA();
	ConcreteDecoractorB d2	= new ConcreteDecoractorB();
	
	//TODO c为原来未经装饰的对象
	//下面的语句表示，d1装饰c，
	d1.SetComponent(c);
	//d2装饰d1【即d2将装饰已被d1装饰了的c】，
	d2.SetComponent(d1);
d2.operation();
}

</code></pre>
<p>上述代码的UML图如下：
<img src="${pageContext.request.contextPath}/\img\designPattern1.png" alt="" /></p>
