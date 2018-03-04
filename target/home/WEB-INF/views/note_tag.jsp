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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="zh">
<head>
    <title>Tag: python | 卓建欢's PersonalPage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="JianhuanZhuo's Blog">
    <meta property="og:type" content="website">
    <meta property="og:title" content="卓建欢的个人小站">
    <meta property="og:url" content="http://yoursite.com/tags/python/index.html">
    <meta property="og:site_name" content="卓建欢的个人小站">
    <meta property="og:description" content="JianhuanZhuo's Personal Page">
    <meta name="twitter:card" content="summary">
    <meta name="twitter:title" content="卓建欢的个人小站">
    <meta name="twitter:description" content="JianhuanZhuo's Personal Page">
    <tiles:insertAttribute name="head"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/note.css"/>">


</head>
<body>
<tiles:insertAttribute name="nav"/>
<%--主题大景--%>
<section class="container-fluid nav-wall jh-center hidden-xs notes">
    <div class="container head-title">
        <h3 class="text-center">欲穷千里目， 更上一层楼</h3>
    </div>
</section>

<div class="container">
    <div class="row">
        <div class="col-md-9">
            <section id="main">
                <c:forEach items="${notes}" var="notesYear">
                    <section class="archives-wrap">
                        <div class="archive-year-wrap">
                            <a href="<c:url value="/note/archive/${notesYear.k}"/> "
                               class="archive-year">${notesYear.k}</a>
                        </div>
                        <div class="archives">
                            <c:forEach items="${notesYear.v}" var="note">
                                <article class="archive-article archive-type-post">
                                    <div class="archive-article-inner">
                                        <header class="archive-article-header">
                                            <a href="<c:url value="/note/archive/${note.pubTime.toLocalDateTime().year}"/> "
                                               class="archive-article-date">
                                                <time datetime="<fmt:formatDate value="${note.pubTime}" pattern="yyyy-MM-dd HH-MM-ss"/>"
                                                      itemprop="datePublished">
                                                    <fmt:formatDate value="${note.pubTime}" pattern="MM-dd"/>
                                                </time>
                                            </a>
                                            <p itemprop="name">
                                                <a class="archive-article-title"
                                                   href="<c:url value="/note/note/path?filePath=${note.filePath}"/> ">
                                                    <c:if test="${note.forward}">【转】</c:if> ${note.title}
                                                </a>
                                            </p>
                                        </header>
                                    </div>
                                </article>
                            </c:forEach>
                        </div>
                    </section>
                </c:forEach>
            </section>
        </div>
        <div class="col-md-3">
            <aside>
                <tiles:insertAttribute name="note_tags"/>
                <tiles:insertAttribute name="note_tag_cloud"/>
                <tiles:insertAttribute name="note_archive"/>
            </aside>
        </div>
    </div>
</div>
<tiles:insertAttribute name="foot"/>
</body>
</html>
