<%-- 
    Document   : index
    Created on : Feb 13, 2016, 11:45:10 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>VNS</title>
        <style>
            <%@include file="/WEB-INF/jspf/style_mainrollup.jspf" %>
            <%@include file="/WEB-INF/jspf/style_additional.jspf" %>
        </style>
    </head>

    <body>
        <%@include file="/WEB-INF/jspf/header.jspf"%>


        <div style="padding: 0px 10px; ">
            </br>
            <c:forEach items="${boxs}" var="bigbox" varStatus="state">

                <c:if test="${bigbox.treelevel eq 2}">
                    <table width="100%" height="30" border="0" cellpadding="00" cellspacing="0">
                        <tbody>
                            <tr>
                                <td width="58" height="30" class="home_category_left">&nbsp;</td>
                                <td width="auto" class="home_category">
                                    <a href="${initParam['siteurl']}box/${bigbox.id}">${bigbox.title}</a>
                                </td>
                                <td width="61" class="home_category_right">
                                    <a style="float:right" href="#top" onclick="return toggle_collapse('forumbit_1')"><img id="collapseimg_forumbit_1" src="${initParam['imageurl']}collapse_tcat.png" alt="" border="0"></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>


                    <table class="tborder" cellpadding="6" cellspacing="1" border="0" width="100%" align="center">
                        <tbody>
                            <tr align="center">
                                <td class="thead" width="5%">&nbsp;</td>
                                <td class="thead" width="60%" align="left">Diễn đàn</td>
                                <td class="thead" width="18%">Bài mới gửi</td>
                                <td class="thead" nowrap="nowrap">Chủ đề</td>
                                <td class="thead" nowrap="nowrap">Bài viết</td>
                            </tr>
                        </tbody>

                        <tbody>
                            <c:forEach items="${boxs}" var="box">
                                <c:if test="${box.treelevel eq bigbox.treelevel + 1 && fn:contains(box.location, bigbox.location)}">

                                    <tr align="center">
                                        <td class="alt2" width="80px">
                                            <img title="" src="${initParam['imageurl']}forum_new.gif" alt="" border="0" id="forum_statusicon_2">
                                        </td>

                                        <td class="alt1Active" align="left" id="f${box.id}">
                                            <div class="titleline">
                                                <h2 class="forumtitle"><a href="${initParam['siteurl']}box/${box.id}">${box.title}</a></h2>
                                            </div>
                                            <div class="smallfont">
                                                <p class="forumdescription">${box.description}</p>
                                            </div>
                                            <div class="smallfont" style="margin-top:6px">
                                                <div class="subforums">
                                                    <ol class="subforumlist commalist">
                                                        <div class="subforums">
                                                            <h4 class="subforumlistlabel">Danh mục:</h4>
                                                            <ol class="subforumlist column3">
                                                                <c:forEach items="${boxs}" var="subbox">
                                                                    <c:if test="${subbox.treelevel eq box.treelevel + 1 && fn:contains(subbox.location, box.location)}">
                                                                        <li class="subforum">
                                                                            <img class="inlineimg" src="${initParam['imageurl']}subforum_new.png" alt="" border="0" id="forum_statusicon_432">
                                                                            <a href="${initParam['siteurl']}box/${subbox.id}">${subbox.title}</a>
                                                                        </li>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </ol>
                                                        </div>
                                                    </ol>
                                                </div>
                                            </div>
                                        </td>





                                        <td class="alt2">
                                            <div class="smallfont" align="left">
                                                <c:catch var="exception">
                                                    <c:set var="tester" value="${box.getLastPost()}"/>
                                                </c:catch>
                                                <c:if test="${exception==null}">
                                                    <div>
                                                        <p class="lastposttitle">
                                                            <a href="${initParam['siteurl']}thread/${box.getLastPost().threadId.id}" class="threadtitle" title="Đến bài đầu tiên chưa đọc trong chủ đề '${box.getLastPost().threadId.title}'">${box.getLastPost().threadId.title}</a>
                                                            <a href="${initParam['siteurl']}post/${box.getLastPost().id}"><img src="${initParam['imageurl']}lastpost-right.png" alt="Đến bài cuối" title="Đến bài cuối"></a>
                                                        </p>
                                                        <div class="lastpostby">
                                                            bởi <div class="popupmenu memberaction" id="${box.getLastPost().userId.displayName}">
                                                                <a class="username offline popupctrl" href="${initParam['siteurl']}member/${box.getLastPost().userId.id}"">
                                                                    ${box.getLastPost().userId.displayName}
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <p align="right" class="lastpostdate">25-12-2015, <span class="time">22:28</span> <a href="${initParam['siteurl']}thread/${box.getLastPost().threadId.id}"><img src="${initParam['imageurl']}golink.gif"></a></p>
                                                    </div>
                                                </c:if>
                                                <c:if test="${exception!=null}">
                                                    ${exception}
                                                </c:if>
                                            </div>
                                        </td>
                                        <td class="alt1">${box.countThreads()}</td>
                                        <td class="alt2">${box.countPosts()}</td>
                                    </tr>


                                </c:if>
                            </c:forEach>

                        </tbody>
                    </table>
                </c:if>

            </c:forEach>

            </br>
            <table class="tborder" cellpadding="6" cellspacing="1" border="0" width="100%" align="center">
                <thead>
                    <tr>
                        <td class="tcat" colspan="2">Tình Hình Diễn Ðàn</td>
                    </tr>
                </thead>


                <tbody>
                    <tr>
                        <td class="thead" colspan="2">
                            <a style="float:right" href="#top" onclick="return toggle_collapse('forumhome_stats')"><img id="collapseimg_forumhome_stats" src="${initParam['imageurl']}collapse_thead.gif" alt="" border="0"></a>
                            oOo VnSharing oOo
                        </td>
                    </tr>
                </tbody>

                <tbody id="collapseobj_forumhome_activeusers" style="">
                    <tr>
                        <td class="alt2"><a href="online.php"><img src="${initParam['imageurl']}whos_online.gif" alt="Xem ai đang online" border="0" title="Xem ai đang online"></a></td>
                        <td class="alt1" width="100%">
                            <div>
                                <b style="color: orange">Administrators</b> |
                                <b style="color: red">Super Moderators</b> |
                                <b style="color: SlateGray">Captain Moderators</b> |
                                <b style="color: green">Moderators</b> |
                                <b style="color: brown">Newsroom Collaborator</b> |
                                <b style="color: #FA8072">Trial Moderators</b> |
                                <b style="color: DarkOrchid">Super Members</b> |
                                <b style="color: teal">VIP Members</b>
                            </div>


                        </td>
                    </tr>
                </tbody>

                <tbody>
                    <tr>
                        <td class="thead" colspan="2">
                            <a style="float:right" href="#top" onclick="return toggle_collapse('forumhome_stats')"><img id="collapseimg_forumhome_stats" src="${initParam['imageurl']}collapse_thead.gif" alt="" border="0"></a>
                            Thống Kê - oOo VnSharing oOo
                        </td>
                    </tr>
                </tbody>

                <tbody id="collapseobj_forumhome_stats" style="">
                    <tr>
                        <td class="alt2"><img src="${initParam['imageurl']}stats.jpg" alt="Thống kê - oOo VnSharing oOo" border="0" title="Thống kê - oOo VnSharing oOo"></td>
                        <td class="alt1" width="100%">
                            <div class="smallfont">
                                <div>
                                    <b>Chủ đề:</b> 93,340,
                                    <b>Bài viết:</b> 940,630,
                                    <b>Thành viên:</b> 61,160
                                </div>
                                <div><p></p><div class="smallfont">Chào mừng thành viên mới nhất <a href="member.php?u=61161">DPK</a></div><p></p>
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>

                <!-- today's birthdays -->
                <tbody>
                    <tr>
                        <td class="thead" colspan="2">
                            <a style="float:right" href="#top" onclick="return toggle_collapse('forumhome_birthdays')"><img id="collapseimg_forumhome_birthdays" src="${initParam['imageurl']}collapse_thead.gif" alt="" border="0"></a>
                            Chúc Mừng Sinh Nhật
                        </td>
                    </tr>
                </tbody>
                <tbody id="collapseobj_forumhome_birthdays" style="">
                    <tr>
                        <td class="alt2"><a href="calendar.php?do=getday&amp;day=2012-08-31&amp;sb=1"><img src="${initParam['imageurl']}birthday.jpg" alt="View Birthdays" border="0" title="View Birthdays"></a></td>
                        <td class="alt1" width="100%">
                            <div class="smallfont">
                                <p>{RECORD_USERS}
                                    <br />{TOTAL_POSTS}
                            </div>
                        </td>
                    </tr>
                </tbody>
                <!-- end today's birthdays -->
                <tbody>
                    <tr>
                        <td class="tfoot" align="center" colspan="5">
                            <div class="smallfont"><strong>
                                    <a href="forumdisplay.php?do=markread" rel="nofollow">Ðánh Dấu Ðã Ðọc</a>
                                    &nbsp; &nbsp;
                                    <a href="showgroups.php">Ðiều Hành Diễn Đàn</a>
                                </strong>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <!-- END disable_viewonline -->

        </div>


        <%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>

</html>
