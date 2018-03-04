<%@ page contentType="text/html; charset=UTF-8" %><h2>title: 图像复原
date: 2016/2/5 20:15:58
tags: [Matlab, DIP]</h2>
<p><span>$s=1$</span></p>
<p>图像复原技术<code>rebuild</code>与图像增强<code>enhance</code>有着相同的目标，以预定的目标进行改善图像。不同的是：</p>
<ol>
<li>图像增强的原则是对图像的再处理，使得图像满足后续使用的需求；</li>
<li>而图像复原技术利用某种已知的退化方式或者某先验知识进行图像复原。</li>
</ol>
<p>如，对原有图像进行对比度拉高以便于人眼观察，是一种增强技术；对受到高斯污染的图像进行复原，是一种还原技术。</p>
<!--more-->
<h2>图像退化/复原模型</h2>
<p>对于退化后的图像<em>g(x,y)<em>与原图</em>f(x,y)</em>，设污染过程如下：
<img src="${pageContext.request.contextPath}/\img\matlab\rebuild1.png" alt="图像退化模型" />
其中：</p>
<ul>
<li>*H[x,y]*为退化函数</li>
<li>*u(x,y)*为加性噪声</li>
</ul>
<p>对于如上污染过程，如果*H[x,y]<em>与</em>u(x,y)*是可知的先验知识，那么为了复原图像所使用的<strong>逆</strong>过程可表示为：
<img src="${pageContext.request.contextPath}/\img\matlab\rebuild2.png" alt="图像还原模型" /></p>
<h2>上述</h2>
