<%--
  Created by IntelliJ IDEA.
  User: tom
  Date: 2018/2/10
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<div class="widget-wrap">
    <p class="widget-title">归档</p>
    <div class="widget">
        <ul class="archive-list">
            <jsp:include page="/resources/files/generatedPage/note_archive_list.jsp"/>
        </ul>
    </div>
</div>
