<%@ page contentType="text/html; charset=UTF-8" %><p>...
10/24/14 21:30:56 INFO common.Storage: Storage directory
/home/hadoop/hadoopinfra/hdfs/namenode has been successfully formatted.
10/24/14 21:30:56 INFO namenode.NNStorageRetentionManager: Going to
retain 1 images with txid &gt;= 0
10/24/14 21:30:56 INFO util.ExitUtil: Exiting with status 0
10/24/14 21:30:56 INFO namenode.NameNode: SHUTDOWN_MSG:
/************************************************************
SHUTDOWN_MSG: Shutting down NameNode at localhost/192.168.1.11
************************************************************/</p>
<pre><code>
在初始化后即可使用 `start-dfs.sh` 命令启动 HDFS：

</code></pre>
<p>tom@S1:~$ start-dfs.sh
10/24/14 21:37:56
Starting namenodes on [localhost]
localhost: starting namenode, logging to /home/hadoop/hadoop-2.4.1/logs/hadoop-hadoop-namenode-localhost.out
localhost: starting datanode, logging to /home/hadoop/hadoop-2.4.1/logs/hadoop-hadoop-datanode-localhost.out
Starting secondary namenodes [0.0.0.0]</p>
<pre><code>
使用 `jps` 命令检查，可以看到有如下进程：
``` bash
8210 SecondaryNameNode
8305 Jps
7958 NameNode
</code></pre>
<p>此时，使用 webUI 应该可以查看到相关的网页了：</p>
<ol>
<li><a href="http://localhost:50030">http://localhost:50030</a> 查看 jobtracker</li>
<li><a href="http://localhost:50070">http://localhost:50070</a> 查看名称节点 namenode</li>
<li><a href="http://localhost:8080">http://localhost:8080</a> 查看资源管理器</li>
<li><a href="http://localhost:19888">http://localhost:19888</a> 查看历史服务器</li>
</ol>
<h2>其他问题</h2>
<h3>log 权限</h3>
<p>在安装时可能出现类似如下的权限问题：</p>
<pre><code class="language-bash">0.0.0.0: /usr/hadoop-2.2.0/sbin/hadoop-daemon.sh: line 167: /usr/hadoop-2.2.0/logs/hadoop-tom-secondarynamenode-S1.out: Permission denied
</code></pre>
<p>这是某文件或文件夹权限不足的原因，解决方式是查看是哪个文件夹权限不足了，一般是 log 日志文件夹，那么修改该文件夹的所有者为当前用户（默认是 root）</p>
<h3>slave 文件丢失</h3>
<p>在启动时可能存在如下找不到 slave 文件的问题：</p>
<pre><code class="language-bash">tom@S1:/usr/hadoop-2.2.0/logs$ start-yarn.sh --config $HADOOP_INSTALL/conf
starting yarn daemons
starting resourcemanager, logging to /usr/hadoop-2.2.0/logs/yarn-tom-resourcemanager-S1.out
cat: /usr/hadoop-2.2.0/conf/slaves: No such file or directory
</code></pre>
<h3>ResourceManager 8088 端口无法访问</h3>
<p>在本机中可以访问，但其他机器无法访问，查看端口，发现如下：</p>
<pre><code class="language-bash">tom@S1:~$ netstat -tunalp | grep LISTEN
(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)
tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      -               
tcp        0      0 0.0.0.0:50090           0.0.0.0:*               LISTEN      12585/java      
tcp        0      0 0.0.0.0:3306            0.0.0.0:*               LISTEN      -               
tcp        0      0 127.0.0.1:8020          0.0.0.0:*               LISTEN      12333/java      
tcp        0      0 127.0.1.1:53            0.0.0.0:*               LISTEN      -               
tcp        0      0 0.0.0.0:21              0.0.0.0:*               LISTEN      -               
tcp        0      0 0.0.0.0:50070           0.0.0.0:*               LISTEN      12333/java      
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -               
tcp6       0      0 ::1:631                 :::*                    LISTEN      -               
tcp6       0      0 127.0.0.1:8088          :::*                    LISTEN      12709/java      
tcp6       0      0 127.0.0.1:8030          :::*                    LISTEN      12709/java      
tcp6       0      0 127.0.0.1:8031          :::*                    LISTEN      12709/java      
tcp6       0      0 127.0.0.1:8032          :::*                    LISTEN      12709/java      
tcp6       0      0 127.0.0.1:8033          :::*                    LISTEN      12709/java      
tcp6       0      0 :::41188                :::*                    LISTEN      13905/java      
tcp6       0      0 :::8040                 :::*                    LISTEN      13905/java      
tcp6       0      0 :::8042                 :::*                    LISTEN      13905/java      
tcp6       0      0 :::22                   :::*                    LISTEN      -            
</code></pre>
<p>仅在 127.0.0.1 地址监听 8088 端口。</p>
<p>解决方法：
参考：<a href="http://stackoverflow.com/questions/25135183/hadoop-binding-multiple-ip-addresses-to-a-cluster-namenode">http://stackoverflow.com/questions/25135183/hadoop-binding-multiple-ip-addresses-to-a-cluster-namenode</a></p>
<p>dfs.namenode.rpc-bind-host 的官方说明：</p>
<blockquote>
<p>The actual address the server will bind to. If this optional address is set, the RPC server will bind to this address and the port specified in dfs.namenode.rpc-address for the RPC server. It can also be specified per name node or name service for HA/Federation. This is most useful for making name node listen to all interfaces by setting to 0.0.0.0.</p>
</blockquote>
<p>在 hdfs-site.xml 文件中指定属性 <code>dfs.namenode.rpc-bind-host</code> 为 <code>0.0.0.0</code>，即要求 hadoop 监听所有内外端口而非只监听内部端口。</p>
<p>可能出现如下情况，解决方法未知：</p>
<pre><code class="language-bash">Incorrect configuration: namenode address dfs.namenode.servicerpc-address or dfs.namenode.rpc-address is not configured.
</code></pre>
<h3>capacity-scheduler.xml 丢失错误</h3>
<p>启动 ResourceManager 时出现如下错误：</p>
<pre><code class="language-bash">java.lang.IllegalStateException: Queue configuration missing child queue names for root
</code></pre>
<p>解决方法：
将如下 XML 保存为 capacity-scheduler.xml，放至 conf 文件夹内。</p>
<pre><code class="language-XML">&lt;!--

  Licensed under the Apache License, Version 2.0 (the &quot;License&quot;);
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an &quot;AS IS&quot; BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License. See accompanying LICENSE file.
--&gt;
&lt;configuration&gt;
	&lt;property&gt;
		&lt;name&gt;yarn.scheduler.capacity.maximum-applications&lt;/name&gt;
		&lt;value&gt;10000&lt;/value&gt;
		&lt;description&gt;
		Maximum number of applications that can be pending and running.
		&lt;/description&gt;
	&lt;/property&gt;
	&lt;property&gt;
		&lt;name&gt;yarn.scheduler.capacity.maximum-am-resource-percent&lt;/name&gt;
		&lt;value&gt;0.1&lt;/value&gt;
		&lt;description&gt;
			Maximum percent of resources in the cluster which can be used to run application masters i.e. controls number of concurrent running applications.
		&lt;/description&gt;
	&lt;/property&gt;
	&lt;property&gt;
		&lt;name&gt;yarn.scheduler.capacity.resource-calculator&lt;/name&gt;
		&lt;value&gt;org.apache.hadoop.yarn.util.resource.DefaultResourceCalculator&lt;/value&gt;
		&lt;description&gt;
			The ResourceCalculator implementation to be used to compare Resources in the scheduler. The default i.e. DefaultResourceCalculator only uses Memory while DominantResourceCalculator uses dominant-resource to compare multi-dimensional resources such as Memory, CPU etc.
		&lt;/description&gt;
	&lt;/property&gt;
	&lt;property&gt;
		&lt;name&gt;yarn.scheduler.capacity.root.queues&lt;/name&gt;
		&lt;value&gt;default&lt;/value&gt;
		&lt;description&gt;
		The queues at the this level (root is the root queue).
		&lt;/description&gt;
	&lt;/property&gt;
	&lt;property&gt;
		&lt;name&gt;yarn.scheduler.capacity.root.default.capacity&lt;/name&gt;
		&lt;value&gt;100&lt;/value&gt;
		&lt;description&gt;Default queue target capacity.&lt;/description&gt;
	&lt;/property&gt;
	&lt;property&gt;
		&lt;name&gt;
		yarn.scheduler.capacity.root.default.user-limit-factor
		&lt;/name&gt;
		&lt;value&gt;1&lt;/value&gt;
		&lt;description&gt;
		Default queue user limit a percentage from 0.0 to 1.0.
		&lt;/description&gt;
	&lt;/property&gt;
	&lt;property&gt;
		&lt;name&gt;
		yarn.scheduler.capacity.root.default.maximum-capacity
		&lt;/name&gt;
		&lt;value&gt;100&lt;/value&gt;
		&lt;description&gt;The maximum capacity of the default queue.&lt;/description&gt;
	&lt;/property&gt;
	&lt;property&gt;
		&lt;name&gt;yarn.scheduler.capacity.root.default.state&lt;/name&gt;
		&lt;value&gt;RUNNING&lt;/value&gt;
		&lt;description&gt;
		The state of the default queue. State can be one of RUNNING or STOPPED.
		&lt;/description&gt;
	&lt;/property&gt;
	&lt;property&gt;
		&lt;name&gt;
		yarn.scheduler.capacity.root.default.acl_submit_applications
		&lt;/name&gt;
		&lt;value&gt;*&lt;/value&gt;
		&lt;description&gt;
		The ACL of who can submit jobs to the default queue.
		&lt;/description&gt;
	&lt;/property&gt;
	&lt;property&gt;
		&lt;name&gt;
		yarn.scheduler.capacity.root.default.acl_administer_queue
		&lt;/name&gt;
		&lt;value&gt;*&lt;/value&gt;
		&lt;description&gt;
		The ACL of who can administer jobs on the default queue.
		&lt;/description&gt;
	&lt;/property&gt;
	&lt;property&gt;
		&lt;name&gt;yarn.scheduler.capacity.node-locality-delay&lt;/name&gt;
		&lt;value&gt;-1&lt;/value&gt;
		&lt;description&gt;
		Number of missed scheduling opportunities after which the CapacityScheduler attempts to schedule rack-local containers. Typically this should be set to number of racks in the cluster, this feature is disabled by default, set to -1.
		&lt;/description&gt;
	&lt;/property&gt;
&lt;/configuration&gt;
</code></pre>
<h1>Windows下安装使用</h1>
<p>这部分后面再添加，未完待续。。。</p>
