<%@ page contentType="text/html; charset=UTF-8" %><p><code>class Filter</code> 是扩展了 Peterson 方法到 n 个线程的情况：</p>
<pre><code class="language-java">class Filter implements Lock {
    int[] level;
    int[] victim;
    public Filter(int n) {
        level = new int[n];
        victim = new int[n]; // use 1..n-1
            for (int i = 0; i &lt; n; i++) {
            level[i] = 0;
        }
    }

    public void lock() {

        int me = ThreadID.get();
        for (int i = 1; i &lt; n; i++) { //attempt level 1
            level[me] = i;
            victim[i] = me;
            // spin while conflicts exist
            while ((∃k != me) (level[k] &gt;= i &amp;&amp; victim[i] == me)) {};
        }
    }

    public void unlock() {
        int me = ThreadID.get();
        level[me] = 0;
    }
}
</code></pre>
<ol>
<li>用 for n 循环表示该线程要往下递增跳</li>
<li>victime 表示垫背的牺牲品，victim[i]==me表示没有垫背，则不能进下一层</li>
<li>level 表示优先级，或者说往下层数高则先执行</li>
<li>那么线程晋级的条件是，要么无前辈（自己的优先级最高）要么有人给自己垫背把自己抬上去。</li>
</ol>
