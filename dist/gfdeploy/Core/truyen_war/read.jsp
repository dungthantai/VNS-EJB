<%-- 
    Document   : reader
    Created on : Feb 4, 2016, 2:49:42 PM
    Author     : DTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            <%@include file="/WEB-INF/jspf/style.jspf" %>
        </style>
        <script src="/jquery.js"></script>
        <script src="/jquery.plugins.js"></script>

    </head>
    <%@include file="/WEB-INF/jspf/header.jspf" %>


    <article id="content">


        <div class="selector top">
            <div>	
                <a href="javascript:void(0)" onclick="rep(this, ${ch.id});
                        return false;">Báo lỗi</a>
                <script type="text/javascript">
                    function rep(select, id) {
                        $.ajax(
                                {
                                    type: "POST",
                                    url: "/error_report/" + id,
                                    success: function (data) {
                                        if (data == "done") {
                                            $(select).html('<a href="#">Thanks</a>');
                                        }
                                        ;
                                    }
                                });
                    }
                </script>
                <label class="lbl">
                    <a href="download_href">Download</a> 
                    <label class="lbl">Chapter</label>
                    <form method="post" style="margin-right:10px;">
                        <select onChange="window.location.href = this.value" id="selectChapter">
                            <c:forEach items="${ch.comicId.chaptersList}" var="chapter">
                                <option value="${chapter.href}" ${(chapter.id eq ch.id)?"selected":""}>${chapter.title}</option>
                            </c:forEach>
                        </select>
                    </form>
                    <c:catch var="exception">
                        <c:set var="tester" value="${ch.prev()}"/>
                    </c:catch>
                    <c:if test="${exception==null}"><a href="${ch.prev().href}"><img title="Chap trước" id="btnNext" style="cursor: pointer;" src="${initParam['imgurl']}previous.png"></a></c:if>

                    <c:catch var="exception">
                        <c:set var="tester" value="${ch.next()}"/>
                    </c:catch>
                    <c:if test="${exception==null}"><a href="${ch.next().href}"><img title="Chap sau" id="btnNext" style="cursor: pointer;" src="${initParam['imgurl']}next.png"></a></c:if>
                </div>
            </div>

            <div class="clear"></div>
            <div id="page">

                <div class="inner">
                <c:forEach items="${ch.pagesList}" var="page" varStatus="state">
                    <img src="${page.href}" alt="Đọc manga ${ch.comicId.name} ${ch.title} page ${state.index +1}"/>
                </c:forEach>
            </div>
        </div>

        <div class="clear"></div>
    </div>

    <div class="selector">
        <a href="java">Download</a> 
        <label class="lbl">Chapter</label>
        <form method="post" style="margin-right:10px;">
            <select onChange="window.location.href = this.value" id="selectChapter">
                <c:forEach items="${ch.comicId.chaptersList}" var="chapter">
                    <option value="${chapter.href}" ${(chapter.id eq ch.id)?"selected":""}>${chapter.title}</option>
                </c:forEach>
            </select>
        </form>
        <c:catch var="exception">
            <c:set var="tester" value="${ch.prev()}"/>
        </c:catch>
        <c:if test="${exception==null}"><a href="${ch.prev().href}"><img title="Chap trước" id="btnNext" style="cursor: pointer;" src="${initParam['imgurl']}previous.png"></a></c:if>

        <c:catch var="exception">
            <c:set var="tester" value="${ch.next()}"/>
        </c:catch>
        <c:if test="${exception==null}"><a href="${ch.next().href}"><img title="Chap sau" id="btnNext" style="cursor: pointer;" src="${initParam['imgurl']}next.png"></a></c:if>
        </div>

    </article>



<%@include file="/WEB-INF/jspf/footer.jspf" %>
</html>
