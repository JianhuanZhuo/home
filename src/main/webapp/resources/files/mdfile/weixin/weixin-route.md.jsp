<%@ page contentType="text/html; charset=UTF-8" %><p>参考：[微信小程序 页面路由]<a href="https://www.w3cschool.cn/weixinapp/route.html()">https://www.w3cschool.cn/weixinapp/route.html()</a></p>
<h2>页面栈</h2>
<table>
<thead>
<tr><th>路由方式</th><th>页面栈表现</th></tr>
</thead>
<tbody>
<tr><td>初始化</td><td>新页面入栈</td></tr>
<tr><td>打开新页面</td><td>新页面入栈</td></tr>
<tr><td>页面重定向</td><td>当前页面出栈，新页面入栈</td></tr>
<tr><td>页面返回</td><td>页面不断出栈，直到目标返回页，新页面入栈</td></tr>
<tr><td>Tab 切换</td><td>页面全部出栈，只留下新的 Tab 页面</td></tr>
<tr><td>重加载</td><td>页面全部出栈，只留下新的页面</td></tr>
</tbody>
</table>
<table>
<thead>
<tr><th>路由方式</th><th>触发时机</th><th>路由前页面</th><th>路由后页面</th></tr>
</thead>
<tbody>
<tr><td>初始化</td><td>小程序打开的第一个页面</td><td></td><td>onLoad, onSHow</td></tr>
<tr><td>打开新页面</td><td>调用 API wx.navigateTo 或使用组件 <code>&lt;navigator open-type=&quot;navigateTo&quot;/&gt;</code></td><td>onHide</td><td>onLoad, onShow</td></tr>
<tr><td>页面重定向</td><td>调用 API wx.redirectTo 或使用组件 <code>&lt;navigator open-type=&quot;redirectTo&quot;/&gt;</code></td><td>onUnload</td><td>onLoad, onShow</td></tr>
<tr><td>页面返回</td><td>调用 API wx.navigateBack 或使用组件 <code>&lt;navigator open-type=&quot;navigateBack&quot;&gt;</code> 或用户按左上角返回按钮</td><td>onUnload</td><td>onShow</td></tr>
<tr><td>Tab 切换</td><td>调用 API wx.switchTab 或使用组件 <code>&lt;navigator open-type=&quot;switchTab&quot;/&gt;</code> 或用户切换 Tab</td><td></td><td>各种情况请参考下表</td></tr>
<tr><td>重启动</td><td>调用 API wx.reLaunch 或使用组件 <code>&lt;navigator open-type=&quot;reLaunch&quot;/&gt;</code></td><td>onUnload</td><td>onLoad, onShow</td></tr>
</tbody>
</table>
<p><code>navigateTo</code>，<code>redirectTo</code> 只能打开非 tabBar 页面。
switchTab 只能打开 tabBar 页面。
reLaunch 可以打开任意页面。
页面底部的 tabBar 由页面决定，即只要是定义为 tabBar 的页面，底部都有 tabBar。
调用页面路由带的参数可以在目标页面的onLoad中获取。</p>
<p><code>getCurrentPages()</code> 函数用于获取当前页面栈的实例，以数组形式按栈的顺序给出，第一个元素为首页，最后一个元素为当前页面。</p>
