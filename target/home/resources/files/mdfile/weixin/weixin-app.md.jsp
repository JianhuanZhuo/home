<%@ page contentType="text/html; charset=UTF-8" %><h2>app.js</h2>
<p><code>App()</code> 函数用来注册一个小程序。接受一个object参数，其指定小程序的生命周期函数等。
<code>App()</code> 必须在app.js中注册，且不能注册多个。</p>
<pre><code class="language-js">// 不要在定义于 App() 内的函数中调用 getApp()，使用 this 就可以拿到 app 实例。
App({
    // 生命周期函数--监听小程序初始化
    onLaunch: function (options) {
        // Do something initial when launch.
        // 不要在 onLaunch 的时候调用 getCurrentPage()，此时 page 还没有生成。
    },
    // 生命周期函数--监听小程序显示
    onShow: function (options) {
        // Do something when show.
    },
    // 生命周期函数--监听小程序隐藏
    onHide: function () {
        // Do something when hide.
    },
    // 错误监听函数，小程序发生脚本错误，或者 api 调用失败时，会触发 onError 并带上错误信息
    onError: function (msg) {
        console.log(msg)
    },
    // 可选的附加其他全局数据，以自定义属性绑定的方式
    globalData: 'I am global data'
})
</code></pre>
<p>这里的 <code>onLaunch</code>、<code>onShow</code> 参数 <code>options</code> 有如下字段：</p>
<table>
<thead>
<tr><th>字段</th><th>类型</th><th>说明</th></tr>
</thead>
<tbody>
<tr><td>path</td><td>String</td><td>打开小程序的路径</td></tr>
<tr><td>query</td><td>Object</td><td>打开小程序的query</td></tr>
<tr><td>scene</td><td>Number</td><td>打开小程序的场景值</td></tr>
<tr><td>shareTicket</td><td>String</td><td>shareTicket，详见 获取更多转发信息</td></tr>
<tr><td>referrerInfo</td><td>Object</td><td>当场景为由另一个小程序打开时，返回此字段</td></tr>
<tr><td>referrerInfo.appId</td><td>String</td><td>来源小程序的 appId</td></tr>
<tr><td>referrerInfo.extraData</td><td>Object</td><td>来源小程序传过来的数据</td></tr>
</tbody>
</table>
<h2>other.js</h2>
<p>在其他页面中</p>
<pre><code class="language-js">//index.js
Page({
    // 页面的初始数据，在视图中可直接获得这些数据绑定，和 Angularjs 的 MVC 结构很像
    // 这些数据应该使用 Page.prototype.setData() 进行设置
    // 如：this.setData({ text:'changed data', 'msg_arr[0].msg':'changed data', 'newField.text':'new data'})
    data: {
        text: &quot;This is page data.&quot;,
        msg_arr: [{msg: '1'}, {msg: '2'}]
    },

    // 生命周期函数--监听页面加载
    // 一个页面只会调用一次，可以在 onLoad 中获取打开当前页面所调用的 query 参数。
    onLoad: function (options) {
        // Do some initialize when page load.
    },

    // 生命周期函数--监听页面初次渲染完成
    // 一个页面只会调用一次，代表页面已经准备妥当，可以和视图层进行交互。
    onReady: function () {
        // Do something when page ready.
    },

    // 页面显示，每次打开页面都会调用一次。
    onShow: function () {
        // Do something when page show.
    },

    // 页面隐藏，当 navigateTo 或底部 tab 切换时调用。
    onHide: function () {
        // Do something when page hide.
    },

    // 页面卸载，当 redirectTo 或 navigateBack 的时候调用。
    onUnload: function () {
        // Do something when page close.
    },


    // 页面相关事件处理函数--监听用户下拉动作
    // 需要开启 enablePullDownRefresh
    // 处理完成后调用 wx.stopPullDownRefresh 停止刷新
    onPullDownRefresh: function () {
        // Do something when pull down.
    },

    // 页面上拉触底事件的处理函数
    onReachBottom: function () {
        // Do something when page reach bottom.
    },

    // 用户点击右上角转发事件
    // 只有定义了此事件处理函数，右上角菜单才会显示“转发”按钮
    // 此事件需要 return 一个 Object，用于自定义转发内容
    onShareAppMessage: function () {
        // return custom share data when user share.
        return {
            // 转发标题，默认当前小程序名称
            title: '自定义转发标题',
            // 转发路径，默认当前页面 path ，必须是以 / 开头的完整路径
            path: '/page/user?id=123'
        }
    },

    // 监听用户滑动页面事件。
    // 参数为 Number 类型，表示页面在垂直方向已滚动的距离（单位px）
    onPageScroll: function (scrollTop) {
        // Do something when page scroll
    },

    // Event handler.
    // 在渲染层使用 bindTap 绑定事件后使用
    // 如：&lt;view bindtap=&quot;viewTap&quot;&gt; click me &lt;/view&gt;
    viewTap: function () {
        this.setData({
            text: 'Set some data for updating view.'
        })
    },

    // 自定义函数和数据
    customData: {
        hi: 'MINA'
    }
})
</code></pre>
<p>视图层可以直接从 <code>data</code> 对象中获得数据，如上的例子的话：</p>
<pre><code class="language-html">&lt;view&gt;{{text}}&lt;/view&gt;
&lt;view&gt;{{array[0].msg}}&lt;/view&gt;
</code></pre>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\weixin\img\2017-08-04-22-12-23.png" alt="Page 实例的生命周期" /></p>
