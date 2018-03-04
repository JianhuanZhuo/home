<%--
  Created by IntelliJ IDEA.
  User: tom
  Date: 2018/2/10
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<div class="list-group list-group-root">
    <a href="<c:url value="/backend/note/"/>" class="list-group-item active">笔记管理</a>
    <a href="<c:url value="/backend/note/folder"/>" class="list-group-item">源文件夹管理</a>
    <a href="#item-2" class="list-group-item" data-toggle="collapse"> Item 2 </a>
    <div class="list-group collapse sub-list-group" id="item-2">
        <a href="#" class="list-group-item"> Item 2.1 </a>
        <a href="#" class="list-group-item"> Item 2.2 </a>
        <a href="#" class="list-group-item"> Item 12.3 </a>
    </div>
</div>
