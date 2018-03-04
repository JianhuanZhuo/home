<%@ page contentType="text/html; charset=UTF-8" %><h2>如何卸载rpm包</h2>
<p>首先通过  rpm -q &lt;关键字&gt; 可以查询到rpm包的名字
然后 调用 rpm -e &lt;包的名字&gt; 删除特定rpm包
如果遇到依赖，无法删除，使用 rpm -e --nodeps &lt;包的名字&gt; 不检查依赖，直接删除rpm包
如果恰好有多个包叫同样的名字，使用 rpm -e --allmatches --nodeps &lt;包的名字&gt; 删除所有相同名字的包， 并忽略依赖</p>
