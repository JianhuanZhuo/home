<%@ page contentType="text/html; charset=UTF-8" %><p>快速排序的最坏时间复杂度为$\Theta(n^2)$，但它的期望复杂度为$\Theta(n\lg n)$</p>
<p>快排有着如下的特点：</p>
<ul>
<li><strong>Divide and Conquer</strong> 基于分治法</li>
<li><strong>Sort &quot;in place&quot;</strong> 原址排序</li>
<li><strong>Very Pratical</strong> 非常实用</li>
</ul>
<p>在观赏MIT教授Thomas的授课影片中，领略了快排在时间复杂度上的优势，并完成本次随笔。</p>
<!--more-->
<h1>基本快排</h1>
<h2>基本思想</h2>
<p>快排是典型的分治法算法，其核心算法思想如下：</p>
<ol>
<li>对于待排序的序列<code>A[p...r]</code></li>
<li>选择一个主元<code>A[q]</code>，将数组划分成两个子序列<code>A[p...q-1]</code>和<code>A[q+1...r]</code>，使得如下条件成立：
<ol>
<li><code>A[p...q-1]</code>中的每一个元素都<strong>小</strong>于主元，</li>
<li><code>A[q+1...r]</code>中的每一个元素都<strong>大</strong>于主元。</li>
</ol>
</li>
<li>递归的分治两个子序列。</li>
<li>组合并完成排序。</li>
</ol>
<p><img src="${pageContext.request.contextPath}/\img\algorithm\Sorting_quicksort_Invariant.png" alt="子序列划分" /></p>
<h2>算法实现</h2>
<p>主体程序算法实现如下：</p>
<pre><code class="language-C">/**
 *  @description    对指定界限的序列A进行快排
 *  @parameter      A：待排序的序列
 *                  p：序列左界限
 *                  r：序列右界限
 */
QuickSort(A, p, r){
    int q;
    if(p&gt;r){
        q = Partition(A, p, r);
        QuickSort(A, p, q-1);
        QuickSort(A, q+1, r);
    }
}
</code></pre>
<h3>子序列划分</h3>
<p>上述主程序依赖于函数<code>Partition(A, p, r)</code>，划分子序列实现如下：</p>
<pre><code class="language-C">/** 
 *  @description    对子序列进行原址重排，使得主元左边元素小于主元，右边元素大于主元
 *  @parameter      A：待排序的子序列
 *                  p：序列左界限
 *                  r：序列右界限
 *  @return         主元所在位置
 */
Partition(A, p, r){
    int x, i, j, t;
    x = A[r];
    i = p-1;
    for(j=p; j&lt;r; j++){
        if(A[j]&lt;=x){
            i=i+1;
            t=A[i];A[i]=A[j];A[j]=t;
        }
    }
    t=A[i+1];A[i+1]=A[r];A[r]=t;
    return i+1;
}
</code></pre>
<h3>动画演示</h3>
<p>快排的动画演示如下：</p>
<p><img src="${pageContext.request.contextPath}/\img\algorithm\Sorting_quicksort_anim.gif" alt="快排算法动画演示" /></p>
<h1>随机化</h1>
<p>对于如上的快排算法，做算法分析如下：</p>
<p>最坏情况:
序列逆序或正序，<code>Partition(A, p, r)</code>返回值为<code>p+1</code>或<code>r-1</code>，则一次<code>QuickSort()</code>函数调用只完成一个元素的排序，其算法复杂度将为$\Theta(n^2)$</p>
<p>最好情况:
<code>Partition(A, p, r)</code>返回为<code>(r-p)/2</code>，即每次子序列划分都能将序列划分为两个等长长度的子序列，则算法复杂度为$\Theta(n \lg n)$</p>
<p>由于现实中接受排序的一般的乱序程度没那么大，大部分情况为一个有序的序列插入某个元素后造成局部的乱序，那么此时使用快排则无法体现它的优势所在。（此时选择其他算法，如插入排序，才是明智的选择）</p>
<p>针对如上问题，提出了随机化的快排(<strong>Randomized Quick Sort</strong>)。一个核心的思想是，<strong>就算有序也要打乱到无序</strong>。</p>
<h2>随机化的快排(<strong>Randomized Quick Sort</strong>)</h2>
<p>输入序列的随机化将有如下的特点：</p>
<ul>
<li>算法运行时间与待排序序列顺序无关</li>
<li>最坏情况仅取决于随机产生器(Random-Number Generator)</li>
</ul>
<p>其基本处理框架如下：</p>
<p><img src="${pageContext.request.contextPath}/\img\algorithm\Sorting_quicksort_Randomize.png" alt="随机化快排流程" /></p>
<h2>随机抽样</h2>
<p>注意到：<code>Partition()</code>函数中的第10行处，直接将主元指定为最右的元素，在正序（逆序）时，其非主元元素的值都比主元小（逆序时都比主元大），这才导致了几乎有序的序列在快排时的失利。</p>
<p>这里我们可以使用另一种简单的方式来解决，随机抽样法<strong>random sampling</strong>，而无须打乱输入序列顺序：</p>
<ul>
<li><strong>使用随机指示器指定主元元素</strong></li>
</ul>
<p>一个实现版本如下，此处与上节的代码，仅对主元做了稍些修改：</p>
<pre><code class="language-C">/** 
 *  @description    对子序列进行原址重排，使得主元左边元素小于主元，右边元素大于主元
 *                  使用了随机指示器指定主元元素
 *  @parameter      A：待排序的子序列
 *                  p：序列左界限
 *                  r：序列右界限
 *  @return         主元所在位置
 */
Partition(A, p, r){
    int x, i, j, t;
    x = (int)rand(r-p)+r;           //随机指示主元元素
    t=A[x];A[x]=A[r];A[r]=t;        //交换元素
    x = A[r];
    i = p-1;
    for(j=p; j&lt;r; j++){
        if(A[j]&lt;=x){
            i=i+1;
            t=A[i];A[i]=A[j];A[j]=t;
        }
    }
    t=A[i+1];A[i+1]=A[r];A[r]=t;
    return i+1;
}
</code></pre>
