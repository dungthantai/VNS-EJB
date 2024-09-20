<%-- 
    Document   : series
    Created on : Feb 6, 2016, 12:21:35 AM
    Author     : Administrator
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



            <div class="bigBarContainer thumb_img" style="width:220px; float: right;">
                <div class="barTitle">
                    Ảnh
                </div>
                <div class="barContent">
                    <div class="arrow-general"></div>
                    <div>
                        <img style="width: 100%;" class="fright" src="${c.thumb_url}" />
                    </div>
                </div>
            </div>

            <div class="bigBarContainer" id="info">
                <div class="barTitle">
                    Thông tin truyện ${c.name}
                </div>
                <div class="barContent">
                    <div class="arrow-general"></div>
                    <div>
                        <img style="padding: 0px 0px 5px 10px; max-width: 40%;" class="fright thumb_img" src="${c.thumb_url}" />

                        <a class="bigChar" href="/series/${c.stub}">${c.name}</a>
                        <p>
                            <span class="info">Thể loại:</span> 
                            <c:forEach items="${c.genresList}" var="g">
                                <a class="dotUnder" href="${initParam['siteurl']}genre/${g.genre}">${g.genre}</a>
                            </c:forEach>
                        </p>
                        <p>
                            <span class="info">Tác giả:</span> 
                            <a href="/AuthorArtist/${c.author}" class="dotUnder" title="">${c.author}</a>
                        </p>
                        <p>
                            <span class="info">Nhóm dịch:</span>
                            ${c.chaptersList[0].teamId.name}
                        </p>
                        <span class="info">Lượt xem:</span> ${c.viewed}
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span id="spanBookmark">

                            <img src="${initParam['imgurl']}minus.png" style="vertical-align: middle; margin-bottom: 5px;">
                            <a onclick="UnBookmark(this, < ?php echo $comic - > id; ? > ); return false;" href="#">Bỏ theo dõi</a>

                            <img src="${initParam['imgurl']}plus.png" style="vertical-align: middle; margin-bottom: 5px">
                            <a onclick="Bookmark(this, < ?php echo $comic - > id; ? > ); return false;" href="#">Theo dõi</a>

                        </span>
                        <script type="text/javascript">
                                    (!$this - > tank_auth - > is_logged_in())
                                    function Bookmark(select, id) {
                                    $(select).parent().html('<a href="/account/">Đăng nhập</a> hoặc <a href="/account/auth/register/">Đăng kí</a>');
                                    }
                            else
                                    function Bookmark(select, id) {
                                    $.ajax(
                                    {
                                    type: "POST",
                                            url: "/Bookmark/" + id,
                                            success:function(data){
                                            if (data == "done") {
                                            $(select).parent().html('<img src="<?php echo ' / content / themes / ' . get_setting('fs_theme_dir') .' / images / minus.png'; ?>" style="vertical-align: middle; margin-bottom: 5px"> <a id="btnUnBookmark" onclick="UnBookmark(this,' + id + ');return false;" href="#">Bỏ theo dõi</a>');
                                            };
                                            }
                                    });
                                    }
                            function UnBookmark(select, id) {
                            $.ajax(
                            {
                            type: "POST",
                                    url: "/Bookmark/" + id,
                                    success:function(data){
                                    if (data == "done") {
                                    $(select).parent().html('<img src="<?php echo ' / content / themes / ' . get_setting('fs_theme_dir') .' / images / plus.png'; ?>" style="vertical-align: middle; margin-bottom: 5px"> <a id="btnUnBookmark" onclick="Bookmark(this,' + id + ');return false;" href="#">Theo dõi</a>');
                                    };
                                    }
                            });
                            }
                            endif;
                        </script>
                        </p>
                        <p>
                            <span class="info">Nội Dung:</span>
                        </p>
                        <p style="text-align: justify;">
                            ${c.description}
                        </p>
                        <p></p>
                    </div>
                </div>
            </div>


            <c:forEach items="${c.chaptersList}" var="volume" varStatus="state">
                <c:if test="${state.first || c.chaptersList.get(state.index).volume ne volume.volume}">
                    <div class="bigBarContainer" id="info">
                        <div class="barTitle">
                            <a style="color:white" href="download_volume_href">
                                ${ch.volume}
                            </a>
                        </div>
                        <div class="barContent comic">
                            <div class="title">
                                <div>Chapter</div>
                                <div>View</div>
                                <div>Download</div>
                            </div>
                            <c:forEach items="${c.chaptersList}" var="chapter">
                                <div class="chap">
                                    <div>
                                        <a href="${chapter.href}">${chapter.title}</a> 
                                        <!--<img title="Truyện mới cập nhật" style="vertical-align: middle;" src="/content/themes/' . get_setting('fs_theme_dir') .'/images/newupdate.png">-->
                                    </div>
                                    <div>${chapter.viewed}</div>
                                    <div><a href="download_href">Download</a></div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </c:forEach>



        </div>
    </article>

    <%@include file="/WEB-INF/jspf/footer.jspf" %>
</html>
