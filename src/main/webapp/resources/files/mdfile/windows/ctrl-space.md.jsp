<%@ page contentType="text/html; charset=UTF-8" %><p>参考：<a href="https://superuser.com/questions/327479/ctrl-space-always-toggles-chinese-ime-windows-7">CTRL-Space always toggles Chinese IME</a></p>
<p>直接修改控制面板的语言处无效。</p>
<p>解决方法：</p>
<ol>
<li>打开注册表编辑器</li>
<li>修改 <code>HKEY_CURRENT_USER/Control Panel/Input Method/Hot Keys</code> 为当前用户修改注册表，也可以为全部用户修改。</li>
<li>选择 <code>00000010</code> 简体中文的，修改 <code>Key Modifiers</code> 02c00000 为 00c00000，修改 <code>Virtual Key</code> 20000000 为 FF000000。</li>
<li>重新登录即可，无需重启。</li>
</ol>
