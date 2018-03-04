<%@ page contentType="text/html; charset=UTF-8" %><pre><code class="language-java">class LockTwo implements Lock {
    private volatile int victim;

    public void lock() {
        int i = ThreadID.get();
        victim = i; // let the other go first
        while (victim == i) {} // wait
    }
    public void unlock() {}
}
</code></pre>
<h2>引理：<code>class LockTwo</code> 满足互斥</h2>
<p>证明：反证法，考虑 A、B 线程同时进入临界区时最后一次请求 <code>lock()</code>，有如下偏序：</p>
<p>$write_A(victim=A) \to read_A(victim!=A) \to CS$
$write_B(victim=B) \to read_B(victim!=B) \to CS$</p>
<p>再不失一般性的假设</p>
<p>$write_A(victim=A) \to write_B(victim=B)$</p>
<p>能得出如下错误结论：</p>
<p>$write_A(victim=A) \to write_B(victim=B) \to read_B(victim!=B) $</p>
<p>则引理成立。</p>
<h2>引理：<code>class LockTwo</code> 会导致死锁</h2>
<p><code>while (victim == i) {}</code> 中不成立的条件是 <code>victim</code> 被其他线程所修改，如果 A、B 中 A 线程请求 <code>lock()</code>，但 B 线程永不请求 <code>lock()</code> 则会导致 A 线程死锁。</p>
