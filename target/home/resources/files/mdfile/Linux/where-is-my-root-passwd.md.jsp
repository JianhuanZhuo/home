<%@ page contentType="text/html; charset=UTF-8" %><p>由于工作室的工程机许久没用，忘记了 root 密码，故折腾了很久才找到解决方法，在此做一次记录。</p>
<!--more-->
<ol>
<li>重启机器，并进入 GRUB 引导模式；</li>
<li>选择 Ubuntu Advance；</li>
<li>光标选择 recovery mode，按 e 键进行编辑（而不是直接按此模式启动）；</li>
<li>在约倒数第四行**（不是最后一行）**：Linux /boot/vmlnuz-4.2.0-27-generic .......ro recovery nomodeset</li>
<li>修改 <code>recovery nomodeset</code> 为 <code>quiet splash rw init=/bin/bash</code></li>
<li>按 Ctrl + x 启动</li>
<li>进入 root mode 之后，输入 <code>passwd</code> 修改密码即可。</li>
</ol>
