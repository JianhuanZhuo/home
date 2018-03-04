<%--
  Created by IntelliJ IDEA.
  User: tom
  Date: 2018/2/9
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <tiles:insertAttribute name="back_head"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/note.css"/>">
</head>
<body>
<tiles:insertAttribute name="back_nav"/>
<section class="container" id="back_body">
    <div class="row">
        <aside class="col-md-3">
            <tiles:insertAttribute name="back_slide"/>
        </aside>

        <section class="col-md-9" id="main">
            源文件夹管理
        </section>
    </div>
</section>
<tiles:insertAttribute name="foot"/>
</body>
</html>
