<%@ page contentType="text/html; charset=UTF-8" %><p>title: 点边切分（持续更新）
date: 2017/7/25</p>
<hr />
<h2>1. 边切分</h2>
<p>边切分 edge-cutting 与以顶点为中心 vertex-centric 的计算模型对应，表示以顶点作为单次计算的基本单元，用户函数 update-function 作用于每个顶点，并进行计算。</p>
<p>以顶点为计算中心的计算模型通过迭代图顶点完成的，优点是简单易用，能比较自然的表达大多数并行图算法。</p>
<h3>1.1. 边随机查找问题</h3>
<p>而边则作为其，考虑有向图有种：</p>
<ol>
<li>顶点单元仅直接关联出边集合；</li>
<li>顶点单元仅直接关联入边集合；</li>
<li>顶点单元直接关联初入边集合。</li>
</ol>
<p>顶点单元仅直接关联出边集合，指的是在顶点计算单元关联该顶点的出边集合，该顶点的入边集合。</p>
<p>这里需要考虑的是，如果仅关联出边（或入边），则在顶点计算时需要用到入边（出边）时，则需要进行全顶点搜索。不管是单机内存、单机磁盘、或分布式，遍历顶点查找都十分费事。在不遍历查找的情况下则转化情况 3 进行考虑，</p>
<ol>
<li>事先固定入边的位置，在访问时通过简单的计算获得，那么则要求数据在计算前进行预处理，如 GraphChi。且在进行图结构的增删处理时需要对入边位置进行严格维护。</li>
<li>【？】使用邻接矩阵法，以空间换去时间，这样的话，对于图全部的节点而言是不可能的，但邻接矩阵的元素对象如果是分区的话，是不是可行的呢？将分区 A 内全部节点与其他分区 B 内全部节点之间的全部边放在矩阵 M 的 (A, B) 元素所表示的地址空间内。当然这也需要预处理的时间。 主要的目的是为了减少同步的时间。</li>
<li>在加载时，为起始顶点和终止顶点都添加一个边的副本 duplication，当然这会出现数据冗余和一致性的问题。而维护一致得想出一种不需要遍历就能同步的方法才行。</li>
<li>【？】双向链表中，使用单个指针就可以获得两个位置的地址的技术是不是可以利用得上。</li>
</ol>
<p>引出的问题还有，如果考虑图为无向图呢？一般的做法是将无向图作为顶点间边为相互指向的有向图。那么数据是只存一份呢还是两份呢？两份的话怎么同步？</p>
<h3>1.2. 边度幂率分布问题</h3>
<p>此外顶点单元在关联边时，都会碰到一个问题是：现实图中顶点的度分布服从 power-law distribution 幂率分布，即描述为不同顶点间的连接边数极不等，极少数顶点握有绝大部分边的 scale-free 无标度特征。
在考虑幂率分布时，某些顶点会因关联大量边而超出内存容纳范围。这里如果是分区内顶点的边总数太大的话，则可再切分分区为更小的分区，如 GraphChi。</p>
<p>其中，顶点切分方式则是考虑了图的幂率分布特点，是对大度顶点切分的解决方法。</p>
<h2>2. 顶点切分</h2>
<p>顶点切分与以边为中心的计算模型对应，
顶点切分是 GraphLab 开始就已经使用的一种切分方式</p>
<p>避免了对边的随机访问，也解决了大边度顶点的问题。</p>
<h3>2.1. 是</h3>
<h2>3. 相关分析</h2>
<h2>4. 以子图为中心</h2>
<p>我将图计算做成一个服务呢？</p>
<p>A. Sala, L. Cao, C. Wilson, R. Zablit, H. Zheng, and B. Y. Zhao. Measurement-calibrated graph models for social network experiments. In WWW, pages 861–870, 2010.</p>