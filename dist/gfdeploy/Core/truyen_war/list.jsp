<%-- 
    Document   : list
    Created on : Mar 31, 2016, 2:38:25 AM
    Author     : root
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
        <div class="panel">

            <div class="sidebar">

                <div class="bigBarContainer">
                    <div class="barTitle">
                        <div>
                            Truyện Hot
                        </div>
                    </div>
                    <div class="barContent">
                        <div class="arrow-general"></div>
                        <p style="margin: 5px; font-weight: bold;"><a href="X">XXX</a></p>
                    </div>
                </div>

                <div class="bigBarContainer">
                    <div class="barTitle">
                        <div>
                            Thông tin
                        </div>
                    </div>
                    <div class="barContent">
                        <div class="arrow-general"></div>
                        CTD hiện nay có<br/><br/>
                        <b>${cCount}</b> đầu truyện<br/>
                        <b>${chCount}</b> chương truyện<br/>
                    </div>
                </div>

            </div>








            <div class="bigBarContainer" style="width:733px;">
                <div class="barTitle">${stub}</div>
                <div id="searchfchar">
                    <a href="${initParam['siteurl']}directory" title="search manga All">Tất cả</a>
                    <c:forEach var="i" begin="65" end="90">
                        | <a href="${initParam['siteurl']}searchfchar/<%=Character.toChars((Integer) pageContext.getAttribute("i"))%>">
                            <%=Character.toChars((Integer) pageContext.getAttribute("i"))%>
                        </a>
                    </c:forEach>
                </div>

                <div class="listing">
                    <div class="clear" style="margin-top:40px;margin-bottom:40px;width:100%">
                        <img title="Truyện mới cập nhật" style="vertical-align: middle;margin-left:40px;" src="${initParam['imgurl']}newupdate.png"> Truyện mới cập nhật
                        <img title="Truyện mới cập nhật" style="vertical-align: middle;margin-left:100px;" src="${initParam['imgurl']}hot.png"> Truyện được yêu thích
                    </div>

                    <div class="head">
                        <div style="border-bottom: 1px white solid; padding-bottom: 5px;">
                            <b>Tên truyện</b>
                        </div>
                        <div style="border-bottom: 1px white solid; padding-bottom: 5px;">
                            <b>Nhóm dịch</b>
                        </div>
                        <div style="border-bottom: 1px white solid; padding-bottom: 5px;">
                            <b>Mới nhất</b>
                        </div>
                    </div>

                    <c:forEach items="${chaptersList}" var="chapter" varStatus="state" end="39">
                    <div class="tooltip right">

                        <div>
                            ${chapter.url}
                        </div>
                        <div>
                            ${chapter.chaptersList[0].teamId.name}
                        </div>
                        <div>
                            ${chapter.chaptersList[0].url}
                        </div>
                        <div class="txt">
                            <img class="preview" src="${chapter.thumb_url}" alt="${chapter.name}" />
                            <div>${chapter.url}
                                <br/><br/>
                                <span>${chapter.description}></span></div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>



            <script type="text/javascript">

                $(document).ready(function () {
                    $(".tooltip").mouseenter(function () {
                        var that = this;
                        timer = setTimeout(function () {
                            $(".tooltip").find(".txt").fadeOut(200);
                            $(that).find(".txt").fadeIn(200);
                        }, 300);
                    }).mouseleave(function () {
                        clearTimeout(timer);
                        $(".tooltip").find(".txt").fadeOut(200);
                    });
                });
            </script>


        </div>
    </article>

    <%@include file="/WEB-INF/jspf/footer.jspf" %>
</html>
