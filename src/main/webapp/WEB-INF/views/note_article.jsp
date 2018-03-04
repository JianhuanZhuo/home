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
    <meta name="description" content="${note.abs}">
    <meta property="og:type" content="article">
    <meta property="og:title" content="${note.title}">
    <meta property="og:updated_time" content="${note.update_time}">
    <meta property="og:site_name" content="卓建欢的个人小站">
    <meta property="og:url" content="<c:url value="/note/note/${note.filePath}"/> ">
    <meta property="og:description" content="${note.abs}">
    <meta name="twitter:card" content="summary">
    <meta name="twitter:title" content="${note.title}">
    <meta name="twitter:description" content="${note.abs}">

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
                <article id="post-Linux/fedora-software" class="article article-type-post" itemscope=""
                         itemprop="blogPost">
                    <div class="article-meta">
                        <a href="<c:url value="/note/archive/${note.pubTime.toLocalDateTime().year}"/> " class="article-date">
                            <time datetime="${note.pubTime}" itemprop="datePublished">
                                <fmt:formatDate value="${note.pubTime}" pattern="yyyy-MM-dd"/>
                            </time>
                        </a>
                    </div>
                    <div class="article-inner">
                        <header class="article-header">
                            <h1 class="article-title">
                                <span itemprop="name"><c:if test="${note.forward}">【转】</c:if> ${note.title}</span>
                                <small>${note.categoryPath}</small>
                            </h1>
                        </header>
                        <hr>
                        <div id="vue_article-entry" class="article-entry" itemprop="articleBody">
                            <jsp:include page="/resources/files/mdfile/${note.filePath}.jsp"/>
                        </div>
                        <footer class="article-footer">
                                    <ul class="article-tag-list">
                                    <c:forEach items="${note.tagsAsList}" var="tag">
                                        <li class="article-tag-list-item">
                                            <a class="article-tag-list-link" href="<c:url value="/note/tag/${tag}"/> ">
                                                    ${tag}
                                            </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </footer>
                    </div>
                    <nav id="article-nav">
                        <a href="/2017/07/09/Linux/rpm/" id="article-nav-older" class="article-nav-link-wrap">
                            <strong class="article-nav-caption">上一篇</strong>
                            <div class="article-nav-title">rpm 知识小结</div>
                        </a>
                    </nav>
                </article>
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

<%--<script type="text/javascript">--%>
<%--window.MathJax = {--%>
<%--tex2jax: {--%>
<%--inlineMath: [ ['$','$'], ["\\(","\\)"] ],--%>
<%--processEscapes: true--%>
<%--}--%>
<%--};--%>
<%--</script>--%>
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  tex2jax: {
    inlineMath: [['$','$']],
    displayMath: [['$$','$$']],
    processEscapes: true,
    processEnvironments: true,
    skipTags: ['script', 'noscript', 'style', 'textarea', 'pre'],
    TeX: { equationNumbers: { autoNumber: "AMS" },
         extensions: ["AMSmath.js", "AMSsymbols.js"] }
  }
});
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
</body>
</html>

<head>
</head>