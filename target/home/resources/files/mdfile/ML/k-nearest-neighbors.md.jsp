<%@ page contentType="text/html; charset=UTF-8" %><h2>title: K最近邻算法及python实现
date: 2016/3/2 13:41:39
tag: [Machine Learning, python]</h2>
<h3>什么是K最近邻算法？</h3>
<p>K最近邻算法（<code>K nearest neighbors</code>, 简写为<code>KNN</code>）是一种比较简单的“基于实例”的机器学习算法。</p>
<blockquote>
<p>基于实例的意思是，不在事先从指定训练样本集中训练出分类规则，而是直接保留训练样本，并在为给定未知实例做预测时，以与现有样本的“差距”作为分类依据，也就是一种懒算法<code>lazy algorithm</code>。</p>
</blockquote>
<!--more-->
<h3>K最近邻算法的工作原理是什么？</h3>
<blockquote>
<p>Lie down with dogs, wake up with fleas.</p>
</blockquote>
<p>K最近邻算法的工作原理为：<strong>近墨者黑</strong>。
举一个比较简单易懂的例子：</p>
<p>假设一个镇子上有很多户人家，这些居民操两种口音：普通话和方言。如下是镇上居住分布与口音情况，其中原型表示讲方言，方形表示讲普通话。
<img src="${pageContext.request.contextPath}/\img\ML\KNN\KNN1.png" alt="图1 镇上居住分布与口音情况" /></p>
<p>如上的情况中需要分辨出带<code>?</code>的六角形人家（待分类实例）可能是操什么口音的？那么<strong>近墨者黑</strong>，我们选取与六角形人家最近的<strong>K</strong>邻居，对六角形人家进行预测。</p>
<ul>
<li>故这里的K是指选取与对待分类样本相邻的样本数目。</li>
</ul>
<p>由图1可知，K为3时（黑色线），它的邻居中有2个讲普通话和1个将方言；K为5时（黑色和红色线），它的邻居中有4个讲普通话和1个将方言。对此，我们认为，或者说采用<strong>少数服从多数原则</strong>预测六角形人家是讲普通话的。</p>
