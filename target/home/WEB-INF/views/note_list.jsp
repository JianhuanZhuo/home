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
                <c:forEach items="${noteres.resList}" var="note">
                    <article id="post-QG/recruit-group-embed-13" class="article article-type-post" itemscope>
                        <div class="article-meta">
                            <a href="<c:url value="/note/archive/${note.pubTime.toLocalDateTime().year}"/> "
                               class="article-date">
                                <time datetime="<fmt:formatDate value="${note.pubTime}" type="both"/>"
                                      itemprop="datePublished">
                                    <fmt:formatDate value="${note.pubTime}" pattern="yyyy-MM-dd"/>
                                </time>
                            </a>
                        </div>
                        <div class="article-inner">
                            <header class="article-header">
                                <h1 itemprop="name">
                                    <a class="article-title"
                                       href="<c:url value="/note/note/path?filePath=${note.filePath}"/> ">
                                        <c:if test="${note.forward}">【转】</c:if> ${note.title}
                                    </a>
                                </h1>
                            </header>
                            <div class="article-entry" itemprop="articleBody">
                                <p>嵌入式组招新宣讲会的幻灯片，现在提供给师弟师妹们下载<br></p>
                                <p class="article-more-link">
                                    <a href="/2015/04/20/QG/recruit-group-embed-13/#more">Read More</a>
                                </p>
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
                    </article>
                </c:forEach>
            </section>

            <nav id="page-nav">
                <a class="extend prev" rel="prev" href="<c:url value="/note?page=${noteres.prev}"/> ">
                    « Prev
                </a>
                <a class="page-number" href="<c:url value="/note?page=1"/> ">
                    1
                </a>

                <span class="space">…</span>

                <a class="page-number <c:if test="${noteres.leftShow2.k}">hidden</c:if>"
                   href="<c:url value="/note?page=${noteres.leftShow2.v}"/> ">
                    ${noteres.leftShow2.v}
                </a>
                <a class="page-number <c:if test="${noteres.leftShow1.k}">hidden</c:if>"
                   href="<c:url value="/note?page=${noteres.leftShow1.v}"/> ">
                    ${noteres.leftShow1.v}
                </a>
                <span class="page-number current">${noteres.pageCurr}</span>

                <a class="page-number <c:if test="${noteres.rightShow1.k}">hidden</c:if>"
                   href="<c:url value="/note?page=${noteres.rightShow1.v}"/> ">
                    ${noteres.rightShow1.v}
                </a>
                <a class="page-number <c:if test="${noteres.rightShow2.k}">hidden</c:if>"
                   href="<c:url value="/note?page=${noteres.rightShow2.v}"/> ">
                    ${noteres.rightShow2.v}
                </a>

                <span class="space">…</span>

                <a class="page-number" href="<c:url value="/note?page=${noteres.pageTotal}"/> ">
                    ${noteres.pageTotal}
                </a>

                <a class="extend next" rel="next" href="<c:url value="/note?page=${noteres.next}"/> ">
                    Next »
                </a>
            </nav>
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
