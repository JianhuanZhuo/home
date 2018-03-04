<%@ page contentType="text/html; charset=UTF-8" %><p>一般比较常见的二叉树遍历算法有<strong>递归遍历</strong>和<strong>借助栈</strong>的做法，接下来的笔记，介绍的是一个时间复杂度为O(n)，辅助空间为O(1)的非递归算法。</p>
<!--more-->
<h3>注意说明：</h3>
<ul>
<li>该算法要求树中节点的结构需带有指向父节点的域。</li>
<li>该算法适用于二叉树的先序、中序、后续和2度以上树的遍历法。为了便于说明，本笔记使用二叉树的中序遍历作为示例。</li>
<li>为了更清楚的说明问题将以下的树结构作为示例。</li>
<li>这里使用**“移动”**至某节点来说明指针p被赋值为该节点的地址，但没有获取或使用该节点的数据域，应该与“访问”(访问节点的数据域)相区分。</li>
</ul>
<p><img src="${pageContext.request.contextPath}/\img\algorithm\example_tree.png" alt="图1 示例用的树" /></p>
<h3>问题分析：</h3>
<ol>
<li>由于节点结构中带有指向父节点的域，所以在任意的节点处都可以通过访问节点中的父节点或左右孩子节点移动指针并到达树中任意目标结点，<strong>且路径唯一</strong>。</li>
<li>对于给定遍历顺序（中序）的二叉树，其遍历的节点顺序是可以确定的，而指针P的移动所经过的节点也是可以确定的。如图1所示的树的中序遍历的结果为：DBEAFCG，而p移动的顺序为：ABDBEBACFCGCA，这是唯一可确定的。</li>
<li>使用指针移动的方式遍历树，指针p可能多次“移动”到一个节点。而<code>递归调用法</code>使指向内部节点的指针在需要被延后访问时被压栈，也就是只移动一次。<code>辅助栈的非递归算法</code>是访问孩子节点前将父节点压栈，子树遍历完成后，再将父节点弹出访问另一个孩子节点，也就是说<strong>用栈保存了“来时的路”</strong>，这一点可以从没有用到指向父节点的域看出来。</li>
<li>上一点中使用到的栈，从根本上来说是为了确定在指定时刻该执行的动作，因为在某一时刻指向节点有多种可能发生的动作，如图1中p将移动三次至节点B中，三次发生的动作分别为移向左孩子D、访问B节点、返回至A。但这个状态恰巧是可以在上一个动作确定的，如：在p指针移向A的孩子节点B时可以确定下一步将访问B节点的左孩子节点D，而在左孩子节点D访问完成返回B节点时可以确定下一步将访问B节点的数据等（中序）。<strong>这里得益于可以通过访问指向父节点的域，来确定当前为父节点的第几个孩子</strong>。</li>
</ol>
<h3>基本思路：</h3>
<p>通过比较父节点的孩子域的指针获得该节点是父节点的第几个孩子，在完成访问动作时判断下一步执行的动作，并使用一个辅助变量S存储结果。移动至目标结点后执行S所指示的动作。以此循环直至树全部遍历完成。</p>
<h3>算法描述</h3>
<ol>
<li>初始化，p赋值为根节点，S为1</li>
<li>如果S为1，转至6</li>
<li>如果S为2，转至8</li>
<li>如果S为3，转至9</li>
<li>如果S为4，转至11</li>
<li>如果p的左孩子为空，S置为2，转至2</li>
<li>p置为p的左孩子，转至2</li>
<li>访问p的数据域，S置为3，转至2</li>
<li>如果p的右孩子为空，S置为4，转至2</li>
<li>S置为1，p置为p的右孩子，转至2</li>
<li>如果p的父节点为空，转至14</li>
<li>如果p的父节点的左孩子为p，S置为2</li>
<li>p置为p的父节点，转至2</li>
<li>算法结束</li>
</ol>
<h3>基本流程图</h3>
<p><img src="${pageContext.request.contextPath}/\img\algorithm\inorder_walk.png" alt="图2 非递归遍历算法流程图" /></p>
<h3>算法复杂度</h3>
<ol>
<li>时间复杂度：
设为该算法时间复杂度为T(n)，n为节点数。对于任意节点x，最大的“移动”次数为4(S={1,2,3,4})；由于该算法将遍历全部节点，故T(n)&lt;=4n，即<strong>T(n)=O(n)</strong>。</li>
<li>空间复杂度：
该算法仅使用一个S作为辅助变量，故空间复杂度为<strong>S(n)=O(1)</strong>。</li>
</ol>
<h3>算法实现</h3>
<pre><code class="language-c">//二叉树中序非递归遍历
Status BiTTraverse(BiTree T){
  BiTree p=T;
  int S=1; 
  while(p!=NULL){
    switch(S){
      case 1:
        if(p-&gt;lchild!=NULL)
          p=p-&gt;lchild;
        else
          S=2;
        break; 
  
      case 2:
        printf(&quot;%c&quot;,p-&gt;data);

      case 3:
        if(p-&gt;rchild!=NULL){
          S=1;
          p=p-&gt;rchild;
        }
        else
          S=4;
        break; 

      case 4:
        if(NULL==p-&gt;parent){
          p=NULL;
          break; 
        }
        else if(p-&gt;parent-&gt;lchild==p){
          S=2;
          p=p-&gt;parent; 
        }
        else 
          p=p-&gt;parent;  
        break; 

      default:
        return 0; 
    }
  } 
}
</code></pre>
