<%@ page contentType="text/html; charset=UTF-8" %><p>参考：</p>
<ul>
<li><a href="https://www.cs.helsinki.fi/u/tpkarkka/opetus/11s/spa/lecture06.pdf">https://www.cs.helsinki.fi/u/tpkarkka/opetus/11s/spa/lecture06.pdf</a></li>
<li>Oflazer K. Error-tolerant finite-state recognition with applications to morphological analysis and spelling correction[J]. Computational Linguistics, 1996, 22(1): 73-89.</li>
</ul>
<h2>编辑距离 Edit Distance</h2>
<p>编辑距离（Edit Distance），又称 Levenshtein 距离，是指两个字串之间，由一个转成另一个所需的最少编辑操作次数。许可的编辑操作包括将一个字符替换成另一个字符，插入一个字符，删除一个字符。一般来说，编辑距离越小，两个串的相似度越大。</p>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\NLP\img\2018-02-16-14-36-06.png" alt="编辑距离示例" /></p>
<p>给定两个字符串 $A[1..m]$ 和 $B[1..n]$，$d_{ij}$ 定义如下：</p>
<div>
$$
\begin{aligned}
d_{00} &= 0, \\
d_{i0} &= i, 1 \le i \le m,\\
d_{0j} &= j, 1 \le j \le n,\\
d_{ij} &= min
\left\{
\begin{aligned}
&d_{i-1,j-1} + \delta(A[i],B[j])
\\
&d_{i-1,j} + 1
\\
&d_{i,j-1} + 1
\end{aligned}
\right.
1 \le i \le m, 1 \le j \le n
\end{aligned}
$$
</div>
<p>其中：</p>
<div>
$$
\delta(A[i],B[j])=\left\{
\begin{array}{cc}
1 & if A[i] \not= B[j]\\ 
0 & if A[i] = B[j]
\end{array}
\right.
$$
</div>
<h2>cut off 编辑距离</h2>
<p>由于经典的编辑距离无法很好地衡量在字符串搜索过程中的编辑距离。</p>
