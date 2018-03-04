<%@ page contentType="text/html; charset=UTF-8" %><p>文本文件下存储了批量 Linux 命令集合</p>
<p>第一行指定哪个程序用来编译和执行的</p>
<blockquote>
<p>#!/bin/bash</p>
</blockquote>
<p>以 <code>#</code> 作为注释符号</p>
<p>变量命名。变量名必须字母或下划线开头，后面可以跟字母、数字和下划线，其他字符都标志变量名的结束。大小写敏感</p>
<blockquote>
<p>name=tom
不要写空格，使用<code>$</code>引用，即<code>$name</code>或<code>${name}</code>，对应的 <code>$(date)</code> 是引用命令的写法</p>
</blockquote>
<p>根据变量的作用域，变量可以分为本地变量和环境变量。
全局环境变量、用户环境变量，如<code>.bash_profile</code></p>
<p>要给变量赋空值，可以在等号后面跟一个换行符</p>
<p>清除变量</p>
<blockquote>
<p>unset &lt;variable&gt;</p>
</blockquote>
<p>显示所有变量</p>
<blockquote>
<p>set</p>
</blockquote>
<p>环境变量按惯例大写</p>
<blockquote>
<p>export LANG</p>
</blockquote>
<p>注意：可被所有的 Shell 环境下访问
如果父 Shell 进程产生了 子 Shell 进程，则环境变量可被 继承并复制。</p>
<table>
<thead>
<tr><th>参数</th><th>说明</th></tr>
</thead>
<tbody>
<tr><td>$0</td><td>当前脚本文件名</td></tr>
<tr><td>$1-$9</td><td>第1到第9个参数位置参量</td></tr>
<tr><td>${10}</td><td>第10个位置参量，10以上类似</td></tr>
<tr><td>$#</td><td>位置参量个数</td></tr>
<tr><td>$*</td><td>以单字符串显示所有位置参量</td></tr>
<tr><td>$@</td><td>未加双引号时与 $* 含义相同，加双引号时有区别</td></tr>
<tr><td>$$</td><td>表示脚本当前的进程号</td></tr>
<tr><td>$!</td><td>最后一个后台允许的进程的进程号</td></tr>
<tr><td>$?</td><td>显示当前最后一个命令的退出状态，0表示没有错误，其他任何值表示有错误。</td></tr>
</tbody>
</table>
<p>如果未知参数中有空格，需要用双引号，或单引号，其中的区别是：</p>
<ul>
<li>双引号内特殊字符保留其特性，对于特殊字符可用 <code>\</code> 进行转义</li>
<li>单引号内全部视为普通字符串</li>
<li>反单引号 <code>`</code> 包起来的字符串则将视为命令，并先于包括它的命令字符串执行。</li>
</ul>
<p>如下是一个例子：</p>
<pre><code class="language-bash">tom@k8:/bin$ echo '$HOSTNAME'
$HOSTNAME
tom@k8:/bin$ echo &quot;$HOSTNAME&quot;
k8
tom@k8:/bin$ echo &quot;\$HOSTNAME&quot;
$HOSTNAME
tom@k8:/bin$ ls -l `locate crontab`
-rw-r--r-- 1 root root      722 Jun 20  2012 /etc/crontab
-rwxr-sr-x 1 root crontab 35896 Jun 20  2012 /usr/bin/crontab
</code></pre>
<p>执行</p>
<blockquote>
<p>./test.sh
. test.sh
sh test.sh</p>
</blockquote>
<p>if[ $? != 0];then
exit 1
fi</p>
<p>定义数组：
arr=(one two three)
引用：</p>
<pre><code class="language-bash">tom@k8:~$ arr=(one two three)
tom@k8:~$ echo ${arr[*]}
one two three
tom@k8:~$ echo ${arr[0]}
one
tom@k8:~$ echo ${arr[1]}
two
tom@k8:~$ echo ${arr[2]}
three
tom@k8:~$ echo ${#arr[*]}
3
tom@k8:~$ arr[0]=tom
tom@k8:~$ echo $arr[0]
tom[0]
</code></pre>
<p>date 命令</p>
<pre><code class="language-bash">tom@k8:~$ date
Tue Apr 25 23:16:57 CST 2017
</code></pre>
<p>查看日历
cal 2019
cal 12 2016</p>
<p>查看某个文件是否存在</p>
<blockquote>
<p>test -e filename</p>
</blockquote>
<ol>
<li>-e 是否存在 exist</li>
<li>-f 是否存在且为文件 file</li>
<li>-d 是否存在且为目录 directory</li>
<li>-r 是否存在且为可读</li>
<li>-w 是否存在且为可写</li>
<li>-x 是否存在且为可执行</li>
</ol>
<p>关于两个整数之间的判断</p>
<blockquote>
<p>test n1 -eq n2</p>
</blockquote>
<ol>
<li>-eq 两数值是否相等</li>
<li>-ne 两数值是否不等</li>
<li>-gt n1 大于 n2</li>
<li>-lt n1 小于 n2</li>
<li>-ge n1 大于等于 n2</li>
<li>-le n1 小于等于 n2</li>
</ol>
<p>关于字符串的判断</p>
<blockquote>
<p>test -z string</p>
</blockquote>
<ol>
<li>test -z string 判断字符串是否为 0</li>
<li>test -n string 判断字符串是否为非 0，-n 可以省略</li>
<li>test str1 = str2 判断 str1 是否等于 str2</li>
<li>test str1 != str2 判断 str1 是否不等于 str2</li>
</ol>
<pre><code class="language-bash">if [-f &quot;${HADOOP_CONF_DIR}/hadoop-env.sh&quot; ]; then
    . &quot;${HADOOP_CONF_DIR}/hadoop-env.sh&quot;
fi

if [ ! -w &quot;$HADOOP_LOG_DIR&quot; ] ; then
    mkdir -p &quot;$HADOOP_LOG_DIR&quot;
    chwon $HADOOP_IDENT_STRING $HADOOP_LOG_DIR
fi
</code></pre>
<p>注意，除了 test 命令之外可以使用中括号 <code>[</code> 和 <code>]</code> 进行判断，由于中括号可用于正则表达式和通配符，所以在 bash 语法中使用中括号作为 shell 的判断式的话，应该在中括号的两端加空格符。如上。</p>
<p>多个条件使用 <code>||</code> 或 <code>&amp;&amp;</code> 进行连接。</p>
<pre><code class="language-bash">if[ &quot;$y&quot; == &quot;Y&quot; ] || [ &quot;&amp;X&quot; == &quot;X&quot; ] ; then
    echo &quot;OK&quot;
fi
</code></pre>
<p>多重判断</p>
<pre><code class="language-bash">if [ 条件判断式一 ] ; then
    指令一
elif [ 条件判断式二 ] ; then
    指令二
else
    指令三
fi
</code></pre>
<h3>循环</h3>
<p>循环</p>
<pre><code class="language-bash">for var in 1 2 3 4 5
do
    echo ${var}
done

### 另外还有一种方式
sum=0
strcat=&quot;s&quot;
for((i=0;i&lt;10;i=i+1))
do
    ### 这个是加数字
    sum=$(({${i}+${sum}}))
    ### 这个字符拼接
    strcat=${strcat}+$i
done
</code></pre>
<p>while 不定循环</p>
<pre><code class="language-bash">while [ condition ]
do
    程序循环段
done
</code></pre>
<p>until 循环</p>
<pre><code class="language-bash">until [ condition]
do
    程序循环段
done
</code></pre>
<p>案例：从文件中逐行读入</p>
<pre><code class="language-bash">cat file | while read line
do
    echo $line
done

### 或者
cat `list ./xx.txt` | while read line
do
    echo $line
done
</code></pre>
<h3>wget 按列表读取</h3>
<p>一个简单用法是：</p>
<blockquote>
<p>wget -l list.txt</p>
</blockquote>
<p>无法自定义读下来的文件的输出名字，解决如下</p>
<pre><code class="language-bash">#!/bin/bash
a=1
while read item
do
    echo &quot;start&quot; ${a}
    wget -nc $item -O &quot;redis&quot;$a &amp; #加&amp;符使其后台并行下载，大写 `-O` 指定文件名，小写 `-o` 指定输出日志
    let &quot;a++&quot;
done &lt; $1
</code></pre>
<p>用法是：<code>. downByList.sh downLoadFileList.txt</code></p>
<pre><code class="language-bash">${HADOOP_SLAVES:-${HADOOP_CONF_DIR}/slaves}
### 若 HADOOP_SLAVES 不存在则使用 `:-` 后面的值，即默认值 ${HADOOP_CONF_DIR}/slaves
</code></pre>
