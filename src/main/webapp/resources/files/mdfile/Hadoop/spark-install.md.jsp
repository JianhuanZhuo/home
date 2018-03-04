<%@ page contentType="text/html; charset=UTF-8" %><p>Spark 是 Scala 写得，运行在 JVM 上，所以需要 Java7+</p>
<p>如果使用 Python API，需要安装 Python2.6+ 或者 Python3.4+</p>
<p>Spark 1.6.2-Scala 2.10
Spark 2.0.0-Scala 2.11</p>
<p>&quot;without Hadoop&quot; 有点误导性，它并表示不绑定哪个版本的 Hadoop，而不是不需要。</p>
<p>Spark 不需要 Hadoop，不过有则需要下载对应的版本</p>
<p>解压</p>
<p>bin包含可执行文件， Spark Shell
组件</p>
<p>examples 包含样例
data 数据目录
conf 配置文件</p>
<p>// 可以选择配置
/etc/environment</p>
<p>SPARK_HOME=
PATH</p>
<p>spark-shell local[4]</p>
<p>maven 加环境变量，指定运行内存
export MAVEN_OPTS=&quot;-Xmx2g -XX:MaxPermSize=512M -XX:ReservedCodeCacheSize=512M&quot;
编译 Spark mvn -Pyarn -Phadoop-2.6 -Dhadoop.version=2.7.2 -DskipTests clean package</p>
<p>修改 Spark-shell 日志级别
spark/conf/log4j.properties
log4j.rootCategory=INFO, console</p>
<h2>org.apache.spark.SparkContext</h2>
<p>Spark 上下文对象是 Spark 程序的主入口点，是负责连接到 spark cluster. 可创建 RDD
在集群上创建累加器和广播变量</p>
<p>在每个 JVM 只能激活一个 SparkContext 对象，</p>
<p>sc.textFile(path : String, minPartitions : Int = dafault)
使用: val lines = sc.textFile(&quot;xxx.txt&quot;)
lines : rdd.RDD[String]</p>
<h2>org.apache.spark.rdd.RDD</h2>
<p>RDD : resilient distributed dataset
这是一个抽象类
是不可变的、可分区的元素集合，可进行并行操作。该类包含了可用于所有RDD之上的基本操作，map、filter、persist</p>
<p>此外
org.apache.spark.rdd.PairRDDFunctions 用于k-&gt;v
org.apache.spark.rdd.DoubleRDDFunctions 仅操作 double RDDs
org.apache.spark.rdd.SequenceFileRDDFunctions 序列文件</p>
<p>RDD 内部由五个特征标识：</p>
<ol>
<li>A list of partitions</li>
<li>A function for computing each split</li>
<li>A list of dependencies on other RDDs（即 RDD 的依赖列表）</li>
<li>Optionally, a Partitioner (分区器) for key-value RDDS (e.g. to say that the RDD is hash-partitioned).</li>
<li>Optionally, a list of perferred locations to compute each split on (e.g. block locations for an HDFS file).</li>
</ol>
<p>Spark 中所有调度和执行都是基于 RDD 的。它允许 RDD 实现自己的实现方式。</p>
<hr />
<pre><code>val lines = sc.textFile(&quot;file:///xx/xx.txt&quot;)	// rdd，默认从集群加载，加file://协议头指定本地文件
lines.count 									// 统计行数
lines.take(2)									// 提取前两行
lines.first										// 提取第一行
</code></pre>
<p>每个 Spark 都由 driver 驱动程序构成，</p>
<p>spark-shell 本身就是一个driver，Driver 通过 SparkContext 访问 Spark，代表和 Spark 集群的连接。
Driver 通常要管理多个称为 executors 节点。执行器</p>
<p>我们认为，在计算集群框架下，速度比空间更有价值，</p>
<p>spark-shell 默认使用 local 模式运行 spark 程序，没有用到 spark 的集群，类似于 Hadoop 的本地模式。
spark-shell --master local[4]  // 4表示启动的线程数</p>
<h2>配置独立集群模式</h2>
<p>命令在 <code>sbin/</code>目录下</p>
<h3>配置conf/slaves</h3>
<p>配置为
s1
s2
s3
配置同步到所有的节点去</p>
<p>在master 节点上启动 start-master.sh</p>
<p>在slaves 节点上启动 start-slave.sh
需要指定 <a href="spark://master:7077">spark://master:7077</a>
或者，
start-slaves.sh</p>
<p>Master GUI接口 8080
Slave GUI接口 8081</p>
<p>4040是通信端口</p>
<p>集群调度是FIFO模式</p>
<p>Spark的端口等参数在 spark/conf/spark-env.sh 中
该文件可通过复制 spark-env.sh.template 得到
SPARK_MASTER_PORT=7077
SPARK_MASTER_WEBUI_PORT=8080
SPARK_WORKER_PORT=
SPARK_WORKER_WEBUI_PORT=8081</p>
<p>设置 MASTER 变量，使得键入 spark-shell 即可直接连接至集群。</p>
<p>MASTER=<a href="spark://s1:8080">spark://s1:8080</a></p>
<p>// 在Scala 中查看</p>
<pre><code>scala&gt; sc.ma
makeRDD master
scala&gt; sc.master
res1: String = spark://s0:7077
scala&gt; sc.appName
res1: String = Spark Shell
</code></pre>
<p>app(1) --&gt; (n)job
job(1) --&gt; (n)task
每一个action都对应一个job</p>
<p>scala&gt; sc.addFile(&quot;/home/ubuntu/aa.txt&quot;)
向所有节点拷贝一份文件，会添加到临时目录去（&quot;/tmp/spark-afas*****&quot;）</p>
<p>JavaWordCount.java 在 examples</p>
<p>下面这个版本是不对的，应该根据自己的 Spark 版本参考<a href="http://spark.apache.org/downloads.html">这个链接</a>给出的坐标信息。
pom.xml</p>
<pre><code>&lt;dependency&gt;
	&lt;groupId&gt;org.apache.spark&lt;/groupId&gt;
	&lt;artifactID&gt;spark.core_2.10.4&lt;/artifactID&gt;
	&lt;version&gt;1.1.0&lt;/version&gt;
	&lt;scope&gt;test&lt;/scope&gt;
&lt;/dependency&gt;

&lt;build&gt;
	&lt;plugins&gt;
		&lt;plugin&gt;
			&lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;
			&lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;
			&lt;configuration&gt;
				&lt;source&gt;1.8&lt;/source&gt;
				&lt;target&gt;1.8&lt;/target&gt;
			&lt;/configuration&gt;
		&lt;/plugin&gt;
	&lt;/plugins&gt;
&lt;/build&gt;
</code></pre>
<p>编译 Scala 的插件</p>
<pre><code>&lt;build&gt;
	&lt;sourceDirectory&gt;src/main/java&lt;/sourceDirectory&gt;
	&lt;testSourceDirectory&gt;src/test/java&lt;/testSourceDirectory&gt;
	&lt;plugins&gt;
		&lt;plugin&gt;
			&lt;groupId&gt;net.alchim31.maven&lt;/groupId&gt;
			&lt;artifactId&gt;scala-maven-plugin&lt;/artifactId&gt;
			&lt;version&gt;3.2.1&lt;/version&gt;
		&lt;/plugin&gt;
	&lt;/plugins&gt;
&lt;/build&gt;
</code></pre>
<p>命令行下用 Maven 编译 Scala
编写pom.xml，添加 scala-library 插件依赖项目</p>
<pre><code>&lt;dependency&gt;
	&lt;groupId&gt;org.scala-lang&lt;/groupId&gt;
	&lt;artifactId&gt;scala-library&lt;/artifactId&gt;
	&lt;version&gt;2.10.4&lt;/version&gt;
	&lt;scope&gt;test&lt;/scope&gt;
&lt;/dependency&gt;
</code></pre>
<p>注意：必须使用2.10.4版本，否则JDK需要降级</p>
<p>获得 scala 插件相关信息</p>
<p>$&gt; mvn scala:help</p>
<p>mvn scala:compile</p>
<p>mvn exec:java -Dexec.mainClass=&quot;MyScala&quot; -Dexec.args=&quot;xxx&quot;</p>
<p>右击项目，是不是有个 Configure --&gt; Add Scala Nature
此时可能出现了红色叉叉，
akka-actor_**.jar build path is cross-compiled with an incompatible version of Scala(2.10.0).
Scala 存在交叉编译，即多个版本</p>
<h3>DEBUG:local class incompatible</h3>
<p><a href="http://stackoverflow.com/questions/35485662/local-class-incompatible-exception-when-running-spark-standalone-from-ide">SOF</a>
原因：Scala 2.11.8 和 Java 8 不兼容</p>
<p>在下载的时候需要注意的一点：
会给出该 Spark 版本对应编译的 Scala 版本，应该引用的 Maven 坐标
<a href="http://spark.apache.org/downloads.html">http://spark.apache.org/downloads.html</a></p>
<p>构建路径中的 Scala 版本太高。
在Java Build Path 中的 Libraries 中删去 Scala Libraries container[2.11.7]
然后添加 Scala Library --&gt; Latest 2.10 bundle(dynamic)</p>
<h3>DEBUG1: a master url must be set</h3>
<p>未设置 Master 节点的 URL，使用</p>
<pre><code>SparkConf conf = new SparkConf().setAppName(&quot;sparkApp&quot;).setMaster(&quot;spark://10.10.18.11:7077&quot;);
JavaSparkContext sc = new JavaSparkContext(conf);
</code></pre>
<h3>DEBUG2: Failed to connect to master 10.10.18.11:7077</h3>
<p>检查下 <code>netstat -anp | grep 7077</code>
发现 7077 端口绑定的是 <code>127.0.0.1:7077</code>，修改<code>setMaster()</code>为<code>setMaster(&quot;spark://127.0.0.1:7077&quot;)</code></p>
<h3>DEBUG3: Task not serializabale</h3>
<p>import org.apache.spark.api.Java.JavaSparkContext</p>
<p>Java:</p>
<pre><code>public static void main(String[] args){
	//get Env variable
	String path = System.getenv(&quot;PATH&quot;);
	SparkConf conf = new SparkConf();
	conf.setMaster(&quot;local[4]&quot;);
	conf.setAppName(&quot;Spark Test&quot;);
	JavaSparkContext sc = new JavaSparkContext(conf);

	JavaRDD rdd = sc.parallelize(Arrays.asList(1,2,3,4));
	List&lt;Integer&gt; list = nrdd.take(2)
	rdd.foreach(t-&gt;System.out.println(Thread.currentThread().getName+&quot;\t&quot;+t));

}
</code></pre>
<p>集群环境下需要将打包分发到每个节点</p>
<p>spark-submit --class com.keepfight.MainClass --master <a href="spark://s0:7077">spark://s0:7077</a> myspark-0.0.1-SNAPSHOT.jar</p>
<p>sc.addFile(&quot;xx.txt&quot;)
val rdd = sc.textFile(SparkFiles.get(&quot;xx.txt&quot;))
rdd.fist</p>
<p>上述代码会出现文件找不到的错误</p>
<p>缓存数据
RDDObject.cache()
== rdd.persist()</p>
<p>部署模式：
local[n]，指定线程数</p>
<p>伪集合操作;
1.
rdd1 = tom tom tomas tomasLee
rdd2 = tomas tomasLee jerry bob</p>
<p>var rdd1 = sc.parrallelize(List(&quot;tom&quot;, &quot;tom&quot;, &quot;tomas&quot;, &quot;tomasLee&quot;))
var rdd2 = sc.parrallelize(List(&quot;tomas&quot;, &quot;tomasLee&quot;, &quot;bob&quot;))</p>
<p>// 去重
rdd1.distinct()</p>
<p>//联合
rdd1.union(rdd2)</p>
<p>//交际
rdd2.intersection(rdd2)</p>
<p>//差集
substract</p>
<p>//笛卡尔积
rdd1.cartesion(rdd2)</p>
<p>//咬合
rdd2.zip</p>
<p>//采样
rdd2.sample(
withReplacement: Boolean,
fraction: Double, //比例
seed: Long=Utils.random.nextLong)</p>
