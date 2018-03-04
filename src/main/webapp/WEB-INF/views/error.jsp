
<%--
  User: tom
  Date: 2017/9/21
  Time: 10:47
--%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <tiles:insertAttribute name="head"/>
</head>
<body>
<tiles:insertAttribute name="nav"/>
<div class="container-fluid page-full-height">
    <div class="center-pane">
        <div class="info-pane flex-center flex-col">
            <img src="<c:url value="/resources/images/404.png"/>">
            <p class="text-center">其实是错误了</p>
        </div>
    </div>
</div>
<tiles:insertAttribute name="foot"/>
</body>