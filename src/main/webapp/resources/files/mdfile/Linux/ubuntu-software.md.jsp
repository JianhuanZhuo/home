<%@ page contentType="text/html; charset=UTF-8" %><h2>source</h2>
<pre><code># deb cdrom:[Ubuntu 16.04 LTS _Xenial Xerus_ - Release amd64 (20160420.1)]/ xenial main restricted
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial universe
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates universe
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security universe
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security multiverse

# deb cdrom:[Ubuntu 16.04 LTS _Xenial Xerus_ - Release amd64 (20160420.1)]/ xenial main restricted
deb-src http://archive.ubuntu.com/ubuntu xenial main restricted #Added by software-properties
deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted multiverse universe #Added by software-properties
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted multiverse universe #Added by software-properties
deb http://mirrors.aliyun.com/ubuntu/ xenial universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe
deb http://mirrors.aliyun.com/ubuntu/ xenial multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse #Added by software-properties
deb http://archive.canonical.com/ubuntu xenial partner
deb-src http://archive.canonical.com/ubuntu xenial partner
deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted multiverse universe #Added by software-properties
deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-security multiverse
</code></pre>
<pre><code class="language-bash">sudo mv sources.list sources.list.bak
sudo vi sources.list
sudo apt update &amp;&amp; sudo apt upgrade
</code></pre>
<h2>git</h2>
<pre><code>sudo apt install git 
git config --global user.name &quot;tomZhuo&quot;
git config --global user.email &quot;keepfight_zjh@163.com&quot;
mkdir ~/project
cd ~/project
git clone git@github.com:JianhuanZhuo/BlogMarkdownSource.git
</code></pre>
<h2>wps</h2>
<pre><code>#remove libreoffice
sudo apt remove libreoffice-common
#install wps
sudo apt install ./wps-office_10.1.0.5672~a21_amd64.deb
</code></pre>
<p><a href="http://community.wps.cn/download/">WPS社区</a></p>
<h2>tweak-tool</h2>
<pre><code>sudo apt install unity-tweak-tool
</code></pre>
<h2>chrome</h2>
<pre><code>#add repo
sudo wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d/
#add apt-key
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
#update
sudo apt-get update
#install chrome
sudo apt-get install google-chrome-stable
</code></pre>
<p><a href="http://jingyan.baidu.com/article/335530da98061b19cb41c31d.html">在 Ubuntu 16.04 中安装谷歌 Chrome 浏览器</a></p>
<h2>tilix</h2>
<pre><code>sudo add-apt-repository ppa:webupd8team/terminix
sudo apt update
sudo apt install tilix
</code></pre>
<p><a href="https://gnunn1.github.io/tilix-web/">Tilix</a></p>
<p>add tilix to shortcut: win+q</p>
<h2>shadowsocks-qt5</h2>
<pre><code>sudo add-apt-repository ppa:hzwhuang/ss-qt5
sudo apt-get update
sudo apt-get install shadowsocks-qt5
</code></pre>
<p><a href="http://www.cnblogs.com/superxuezhazha/p/6065992.html">ubuntu安装shadowshocks-qt5</a></p>
<pre><code>{
  &quot;configs&quot;: [
    {
      &quot;server&quot;: &quot;138.128.212.80&quot;,
      &quot;server_port&quot;: 443,
      &quot;password&quot;: &quot;xgsRGRg0IO1&quot;,
      &quot;method&quot;: &quot;aes-256-cfb&quot;,
      &quot;remarks&quot;: &quot;帮外公&quot;,
      &quot;auth&quot;: false,
      &quot;timeout&quot;: 5
    },
    {
      &quot;server&quot;: &quot;45.32.255.63&quot;,
      &quot;server_port&quot;: 443,
      &quot;password&quot;: &quot;leiyongcong1231&quot;,
      &quot;method&quot;: &quot;aes-256-cfb&quot;,
      &quot;remarks&quot;: &quot;老虎的日本鸡&quot;,
      &quot;auth&quot;: false,
      &quot;timeout&quot;: 5
    }
  ],
  &quot;strategy&quot;: null,
  &quot;index&quot;: 1,
  &quot;global&quot;: true,
  &quot;enabled&quot;: false,
  &quot;shareOverLan&quot;: false,
  &quot;isDefault&quot;: false,
  &quot;localPort&quot;: 1080,
  &quot;pacUrl&quot;: null,
  &quot;useOnlinePac&quot;: false,
  &quot;secureLocalPac&quot;: true,
  &quot;availabilityStatistics&quot;: false,
  &quot;autoCheckUpdate&quot;: false,
  &quot;checkPreRelease&quot;: false,
  &quot;isVerboseLogging&quot;: true,
  &quot;logViewer&quot;: {
    &quot;topMost&quot;: false,
    &quot;wrapText&quot;: false,
    &quot;toolbarShown&quot;: false,
    &quot;Font&quot;: &quot;Consolas, 8pt&quot;,
    &quot;BackgroundColor&quot;: &quot;Black&quot;,
    &quot;TextColor&quot;: &quot;White&quot;
  },
  &quot;proxy&quot;: {
    &quot;useProxy&quot;: false,
    &quot;proxyType&quot;: 0,
    &quot;proxyServer&quot;: &quot;&quot;,
    &quot;proxyPort&quot;: 0,
    &quot;proxyTimeout&quot;: 3
  },
  &quot;hotkey&quot;: {
    &quot;SwitchSystemProxy&quot;: &quot;&quot;,
    &quot;SwitchSystemProxyMode&quot;: &quot;&quot;,
    &quot;SwitchAllowLan&quot;: &quot;&quot;,
    &quot;ShowLogs&quot;: &quot;&quot;,
    &quot;ServerMoveUp&quot;: &quot;&quot;,
    &quot;ServerMoveDown&quot;: &quot;&quot;
  }
}
</code></pre>
<h2>vscode</h2>
<pre><code>curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor &gt; microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo &quot;deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main&quot; &gt; /etc/apt/sources.list.d/vscode.list'

