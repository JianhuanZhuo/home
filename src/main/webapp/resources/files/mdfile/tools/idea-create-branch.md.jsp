<%@ page contentType="text/html; charset=UTF-8" %><p>管理上需要</p>
<!--more-->
<h2>IDEA 创建分支</h2>
<p>创建分支之前你得需要在 SVN 上知道个可以存放分支的地方，一般来说，项目上应该有两个文件夹 <code>[pro_root]\trunk</code> 和 <code>pro_root\branches</code> 两个文件夹，trunk 文件夹存放项目的主干分支，而 branches 则存放各种小分支。</p>
<p>很不幸，虽然我现在的项目之前木有这么个设定，于是乎自己创建了个文件夹 <code>dap_branches</code> 用于存放分支。</p>
<p>接下来是创建一个分支，在使用命令行时使用如下命令</p>
<pre><code class="language-bash">$ svn copy [source_pro_url]\trunk \
           [target_pro_url]\branches\ [target_new_branch]
           -m &quot;some message to log this change!&quot;
</code></pre>
<p>使用 IDEA 的话，则需要</p>
<ol>
<li>右击该项目 &gt; subversion... &gt; Branch or Tag... &gt;</li>
<li>指定 <code>Copy From</code>，选择 <code>Working Copy</code> 拷贝当前工程，或者选择 <code>Repository Location</code> 指定具体版本号的工程</li>
<li>指定 <code>Copy To</code>，选择 <code>Branch or Tag</code> 指定新建的分支路径和分支名。</li>
</ol>
<h2>切换分支</h2>
<p>使用 IDEA 的话</p>
<ol>
<li>右击该项目 &gt; subversion... &gt; Update directory</li>
<li>勾选 Update/Switch to specific url 重新设置新的URL</li>
</ol>
