<%--
  User: tom
  Date: 2017/9/21
  Time: 10:47
--%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <tiles:insertAttribute name="head"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/note.css"/>">
</head>
<body>
<tiles:insertAttribute name="nav"/>
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <section id="main">
                <div class="container-fluid df-body-section not-left-margin">
                    <div class="center-pane">
                        <div class="info-pane">
                            <div class="panel panel-success">
                                <div class="panel-heading">跳转信息</div>
                                <div class="panel-body">${msg}</div>
                                <div class="panel-footer">两秒后自动跳转，如无法跳转，点击<a href="<c:url value="${url}"/>">这里</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
<script type="application/javascript">
    function delayer() {
        window.location = "<c:url value="${url}"/>";
    }
    $(document).ready(function () {
        setTimeout('delayer()', 1000);
        //这里实现延迟5秒跳转
    });
</script>
</body>