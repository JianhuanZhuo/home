<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tom
  Date: 2017/11/20
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<div class="container-fluid bg-info">
    <div class="text-center">粤ICP备18017360号</div>
</div>

<script src="<c:url value="/resources/js/tether.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
<script src="<c:url value="/resources/js/vue.js"/>"></script>

<script type="application/javascript">
    $.ajax({
        type: "POST",
        url: '<c:url value="/api/tips"/>',
        contentType: 'application/json;charset=utf-8',//指定为json类型
        success: function (tips) {//返回json结果
            if (tips['newMsgsNum'] !== 0) {
                console.log("xxx");
                $("#newMsgsNum").show();
            }
        }
    });

    function extractContent(s, len) {
        var span = document.createElement('span');
        span.innerHTML = s;
        return (span.textContent || span.innerText).substr(0, len ? len : 40);
    }
</script>


<%--<script type="application/javascript">--%>
<%--$(function () {--%>
<%--var my_vue_footer = new Vue({--%>
<%--el: '#my_vue_footer',--%>
<%--data: {--%>
<%--isActive: true,--%>
<%--right_phone: '',--%>
<%--phone: '',--%>
<%--fax: '',--%>
<%--email: '',--%>
<%--addr: ''--%>
<%--}--%>
<%--});--%>
<%--$.getJSON({--%>
<%--type: 'Get',--%>
<%--url: "<c:url value="/api/side"/>",--%>
<%--success: function (data) {--%>
<%--my_vue_footer.right_phone = data.right_phone;--%>
<%--my_vue_footer.phone = data.phone;--%>
<%--my_vue_footer.fax = data.fax;--%>
<%--my_vue_footer.email = data.email;--%>
<%--my_vue_footer.addr = data.addr;--%>
<%--my_vue_footer.isActive = false;--%>
<%--}--%>
<%--});--%>
<%--})--%>
<%--</script>--%>