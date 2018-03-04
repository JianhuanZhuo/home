<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%--
  User: tom
  Date: 2017/9/20
  Time: 22:55
--%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>小站后台管理</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">

<link rel="stylesheet" href="<c:url value="/resources/css/theme.css"/>">

<link rel="stylesheet" href="<c:url value="/resources/css/back.css"/>">

<%--通用函数--%>
<script type="application/javascript">
    function extractContent(s, len) {
        var span = document.createElement('span');
        span.innerHTML = s;
        return (span.textContent || span.innerText).substr(0, len ? len : 40);
    }

    // 图片加载错误时，直接更换为默认的图片
    function imgError(image) {
        image.onerror = "";
        image.src = "<c:url value="/resources/images/img_load_error.jpg"/>";
        return true;
    }
    function ts() {
        return 1 + Date.now();
    }
</script>