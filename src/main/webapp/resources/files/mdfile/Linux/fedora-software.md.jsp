<%@ page contentType="text/html; charset=UTF-8" %><p>多次重装，好的软件老是需要重新找回，故在此做个笔记</p>
<!--more-->
<h2>替代 terminal 的好软件 tilix</h2>
<p>添加如下源，另存为 <code>/etc/yum.repos.d/tilix.repo</code></p>
<pre><code>[heikoada-terminix]
name=Copr repo for terminix owned by heikoada
baseurl=https://copr-be.cloud.fedoraproject.org/results/heikoada/terminix/fedora-$releasever-$basearch/
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/heikoada/terminix/pubkey.gpg
repo_gpgcheck=0
enabled=1
enabled_metadata=1
</code></pre>
<p>更新缓存并安装即可</p>
<pre><code>sudo dnf makecache
sudo dnf install tilix
</code></pre>
<p>参考：<a href="https://gnunn1.github.io/tilix-web/">Tilix 官网</a></p>
<h2>shadowsock</h2>
<p>添加 copr 源并安装</p>
<pre><code>sudo dnf copr enable librehat/shadowsocks
sudo dnf install shadowsocks-qt5
</code></pre>
<p>这里需要注意的是，shadowsocks 中使用 sock5 连接时，autoswitch 和系统代理都需要将协议转换为 socket 而不是 http</p>
<h2>chrome</h2>
<p>添加谷歌源并直接安装</p>
<pre><code>sudo wget -O /etc/yum.repos.d/chrome.repo http://repo.fdzh.org/chrome/google-chrome-mirrors.rep
sudo dnf install -y google-chrome-stable
</code></pre>
<h2>idea</h2>
<p>直接在官网下载即可</p>
<h2>ssh</h2>
<p><code>rpm -qa |grep ssh</code> 查找当前系统是否已经安装
若无，则使用 <code>sudo dnf install ssh</code> 安装即可
使用 <code>sudo service sshd start</code> 启动</p>
<h2>zathura</h2>
<p>To view pdf, you need to install a <code>zathura-pdf-poppler</code>, or hit by error <code>unknown file type</code></p>
<pre><code class="language-bash">sudo dnf install zathura
sudo dnf install zathura-pdf-poppler
</code></pre>
<p><a href="https://pwmt.org/projects/zathura">ZATHURA: A DOCUMENT VIEWER</a>
<a href="https://bugzilla.redhat.com/show_bug.cgi?id=962097">Bug 962097 - Cannot open pdf file with Zathura</a></p>
<h2>wps</h2>
<p>download .rpm file from this <a href="http://wps-community.org/downloads">site</a> and install by:</p>
<pre><code class="language-bash">sudo dnf install ./wps-office-10.1.0.5707-1.a21.x86_64.rpm 
</code></pre>
<p>install bzip2-devel if this error incurs:</p>
<blockquote>
<p>Error while loading shared libraries: libbz2.so.1.0: cannot open shared object file</p>
</blockquote>
<pre><code>sudo dnf install bzip2-devel
sudo ln -s `find /usr/lib64/ -type f -name &quot;libbz2.so.1*&quot;`
</code></pre>
<p><a href="http://www.fosslinux.com/919/install-wps-office-on-fedora.htm">Install WPS Office on Fedora</a>
<a href="https://michaelheap.com/error-while-loading-shared-libraries-libbz2-so-1-0-cannot-open-shared-object-file-on-centos-7">Error while loading shared libraries: libbz2.so.1.0</a></p>
