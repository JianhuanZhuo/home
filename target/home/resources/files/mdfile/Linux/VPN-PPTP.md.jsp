<%@ page contentType="text/html; charset=UTF-8" %><h2>PPTP 介绍</h2>
<p>Point-to-Point Tunneling Protocol (PPTP) 点对点隧道协议</p>
<p>嗯，这种方式不适合翻墙。翻墙用 SS。</p>
<h2>安装 PPTP 服务器软件</h2>
<pre><code class="language-bash">apt-get install pptpd
</code></pre>
<h2>添加用户</h2>
<p>我们不想每个人都可以访问到我们私有的 VPN 资源，所以你应该在创建一些带密码的 VPN 用户，而我们的资源仅开放给这些用户即可。用户的增删在文件 <code>/etc/ppp/chap-secrets</code> 编辑即可，格式为：</p>
<pre><code class="language-bash">[用户名] [服务] [密码] [ip]
</code></pre>
<p>用户名和密码就字面意思，服务在仅用于 VPN 时为 <code>pptpd</code>，<code>ip</code> 表示允许该用户从哪个 <code>ip</code> 访问 VPN 资源，使用 <code>*</code> 表示允许该用户从任意 IP 登录，也可以改为自己的一些ip，ip之间用逗号或空格隔开。</p>
<h2>设置 PPTD 服务</h2>
<p>PPTD 服务的配置文件的位置在 <code>/etc/pptpd.conf</code>，确保 <code>remoteip</code>、<code>localip</code> 可用。</p>
<p>因为每一个vpn客户端拨号进来，都会在pptpd服务端生成一个ppp虚拟网卡，并往路由表里增加一条路由。</p>
<h3>可选的配置</h3>
<p><code>pptpd.conf</code> 有其他可选的配置，第一次安装就不用理它们了，后面维护可能需要用到</p>
<ol>
<li>连接数，<code>connections 100</code> 表示客户端连接数量的上限限制，用于保护服务器负载。</li>
<li>广播开启，<code>bcrelay [网络接口名]</code>，配置则表示允许转发指定接口 <code>[网络接口名]</code> 的广播消息给 PPTP 客户端。</li>
</ol>
<h2>设置 sysctl.conf</h2>
<p>使用 VPN 时需要开启 ip 转发，也就是 <code>ip_forward</code>，这个选项在 <code>/etc/sysctl.conf</code> 中开启：</p>
<pre><code class="language-bash"># Uncomment the next line to enable packet forwarding for IPv4
net.ipv4.ip_forward=1
</code></pre>
<p>确保如上的配置 <code>net.ipv4.ip_forward</code> 是 <code>=1</code> 的，1 表示开启，0 表示关闭。</p>
<p>修改后，使用 <code>sudo sysctl -p</code> 命令重加载。</p>
<h2>重启 PPTD 服务</h2>
<p>上述配置结束后，使用如下命令重启下服务以便重新读取配置。</p>
<pre><code class="language-bash">sudo service pptpd restart
</code></pre>
<p>参考：</p>
<ol>
<li><a href="https://www.vultr.com/docs/setup-a-pptp-vpn-server-on-ubuntu">Setup a PPTP VPN Server on Ubuntu</a>，这里的资料在 <code>Step 3:Step 3: Edit the PPTPD settings</code> 有一处错误，<code>pptpd.conf</code> 在 <code>/etc/pptpd.conf</code> 而不是在 <code>/etc/pptpd/pptpd.conf</code>。</li>
</ol>
