<%@ page contentType="text/html; charset=UTF-8" %><p>Time</p>
<blockquote>
<p>A thread is a state machine, and its state transtion are called <em>event</em>. ... Events are instantanous.</p>
</blockquote>
<table>
<thead>
<tr><th>符号</th><th>解释</th></tr>
</thead>
<tbody>
<tr><td>$a_i^j$</td><td>表示 $a_i$ 时间的第 j 次发生。</td></tr>
<tr><td>$a \to b$</td><td>表示 a 先于 b 发生</td></tr>
<tr><td>$I_A(a_0, a_1)$</td><td>Interval between $a_0$ and $a_1$</td></tr>
<tr><td>$I_A^j$</td><td>denote the j-th execution of interval $I_A$</td></tr>
<tr><td>$CS_A^j$</td><td>the invertal during which A executes the critical section for the j-th time</td></tr>
<tr><td>$write_A(x=v)$</td><td>表示 A 对变量 x 的赋值为 v 的操作</td></tr>
<tr><td>$read_A(x==v)$</td><td>表示 A 对变量 x 的读出值为 v 的操作</td></tr>
</tbody>
</table>
<blockquote>
<p><strong>Mutual Exclusion</strong> Critical sections of different threads do not overlap.</p>
</blockquote>
<blockquote>
<p><strong>Freedom from Deadlock</strong> If some threads attempt to acquire the lock, then some thread will succceed in acquiring the lock. If thread A calls <code>lock()</code> but never acquire the lock, then other threads must be completing an infinite number of critical sections.</p>
</blockquote>
<p>后面一句中：如果线程 A 请求 lock 时始终都无法成功，那么肯定是有别的线程，完成了无限多次 lock 请求。也就是不能是一次 lock 导致无限长的等待。</p>
<p>也就是说，</p>
<ol>
<li>一次 lock 的时间不能是无限长.</li>
</ol>
<blockquote>
<p><strong>Freedom from Starvation</strong> Every thread attempts acquire the lock eventually succeeds.
Note that starvation freedom implies deadlock freemdom.</p>
</blockquote>
<p>饥饿虽然在实际环境中有可能发生，但真的很少发生。所以它是上述三个条件中最不引人注意的。</p>
