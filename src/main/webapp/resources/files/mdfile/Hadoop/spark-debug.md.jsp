<%@ page contentType="text/html; charset=UTF-8" %><p>在应用表现为如下症状</p>
<blockquote>
<p>17/04/20 20:11:39 ERROR StandaloneSchedulerBackend: Application has been killed. Reason: All masters are unresponsive! Giving up.
17/04/20 20:11:39 WARN StandaloneSchedulerBackend: Application ID is not initialized yet.
17/04/20 20:11:39 ERROR SparkContext: Error initializing SparkContext.
java.lang.IllegalArgumentException: requirement failed: Can only call getServletHandlers on a running MetricsSystem
at scala.Predef$.require(Predef.scala:219)
at org.apache.spark.metrics.MetricsSystem.getServletHandlers(MetricsSystem.scala:91)
at org.apache.spark.SparkContext.<init>(SparkContext.scala:524)
at org.apache.spark.api.java.JavaSparkContext.<init>(JavaSparkContext.scala:58)
at cn.keepfight.spark.SparkTest.main(SparkTest.java:15)
at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
at java.lang.reflect.Method.invoke(Method.java:498)
at com.intellij.rt.execution.application.AppMain.main(AppMain.java:147)</p>
</blockquote>
<p>在 spark/logs/**master** 中报了如下错误</p>
<blockquote>
<p>17/04/20 20:21:47 ERROR TransportRequestHandler: Error while invoking RpcHandler#receive() for one-way message.
java.io.InvalidClassException: scala.collection.immutable.List$SerializationProxy; local class incompatible: stream classdesc serialVersionUID = -7905219378619747021, local class serialVersionUID = 1</p>
</blockquote>
<blockquote>
<p>17/04/20 20:22:07 ERROR TransportRequestHandler: Error while invoking RpcHandler#receive() for one-way message.
java.io.InvalidClassException: scala.collection.immutable.List$SerializationProxy; local class incompatible: stream classdesc serialVersionUID = -7905219378619747021, local cl
ass serialVersionUID = 1</p>
</blockquote>
<blockquote>
<p>17/04/20 20:22:47 INFO Master: 10.10.18.96:33722 got disassociated, removing it.
17/04/20 20:22:47 INFO Master: 10.10.18.96:45147 got disassociated, removing it.</p>
</blockquote>
<p>原因：
在 IDEA 添加 Scala 支持的时候选择的版本不对</p>
<h2>ClassCastException</h2>
<blockquote>
<p>ClassCastException: cannot assign instance of scala.collection.immutable.list</p>
</blockquote>
<p>呃，我添加了 jar 包 <code>sc.addJar(&quot;xxx.jar&quot;)</code> 就好了。
查阅了一些 issue <a href="https://github.com/gettyimages/docker-spark/issues/4">Q: Why do you add extra jars to spark lib dir?</a></p>
<blockquote>
<p>Well I had to use --jars or --packages to be able to use hadoop-aws <strong>otherwise it failed on ClassNotFound exception of those classes from hadoop-aws jar.</strong> But I was calling spark-submit via apache Zeppelin (but I wasn't using the built-in spark)... So maybe it's caused by that...</p>
</blockquote>
<h2>uncaught error</h2>
<blockquote>
<p>spark uncaught error in thread SparkListenerBus</p>
</blockquote>
<p>According <a href="https://mail-archives.apache.org/mod_mbox/incubator-spark-user/201406.mbox/%3CCAMJOb8=6Q9xDhLALyo-bWQR3AkMz=ost=7jhTad7Zduv7mpQ0w@mail.gmail.com%3E">this mail archive</a>, i.e.:</p>
<blockquote>
<p>Hi Haoming,
You can safely disregard this error. This is printed at the end of the execution when we clean up and kill the daemon context cleaning thread. In the future it would be good to silence this particular message, as it may be confusing to users.
Andrew</p>
</blockquote>
<p>直接忽视即可。</p>
<p>也可以在代码最后添加 <code>sc.stop</code> 正常停止，以屏蔽这些错误提示。</p>
<h2>Spark java.lang.OutOfMemoryError: Java heap space</h2>
<p>在spark/conf/spark-env.sh中加大SPARK_WORKER_MEMORY值</p>
<blockquote>
<p>###Options for the daemons used in the standalone deploy mode
SPARK_WORKER_MEMORY=6g<br />
val conf = new SparkConf().setAppName(&quot;sinaApplication&quot;).set(&quot;spark.executor.memory&quot;,&quot;6g&quot;)</p>
</blockquote>
<p>若是 YARN 模式，可能是：</p>
<blockquote>
<p>SPARK_EXECUTOR_MEMORY=6g</p>
</blockquote>
<h2>could not find coarseGrainedSchduler</h2>