sudo apt-get update
sudo apt-get install code
</code></pre>
<p><a href="https://code.visualstudio.com/docs/setup/linux">Running VS Code on Linux</a></p>
<h2>vim</h2>
<pre><code>sudo apt-get install vim
</code></pre>
<p>I got</p>
<pre><code>Reading package lists... Done  
Building dependency tree  
Reading state information... Done

Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 vim : Depends: vim-common (= 2:7.3.154+hg~74503f6ee649-2ubuntu2) but 2:7.3.154+hg~74503f6ee649-2ubuntu3 is to be installed
E: Unable to correct problems, you have held broken packages.
</code></pre>
<p><a href="https://askubuntu.com/questions/78406/cannot-install-vim">Cannot install vim</a></p>
<h2>zathura</h2>
<pre><code>sudo apt install zathura
</code></pre>
<p><a href="https://pwmt.org/projects/zathura">zathura project</a></p>
<h2>xclip</h2>
<pre><code>sudo apt install xclip
</code></pre>
<h2>maven</h2>
<pre><code>sudo apt install maven
wget -o ~/.m2/settings  https://github.com/JianhuanZhuo/BlogMarkdownSource/blob/master/tools/settings.xml

</code></pre>
<h2>apache</h2>
<pre><code>cd ~
wget http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.16/bin/apache-tomcat-8.5.16.tar.gz
sudo tar -zxf apache-tomcat-8.5.16.tar.gz -C /opt/
</code></pre>
<h2>tomcat</h2>
<pre><code>sudo apt install tomcat8 tomcat8-admin
sudo vim /etc/tomcat8/tomcat-users.xml
sudo service tomcat8 restart
</code></pre>
<p>add this:</p>
<pre><code class="language-xml">&lt;user username=&quot;admin&quot; password=&quot;mima123&quot; roles=&quot;manager-gui,admin-gui&quot;/&gt;
</code></pre>
<p>如果无法访问网站，可以从如下几个方面考虑：</p>
<ol>
<li>JDK 要安装，<code>sudo apt-get install default-jdk</code></li>
<li>服务器的防火墙要关，Ubuntu 下为 <code>sudo service ufw stop</code></li>
<li>云主机要配置安全策略</li>
</ol>
<p><a href="https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-7-on-ubuntu-14-04-via-apt-get">Ubuntu install tomcat via apt</a></p>
<p>可选的装下</p>
<pre><code class="language-bash">sudo apt-get install tomcat8-docs tomcat8-examples
</code></pre>
<p>我有个案例是，admin 卡死了。一切风平浪静，就是 tomcat 无响应。</p>
<p>BUG ：发布时，无法访问：
我有个例子是因为打包后只有一个列表没有文件，加入下面的插件才会把全部文件打包成一个 War</p>
<pre><code class="language-xml">&lt;plugin&gt;
  &lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;
  &lt;artifactId&gt;maven-war-plugin&lt;/artifactId&gt;
  &lt;version&gt;2.6&lt;/version&gt;
  &lt;configuration&gt;
    &lt;failOnMissingWebXml&gt;false&lt;/failOnMissingWebXml&gt;
  &lt;/configuration&gt;
