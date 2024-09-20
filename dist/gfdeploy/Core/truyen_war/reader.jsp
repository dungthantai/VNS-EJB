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
        <div class="panel">

            <div class="sidebar">
                <div class="bigBarContainer">
                    <div class="barTitle">
                        <div>
                            Mạng xã hội
                        </div>
                    </div>

                    <div id="share-buttons">
                        <div class="mini-arrow-general"></div>
                        <!-- Facebook -->
                        <a href="http://www.facebook.com/sharer.php?u=${initParam['siteurl']}" target="_blank">
                            <img src="https://simplesharebuttons.com/images/somacro/facebook.png" alt="Facebook" />
                        </a>

                        <!-- Google+ -->
                        <a href="https://plus.google.com/share?url=${initParam['siteurl']}" target="_blank">
                            <img src="https://simplesharebuttons.com/images/somacro/google.png" alt="Google" />
                        </a>

                        <!-- Twitter -->
                        <a href="https://twitter.com/share?url=${initParam['siteurl']}&amp;text=Simple%20Share%20Buttons&amp;hashtags=simplesharebuttons" target="_blank">
                            <img src="https://simplesharebuttons.com/images/somacro/twitter.png" alt="Twitter" />
                        </a>

                    </div>
                </div>

                <div class="bigBarContainer">
                    <div class="barTitle">
                        <div>
                            Truyện Hot
                        </div>
                    </div>
                    <div class="barContent">
                        <div class="arrow-general"></div>
                        <p style="margin: 5px; font-weight: bold;"><a href="X">XXX</a></p>
                        <p style="margin: 5px; font-weight: bold;"><a href="X">XXX</a></p>
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

                <div class="bigBarContainer">
                    <div class="barTitle">
                        <div>
                            Mới cập nhật
                        </div>
                    </div>
                    <div class="barContent lasted">
                        <div class="arrow-general"></div>

                        <c:forEach items="${cNews}" var="cNew" end="29">
                            <img src="${initParam['imgurl']}bullet.png" />
                            <a href="${cNew.href}">${cNew.name}</a> 
                            <a class="textDark" href="${cNew.chaptersList[0].href}">${cNew.chaptersList[0].title}</a><br/>
                        </c:forEach>

                        <div style="float:right; padding:10px;">
                            <a href="${initParam['siteurl']}newchapter">More...</a>
                        </div>
                    </div>
                </div>

            </div>








            <div class="list">

                <div class="banner">

                    <div class="details">
                        <a href="${cRand.href}">
                            <img src="${cRand.thumb_url}" alt="randommanga"></a>
                        <div>
                            <a class="bigChar" href="${cRand.href}">${cRand.name}</a>
                            <p>
                                <span class="info">Thể loại:</span>
                                <c:forEach items="${cRand.genresList}" var="g">
                                    <a class="dotUnder" href="${initParam['siteurl']}genre/${g.genre}">${g.genre}</a>
                                </c:forEach>
                            </p>
                            <p>
                                <span class="info">Tác giả:</span> 
                                <a href="${initParam['siteurl']}AuthorArtist/${cRand.author}" class="dotUnder" title="">${cRand.author}</a>
                                <a href="${initParam['siteurl']}AuthorArtist/${cRand.artist}" class="dotUnder" title="">${cRand.artist}</a>
                            </p>
                            <p>
                                ${cRand.description}
                            </p>
                        </div>
                    </div>

                </div>



                <div class="bigBarContainer customw">
                    <div class="barTitle">
                        <div class="scrollable_title">
                            Mới cập nhật 
                        </div>
                        <div id="recently-nav">
                            <a class="prev"></a>
                            <div class="navi">Trang <span id="num">1</span></div>
                            <a class="next" style="display: block;"></a>
                            <div class="clear"></div>
                        </div>
                        <div class="clear"></div>
                    </div>


                    <div class="barContent">
                        <div class="arrow-general"></div>
                        <div class="scrollable">
                            <div class="items" style="transition:0.5s;">
                                <div>
                                    <c:forEach items="${chNews}" var="chNew">
                                        <a class="comic" title="${chNew.comicId.name} ${chNew.title}" href="${chNew.href}">
                                            <img width="130" height="150" src="${chNew.comicId.thumb_url}" alt="Đọc manga ${chNew.comicId.name} ${chNew.title}" ><br>
                                            ${chNew.comicId.name}<br>
                                            <span class="textDark">${chNew.title}</span>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>




                <div id="submenu">
                    <div id="tabmenucontainer">
                        <ul>
                            <li><a title="New manga" class="tab tabactive neww" id="">Truyện mới</a></li>
                            <li><a title="Most popular manga" class="tab vieww">Phổ biến nhất</a></li>
                        </ul>
                    </div>
                    <div class="clear"></div>
                    <div id="subcontent">
                        <div id="tab-newest">
                            <c:forEach items="${cNews}" var="cNew" varStatus="state" end="9">
                                <div>

                                    <a href="${cNew.href}"><img src="${cNew.thumb_url}" alt="Đọc manga ${cNew.name}" /></a>

                                    <a href="${cNew.href}"> 
                                        <span class="title">${cNew.name}
                                        </span>
                                    </a>

                                    <p>
                                        <span class="info">Thể loại:</span>
                                        <c:forEach items="${cNew.genresList}" var="g">
                                            <a class="dotUnder" href="${initParam['siteurl']}genre/${g.genre}">${g.genre}</a>
                                        </c:forEach>
                                    </p>

                                    <p>
                                        <span class="info">Latest:</span> <a href="${cNew.chaptersList[0].href}" title="${cNew.chaptersList[0].title}" class="textDark">${cNew.chaptersList[0].title}</a>
                                    </p>

                                    <div>
                                        <img src="${initParam['imgurl']}${state.index+1}.png" alt="top new">
                                    </div>
                                </div>
                            </c:forEach>

                            <br/>
                            <div style="text-align: right; font-size: 16px;">
                                <a href="${initParam['siteurl']}newmanga">More...</a>
                            </div>
                        </div>

                        <div id="tab-view" class="hide">

                            <c:forEach items="${cHots}" var="cHot" varStatus="state" end="9">
                                <div>

                                    <a href="${cHot.href}"><img src="${cHot.thumb_url}" alt="Đọc manga ${cHot.name}" /></a>

                                    <a href="${cHot.href}"> 
                                        <span class="title">${cHot.name}
                                        </span>
                                    </a>

                                    <p>
                                        <span class="info">Thể loại:</span>
                                        <c:forEach items="${cHot.genresList}" var="g">
                                            <a class="dotUnder" href="${initParam['siteurl']}genre/${g.genre}">${g.genre}</a>
                                        </c:forEach>
                                    </p>

                                    <p>
                                        <span class="info">Latest:</span> <a href="${cHot.chaptersList[0].href}" title="${cHot.chaptersList[0].title}" class="textDark">${cHot.chaptersList[0].title}</a>
                                    </p>

                                    <div>
                                        <img src="${initParam['imgurl']}${state.index+1}.png" alt="top new">
                                    </div>
                                </div>
                            </c:forEach>


                            <br/>
                            <div style="text-align: right; font-size: 16px;">
                                <a href="${initParam['siteurl']}newmanga">More...</a>
                            </div>
                        </div>        
                    </div>
                </div>

            </div>


        </div>
    </article>    

    <script type="text/javascript">
        $(document).ready(function () {
            $(".prev").click(function () {
                DoPrev();
            });
            $(".next").click(function () {
                GoNext();
            });

            $(document).keydown(function (e) {
                if (e.keyCode == 37) {
                    DoPrev();
                }
                else if (e.keyCode == 39) {
                    GoNext();
                }
            });

            function DoPrev() {
                var num = parseInt($("#num").text());
                num -= 1;
                if (num == 0) {
                    num = 5;
                }
                ;
                $("#num").text(num);
                num = num * (-100) + 100;
                $(".items").css("left", num + "%");
            }
            function GoNext() {
                var num = parseInt($("#num").text());
                num += 1;
                if (num == 6)
                    num = 1;
                $("#num").text(num);
                num = num * (-100) + 100;
                $(".items").css("left", num + "%");
            }
        });

        $(".tab").click(function () {
            $(".tab").removeClass("tabactive");
            $(this).addClass("tabactive");
            if ($(this).hasClass("neww")) {
                $("#tab-newest").removeClass("hide");
                $("#tab-view").addClass("hide");
            } else {
                $("#tab-view").removeClass("hide");
                $("#tab-newest").addClass("hide");
            }
        });
    </script>







    <%@include file="/WEB-INF/jspf/footer.jspf" %>
</html>
