<%@ page contentType="text/html; charset=UTF-8" %><h2>全局配置</h2>
<p><code>app.json</code> 文件来对微信小程序进行全局配置，决定页面文件的路径、窗口表现、设置网络超时时间、设置多 tab 等。</p>
<pre><code class="language-json">{
    // 必填，页面配置，字符串数组，【路径+文件名】代表一个页面
    // 第一项被设定为小程序的初始页面
    &quot;pages&quot;: [
        &quot;pages/index/index&quot;,
        &quot;pages/logs/index&quot;
    ],
    // 可选，设置默认页面的窗口表现
    &quot;window&quot;: {
        // 导航栏背景颜色
        &quot;navigationBarBackgroundColor&quot;:&quot;#000000&quot;,
        // 导航栏标题颜色，仅支持 black/white
        &quot;navigationBarTextStyle&quot;: &quot;white&quot;,
        // 导航栏标题文字内容
        &quot;navigationBarTitleText&quot;: &quot;Demo&quot;,
        // 窗口的背景色
        &quot;backgroundColor&quot;:&quot;#ffffff&quot;,
        // 下拉背景字体、loading 图的样式，仅支持 dark/light
        &quot;backgroundTextStyle&quot;:&quot;dark&quot;,
        // 是否开启下拉刷新，默认值为 false
        &quot;enablePullDownRefresh&quot;: false,
    },
    // 可选，设置底部 tab 的表现
    &quot;tabBar&quot;: {
        // 必填，tab 上的文字默认颜色
        &quot;color&quot; : &quot;#dddddd&quot;,
        // 必填，tab 上的文字选中时的颜色
        &quot;selectedColor&quot; : &quot;#3cc51f&quot;,
        // 必填，tab 的背景色
        &quot;backgroundColor&quot; : &quot;black&quot;,
        // 可选，tabbar上边框的颜色，仅支持 black/white，默认为 black
        &quot;borderStyle&quot; : &quot;black&quot;,
        // 可选，可选值 bottom、top，默认 bottom
        // 当设置 position 为 top 时，将不会显示 icon
        &quot;position&quot; : &quot;black&quot;,
        // 必填，tab 的列表
        // tabBar 是一个数组，只能配置最少2个、最多5个 tab，tab 按数组的顺序排序。
        &quot;list&quot;: [
            {
                // 必填，页面路径，必须在 pages 中先定义
                &quot;pagePath&quot;: &quot;pages/index/index&quot;,
                // 必填，tab 上按钮文字
                &quot;text&quot;: &quot;首页&quot;,
                // 可选，图片路径，icon 大小限制为40kb，
                // 建议尺寸为 81px * 81px，当 postion 为 top 时，此参数无效
                &quot;iconPath&quot;: &quot;pages/images/home.png&quot;,
                // 可选，选中时的图片路径
                &quot;selectedIconPath&quot;: &quot;pages/images/home_select.png&quot;
            },
            {
                &quot;pagePath&quot;: &quot;pages/logs/logs&quot;,
                &quot;text&quot;: &quot;日志&quot;
            }
        ]
    },
    // 可选，设置网络超时时间
    &quot;networkTimeout&quot;: {
        // wx.request 的超时时间，单位毫秒
        &quot;request&quot;: 10000,
        // wx.connectSocket 的超时时间，单位毫秒
        &quot;connectSocket&quot;: 10000,
        // wx.uploadFile 的超时时间，单位毫秒
        &quot;uploadFile&quot;: 10000,
        // wx.downloadFile 的超时时间，单位毫秒
        &quot;downloadFile&quot;: 10000
    },
    // 可选，设置是否开启 debug 模式
    // 在开发者工具的控制台面板，调试信息以 info 的形式给出
    &quot;debug&quot;: true
}
</code></pre>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\weixin\2017-08-04-21-03-09.png" alt="window 示例" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\weixin\2017-08-04-21-03-36.png" alt="tabBar 示例" /></p>
<h2>页面配置</h2>
<p>每一个小程序页面也可以使用 <code>.json</code> 文件来对本页面的窗口表现进行配置。页面的配置比 <code>app.json</code> 全局配置简单得多，只是设置 <code>app.json</code> 中的 <code>window</code> 配置项的内容，页面中配置项会覆盖 <code>app.json</code> 的 <code>window</code> 中相同的配置项。</p>
<pre><code class="language-json">{
    // 本页面导航栏背景颜色
    &quot;navigationBarBackgroundColor&quot;:&quot;#000000&quot;,
    // 本页面导航栏标题颜色，仅支持 black/white
    &quot;navigationBarTextStyle&quot;: &quot;white&quot;,
    // 本页面导航栏标题文字内容
    &quot;navigationBarTitleText&quot;: &quot;Demo&quot;,
    // 本页面窗口的背景色
    &quot;backgroundColor&quot;:&quot;#ffffff&quot;,
    // 本页面下拉背景字体、loading 图的样式，仅支持 dark/light
    &quot;backgroundTextStyle&quot;:&quot;dark&quot;,
    // 本页面是否开启下拉刷新，默认值为 false
    &quot;enablePullDownRefresh&quot;: false,
    // 本页面设置上下滚动；只在 page.json 中有效，无法在 app.json 中设置该项
    &quot;disableScroll&quot;: false,
}
</code></pre>
