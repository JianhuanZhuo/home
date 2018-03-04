<%@ page contentType="text/html; charset=UTF-8" %><p>之前没用过 IDEA 和 SVN，此次在 IDEA 上搭建 SVN 时出现了某些问题，在此作个小记录。</p>
<!--more-->
<h2>IDEA 找不到 SVN.exe 问题解决</h2>
<p>在 IDEA 搭建一个 SVN 时拉取代码时，发现 TortoiseSVN\bin 下没有 SVN.exe，故 IDEA 直接报 <code>Can't use Subversion</code> 的错误。
问题原因：
SVN.exe 是命令行工具的可执行文件，在早前安装时没有安装命令行工具。故无法找到该文件。
解决方式：
重新安装，并选择安装 <code>command line client tools</code>。</p>
<p><img src="\img\tools\idea_svn_1.png" alt="command line client tools 安装选项" /></p>
