<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%--
  Created by IntelliJ IDEA.
  User: 卓建欢
  Date: 2017/11/13
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>

<div class="list-group list-group-root">
    <a href="<c:url value="/about"/>" class="list-group-item">1</a>
    <a href="<c:url value="/about_elite"/>" class="list-group-item active">2</a>
    <a href="#item-1" class="list-group-item" data-toggle="collapse">Item 1</a>
    <div class="list-group collapse sub-list-group" id="item-1">
        <a href="#" class="list-group-item"> Item 1.1 </a>
        <a href="#" class="list-group-item"> Item 1.2 </a>
        <a href="#" class="list-group-item"> Item 1.3 </a>
    </div>
    <a href="#item-2" class="list-group-item" data-toggle="collapse"> Item 2 </a>
    <div class="list-group collapse sub-list-group" id="item-2">
        <a href="#" class="list-group-item"> Item 2.1 </a>
        <a href="#" class="list-group-item"> Item 2.2 </a>
        <a href="#" class="list-group-item"> Item 12.3 </a>
    </div>
    <%--<a href="<c:url value="/about_construct"/>" class="list-group-item"><spring:message code="about.manage"/></a>--%>
</div>
