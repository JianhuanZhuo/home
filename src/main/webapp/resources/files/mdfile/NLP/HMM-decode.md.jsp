<%@ page contentType="text/html; charset=UTF-8" %><p>给定一个观察序列 $O=O_1O_2O_3 \cdots O_T$ 和模型 $\mu = (A,B,\pi)$，计算观察序列 $O$ 的概率 $P(O|\mu)$。</p>
<h2>朴素产生式解法</h2>
<p>对任意隐状态序列 $Q=q_1q_2 \cdots q_T$，有：</p>
<div>
$$
\begin{aligned}
P(O|Q,\mu) &= \prod^{T-1}_{t=1}{P(O_t | q_t, q_{t+1}, \mu)} \\
&= b_{q1}(O_1) \times b_{q2}(O_2) \times b_{qT}(O_T)
\end{aligned}
\tag{6-8}
$$
</div>
<p>并且</p>
<div>
$$
\begin{aligned}
P(Q | \mu) &= \pi_{q1}a_{q1q2}a_{q2q3} \cdots a_{q_{T-1}qT}
\end{aligned}
\tag{6-9}
$$
</div>
<p>由于</p>
<div>
$$
\begin{aligned}
P(O, Q|\mu) &= P(O|Q, \mu) P(Q|\mu)
\end{aligned}
\tag{6-10}
$$     
</div>
<p>于是</p>
<div>
$$
\begin{aligned}
P(O|\mu) &= \sum_Q{P(O,Q|\mu)} \\
&= \sum_Q{P(O|Q,\mu) P(Q|\mu))} \\
&= \sum_Q{\pi_{q_1}b_{q_1}(O_1) \prod^{T-1}_{t=1}{a_{q_tq_{t+1}} b_{q_{t+1}}(O_{t+1}) } }
\end{aligned}
\tag{6-11}
$$
</div>
