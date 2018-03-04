<%@ page contentType="text/html; charset=UTF-8" %><p><code>top</code>命令</p>
<p>CPU 信息</p>
<pre><code>total 进程总数
running 正在运行的进程数
sleeping 睡眠的进程数
stopped 停止的进程数
zombie 僵尸进程数
Cpu(s): 
0.3% us 用户空间占用CPU百分比
1.0% sy 内核空间占用CPU百分比
0.0% ni 用户进程空间内改变过优先级的进程占用CPU百分比
98.7% id 空闲CPU百分比
0.0% wa 等待输入输出的CPU时间百分比
0.0%hi：硬件CPU中断占用百分比
0.0%si：软中断占用百分比
0.0%st：虚拟机占用百分比
</code></pre>
<p>内存信息</p>
<pre><code>Mem:
191272k total    物理内存总量
173656k used    使用的物理内存总量
17616k free    空闲内存总量
22052k buffers    用作内核缓存的内存量
Swap: 
192772k total    交换区总量
0k used    使用的交换区总量
192772k free    空闲交换区总量
123988k cached    缓冲的交换区总量,内存中的内容被换出到交换区，而后又被换入到内存，但使用过的交换区尚未被覆盖，该数值即为这些内容已存在于内存中的交换区的大小,相应的内存再次被换出时可不必再对交换区写入。
</code></pre>
<pre><code>序号  列名    含义
a    PID     进程id
b    PPID    父进程id
c    RUSER   Real user name
d    UID     进程所有者的用户id
e    USER    进程所有者的用户名
f    GROUP   进程所有者的组名
g    TTY     启动进程的终端名。不是从终端启动的进程则显示为 ?
h    PR      优先级
i    NI      nice值。负值表示高优先级，正值表示低优先级
j    P       最后使用的CPU，仅在多CPU环境下有意义
k    %CPU    上次更新到现在的CPU时间占用百分比
l    TIME    进程使用的CPU时间总计，单位秒
m    TIME+   进程使用的CPU时间总计，单位1/100秒
n    %MEM    进程使用的物理内存百分比
o    VIRT    进程使用的虚拟内存总量，单位kb。VIRT=SWAP+RES
p    SWAP    进程使用的虚拟内存中，被换出的大小，单位kb。
q    RES     进程使用的、未被换出的物理内存大小，单位kb。RES=CODE+DATA
r    CODE    可执行代码占用的物理内存大小，单位kb
s    DATA    可执行代码以外的部分(数据段+栈)占用的物理内存大小，单位kb
t    SHR     共享内存大小，单位kb
u    nFLT    页面错误次数
v    nDRT    最后一次写入到现在，被修改过的页面数。
w    S       进程状态(D=不可中断的睡眠状态,R=运行,S=睡眠,T=跟踪/停止,Z=僵尸进程)
x    COMMAND 命令名/命令行
y    WCHAN   若该进程在睡眠，则显示睡眠中的系统函数名
z    Flags   任务标志，参考 sched.h
</code></pre>
<h3>命令使用</h3>
<blockquote>
<p>top [-] [d] [p] [q] [c] [C] [S] [s]  [n]</p>
</blockquote>
<p>参数说明</p>
<pre><code>d 指定每两次屏幕信息刷新之间的时间间隔。当然用户可以使用s交互命令来改变之。 
p 通过指定监控进程ID来仅仅监控某个进程的状态。 
q 该选项将使top没有任何延迟的进行刷新。如果调用程序有超级用户权限，那么top将以尽可能高的优先级运行。 
S 指定累计模式 
s 使top命令在安全模式中运行。这将去除交互命令所带来的潜在危险。 
i 使top不显示任何闲置或者僵死进程。 
c 显示整个命令行而不只是显示命令名 
</code></pre>
<p>交互命令</p>
<pre><code>Ctrl+L 擦除并且重写屏幕。 
h或者? 显示帮助画面，给出一些简短的命令总结说明。 
k       终止一个进程。系统将提示用户输入需要终止的进程PID，以及需要发送给该进程什么样的信号。一般的终止进程可以使用15信号；如果不能正常结束那就使用信号9强制结束该进程。默认值是信号15。在安全模式中此命令被屏蔽。 
i 忽略闲置和僵死进程。这是一个开关式命令。 
q 退出程序。 
r 重新安排一个进程的优先级别。系统提示用户输入需要改变的进程PID以及需要设置的进程优先级值。输入一个正值将使优先级降低，反之则可以使该进程拥有更高的优先权。默认值是10。 
S 切换到累计模式。 
s 改变两次刷新之间的延迟时间。系统将提示用户输入新的时间，单位为s。如果有小数，就换算成m s。输入0值则系统将不断刷新，默认值是5 s。需要注意的是如果设置太小的时间，很可能会引起不断刷新，从而根本来不及看清显示的情况，而且系统负载也会大大增加。 
f或者F 从当前显示中添加或者删除项目。 
o或者O 改变显示项目的顺序。 
l 切换显示平均负载和启动时间信息。 
m 切换显示内存信息。 
t 切换显示进程和CPU状态信息。 
c 切换显示命令名称和完整命令行。 
M 根据驻留内存大小进行排序。 
P 根据CPU使用百分比大小进行排序。 
T 根据时间/累计时间进行排序。 
W 将当前设置写入~/.toprc文件中。这是写top配置文件的推荐方法。
</code></pre>
<p>常用操作：</p>
<pre><code>top   //每隔5秒显式所有进程的资源占用情况
top -d 2  //每隔2秒显式所有进程的资源占用情况
top -c  //每隔5秒显式进程的资源占用情况，并显示进程的命令行参数(默认只有进程名)
top -p 12345 -p 6789//每隔5秒显示pid是12345和pid是6789的两个进程的资源占用情况
top -d 2 -c -p 123456 //每隔2秒显示pid是12345的进程的资源使用情况，并显式该进程启动的命令行参数
</code></pre>
<h2>修改默认启动模式</h2>
<blockquote>
<p>$ vi /etc/inittab</p>
</blockquote>
<p>修改这一行</p>
<blockquote>
<p>id:3:initdefault:</p>
</blockquote>
<p>意义：</p>
<pre><code>0-halt 关机，让init关闭所有进程并关机
1-Single user mode 单用户字符界面，通常又称为s或S
2-Multiuser,without NFS 不具备网络文件系统功能的多用户字符界面
3-Full multiuser mode 具备网络文件系统功能的多用户字符界面
4-unused 保留不用
5-X11 具备网络功能的图形用户界面
6-reboot 关闭所有运行的进程并重新启动系统
</code></pre>
<h2>查看运行服务</h2>
<blockquote>
<p>$ chkconfig --list</p>
</blockquote>
<h2>查看当前正在执行的进程</h2>
<blockquote>
<p>$ ps aux</p>
</blockquote>
<p>查看指定的软件是否有跑起来</p>
<blockquote>
<p>$ ps -ef|grep tomcat
root 7010 1 0 Apr19 ? 00:30:13 /usr/local/java/bin/java -Djava.util.logging.config.file=/usr/local/tomcat/conf/logging.properties -Djava.awt.headless=true -Dfile.encoding=UTF-8 -server -Xms1024m -Xmx1024m -XX:NewSize=256m -XX:MaxNewSize=256m -XX:PermSize=256m -XX:MaxPermSize=256m -XX:+DisableExplicitGC -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Djava.endorsed.dirs=/usr/local/tomcat/endorsed -classpath /usr/local/tomcat/bin/bootstrap.jar -Dcatalina.base=/usr/local/tomcat -Dcatalina.home=/usr/local/tomcat -Djava.io.tmpdir=/usr/local/tomcat/temp org.apache.catalina.startup.Bootstrap start</p>
</blockquote>
<h3>pgrep 命令</h3>
<p><code>pgrep</code> 用于查找进程</p>
<ul>
<li>-o：仅显示找到的最小（起始）进程号</li>
<li>-n：仅显示找到的最大（结束）进程号</li>
<li>-l：显示进程名称</li>
<li>-P：指定父进程号</li>
<li>-g：指定进程组</li>
<li>-t：指定开启进程的终端</li>
<li>-u：指定进程的有效用户ID。</li>
</ul>
<h3>查找大文件、大目录</h3>
<p>从查找大文件开始</p>
<blockquote>
<p>find / -type f -size +800M</p>
</blockquote>
<blockquote>
<p>//如下显示了文件的信息（例如，文件大小、文件属性）
find / -type f -size +800M  -print0 | xargs -0 ls -l</p>
</blockquote>
<blockquote>
<p>//如下显示查找出来文件的具体大小
find / -type f -size +800M  -print0 | xargs -0 du -h</p>
</blockquote>
<blockquote>
<p>//对查找结果按照文件大小做一个排序，那么可以使用下面命令
find / -type f -size +800M  -print0 | xargs -0 du -h | sort -nr</p>
</blockquote>
<p>find / -type f -size +500M  -print0 | xargs -0 ls -lrth</p>
<p>到查找大目录</p>
<blockquote>
<p>du / -h --max-depth=1</p>
</blockquote>
<ol>
<li>阅读论文《2006-OSDI-Bigtable A Distributed Storage System for Structured Data》</li>
<li>阅读论文《2013-IEEE-BigData-Kylin An efficient and scalable graph data processing system》</li>
<li>阅读论文《2011-KDD-GBASEa scalable and general graph management system》</li>
<li>阅读论文《2013-KDD-TurboGrapha fast parallel graph engine handling billion-scale graphs in a single PC》
阅读大图数据分布式存储与索引技术章节
编写汇报 PPT</li>
</ol>
