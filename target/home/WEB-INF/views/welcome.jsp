<%--
  Created by IntelliJ IDEA.
  User: tom
  Date: 2017/9/20
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <tiles:insertAttribute name="head"/>
</head>
<body>
<tiles:insertAttribute name="nav"/>

<h1>welcome</h1>
<tiles:insertAttribute name="test"/>
<tiles:insertAttribute name="foot"/>
</body>
</html>