<%@ page contentType="text/html; charset=UTF-8" %><h3>庭院独占使用样例</h3>
<blockquote>
<p>Alice 和 Bob 共用一个院子，院子仅独占使用。</p>
</blockquote>
<p>对于上述问题，Alice 提出一个方案如下：</p>
<p>Alice 与 Bob 在各自窗口竖立一个小旗 Flag，并各自遵守如下协议：
当 Alice 想使用院子时：</p>
<ol>
<li>升起小旗</li>
<li>再窗口看 Bob 的小旗，如果 Bob 的小旗没有升起，则使用院子</li>
<li>降下小旗</li>
</ol>
<p>当 Bob 想使用院子时：</p>
<ol>
<li>升起小旗</li>
<li>while 如果 Alice 的小旗为升起的</li>
</ol>
<ul>
<li>降下 Bob 的小旗</li>
<li>等待 Alice 降下小旗</li>
<li>升起小旗</li>
</ul>
<ol start="3">
<li>使用庭院</li>
<li>使用完毕后降下小旗</li>
</ol>
<h3>互斥的属性</h3>
<p>我们使用上述的样例对互斥的几个属性进行讨论：</p>
<ol>
<li>deadlock，在上述协议中，并不会产生死锁现象，因为死锁中的四个必然条件中的请求与保持不成立，Bob 在请求使用院子时，对其自身的小旗并不做保持要求，故而避免了死锁的产生。</li>
<li>starvation，显而易见，在这个协议中 Alice 与 Bob 的优先级是不对等的，Bob 与 Alice 同时请求时，Bob 会做出让步。由此，如果 Alice 重复的使用院子，那么 Bob 则可能一直无法使用到院子。</li>
<li>fault-tolerance，在上述协议中，Alice 与 Bob 彼此信任，当一方操作失误则协议无法继续进行。</li>
<li>wait，假如 Alice 占用院子（升起小旗）后，由于某些原因出现延迟，在延迟中并不需要使用到院子（如被中途去了洗手间）此时院子则出现院子空置，而 Bob 依然无法使用的情况，注意此时 Alice 并没有破坏协议。</li>
</ol>
