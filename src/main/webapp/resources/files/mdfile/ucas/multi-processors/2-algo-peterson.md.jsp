<%@ page contentType="text/html; charset=UTF-8" %><p><code>class Peterson</code> 有：</p>
<ol>
<li>满足互斥</li>
<li>免死锁</li>
<li>免饥饿</li>
</ol>
<pre><code class="language-java">class Peterson implements Lock {
    // thread-local index, 0 or 1
    private volatile boolean[] flag = new boolean[2];
    private volatile int victim;

    public void lock() {
        int i = ThreadID.get();
        int j = 1 - i;
        flag[i] = true; // I’m interested
        victim = i; // you go first
        while (flag[j] &amp;&amp; victim == i) {}; // wait
    }

    public void unlock() {
        int i = ThreadID.get();
        flag[i] = false; // I’m not interested
    }
}
</code></pre>
<h2>引理：<code>class Peterson</code> 满足互斥</h2>
<p>证明：反证法，考虑 A、B 线程同时进入临界区之前的最后一次请求 <code>lock()</code>，则有：</p>
<p>$write_A(flag[A] = true) \to write_A(victim=A) \to read_A(flag[B]) \to read_A(victim) \to CS_A$</p>
<p>$write_B(flag[B] = true) \to write_B(victim=B) \to read_B(flag[A]) \to read_B(victim) \to CS_B$</p>
<p>再不失一般性的假设：</p>
<p>$write_A(victim=A) \to write_B(victim=B)$</p>
<p>$write_A(flag[A] = true) \to write_B(victim=B) \to read_B(flag[A]) \to read_B(victim) \to CS_B$</p>
<p>那么由这条序列知道，B 线程不可能进入临界区，因为读到的 flag[A] 为 true，且 victim 为 B。</p>
<p>原命题得证</p>
<h2>引理：<code>class Peterson</code> 免饥饿</h2>
<p>证明：反证法，假设 A 始终 <code>while</code> 条件都成立，卡在 <code>while</code> 中等待锁，而 B 都在执行，且在请求锁时超过 A 进入临界区。</p>
<p>那么在 B 离开临界区，第二次请求 <code>lock()</code> 时，有如下条件成立：</p>
<p>$write_A(flag[A]=true) \to read_A(flag[B]==true) \to read_A(victim==A) \to write_B(flag[B]=true)$</p>
<p>$\to write_B(victim=B) \to read_B(flag[A]==true) \to read_B(victim==A)$</p>
<p>易知，B 的 <code>while</code> 条件成立，故原证成立。</p>
<blockquote>
<p>由此可推出该方法免死锁</p>
</blockquote>
