<%@ page contentType="text/html; charset=UTF-8" %><p>title: X-Stream
date: 2017/8/24</p>
<hr />
<p>给用户看到的是使用图顶点存储数据</p>
<p>提供两个原语：
Edge-centric scatter takes as input an edge, and computes, based on the data field of its source vertex, whether an update value needs to be sent to its destination vertex, and, if so, the value of that update.</p>
<p>以边作为输入，并基于边的源顶点数据进行计算，如果必要，计算后的值会更新到目的节点。</p>
<p>Edge-centric gather takes as input an update, and uses its value to recompute the data field of its destination vertex.
以更新作为输入，使用更新的值进行对目的定点的数据域进行重计算。</p>
<p>整个计算由 scatter-&gt;gather 的循环组成。使用应用指定的终止临界条件。</p>
<p>整个计算是同步的，保证在下一次迭代之前 gather 已全部完成。</p>
<p>InputStream 每次只读一个 item，相对的是 output stream</p>
<p>The scatter phase of the computation takes the edges as the input stream, and produces an output stream of updates.
scatter 阶段以边作为输入流，并生产输出流（if need, append update to output stream）</p>
<p>低速设备是顺序访问的，而顶点数据是放在高速设备，随机访问的，
问题是=&gt;高速设备可能放不下那么大的顶点数据。</p>
<p>A streaming partition consists of a vertex set, an edge list, and an update list.
顶点集相互不相交，
边集为源顶点在顶点集的边
更新列表指，边的目的顶点集。</p>
<p>分区数量在整个计算过程中固定不变。</p>
<p>分区的话，初始化的时候就会计算分区、边集和更新列表顶点集。以分区为计算的大单位。在分区内计算时，还是和 Graph Chi 的老方法。简单而粗暴的那种。
分区的作用是在 shuffle 的阶段将更新信息按分区装桶。Uout(p)</p>
<p>大图的操作？</p>
<p>准备数据的这一方面？</p>
