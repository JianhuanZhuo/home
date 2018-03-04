<%@ page contentType="text/html; charset=UTF-8" %><p>snapshot algorithm 快照算法是用于持久化分布式系统全局状态的一类算法。由于无全局共享存储和全局所，快照算法变得不可能。</p>
<h2>快照算法</h2>
<p>举个例子：</p>
<blockquote>
<p>假定有一这样的分布式系统：每个节点都表示一个持有一定额度的账户，节点间可以通过交换消息转账。那么在转账时如果一个节点已经发送了转账消息（故在自己的账户上减去了相应的金额），而另一个节点确没有接收到（没有增加金额），就会出现不一致的问题。</p>
</blockquote>
<h2>Chandy-Lamport algorithm</h2>
<blockquote>
<p>The Chandy–Lamport algorithm is a snapshot algorithm that is used in distributed systems for recording a consistent global state of an asynchronous system.</p>
</blockquote>
<p>Chandy-Lamport 算法是一种分布式系统中用于记录异步系统全局一致性状态的快照算法，它由 Leslie Lamport 和 K.Mani Chandy 开发并以两人的名字命名。</p>
<p>相关成果发表于 1985 年，<a href="http://research.microsoft.com/users/lamport/pubs/chandy.pdf">&quot;Distributed Snapshots: Determining Global States of a Distributed System&quot;</a></p>
