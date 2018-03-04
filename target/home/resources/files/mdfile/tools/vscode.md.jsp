<%@ page contentType="text/html; charset=UTF-8" %><p>详细参考：
<a href="https://code.visualstudio.com/docs/getstarted/keybindings">Key Bindings for Visual Studio Code</a></p>
<p>查看快捷键绑定情况</p>
<p>菜单在项在：
File &gt; Preferences &gt; Keyboard Shortcuts （快捷键为 Ctrl+K Ctrl+S）</p>
<p>更改快捷键映射，全部换，</p>
<ul>
<li><a href="https://marketplace.visualstudio.com/items?itemName=vscodevim.vim">Vim 快捷键</a></li>
<li><a href="https://marketplace.visualstudio.com/items?itemName=ms-vscode.sublime-keybindings">Sublime 快捷键</a></li>
<li><a href="https://marketplace.visualstudio.com/items?itemName=ms-vscode.atom-keybindings">Atom 快捷键</a></li>
<li><a href="https://ms-vscode.gallerycdn.vsassets.io/extensions/ms-vscode/vs-keybindings/0.1.3/1483728766459/Microsoft.VisualStudio.Services.Icons.Default">Visual Studio</a></li>
</ul>
<p>使用 JSON 进行分发</p>
<pre><code class="language-json">{ &quot;key&quot;: &quot;home&quot;,            &quot;command&quot;: &quot;cursorHome&quot;,                  &quot;when&quot;: &quot;editorTextFocus&quot; },
{ &quot;key&quot;: &quot;shift+home&quot;,      &quot;command&quot;: &quot;cursorHomeSelect&quot;,            &quot;when&quot;: &quot;editorTextFocus&quot; },

// Keybindings that are complementary
{ &quot;key&quot;: &quot;f5&quot;,              &quot;command&quot;: &quot;workbench.action.debug.continue&quot;, &quot;when&quot;: &quot;inDebugMode&quot; },
{ &quot;key&quot;: &quot;f5&quot;,              &quot;command&quot;: &quot;workbench.action.debug.start&quot;,    &quot;when&quot;: &quot;!inDebugMode&quot; },

// Global keybindings
{ &quot;key&quot;: &quot;ctrl+f&quot;,          &quot;command&quot;: &quot;actions.find&quot; },
{ &quot;key&quot;: &quot;alt+left&quot;,        &quot;command&quot;: &quot;workbench.action.navigateBack&quot; },
{ &quot;key&quot;: &quot;alt+right&quot;,       &quot;command&quot;: &quot;workbench.action.navigateForward&quot; },

// Global keybindings using chords (two separate keypress actions)
{ &quot;key&quot;: &quot;ctrl+k enter&quot;,    &quot;command&quot;: &quot;workbench.action.keepEditor&quot; },
{ &quot;key&quot;: &quot;ctrl+k ctrl+w&quot;,   &quot;command&quot;: &quot;workbench.action.closeAllEditors&quot; },
</code></pre>
<p>自上而下的检索，而用户的<code>User/keybindings.json</code>会自动加在规则最下面</p>
<h2>VSCode 回退英文版</h2>
<p>参考<a href="https://code.visualstudio.com/docs/getstarted/locales">官方文档</a></p>
<ol>
<li>快捷键 <code>Command+Shift+P</code>（Win下为Control） 打开命令行工具，</li>
<li>输入<code>设置语言 Configure Language</code>，会打开一个 <code>locale.json</code> 的文件</li>
<li><code>&quot;locale&quot;:&quot;zh-cn&quot;</code> 修改为 <code>&quot;locale&quot;:&quot;en-US&quot;</code></li>
<li>重启 VSCode。</li>
</ol>
<h2>扩展文件关联</h2>
<p>在 <code>emmet.syntaxProfiles</code> 条目下进行设置</p>
<pre><code class="language-json">{
    &quot;files.associations&quot;: {
        // 对 .wxml 后缀的文件应用 HTML 语法
        &quot;*.wxss&quot;: &quot;css&quot;,
        &quot;*.wxml&quot;: &quot;html&quot;
    }
}
</code></pre>
<h2>在其他文件类型启用 emmet</h2>
<pre><code class="language-json">{
    &quot;emmet.syntaxProfiles&quot;: {
        &quot;wxml&quot;:&quot;html&quot;
    }
}
</code></pre>
