<%@ page contentType="text/html; charset=UTF-8" %><p>Java RMI 指的是远程方法调用 (Remote Method Invocation)。它是能够让在某个 Java 虚拟机上的对象调用另一个 Java 虚拟机中的对象上方法的一种机制。从最基本的角度看，RMI是Java的远程过程调用(RPC)机 制。</p>
<!--more-->
<h2>用法</h2>
<p>简单的接口代码示例</p>
<pre><code class="language-java">
	package rmi;

	import java.rmi.Remote;
	import java.rmi.RemoteException;

	/**
	 * 税收计算政策.
	 *&lt;p&gt;
	 * RMI 远程调用接口，这个用于将远程调用中的方法抽象，使得服务器可以为客户端提供多样化的实现。
	 *&lt;/p&gt;
	 * @author Tom
	 *
	 */
	public interface ComputePolice extends Remote{

		/**
		 * 税收计算
		 * @param salary 薪水
		 * @return 所叫税收
		 * @throws RemoteException RMI调用错误
		 */
		public double compute(double salary) throws RemoteException;


		/**
		 * 默认动作，这里展现的例子中可以看到，这里的 System.out 是服务器的标准输出流
		 * @throws RemoteException RMI调用错误
		 */
		default public void defaultAction() throws RemoteException {
			System.out.println(&quot;defaultAction&quot;);
		}
	}
</code></pre>
<p>简单的接口实现类代码示例</p>
<pre><code class="language-java">
	public class ComputeImpl extends UnicastRemoteObject implements ComputePolice{

		private static final long serialVersionUID = -5970979547132914195L;

		protected ComputeImpl() throws RemoteException {
			super();
		}

		@Override
		public double compute(double salary) throws RemoteException {
			System.out.println(&quot;compute&quot;);
			return salary * 0.1;
		}

	}
</code></pre>
<p>简单的客户端代码示例</p>
<pre><code class="language-java">
	package rmi;

	import java.net.MalformedURLException;
	import java.rmi.Naming;
	import java.rmi.NotBoundException;
	import java.rmi.RemoteException;

	public class Client {

		public static void main(String[] args) {
			try {
				// 获得税收计算实现
				ComputePolice police =(ComputePolice) Naming.lookup(&quot;rmi://192.168.1.2:8888/police&quot;);

				double x = police.compute(100);
				System.out.println(&quot;x:&quot;+x);
			} catch (RemoteException e) {
				e.printStackTrace();
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (NotBoundException e) {
				e.printStackTrace();
			}
		}
	}
</code></pre>
<p>简单的服务器代码示例</p>
<pre><code class="language-java">	
	package rmi;

	import java.net.MalformedURLException;
	import java.rmi.AlreadyBoundException;
	import java.rmi.Naming;
	import java.rmi.RemoteException;
	import java.rmi.registry.LocateRegistry;

	/**
	 * 服务器类
	 * @author Tom
	 */
	public class Server {
		public static void main(String[] args) {

			try {
				// 设置 hostname 属性
				System.setProperty(&quot;java.rmi.server.hostname&quot;,&quot;192.168.1.2&quot;);

				// 创建一个政策实现类
				ComputePolice police = new ComputeImpl();

				// 注册端口，并将 police 绑定到一个路径中
				LocateRegistry.createRegistry(8888);
				Naming.bind(&quot;rmi://192.168.1.2:8888/police&quot;,police);

			}catch (RemoteException e) {
	            System.out.println(&quot;创建对象异常&quot;);
	        } catch (MalformedURLException  e) {
	            System.out.println(&quot;url格式异常&quot;);
	            e.printStackTrace();
	        } catch (AlreadyBoundException e) {
	            System.out.println(&quot;端口已绑定异常&quot;);
				e.printStackTrace();
			}
		}
	}
</code></pre>
<h2>调试</h2>
<h3>出现无法找到类的情况</h3>
<blockquote>
<p>rmi.ComputePolice (no security manager: RMI class loader disabled)</p>
</blockquote>
<p>解决方法：</p>
<ol>
<li>保证接口类上方法一致（接口名、方法名、参数列表和返回类型）</li>
<li>确保接口的标识名一致，也就是接口类所在的包路径应该和服务器上的接口类文件是一样的。</li>
</ol>
<h3>出现无法连接的错误：</h3>
<blockquote>
<p>java.rmi.ConnectException: Connection refused to host: 127.0.1.1;</p>
</blockquote>
<p>解决方法：
<a href="http://stackoverflow.com/questions/15685686/java-rmi-connectexception-connection-refused-to-host-127-0-1-1">stackOverflow</a>
在服务器中绑定 <code>java.rmi.server.hostname</code> 属性，即在 Server 端代码中，添加如下代码：</p>
<blockquote>
<p>System.setProperty(&quot;java.rmi.server.hostname&quot;,&quot;192.168.1.2&quot;);</p>
</blockquote>
<h2>参考</h2>
<p><a href="http://blog.csdn.net/a19881029/article/details/9465663">Java RMI详解</a>
<a href="https://docs.oracle.com/javase/8/docs/platform/rmi/spec/rmiTOC.html">ava Remote Method Invocation</a>
<a href="http://docs.huihoo.com/java/rmi/whitepage/index.html">Java分布式计算白皮书</a></p>
