<%@ page contentType="text/html; charset=UTF-8" %><p><code>class LockOne</code></p>
<ol>
<li>满足互斥</li>
<li>会死锁，也就是不满足免饥饿</li>
</ol>
<pre><code class="language-java">class LockOne implements Lock {
    private boolean[] flag = new boolean[2];

    // thread-local index, 0 or 1
    public void lock() {
        int i = ThreadID.get();
        int j = 1 - i;
        flag[i] = true;
        while (flag[j]) {} // wait
    }

    public void unlock() {
        int i = ThreadID.get();
        flag[i] = false;
    }
}
</code></pre>
<p>引理：<code>class LockOne</code> 满足互斥。</p>
<p>证明：反证法，如果不满足，设 A、B 在同时进入临界时最后一次请求 <code>lock()</code> 时，有：</p>
<p>$write_A(flag[A]=true) \to read_A(flag[B]==false) \to CS_A$
$write_B(flag[B]=true) \to read_B(flag[A]==false) \to CS_B$</p>
<p>不是一般性的假设：</p>
<p>$read_A(flag[B]==false) \to read_B(flag[A]==false)$</p>
<p>易得错误结论，</p>
<p>$write_A(flag[A]=true) \to read_A(flag[B]==false) \to read_B(flag[A]==false)$</p>
<p>得证。</p>
