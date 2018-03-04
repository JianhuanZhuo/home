<%@ page contentType="text/html; charset=UTF-8" %><p>titl: Hadoop 主要类分析笔记
date: 2017/1/4 19:51:20</p>
<hr />
<p>Hadoop 主要类分析学习笔记。</p>
<!--more-->
<h3>Job</h3>
<ol>
<li>允许 user 配置、提交、控制执行、查询状态</li>
<li>setxxx() 方法必须在 submit() 之前调用</li>
</ol>
<h3>ResourceManager</h3>
<p>集群中所有的资源都属于我</p>
<h3>NodeManager</h3>
<p>包括：</p>
<ol>
<li>ContainerManagerImpl</li>
<li>ContainsLauncher</li>
<li>ContainLauncher</li>
<li>...</li>
</ol>
<h3>MRAppMaster</h3>
<p>状态机
封装了 Job 接口的实现，所有状态的变化通过 Job 接口使其发生。
每个事件都会导致最终的状态变换。
状态机的变换是基于事件的。</p>
<p>组件之间收发事件，事件是实际的载体。这样可以保持高度的并发性，仅需要少量或无需同步。
每个事件都需向 Dispatcher 注册，事件由核心分发机制进行分发。</p>
<h3>YarnChild</h3>
<p>可单独运行
MRtask的主要进程，这个类的主要存在就是负责启动进程。</p>
<h3>MapTask</h3>
<p>Map任务的封装
extends Task</p>
<p>位于：hadoop-mapreduce-client-core-2.7.1.jar/org.apache.hadoop.mapred</p>
<p>也就是在新的版本里没有对应的类</p>
<p>V2版本
Task
--CompletedTask
--TaskImpl
----MapTaskImpl
----ReduceTaskImpl</p>
<h3>ReduceTask</h3>
