<%@ page contentType="text/html; charset=UTF-8" %><p>一、机器选型
小型机---百万级
pcserver--几万块一个的那种插在机架上的
云主机（阿里云、腾讯云）---创业公司首选，数据逐步增加
pc</p>
<p>软件选型
jdk1.7以上</p>
<p>hadoop:</p>
<ol>
<li>apache 版本</li>
<li>CDH 版本</li>
<li>HDP 版本</li>
</ol>
<p>目录结构：</p>
<ol>
<li>
<p>程序存放目录：/home/hadoop/app/</p>
</li>
<li>
<p>数据存放目录：</p>
<ul>
<li>dfs.namenode.name.dir ---file:/home/hadoop/data/name</li>
<li>dfs.datanode.data.dir ---file:/home/hadoop/data/datanode</li>
<li>dfs.namenode.edits.dir ---file:/home/hadoop/data/hdfs/edits</li>
<li>dfs.journalnode.edits.dir ---file:/home/hadoop/data/journaldata/jn</li>
<li>dfs.hosts.exclude ---file:/home/hadoop/app/hadoop-2.6.0-cdh5.4.5/etc/hadoop/excludes</li>
</ul>
</li>
<li>
<p>中间结果存放目录</p>
</li>
<li>
<p>PID 目录</p>
<ul>
<li>HADOOP_PID_DIR=/home/hadoop/data/pid</li>
<li>HADOOP_SECURE_DN_PID_DIR=/home/hadoop/data/pid</li>
</ul>
</li>
<li>
<p>其他目录</p>
</li>
</ol>
<p>用户规划：hadoop用户底下</p>
<p>ssh 免密码连接：</p>
<p>###生成密钥、公钥，</p>
<ol>
<li><code>ssh-keygen -t rsa</code> 生成密钥</li>
<li><code>cp id_rsa_pub authorized_keys</code></li>
<li>修改权限
.ssh 是 700 <code>chmod 700 ~/.ssh</code>
.ssh 下的文件是 600 <code>chmod 600 ~/.ssh/anthorized_keys</code>
用户主目录是 700</li>
</ol>
<h3>安装JDK</h3>
<p>CDH
：archive-primary.cloudera.com/cdh5/cdh/5/</p>
