<%--
  User: tom
  Date: 2017/9/20
  Time: 22:55
--%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><tiles:insertAttribute name="title"/></title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <%--<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>
    <%--<link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>">--%>
    <link rel="stylesheet" href="<c:url value="/resources/css/float_ck.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/theme.css"/>">
    <tiles:insertAttribute name="top_css"/>

    <%--<script src="<c:url value="/resources/js/tether.js"/>"></script>--%>
    <script src="<c:url value="/resources/js/jquery.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
    <script src="<c:url value="/resources/js/vue.js"/>"></script>
    <%--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>--%>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <%--<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>--%>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.10/vue.js"></script>--%>
    <%--顶部 js--%>
    <tiles:insertAttribute name="top_js"/>

    <script type="application/javascript">
        function extractContent(s, len) {
            var span = document.createElement('span');
            span.innerHTML = s;
            return (span.textContent || span.innerText).substr(0, len ? len : 40);
        }

        // 图片加载错误时，直接更换为默认的图片
        function imgError(image) {
            image.onerror = "";
            image.src = "<c:url value="/resources/images/load_error.jpg"/>";
            return true;
        }
        function ts() {
            return 1 + Date.now();
        }
    </script>
</head>
<body>
<%--<div class="_layout_header">--%>
<%--<tiles:insertAttribute name="header"/>--%>
<%--</div>--%>
<div class="container-fluid jh-header">
    <div class="container hidden-xs">
        <div class="jh-brand hidden-sm  hidden-xs">
            <img src="<c:url value="/resources/images/logo3.jpg"/>"/>
        </div>
        <div class="jh-nav-item <tiles:insertAttribute name="home_active"/>">
            <a href="<c:url value="/"/>"><spring:message code="header.home.h1.label"/></a>
        </div>
        <div class="jh-nav-item <tiles:insertAttribute name="about_active"/>">
            <a href="<c:url value="/about"/>"><spring:message code="header.about.h1.label"/></a>
        </div>
        <div class="jh-nav-item <tiles:insertAttribute name="products_active"/>">
            <a href="<c:url value="/products/"/>"><spring:message code="header.products.h1.label"/></a>
        </div>
        <div class="jh-nav-item <tiles:insertAttribute name="news_active"/>">
            <a href="<c:url value="/news/"/>"><spring:message code="header.news.h1.label"/></a>
        </div>
        <div class="jh-nav-item <tiles:insertAttribute name="videos_active"/>">
            <a href="<c:url value="/videos/"/>"><spring:message code="header.videos.h1.label"/></a>
        </div>
        <div class="jh-nav-item <tiles:insertAttribute name="contract_active"/>">
            <a href="<c:url value="/contract"/>"><spring:message code="header.contract.h1.label"/></a>
        </div>
    </div>
    <div class="container visible-xs">
            <nav class="navbar navbar-default" id="xs-navbar">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbarSupportedContent" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">深圳华克普缝纫机有限公司</a>
                    </div>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="jh-stack nav nav-pills nav-stacked">
                            <li role="presentation" class="<tiles:insertAttribute name="home_active"/>">
                                <a href="<c:url value="/"/>"><spring:message code="header.home.h1.label"/></a>
                            </li>
                            <li role="presentation" class="<tiles:insertAttribute name="about_active"/>">
                                <a href="<c:url value="/about"/>"><spring:message code="header.about.h1.label"/></a>
                            </li>
                            <li role="presentation" class="<tiles:insertAttribute name="products_active"/>">
                                <a href="<c:url value="/products/"/>"><spring:message
                                        code="header.products.h1.label"/></a>
                            </li>
                            <li role="presentation" class="<tiles:insertAttribute name="news_active"/>">
                                <a href="<c:url value="/news/"/>"><spring:message code="header.news.h1.label"/></a>
                            </li>
                            <li role="presentation" class="<tiles:insertAttribute name="videos_active"/>">
                                <a href="<c:url value="/videos/"/>"><spring:message code="header.videos.h1.label"/></a>
                            </li>
                            <li role="presentation" class="<tiles:insertAttribute name="contract_active"/>">
                                <a href="<c:url value="/contract"/>"><spring:message
                                        code="header.contract.h1.label"/></a>
                            </li>
                        </ul>
                    </div>
                </div><!-- /.container-fluid -->
            </nav>
    </div>
</div>
<div class="_layout_content">
    <tiles:insertAttribute name="content"/>
</div>
<div class="_layout_footer">
    <tiles:insertAttribute name="footer"/>
</div>

<tiles:insertAttribute name="navigation"/>

<tiles:insertAttribute name="bottom_js"/>
</body>
</html>