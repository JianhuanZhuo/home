<%@ page contentType="text/html; charset=UTF-8" %><p>此处为 pip 的使用笔记。</p>
<!--more-->
<h2>安装</h2>
<h2>使用</h2>
<p>pip安装包</p>
<pre><code class="language-bash">pip install SomePackage
</code></pre>
<p>pip查看已安装的包</p>
<pre><code class="language-bash">pip show --files SomePackage

C:\Users\TOM&gt;pip show --files numpy
---
Metadata-Version: 2.0
Name: numpy
Version: 1.11.2
Summary: NumPy: array processing for numbers, strings, records, and objects.
Home-page: http://www.numpy.org
Author: NumPy Developers
Author-email: numpy-discussion@scipy.org
Installer: pip
License: BSD
Location: f:\python35\lib\site-packages
Requires:
Classifiers:
  Development Status :: 5 - Production/Stable
  Intended Audience :: Science/Research
  Intended Audience :: Developers
  License :: OSI Approved
  Programming Language :: C
  Programming Language :: Python

.
.
.
</code></pre>
<p>pip检查哪些包需要更新</p>
<pre><code class="language-bash">pip list --outdated

C:\Users\TOM&gt;pip list --outdated
pip (8.1.1) - Latest: 8.1.2 [wheel]
setuptools (18.2) - Latest: 28.7.1 [wheel]
</code></pre>
<p>pip升级包</p>
<pre><code class="language-bash">pip install --upgrade SomePackage
</code></pre>
<p>pip卸载包</p>
<pre><code class="language-bash">pip uninstall SomePackage
</code></pre>
<p>pip帮助</p>
<pre><code class="language-bash"># pip --help
 
Usage:   
  pip &lt;command&gt; [options]
 
Commands:
  install                     安装包.
  uninstall                   卸载包.
  freeze                      按着一定格式输出已安装包列表
  list                        列出已安装包.
  show                        显示包详细信息.
  search                      搜索包，类似yum里的search.
  wheel                       Build wheels from your requirements.
  zip                         不推荐. Zip individual packages.
  unzip                       不推荐. Unzip individual packages.
  bundle                      不推荐. Create pybundles.
  help                        当前帮助.
 
General Options:
  -h, --help                  显示帮助.
  -v, --verbose               更多的输出，最多可以使用3次
  -V, --version               现实版本信息然后退出.
  -q, --quiet                 最少的输出.
  --log-file &lt;path&gt;           覆盖的方式记录verbose错误日志，默认文件：/root/.pip/pip.log
  --log &lt;path&gt;                不覆盖记录verbose输出的日志.
  --proxy &lt;proxy&gt;             Specify a proxy in the form [user:passwd@]proxy.server:port.
  --timeout &lt;sec&gt;             连接超时时间 (默认15秒).
  --exists-action &lt;action&gt;    Default action when a path already exists: (s)witch, (i)gnore, (w)ipe, (b)ackup.
  --cert &lt;path&gt;               证书.
</code></pre>
