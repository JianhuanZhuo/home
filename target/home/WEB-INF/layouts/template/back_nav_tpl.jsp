<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%--
  Created by IntelliJ IDEA.
  User: 卓建欢
  Date: 2017/11/13
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"> 小站后台管理系统 </a>
        </div>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="nav navbar-nav">
                <li role="presentation">
                    <a href="<c:url value="/"/>">主页</a>
                </li>
                <li><a href="<c:url value="/backend/note/"/> ">笔记管理</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">文章翻译 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
                <li><a href="#">工作</a></li>
                <li><a href="#">生活</a></li>
                <li><a href="#">资料中转</a></li>
                <li role="presentation">
                    <a href="<c:url value="/contract"/>"><spring:message
                            code="head.contract"/>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/"/>" style="padding-bottom: 5px;padding-top: 5px;">
                        <img style="display: inline; height: 40px" src="<c:url value="/resources/images/admin.jpg"/> "/>
                    </a>
                </li>
            </ul>
            <form class="navbar-form navbar-right" action="#">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit">站内查找</button>
                    </span>
                </div><!-- /input-group -->
            </form>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>