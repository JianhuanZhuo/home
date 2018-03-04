<%@ page contentType="text/html; charset=UTF-8" %><h2>title: Keil MDK RTE 兼容 keil4 的STM32F10x标准库
date: 2015-02-03 23:37
tags:
-keil
-RTE
-STM32</h2>
<h3>问题</h3>
<p>在开始学习嵌入式时，是从51单片机入手的，使用的是Keil4开发环境，用得十分的顺手。直到最近接触ARM，才学习STM32和它的那些库函数。
一开始我学习的是STM32的3.5版标准库《STM32F10x Standard Peripherals Library 》，但后来发现被收购的Keil公司开发了一个更强大的MDK，也就是Keil5，所以“赶时髦”地更新了绿色的Keil编译环境。
问题就出现了，MDK支持RTE[Run_Time Environment]框架，这是个很好用的东西，可以点几下鼠标之后便加入了文件，而不需要自己再去加什么启动文件、库文件啥的。但是在刚下载好的MDK中找不到这个标准库的，如果像用Keil4一样扔库文件进去那么RTE框架就没什么意义了，但3.5版本的STM32库用久，现在不用实在是有些怪怪的。</p>
<h3>解决</h3>
<p>直到今天才发现RTE是可以使用那个标准库的，只不过在以包为界限的帮助文档并没有扯一下这个“古董”，而Keil也不仅仅只是STM32的开发平台。
在Keil MDK RTE中，STM32F10X标准库扔在Device-StdPeriph Drivers中，这一条目下选中所需的API，RTE就自动将相应的文件加入到工程内了，十分方便。
前提：</p>
<ol>
<li>你需要下载STM32F10X的包，类似于：Keil.STM32F1xx_DFP.1.0.5.pack，这可以由MDK的更新得到，也可以直接去Keil官网下载（比较快）。</li>
<li>想要使用STM32F10X标准库的任何驱动，RTE里都需要包含一个FrameWork的选项，使得标准库适应RTE这个框架吧。</li>
</ol>
