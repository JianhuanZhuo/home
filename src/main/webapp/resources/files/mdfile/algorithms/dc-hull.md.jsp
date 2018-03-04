<%@ page contentType="text/html; charset=UTF-8" %><p>在这里，我将记录在平面或<strong>高维空间</strong>的一个给定点集合中寻找凸包问题(convex-hull problem)的思考与笔录。</p>
<!--more-->
<h1>凸包</h1>
<h2>一维的理解</h2>
<p>在一维空间，凸包可以解释为如下：</p>
<blockquote>
<p>在集合$A=\lbrace x_1, x_2, \ldots x_m \rbrace $中寻找两个点$x_i$和$x_j$作为闭区间$S$的端点，使得 $A \in [x_i, x_j]$</p>
</blockquote>
<p>如上的$[x_i, x_j]$就是所谓的凸包的边界了。</p>
<h2>二维的理解</h2>
<p>在二维空间中，可以如下图十分形象的解释为一条刚好包著所有点的橡皮圈，更为形式的说法可以是：</p>
<blockquote>
<p>在集合$A=\lbrace (x_1, y_1), (x_2, y_2), \ldots (x_m, y_m) \rbrace $中寻找有序子集$B = \lbrace (x_i, y_i) \ldots (x_j, y_j) \rbrace$，使得$B$为顶点连接起来的闭区域$S$，满足$A \subset S$，那么</p>
</blockquote>
<p><img src="${pageContext.request.contextPath}/\img\algorithm\convex_hull_1.jpg" alt="二维凸包" /></p>
<h2>高维的理解</h2>
<p>三维的凸包应该是由$n$个平面包围而成的空间闭合平面$H$。
对于<strong>m维</strong>的凸包应该是由$n$个高维的超平面$\lbrace \Phi_1 \ldots \Phi_n \rbrace ( 其中\Phi_k \triangleq F(d_1, \ldots , d_m)=0 )$包围而成的闭合超平面$Z$，该超平面$Z$将“包含”集合$A=\lbrace x_1, x_2 \ldots x_s \rbrace ( 其中 x_s={\mathbb{R}}^m)$中的所有点。</p>
<h1>蛮力法</h1>
<h2>算法思想</h2>
<blockquote>
<p>搜索所有可能的组合，找到满足凸包问题的边界。</p>
</blockquote>
<p>对于如上的说法，理解如下：</p>
<ul>
<li>边界，即所有的点都在边界的“一侧”的分界。</li>
<li>对于一维的凸包，边界为$F(x)=0$，即以一维数轴上点作为边界。其边界条件为$\forall x \in A, 满足 x_i \leq x 和 x_j \geq x $，这样所有的点都在$x_i$的右侧（都比$x_i$大），且都在$x_j$的左侧（都比$x_j$小）</li>
<li>对于二维的凸包，边界为$F(x, y)=0$，</li>
<li>对于高维的凸包，更一般化的讲</li>
</ul>
