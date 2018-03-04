<%@ page contentType="text/html; charset=UTF-8" %><h2>title: ID3归纳决策树
date: 2016/2/10 21:06:11
tags: Machine Learning</h2>
<p>id3算法被视为数据挖掘的十大算法，在此发展出来的C4.5算法、C5.0算法（商业化）成为实践中较为普遍的机器学习工具，但从根本上来讲它主要是在节点的属性选择上做出了贡献。</p>
<!--more-->
<p>ID3归纳决策树的算法核心是“信息熵”，它使用每个属性的“信息增益”作为选用标准。</p>
<h1>信息熵</h1>
<p>信息熵，用于量化事物的“信息量”的度量，是1948年香农祖师爷<em>C. E. Shannon</em>在借助热力学中的热熵（表示分子状态混乱程度的物理量）概念后提出的。</p>
<p>假定某个事件在某时刻可能发生的事件有n个，每个事件对应的可能概率为Pi，那么每个事件的发生对于观察者而言将带来一定的“信息量”的。</p>
<p>信息度量的计算公式为：<img src="${pageContext.request.contextPath}/\img\ML\id3_1.png" alt="" />
备注：</p>
<ol>
<li>函数满足<strong>单调递减</strong>与<strong>可加性</strong>。</li>
<li>对数底一般取2，对应单位为比特 <strong>bit</strong>，当然也可取其他单位。</li>
<li>确定事件的不确定性为0</li>
</ol>
<p>而信息熵在此则表示为所有事件的信息统计平均值
其计算公式为：<img src="${pageContext.request.contextPath}/\img\ML\id3_2.png" alt="" /></p>
<p>对于二元信源，即可能发生的事件只有两种：0或1，其信息熵随事件1的概率的由小至大变化呈抛物线状，并在H(1/2)处达到顶点，如下图：
<img src="${pageContext.request.contextPath}/\img\ML\id3_3.png" alt="" /></p>
<h4>信息增益</h4>
<p>信息增益(<strong>information gain</strong>) 在决策树创建的过程是指生成子树后的获得减少的信息熵，也就是原先的信息熵与生成子树后信息熵的差值 。</p>