&lt;/plugin&gt;
</code></pre>
<p>使用这个命令查看当前监听的端口：</p>
<pre><code class="language-bash">$ netstat -ltnpa | grep -i --colour LISTEN
tcp        0      0 0.0.0.0:3306            0.0.0.0:*               LISTEN      1044/mysqld     
tcp        0      0 0.0.0.0:8080            0.0.0.0:*               LISTEN      1191/java       
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      999/sshd        
tcp6       0      0 :::22                   :::*                    LISTEN      999/sshd      
</code></pre>
<p>这个方法安装的 tomcat 在修改端口时会出现没有权限的情况</p>
<p>参考：<a href="https://askubuntu.com/questions/685151/how-to-change-tomcat-8-port">How to change tomcat 8 port</a></p>
<p>解决办法：</p>
<ol>
<li>通过端口转发：<code>sudo /sbin/iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080</code></li>
<li>安装 authbind</li>
</ol>
<p>添加域名，需要注意的是在指定的 appBase 内如果没有 ROOT 文件夹的话，需要在 <code>&lt;Host&gt;&lt;/Host&gt;</code> 内添加一个 <code>&lt;Context&gt;&lt;/Context&gt;</code> 才行</p>
<pre><code class="language-xml"> &lt;Host name=&quot;localhost&quot;  appBase=&quot;webapps&quot;
            unpackWARs=&quot;true&quot; autoDeploy=&quot;true&quot;
            xmlValidation=&quot;false&quot; xmlNamespaceAware=&quot;false&quot;&gt;
   &lt;Context path=&quot;&quot; docBase=&quot;web1&quot; reloadable=&quot;true&quot;  crossContext=&quot;true&quot; /&gt; 
  &lt;/Host&gt;
</code></pre>
<h2>启用 ssl</h2>
<p>复制 <code>*.jks</code> 认证文件到 <code>/etc/tomcat8/www.keepfight.cn.jks</code> 下，</p>
<p>启用被注释的下方元素</p>
<pre><code class="language-xml">    &lt;!-- Define a SSL/TLS HTTP/1.1 Connector on port 8443
         This connector uses the NIO implementation that requires the JSSE
         style configuration. When using the APR/native implementation, the
         OpenSSL style configuration is required as described in the APR/native
         documentation --&gt;
    &lt;Connector port=&quot;8443&quot; protocol=&quot;org.apache.coyote.http11.Http11NioProtocol&quot;
               maxThreads=&quot;150&quot; SSLEnabled=&quot;true&quot; scheme=&quot;https&quot; secure=&quot;true&quot;
               clientAuth=&quot;false&quot; sslProtocol=&quot;TLS&quot; 
               keystoreFile=&quot;/etc/tomcat8/www.keepfight.cn.jks&quot;
               keystorePass=&quot;&lt;这里是密码&gt;&quot;
    /&gt;
</code></pre>
<p>重启服务器，使配置生效。</p>
<p>这里只能使用 <code>https://域名:8443</code> 访问，为了能默认端口 <code>443</code> 使用访问，使用如下方式转发：</p>
<pre><code class="language-bash">sudo /sbin/iptables -t nat -I PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 8443
</code></pre>
<h2>netease clode music</h2>
<pre><code>wget http://s1.music.126.net/download/pc/netease-cloud-music_1.0.0-2_amd64_ubuntu16.04.deb
sudo apt install ./netease-cloud-music_1.0.0-2_amd64_ubuntu16.04.deb
</code></pre>
<h2>sshd</h2>
<pre><code class="language-bash">sudo apt-get install openssh-server
</code></pre>
<h2>other</h2>
<ol>
<li>just add add printer!</li>
<li>close bluetooth</li>
</ol>
