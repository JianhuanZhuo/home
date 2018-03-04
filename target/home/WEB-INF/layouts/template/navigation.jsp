<%--
  Created by IntelliJ IDEA.
  User: tom
  Date: 2017/9/20
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="application/javascript">
    /**
     * JavaScript脚本实现回到页面顶部示例
     * @param acceleration 速度
     * @param stime 时间间隔 (毫秒)
     **/
    function gotoTop(acceleration, stime) {
        acceleration = acceleration || 0.1;
        stime = stime || 10;
        var x1 = 0;
        var y1 = 0;
        var x2 = 0;
        var y2 = 0;
        if (document.documentElement) {
            x1 = document.documentElement.scrollLeft || 0;
            y1 = document.documentElement.scrollTop || 0;
        }
        if (document.body) {
            x2 = document.body.scrollLeft || 0;
            y2 = document.body.scrollTop || 0;
        }

        // 滚动条到页面顶部的水平距离
        var x = Math.max(x1, Math.max(x2, window.scrollX || 0));
        // 滚动条到页面顶部的垂直距离
        var y = Math.max(y1, Math.max(y2, window.scrollY || 0));

        // 滚动距离 = 目前距离 / 速度, 因为距离原来越小, 速度是大于 1 的数, 所以滚动距离会越来越小
        var speeding = 1 + acceleration;
        window.scrollTo(Math.floor(x / speeding), Math.floor(y / speeding));

        // 如果距离不为零, 继续调用函数
        if (x > 0 || y > 0) {
            var run = "gotoTop(" + acceleration + ", " + stime + ")";
            window.setTimeout(run, stime);
        }
    }

</script>

<div id="floating_ck">
    <div v-if="seen" class="floating_ck" v-bind:class="{ hidden: isActive }">
        <dl>
            <dt></dt>
            <dd class="consult">
                <span><spring:message code="navigation.english"/></span>
                <div class="floating_left">
                    <a id="english" style="line-height: 40px" href="#">For English Users</a>
                    <br>
                    <a id="chinese" style="line-height: 40px" href="#">中文页面</a>
                </div>
            </dd>
            <dd class="words">
                <span><spring:message code="navigation.qq-inline"/></span>
                <div class="floating_left">
                    <a target="_blank" :href="'http://wpa.qq.com/msgrd?v=3&site=qq&menu=yes&uin='+qq">
                        <spring:message code="navigation.qq-line_content"/>
                    </a>
                </div>
            </dd>
            <dd class="quote">
                <span><spring:message code="navigation.take-quoted"/></span>
                <div class="floating_left">
                    <a target="_blank" :href="'http://wpa.qq.com/msgrd?v=3&site=qq&menu=yes&uin='+qq">
                        <spring:message code="navigation.take-quoted_content"/>
                    </a>
                </div>
            </dd>
            <dd class="qrcord">
                <span><spring:message code="navigation.scan"/></span>
                <div class="floating_left floating_ewm">
                    <img width="185px" height="185px" :src="qrcode"/>
                    <p class="qrcord_p01"><spring:message code="navigation.scan_content"/></p>
                    <p class="qrcord_p02"><spring:message code="navigation.scan_tel"/><br><b>{{right_phone}}</b></p>
                </div>
            </dd>
            <dd class="return">
                <span onClick="gotoTop();return false;"><spring:message code="navigation.top"/></span>
            </dd>
            <dd class="hid">
                <span v-on:click="seen = !seen"><spring:message code="navigation.hidden"/></span>
            </dd>
        </dl>
    </div>

    <div v-else id="showdiv" class="showdiv" v-on:click="seen = !seen"></div>
</div>
<script type="application/javascript">
    var ps = location.href.split("?")[1];
    if (!ps) {
        ps = '';
    }
    ps = ps.replace("&language=en", "");
    ps = ps.replace("&language=zh", "");
    document.getElementById("english").href = "?" + ps + "&language=en";
    document.getElementById("chinese").href = "?" + ps + "&language=zh";
    $(function () {
        var floating_ck = new Vue({
            el: '#floating_ck',
            data: {
                isActive: true,
                qq: '',
                qrcode: '',
                right_phone: '',
                seen: true
            }
        });
        $(window).resize(function () {
            floating_ck.seen = ($(window).width() > 765);
        });
        floating_ck.seen = ($(window).width() > 765);
        $.getJSON({
            type: 'Get',
            url: "<c:url value="/api/side"/>",
            success: function (data) {
                floating_ck.qq = data.qq;
                floating_ck.qrcode = data.qrcode;
                floating_ck.right_phone = data.right_phone;
                floating_ck.isActive = false
            }
        });
    })
</script>
