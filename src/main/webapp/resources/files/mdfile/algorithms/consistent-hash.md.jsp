<%@ page contentType="text/html; charset=UTF-8" %><h2>参考</h2>
<ol>
<li><a href="https://zh.wikipedia.org/wiki/%E4%B8%80%E8%87%B4%E5%93%88%E5%B8%8C">维基百科：一致哈希</a></li>
<li><a href="http://www8.org/w8-papers/2a-webserver/caching/paper2.html">论文：Web Caching with Consistent Hashing</a></li>
<li><a href="https://web.archive.org/web/20120605030524/http://weblogs.java.net/blog/tomwhite/archive/2007/11/consistent_hash.html">java.net blog : Consistent Hashing</a></li>
</ol>
<h2>介绍</h2>
<p>一致哈希(<code>ConsistentHash</code>) 是一种特殊的哈希算法。在使用一致哈希算法后，哈希表槽位数（大小）的改变平均只需要对 <code>K/n</code> 个关键字重新映射，其中 <code>K</code> 是关键字的数量， <code>n</code> 是槽位数量。然而在传统的哈希表中，添加或删除一个槽位的几乎需要对所有关键字进行重新映射。</p>
<h1>简单实例</h1>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\algorithms\img\2017-12-19-20-25-06.png" alt="Consistent Hash" /></p>
<p>哈希函数实际上是将对象映射到一个数值域，对应 java 的 <code>hashCode()</code> 函数是将计算对象哈希值并返回一个范围在 $-2^{31}$ to $2^{31}-1$ 的 <code>int</code> 值。</p>
<p>上图中蓝色点为对象 1、2、3、4 的哈希值，红点 A、B、C 为缓存服务器。将他们如上显示在哈希值域首尾相接闭合成环状里。</p>
<p>通过顺时针方向查找以确定由哪个服务器缓存对象的哈希值。如上例子中顺时针方向下来，4、1 由 A 缓存，2 由 B 缓存，3 由 C 缓存。</p>
<p>假设上图中 C 服务被移除，则所有对象中仅 3 需要改变，并缓存至 A 服务器中，其他对象均无变化。</p>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\algorithms\img\2017-12-19-20-35-19.png" alt="" /></p>
<p>如果添加一服务器 D， 那么则重分配 3、4 对象缓存至 D 服务器，其他对象缓存不作任何变化。</p>
<p>这种方法是有效的，不过如果分配给某个缓存服务器的区间十分火热（命中几率异常大）或者异常冷清，那么这个方法则不 work 了，因为哈希本身就是随机的，它并不保证哈希出来的分布是均匀的。</p>
<p>有一种解决方法是添加虚拟节点</p>
<h2>java 实现</h2>
<p>这里是 <code>HashFunction</code> 是一个哈希函数接口，用户可以通过该接口实现任何自定义的哈希函数，需要注意的是，一般哈希函数的结果都不够 <code>mix</code> 混乱。这里推荐 <code>MD5</code> 作为哈希函数。</p>
<p>如下代码中 <code>circle</code> 是 <code>SortedMap</code> 类型对象，它用于缓存 哈希值-对象 映射对。一致哈希建立后，每创建一个节点，该节点都会循环 <code>numberOfReplicas</code> 次加入到 <code>circle</code> 中，且每次加入的哈希以对象字符串值加数字后缀计算。这些虚拟节点都会被存储到 <code>circle</code> 中。</p>
<p>在使用 <code>get</code> 函数获取缓存中的对象时，会先计算该键值的哈希值，
To find a node for an object (the get method), the hash value of the object is used to look in the map. Most of the time there will not be a node stored at this hash value (since the hash value space is typically much larger than the number of nodes, even with replicas), so the next node is found by looking for the first key in the tail map. If the tail map is empty then we wrap around the circle by getting the first key in the circle.</p>
<pre><code class="language-java">import java.util.Collection;
import java.util.SortedMap;
import java.util.TreeMap;

public class ConsistentHash&lt;T&gt; {

 private final HashFunction hashFunction;
 private final int numberOfReplicas;
 private final SortedMap&lt;Integer, T&gt; circle = new TreeMap&lt;Integer, T&gt;();

 public ConsistentHash(HashFunction hashFunction, int numberOfReplicas, Collection&lt;T&gt; nodes) {
   this.hashFunction = hashFunction;
   this.numberOfReplicas = numberOfReplicas;

   for (T node : nodes) {
     add(node);
   }
 }

 public void add(T node) {
   for (int i = 0; i &lt; numberOfReplicas; i++) {
     circle.put(hashFunction.hash(node.toString() + i), node);
   }
 }

 public void remove(T node) {
   for (int i = 0; i &lt; numberOfReplicas; i++) {
     circle.remove(hashFunction.hash(node.toString() + i));
   }
 }

 public T get(Object key) {
   if (circle.isEmpty()) {
     return null;
   }
   int hash = hashFunction.hash(key);
   if (!circle.containsKey(hash)) {
     SortedMap&lt;Integer, T&gt; tailMap = circle.tailMap(hash);
     hash = tailMap.isEmpty() ? circle.firstKey() : tailMap.firstKey();
   }
   return circle.get(hash);
 }

}
</code></pre>
