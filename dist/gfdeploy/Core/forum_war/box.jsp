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
            <%--@include file="/WEB-INF/jspf/style_forumdisplayrollup.jspf" --%>
            <%@include file="/WEB-INF/jspf/style_additional.jspf" %>
            <%--@include file="/WEB-INF/jspf/style.jspf" --%>
        </style>
    </head>

    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>


        <div align="left" style="padding: 0px 10px; ">
            <c:catch var="exception">
                <c:set var="tester" value="${boxs.get(1)}"/>
            </c:catch>
            <c:if test="${exception==null}">

                <table align="center" style="border-collapse:separate;border-spacing:1px;width:100%;background-color: rgb(227, 227, 227); color:rgb(0, 0, 0);border-width: 1px 1px 0px; border-style: solid; border-color: rgb(0, 117, 201); ">
                    <tbody><tr>
                            <td style="width:100%;background-image:url(${initParam['imageurl']}tcat.gif);background-color: rgb(16, 151, 221); color:rgb(255, 255, 255);font:normal normal bold 10pt/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 6px; ">
                                Phụ Mục<span style="font-weight:normal;"> : ${boxs.get(0).title}</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table align="center" style="border-collapse:separate;border-spacing:1px;width:100%;background-color: rgb(227, 227, 227); color:rgb(0, 0, 0);border-width: 1px; border-style: solid; border-color: rgb(0, 117, 201); ">
                    <thead>
                        <tr align="center">
                            <td style="background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; ">&nbsp;</td>
                            <td align="left" style="width:100%;background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; ">Chuyên mục</td>
                            <td style="white-space:nowrap;background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; ">Bài mới gửi</td>
                            <td style="background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; ">Ðề tài</td>
                            <td style="background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; ">Bài gửi</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${boxs}" var="box" varStatus="state">
                            <c:if test="${not state.first && boxs.get(0).treelevel + 1 eq box.treelevel}">
                                <tr align="center">
                                    <td colspan="2" align="left" style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">
                                        <table style="border-collapse:separate;border-spacing:0px;width:100%;border-width: 0px; border-style: outset; border-color: #999; ">
                                            <tbody><tr>
                                                    <td style="width:60px;color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; "><img src="${initParam['imageurl']}forum_old.gif" style="border-width: 0px; "></td>
                                                    <td style="width:9px;color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; "><img src="data:image/gif;base64,R0lGODlhAQABAIAAAMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" style="height:1px;width:9px;border-width: 0px; "></td>
                                                    <td style="width:100%;color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; ">
                                                        <div>
                                                            <a href="${initParam['siteurl']}box/${box.id}" style="color:rgb(0, 89, 189);text-decoration:none;"><strong>${box.title}</strong></a>
                                                        </div>
                                                        <div style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">${box.description}</div>
                                                        <div style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;margin-top:6px;">
                                                            <table align="center" style="border-collapse:separate;border-spacing:0px;width:100%;border-width: 0px; border-style: outset; border-color: #999; ">

                                                                <tbody>
                                                                    <tr style="vertical-align:top;">
                                                                        <c:forEach items="${boxs}" var="subbox">
                                                                            <c:if test="${subbox.treelevel eq box.treelevel + 1 && fn:contains(subbox.location, box.location)}">
                                                                                <td style="width:33%;color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;text-transform:none;font-size:12px;white-space:nowrap;padding: 0px; ">
                                                                                    <img src="${initParam['imageurl']}subbox.gif" style="vertical-align:middle;border-width: 0px; ">
                                                                                    <a href="${initParam['siteurl']}box/${subbox.id}" style="color:rgb(0, 89, 189);text-decoration:none;">${subbox.title}</a>
                                                                                </td>

                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                    </td>
                                    <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">
                                        <div align="left" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                            <div>
                                                <span style="white-space:nowrap;">
                                                    <a href="${initParam['siteurl']}post/${box.getLastPost().id}" title="Tới bài chưa đọc trong chủ đề" style="color:rgb(0, 89, 189);text-decoration:none;white-space:nowrap;">
                                                        <strong>${box.getLastPost().getThreadId().title}</strong>
                                                    </a>
                                                </span>
                                            </div>
                                            <div style="white-space:nowrap;">
                                                bởi <a href="${initParam['siteurl']}user/${box.getLastPost().userId.id}" style="color:rgb(0, 89, 189);text-decoration:none;">
                                                    ${box.getLastPost().userId.displayName}
                                                </a>
                                            </div>
                                            <div align="right" style="white-space:nowrap;">
                                                06-07-2013 <span style="color:rgb(85, 85, 85);">13:32</span>
                                                <a href="${initParam['siteurl']}post/${box.getLastPost().id}" style="color:rgb(0, 89, 189);text-decoration:none;">
                                                    <img alt="Tới bài mới nhất" src="${initParam['imageurl']}golink.gif" title="Tới bài mới nhất" style="vertical-align:middle;border-width: 0px; ">
                                                </a>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">4,995</td>
                                    <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">5,652</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>


                <br>
            </c:if>

            <form action="#" method="post" style="margin: 0px; ">

                <table style="border-collapse:separate;border-spacing:0px;width:100%;margin-bottom:3px;border-width: 0px; border-style: outset; border-color: #999; ">
                    <tbody>
                        <tr style="vertical-align:bottom;">
                            <td style="color:rgb(51, 51, 51);font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; "><a href="${initParam['siteurl']}newthread/${boxs.get(0).id}" style="color:rgb(0, 89, 189);text-decoration:none;"><img alt="Gởi Ðề Tài Mới" src="${initParam['imageurl']}newtopic.jpg" title="Gởi Ðề Tài Mới" style="border-width: 0px; "></a></td>
                            <td align="right" style="color:rgb(51, 51, 51);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; ">
                                <div align="right">
                                    <table style="border-collapse:separate;border-spacing:1px;background-color: rgb(227, 227, 227); color:rgb(0, 0, 0);border-width: 1px; border-style: solid; border-color: rgb(0, 117, 201); ">
                                        <tbody>

                                            <tr>
                                                <td style="background-image:url(${initParam['imageurl']}tcat.gif);background-color: rgb(0, 117, 201); color:rgb(255, 255, 255);font:normal normal bold 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;font-weight:normal;background-position: 0% 0%; background-repeat: repeat-x; padding: 2px 4px; ">Trang ${paged.current_page}/${paged.total_pages}</td>
                                                <c:if test="${paged.has_previous}">
                                                    <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                        <a href="${initParam['siteurl']}box/${threads.get(0).boxId.id}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&lt;&lt;</a>
                                                    </td>
                                                    <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                        <a href="${initParam['siteurl']}box/${threads.get(0).boxId.id}?page=${paged.previous_page}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&lt;</a>
                                                    </td>
                                                </c:if>

                                                <c:forEach var="i" begin="1" end="${paged.total_pages}">
                                                    <c:choose>
                                                        <c:when test="${i eq paged.current_page}">
                                                            <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; "><span style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                                                    <b>${paged.current_page}</b></span>
                                                            </td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                                <a href="${initParam['siteurl']}box/${threads.get(0).boxId.id}?page=${i}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">${i}</a>
                                                            </td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>

                                                <c:if test="${paged.has_next}">
                                                    <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                        <a href="${initParam['siteurl']}box/${threads.get(0).boxId.id}?page=${paged.next_page}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&gt;</a>
                                                    </td>
                                                    <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                        <a href="${initParam['siteurl']}box/${threads.get(0).boxId.id}?page=${paged.total_pages}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&gt;&gt;</a>
                                                    </td>
                                                </c:if>
                                                <td style="background-image:url(${initParam['imageurl']}tcat.gif);background-color: rgb(0, 117, 201); color:rgb(255, 255, 255);font:normal normal bold 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;cursor:pointer;background-position: 0% 0%; background-repeat: repeat-x; padding: 2px 4px; ">
                                                    <img src="${initParam['imageurl']}download.gif" style="border-width: 0px; ">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <table align="center" style="border-collapse:separate;border-spacing:1px;width:100%;background-color: rgb(227, 227, 227); color:rgb(0, 0, 0);border-width: 1px 1px 0px; border-style: solid; border-color: rgb(0, 117, 201); ">
                    <tbody>
                        <tr>
                            <td style="width:100%;background-image:url(${initParam['imageurl']}tcat.gif);background-color: rgb(16, 151, 221); color:rgb(255, 255, 255);font:normal normal bold 10pt/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 6px; ">Chuyên Mục<span style="font-weight:normal;">
                                    : ${boxs.get(0).title}</span></td>
                            <td style="white-space:nowrap;background-image:url(${initParam['imageurl']}tcat.gif);background-color: rgb(16, 151, 221); color:rgb(255, 255, 255);font:normal normal bold 10pt/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;cursor:pointer;background-position: 0% 0%; background-repeat: repeat-x; padding: 6px; "><a href="0BiOf/http://vnsharing.net${initParam['siteurl']}forumdisplay.php?f=800&amp;nojs=1%23goto_forumtools" style="text-decoration:none;color:rgb(255, 255, 255);font:normal normal bold 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;">Sử Dụng</a>

                                <img src="data:image/gif;base64,R0lGODlhCwAHAMQAAAAAAP////j4+O/v7+vr67q6uri4uK+vr66urpmZmZWVlZKSkomJiX9/f3JycnFxcWlpaV1dXVtbW1dXV////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAABQALAAAAAALAAcAQAUfICWOJCklwfCUlBK8gsPO42IUhtGUEPEiElbkwJiMQgA7" style="border-width: 0px; "></td>
                        </tr>
                    </tbody>
                </table>

                <c:catch var="exception">
                    <c:set var="tester" value="${threads.get(0)}"/>
                </c:catch>
                <c:if test="${exception==null}">
                    <table align="center" style="border-collapse:separate;border-spacing:1px;width:100%;background-color: rgb(227, 227, 227); color:rgb(0, 0, 0);border-width: 1px; border-style: solid; border-color: rgb(0, 117, 201); ">
                        <tbody>
                            <tr>
                                <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; "><img alt="Thông báo" src="5.gif" title="Thông báo" style="border-width: 0px; "></td>
                                <td colspan="5" style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">
                                    <div>
                                        <span style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;float:right;">Lần đọc:
                                            <strong>6,619</strong>


                                            <a href="0BiOf/http://vnsharing.net${initParam['siteurl']}announcement.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;f=800" style="color:rgb(0, 89, 189);text-decoration:none;"><img alt="View Announcement" src="${initParam['imageurl']}golink.gif" title="View Announcement" style="vertical-align:middle;border-width: 0px; "></a></span>
                                        <strong>Thông báo</strong>:

                                        BANNER

                                    </div>
                                    <b>
                                        <font size="4" color="#000000">


                                        <div>
                                            <span style="float:right;"><span style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">17-03-2011</span></span>
                                            <span style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                                <a href="0BiOf/http://vnsharing.net${initParam['siteurl']}member.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;u=194083" style="color:rgb(0, 89, 189);text-decoration:none;">Metafalica</a>
                                                (ヾ(´･ ･｀｡)ノ”) 
                                            </span>
                                        </div>
                                        </font>
                                    </b>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; ">&nbsp;</td>
                                <td style="width:100%;background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; ">
                                    <span style="float:right;"><a href="0BiOf/http://vnsharing.net${initParam['siteurl']}forumdisplay.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;f=800&amp;daysprune=-1&amp;order=desc&amp;sort=voteavg" style="color:rgb(51, 51, 51);text-decoration:none;">Ðiểm</a>
                                    </span>
                                    <a href="0BiOf/http://vnsharing.net${initParam['siteurl']}forumdisplay.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;f=800&amp;daysprune=-1&amp;order=asc&amp;sort=title" style="color:rgb(51, 51, 51);text-decoration:none;">Ðề tài</a>
                                    / <a href="0BiOf/http://vnsharing.net${initParam['siteurl']}forumdisplay.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;f=800&amp;daysprune=-1&amp;order=asc&amp;sort=postusername" style="color:rgb(51, 51, 51);text-decoration:none;">Người Gửi</a>
                                </td>
                                <td align="center" style="width:150px;white-space:nowrap;background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; "><span style="white-space:nowrap;"><a href="0BiOf/http://vnsharing.net${initParam['siteurl']}forumdisplay.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;f=800&amp;daysprune=-1&amp;order=desc&amp;sort=lastpost" style="color:rgb(51, 51, 51);text-decoration:none;">Bài mới gửi</a>
                                        <a href="0BiOf/http://vnsharing.net${initParam['siteurl']}forumdisplay.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;f=800&amp;daysprune=-1&amp;order=asc&amp;sort=lastpost&amp;pp=25&amp;page=1" style="color:rgb(51, 51, 51);text-decoration:none;"><img alt="Xếp theo thứ tự" src="data:image/gif;base64,R0lGODlhDAAMAJEAAP////+nJP///wAAACH5BAEHAAIALAAAAAAMAAwAAAIfhI8ny20NxYvshXjtZSGD1YHbJHThQpYb+lGsyyZyAQA7" title="Xếp theo thứ tự" style="vertical-align:middle;border-width: 0px; "></a></span></td>
                                <td align="center" style="white-space:nowrap;background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; "><span style="white-space:nowrap;"><a href="0BiOf/http://vnsharing.net${initParam['siteurl']}forumdisplay.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;f=800&amp;daysprune=-1&amp;order=desc&amp;sort=replycount" style="color:rgb(51, 51, 51);text-decoration:none;">Trả lời</a>
                                    </span></td>
                                <td align="center" style="white-space:nowrap;background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; "><span style="white-space:nowrap;"><a href="0BiOf/http://vnsharing.net${initParam['siteurl']}forumdisplay.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;f=800&amp;daysprune=-1&amp;order=desc&amp;sort=views" style="color:rgb(51, 51, 51);text-decoration:none;">Lần đọc</a>
                                    </span></td>
                            </tr>
                        </tbody>

                        <tbody>

                            <c:if test="${threads.get(0).sticky}">

                                <tr>
                                    <td colspan="7" style="background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; "><strong>Sticky Threads</strong></td>
                                </tr>
                                <c:forEach items="${threads}" var="thread">
                                    <c:if test="${thread.sticky}">

                                        <tr>
                                            <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">
                                                <img src="${initParam['imageurl']}thread_hot_new.gif">
                                            </td>
                                            <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">&nbsp;</td>


                                            <td title="${thread.title}" style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">
                                                <div>
                                                    <a href="${initParam['siteurl']}thread/${thread.id}" id="thread_${thread.id}" style="color:rgb(0, 89, 189);text-decoration:none;">
                                                        ${thread.title}
                                                    </a> 
                                                    <c:if test="${not empty user && user.issetPermission('edit_thread')}"><a href="javascript:void(0)" onclick="rename_thread(${thread.id})">Edit</a></c:if>
                                                        <span style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;white-space:nowrap;">
                                                            (<img alt="Multi-page thread" src="data:image/gif;base64,R0lGODlhDAAMAOZ7AP///+rp61JVVYCDg8TDy9LS09rb4dzc5dzc5r6+xoGDhJeYms/P2u3s8cPEy/Hy86SnrOvr74yOkJman8bH06SmqouLkZOSktbX3UBCRcDDyPPx+kZHS93d3Kyss6iqr93d4YqLjPz8/o+Qkaiorerq7cvKzrGytK+vsOfo6H5+gX6CgpueoUpPUOXl54SEhF5fZdvb4cbIz4ODhd7g6MC/ybe3vlZWXOrq7qurqvP09pGRloaGi/Ly/MbGzM7P15qcntLT08/P17++x/j4+f39/Jmbnpibnre4v5qcn8nKzHZ7e8LByfj4+KuqrM3N1Pn7+7W3t7u9xO7s8Onp7YGEhsTEyM7R0GFgYc/O0OPk7cjHyu/w8dDQ2ICCg1FTVG9ucpqaoPDw+urr6peamp6gpD4/P3p+fKCip7CzuNDR1+bm79bW38/R1+Li4qyurfHx8svL05ibm6GhoMDAwJCTk/Dv85yaoL/Ax5mbouPj7PX1/wAAAAAAAAAAAAAAACH5BAEAAHsALAAAAAAMAAwAQAeUgFIfaFVeKwMSLEZ4e3tXNTBkGzQNTQAdI2kiFmZQBExDIEUve0lWYF8AAXAuJW4he3oAJlhBOAYYMlRzDntyADlnSkstHDw2YkAPJ3VbdyRZBXQLe2UATgIAT2ptXT4zez8AYRkpEVN2XEQXWntjSDdRCBQMQgEoFXtvMSoKAP8AdGjIswfCkQk7PCSIw+bAmh6BAAA7" title="Multi-page thread" style="vertical-align:middle;border-width: 0px; ">
                                                            <a href="${initParam['siteurl']}thread/${thread.id}" style="color:rgb(0, 89, 189);text-decoration:none;">1</a>
                                                        <a href="${initParam['siteurl']}thread/${thread.id}?page=2" style="color:rgb(0, 89, 189);text-decoration:none;">2</a>
                                                        <a href="${initParam['siteurl']}thread/${thread.id}?page=3" style="color:rgb(0, 89, 189);text-decoration:none;">3</a>
                                                        <a href="${initParam['siteurl']}thread/${thread.id}?page=4" style="color:rgb(0, 89, 189);text-decoration:none;">4</a>
                                                        <a href="${initParam['siteurl']}thread/${thread.id}?page=5" style="color:rgb(0, 89, 189);text-decoration:none;">5</a>
                                                        ... 
                                                        <a href="${initParam['siteurl']}thread/${thread.id}?page=96" style="color:rgb(0, 89, 189);text-decoration:none;">Trang Cuối</a>)</span>
                                                </div>
                                                <div style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                                    <span style="float:right;"><img alt="Thread Rating: 3 votes, 5.00 average." src="${initParam['imageurl']}rating-trans-15_5.png" title="Thread Rating: 3 votes, 5.00 average." style="vertical-align:middle;border-width: 0px; "></span>
                                                    <span style="cursor:pointer;">${thread.userId.displayName}</span>
                                                </div>
                                            </td>
                                            <td title="Replies: 956, Views: 45,996" style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">
                                                <div style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;text-align:right;white-space:nowrap;">
                                                    04-07-2013 <span style="color:rgb(85, 85, 85);">13:47</span><br>
                                                    bởi <a href="${initParam['siteurl']}user/${thread.getLastPostofThread().userId.id}" style="color:rgb(0, 89, 189);text-decoration:none;">
                                                        ${thread.getLastPostofThread().userId.displayName}
                                                    </a>
                                                    <a href="${initParam['siteurl']}" style="color:rgb(0, 89, 189);text-decoration:none;">
                                                        <img alt="Tới bài mới nhất" src="${initParam['imageurl']}golink.gif" title="Tới bài mới nhất" style="vertical-align:middle;border-width: 0px; ">
                                                    </a>
                                                </div>
                                            </td>
                                            <td align="center" style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">
                                                <a href="${initParam['siteurl']}" style="color:rgb(0, 89, 189);text-decoration:none;">${thread.countPosts()}</a>
                                            </td>
                                            <td align="center" style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">0</td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:if>

                            <tr>
                                <td colspan="7" style="background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; ">Normal Threads</td>
                            </tr>

                            <c:forEach items="${threads}" var="thread">
                                <c:if test="${not thread.sticky}">
                                    <tr>
                                        <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">
                                            <img src="${initParam['imageurl']}thread_hot_new.gif">
                                        </td>
                                        <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">&nbsp;</td>


                                        <td title="${thread.title}" style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">
                                            <div>
                                                <a href="${initParam['siteurl']}thread/${thread.id}" style="color:rgb(0, 89, 189);text-decoration:none;">${thread.title}</a> <c:if test="${not empty user && user.issetPermission('edit_thread')}"><a href="${initParam['siteurl']}editthread/${thread.id}">Edit</a></c:if>
                                                    <span style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;white-space:nowrap;">
                                                        (<img alt="Multi-page thread" src="data:image/gif;base64,R0lGODlhDAAMAOZ7AP///+rp61JVVYCDg8TDy9LS09rb4dzc5dzc5r6+xoGDhJeYms/P2u3s8cPEy/Hy86SnrOvr74yOkJman8bH06SmqouLkZOSktbX3UBCRcDDyPPx+kZHS93d3Kyss6iqr93d4YqLjPz8/o+Qkaiorerq7cvKzrGytK+vsOfo6H5+gX6CgpueoUpPUOXl54SEhF5fZdvb4cbIz4ODhd7g6MC/ybe3vlZWXOrq7qurqvP09pGRloaGi/Ly/MbGzM7P15qcntLT08/P17++x/j4+f39/Jmbnpibnre4v5qcn8nKzHZ7e8LByfj4+KuqrM3N1Pn7+7W3t7u9xO7s8Onp7YGEhsTEyM7R0GFgYc/O0OPk7cjHyu/w8dDQ2ICCg1FTVG9ucpqaoPDw+urr6peamp6gpD4/P3p+fKCip7CzuNDR1+bm79bW38/R1+Li4qyurfHx8svL05ibm6GhoMDAwJCTk/Dv85yaoL/Ax5mbouPj7PX1/wAAAAAAAAAAAAAAACH5BAEAAHsALAAAAAAMAAwAQAeUgFIfaFVeKwMSLEZ4e3tXNTBkGzQNTQAdI2kiFmZQBExDIEUve0lWYF8AAXAuJW4he3oAJlhBOAYYMlRzDntyADlnSkstHDw2YkAPJ3VbdyRZBXQLe2UATgIAT2ptXT4zez8AYRkpEVN2XEQXWntjSDdRCBQMQgEoFXtvMSoKAP8AdGjIswfCkQk7PCSIw+bAmh6BAAA7" title="Multi-page thread" style="vertical-align:middle;border-width: 0px; ">
                                                        <a href="${initParam['siteurl']}thread/${thread.id}" style="color:rgb(0, 89, 189);text-decoration:none;">1</a>
                                                    <a href="${initParam['siteurl']}thread/${thread.id}?page=2" style="color:rgb(0, 89, 189);text-decoration:none;">2</a>
                                                    <a href="${initParam['siteurl']}thread/${thread.id}?page=3" style="color:rgb(0, 89, 189);text-decoration:none;">3</a>
                                                    <a href="${initParam['siteurl']}thread/${thread.id}?page=4" style="color:rgb(0, 89, 189);text-decoration:none;">4</a>
                                                    <a href="${initParam['siteurl']}thread/${thread.id}?page=5" style="color:rgb(0, 89, 189);text-decoration:none;">5</a>
                                                    ... <a href="${initParam['siteurl']}thread/${thread.id}?page=96" style="color:rgb(0, 89, 189);text-decoration:none;">Trang Cuối</a>)</span>
                                            </div>
                                            <div style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                                <span style="float:right;"><img alt="Thread Rating: 3 votes, 5.00 average." src="${initParam['imageurl']}rating-trans-15_5.png" title="Thread Rating: 3 votes, 5.00 average." style="vertical-align:middle;border-width: 0px; "></span>
                                                <span style="cursor:pointer;">${thread.userId.displayName}</span>
                                            </div>
                                        </td>
                                        <td title="Replies: 956, Views: 45,996" style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">
                                            <div style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;text-align:right;white-space:nowrap;">
                                                04-07-2013 <span style="color:rgb(85, 85, 85);">13:47</span><br>
                                                bởi <a href="${initParam['siteurl']}user/${thread.postsList.get(0).userId.id}" style="color:rgb(0, 89, 189);text-decoration:none;">${thread.postsList.get(0).userId.displayName}</a>
                                                <a href="0BiOf/http://vnsharing.net${initParam['siteurl']}showthread.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;p=13468507%23post13468507" style="color:rgb(0, 89, 189);text-decoration:none;"><img alt="Tới bài mới nhất" src="${initParam['imageurl']}golink.gif" title="Tới bài mới nhất" style="vertical-align:middle;border-width: 0px; "></a>
                                            </div>
                                        </td>
                                        <td align="center" style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; "><a href="0BiOf/http://vnsharing.net${initParam['siteurl']}misc.php?do=whoposted&amp;t=408351" style="color:rgb(0, 89, 189);text-decoration:none;">0</a></td>
                                        <td align="center" style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">0</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>

                    <table style="border-collapse:separate;border-spacing:0px;width:100%;margin-top:3px;border-width: 0px; border-style: outset; border-color: #999; ">
                        <tbody>
                            <tr style="vertical-align:top;">
                                <td style="color:rgb(51, 51, 51);font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; ">
                                    <a href="${initParam['siteurl']}newthread/${boxs.get(0).id}" style="color:rgb(0, 89, 189);text-decoration:none;">
                                        <img alt="Gởi Ðề Tài Mới" src="${initParam['imageurl']}newtopic.jpg" title="Gởi Ðề Tài Mới" style="border-width: 0px; ">
                                    </a>
                                </td>
                                <td align="right" style="color:rgb(51, 51, 51);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; ">
                                    <div align="right">
                                        <table style="border-collapse:separate;border-spacing:1px;background-color: rgb(227, 227, 227); color:rgb(0, 0, 0);border-width: 1px; border-style: solid; border-color: rgb(0, 117, 201); ">
                                            <tbody>
                                                <tr>
                                                    <td style="background-image:url(${initParam['imageurl']}tcat.gif);background-color: rgb(0, 117, 201); color:rgb(255, 255, 255);font:normal normal bold 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;font-weight:normal;background-position: 0% 0%; background-repeat: repeat-x; padding: 2px 4px; ">Trang ${paged.current_page}/${paged.total_pages}</td>
                                                    <c:if test="${paged.has_previous}">
                                                        <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                            <a href="${initParam['siteurl']}box/${threads.get(0).boxId.id}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&lt;&lt;</a>
                                                        </td>
                                                        <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                            <a href="${initParam['siteurl']}box/${threads.get(0).boxId.id}?page=${paged.previous_page}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&lt;</a>
                                                        </td>
                                                    </c:if>

                                                    <c:forEach var="i" begin="1" end="${paged.total_pages}">
                                                        <c:choose>
                                                            <c:when test="${i eq paged.current_page}">
                                                                <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; "><span style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                                                        <b>${paged.current_page}</b></span>
                                                                </td>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                                    <a href="${initParam['siteurl']}box/${threads.get(0).boxId.id}?page=${i}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">${i}</a>
                                                                </td>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>

                                                    <c:if test="${paged.has_next}">
                                                        <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                            <a href="${initParam['siteurl']}box/${threads.get(0).boxId.id}?page=${paged.next_page}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&gt;</a>
                                                        </td>
                                                        <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                            <a href="${initParam['siteurl']}box/${threads.get(0).boxId.id}?page=${paged.total_pages}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&gt;&gt;</a>
                                                        </td>
                                                    </c:if>
                                                    <td style="background-image:url(${initParam['imageurl']}tcat.gif);background-color: rgb(0, 117, 201); color:rgb(255, 255, 255);font:normal normal bold 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;cursor:pointer;background-position: 0% 0%; background-repeat: repeat-x; padding: 2px 4px; ">
                                                        <img src="${initParam['imageurl']}download.gif" style="border-width: 0px; ">
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </c:if>
            </form>
            <br>

            <form action="#" method="get" style="margin: 0px; ">
                <input type="hidden" name="s" value="9b4796e5537a87c161aac07f9c3f29af">
                <input type="hidden" name="f" value="800">
                <input type="hidden" name="page" value="1">
                <input type="hidden" name="pp" value="25">
                <table align="center" style="border-collapse:separate;border-spacing:1px;width:100%;background-color: rgb(227, 227, 227); color:rgb(0, 0, 0);border-width: 1px; border-style: solid; border-color: rgb(0, 117, 201); ">
                    <tbody><tr>
                            <td style="background-image:url(${initParam['imageurl']}tcat.gif);background-color: rgb(0, 117, 201); color:rgb(255, 255, 255);font:normal normal bold 10pt/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 6px; ">Xếp Bài</td>
                            <td style="background-image:url(${initParam['imageurl']}tcat.gif);background-color: rgb(0, 117, 201); color:rgb(255, 255, 255);font:normal normal bold 10pt/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 6px; ">Ban quản trị</td>
                        </tr>
                        <tr>
                            <td style="background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; ">Xếp bài từ 1 tới 25 trên 307</td>
                            <td style="background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; ">Ban quản trị : 4</td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">
                                <table style="border-collapse:separate;border-spacing:1px;border-width: 0px; border-style: outset; border-color: #999; ">
                                    <tbody><tr style="vertical-align:bottom;">
                                            <td style="color:rgb(0, 0, 0);font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px 6px 0px 0px; ">
                                                <div><label for="sel_sort" style="cursor:default;">Xếp theo</label></div>
                                                <select style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">đề tài</option>
                                                    <option selected="selected" value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">bài chót</option>
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">Thread Start Time</option>
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">số lần trả lời</option>
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">số lần xem</option>
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">Người Gửi</option>
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">đánh giá đề tài</option>
                                                </select>
                                            </td>
                                            <td style="color:rgb(0, 0, 0);font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px 6px 0px 0px; ">
                                                <div><label for="sel_order" style="cursor:default;">Liệt kê</label></div>
                                                <select style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">từ nhỏ đến lớn</option>
                                                    <option selected="selected" value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">từ lớn đến nhỏ</option>
                                                </select>
                                            </td>
                                            <td style="color:rgb(0, 0, 0);font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; ">
                                                <div><label for="sel_daysprune" style="cursor:default;">Khoảng thời gian</label></div>
                                                <select style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">1 ngày</option>
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">2 ngày</option>
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">1 tuần</option>
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">10 ngày</option>
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">2 tuần</option>
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">1 tháng</option>
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">45 ngày</option>
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">2 tháng</option>
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">75 ngày</option>
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">100 ngày</option>
                                                    <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">1 năm</option>
                                                    <option selected="selected" value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">tất cả</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr style="vertical-align:bottom;">
                                            <td colspan="2" style="color:rgb(0, 0, 0);font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; ">
                                                &nbsp; </td>
                                            <td align="right" style="color:rgb(0, 0, 0);font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 6px 0px 0px; ">
                                                <input type="submit" value="Show Threads" style="background-color: rgb(88, 173, 23); color:rgb(255, 255, 255);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;border-width: 1px; border-style: solid; padding: 2px; border-color: rgb(204, 204, 204); ">
                                            </td>
                                        </tr>
                                    </tbody></table>
                            </td>
                            <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; "><div style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;"><a href="0BiOf/http://vnsharing.net${initParam['siteurl']}member.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;u=253044" style="color:rgb(0, 89, 189);text-decoration:none;"><b><font color="green">bigfree</font></b></a>,
                                    <a href="0BiOf/http://vnsharing.net${initParam['siteurl']}member.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;u=257775" style="color:rgb(0, 89, 189);text-decoration:none;"><b><font color="green">esmoon</font></b></a>,
                                    <a href="0BiOf/http://vnsharing.net${initParam['siteurl']}member.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;u=421791" style="color:rgb(0, 89, 189);text-decoration:none;"><b><font color="green">Miku-tan</font></b></a>,
                                    <a href="0BiOf/http://vnsharing.net${initParam['siteurl']}member.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;u=381947" style="color:rgb(0, 89, 189);text-decoration:none;"><b><font color="green">LeoShadow</font></b></a>&nbsp;</div></td>
                        </tr>
                    </tbody></table>
            </form>

            <br>


            <div style="background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);display:none;border-width: 1px; border-style: solid; border-color: rgb(236, 236, 236); ">
                <form action="#" method="post" style="margin: 0px; ">
                    <table style="border-collapse:separate;border-spacing:1px;border-width: 0px; border-style: outset; border-color: #999; ">
                        <tbody><tr><td style="background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; ">Sử Dụng<a name="goto_forumtools"></a></td></tr>
                            <tr><td style="background-color: rgb(239, 239, 239); color:rgb(51, 51, 51);font:normal normal normal 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;white-space:nowrap;cursor:pointer;padding: 4px; "><a href="${initParam['siteurl']}newthread/${boxs.get(0).id}" style="color:rgb(0, 0, 0);text-decoration:none;">Tạo Ðề Tài Mới</a></td></tr>
                            <tr><td style="background-color: rgb(239, 239, 239); color:rgb(51, 51, 51);font:normal normal normal 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;white-space:nowrap;cursor:pointer;padding: 4px; "><a href="0BiOf/http://vnsharing.net${initParam['siteurl']}forumdisplay.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;do=markread&amp;f=800" style="color:rgb(0, 0, 0);text-decoration:none;">Ðánh Dấu Ðã Ðọc</a></td></tr>
                            <tr>
                                <td style="background-color: rgb(239, 239, 239); color:rgb(51, 51, 51);font:normal normal normal 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;white-space:nowrap;cursor:pointer;padding: 4px; ">
                                    <a href="0BiOf/http://vnsharing.net${initParam['siteurl']}subscription.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;do=addsubscription&amp;f=800" style="color:rgb(0, 0, 0);text-decoration:none;">Theo Dõi Chuyên Mục</a>
                                </td>
                            </tr>
                            <tr><td style="background-color: rgb(239, 239, 239); color:rgb(51, 51, 51);font:normal normal normal 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;white-space:nowrap;cursor:pointer;padding: 4px; "><a href="0BiOf/http://vnsharing.net${initParam['siteurl']}forumdisplay.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;f=1231" style="color:rgb(0, 0, 0);text-decoration:none;">Xem Chuyên Mục Chánh</a></td></tr>
                        </tbody></table>
                </form>
            </div>








            <table style="border-collapse:separate;border-spacing:0px;border-width: 0px; border-style: outset; border-color: #999; ">
                <tbody><tr>
                        <td style="color:rgb(51, 51, 51);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 2px; "><img alt="Có bài mới" src="${initParam['imageurl']}thread_new.gif" title="Có bài mới" style="border-width: 0px; "></td>
                        <td style="color:rgb(51, 51, 51);font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 2px; ">Có bài mới</td>
                        <td style="color:rgb(51, 51, 51);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 2px; "><img alt="Nhiều hơn 15 trả lời hoặc 150 lần xem" src="${initParam['imageurl']}thread_hot_new.gif" title="Nhiều hơn 15 trả lời hoặc 150 lần xem" style="border-width: 0px; "></td>
                        <td style="color:rgb(51, 51, 51);font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 2px; ">Có Bài Mới Trong Ðề Tài Sôi Nổi</td>
                    </tr>
                    <tr>
                        <td style="color:rgb(51, 51, 51);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 2px; "><img alt="Chưa có bài mới" src="${initParam['imageurl']}thread_old.gif" title="Chưa có bài mới" style="border-width: 0px; "></td>
                        <td style="color:rgb(51, 51, 51);font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 2px; ">Chưa có bài mới</td>
                        <td style="color:rgb(51, 51, 51);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 2px; "><img alt="Nhiều hơn 15 trả lời hoặc 150 lần xem" src="${initParam['imageurl']}thread_hot_new.gif" title="Nhiều hơn 15 trả lời hoặc 150 lần xem" style="border-width: 0px; "></td>
                        <td style="color:rgb(51, 51, 51);font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 2px; ">Chưa Có Bài Mới Trong Ðề Tài Sôi Nổi Này</td>
                    </tr>
                    <tr>
                        <td style="color:rgb(51, 51, 51);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 2px; "><img alt="Ðề tài đã khoá" src="${initParam['imageurl']}thread_lock.gif" title="Ðề tài đã khoá" style="border-width: 0px; "></td>
                        <td style="color:rgb(51, 51, 51);font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 2px; ">Ðã bị đóng lại</td>
                        <td colspan="2" style="color:rgb(51, 51, 51);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 2px; ">&nbsp;</td>
                    </tr>
                </tbody></table>


            <table align="center" style="border-collapse:separate;border-spacing:0px;width:100%;border-width: 0px; border-style: outset; border-color: #999; ">
                <tbody><tr style="vertical-align:bottom;">
                        <td style="width:100%;color:rgb(51, 51, 51);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; ">
                            <div style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">&nbsp;</div>
                            <table style="border-collapse:separate;border-spacing:1px;width:210px;background-color: rgb(227, 227, 227); color:rgb(0, 0, 0);border-width: 1px; border-style: solid; border-color: rgb(0, 117, 201); ">
                                <thead>
                                    <tr>
                                        <td style="background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; ">
                                            <a href="0BiOf/http://vnsharing.net${initParam['siteurl']}forumdisplay.php?f=800%23top" style="color:rgb(51, 51, 51);text-decoration:none;float:right;"><img src="data:image/gif;base64,R0lGODlhDQANAJEAAP////+nJP///wAAACH5BAEHAAIALAAAAAANAA0AAAIghI8oyy3mImzBzRVyu1qvi1kA5X0jVpVg9Jys+TLJfBQAOw==" style="border-width: 0px; "></a>
                                            Quyền Hạn Của Bạn </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td style="white-space:nowrap;font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; "><div style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                                <div>You
                                                    <strong>may not</strong>
                                                    post new threads</div>
                                                <div>You
                                                    <strong>may not</strong>
                                                    post replies</div>
                                                <div>You
                                                    <strong>may not</strong>
                                                    post attachments</div>
                                                <div>You
                                                    <strong>may not</strong>
                                                    edit your posts</div>
                                                <hr>
                                                <div><a href="0BiOf/http://vnsharing.net${initParam['siteurl']}misc.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;do=bbcode" style="color:rgb(0, 89, 189);text-decoration:none;">BB code</a>
                                                    is <strong>Mở</strong></div>
                                                <div><a href="0BiOf/http://vnsharing.net${initParam['siteurl']}misc.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;do=showsmilies" style="color:rgb(0, 89, 189);text-decoration:none;">Smilies</a>
                                                    đang <strong>Mở</strong></div>
                                                <div><a href="0BiOf/http://vnsharing.net${initParam['siteurl']}misc.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;do=bbcode%23imgcode" style="color:rgb(0, 89, 189);text-decoration:none;">[IMG]</a>
                                                    đang <strong>Mở</strong></div>
                                                <div>HTML đang
                                                    <strong>Tắt</strong></div>
                                                <hr>
                                                <div><a href="0BiOf/http://vnsharing.net${initParam['siteurl']}misc.php?s=9b4796e5537a87c161aac07f9c3f29af&amp;do=showrules" style="color:rgb(0, 89, 189);text-decoration:none;">Forum Rules</a></div>
                                            </div></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td style="color:rgb(51, 51, 51);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; ">
                            <div style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;white-space:nowrap;">
                                <form action="#" method="get" style="margin: 0px; ">
                                    <input type="hidden" name="s" value="9b4796e5537a87c161aac07f9c3f29af">
                                    <input type="hidden" name="daysprune" value="-1">
                                    <strong>Chuyển đến</strong><br>
                                    <select style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                        <optgroup label="Chức Năng" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                            <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">Khung Ðiều Chỉnh</option>
                                            <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">Nhắn tin</option>
                                            <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">Ðang theo dõi</option>
                                            <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">Phúc Trình Vãng Lai</option>
                                            <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">Kiếm Trong Diễn Ðàn</option>
                                            <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">Trang Ðầu</option>
                                        </optgroup>

                                        <optgroup label="Diễn Ðàn" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                            <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(247, 247, 247); color:rgb(0, 0, 0);"> VnSharing - Trung tâm điều hành</option>
                                            <option value="" style="font-size:11px;font-family:arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">&nbsp; &nbsp;  Thông báo - Sự kiện</option>

                                        </optgroup>

                                    </select><input type="submit" value="Tiếp Tục" style="background-color: rgb(88, 173, 23); color:rgb(255, 255, 255);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;border-width: 1px; border-style: solid; padding: 2px; border-color: rgb(204, 204, 204); ">
                                </form>
                            </div>
                        </td>
                    </tr>
                </tbody></table>
        </div>


        <%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>

    <script>

        function rename_thread(id) {
            document.getElementById("thread_" + id).href = "javascript:void(0)";
            document.getElementById("thread_" + id).innerHTML = '<input id="selected" onfocusout="rename_send(' + id + ')" type="text" value="' + document.getElementById("thread_" + id).innerHTML.replace(/  +/g, ' ') + '" />';
            document.getElementById("selected").focus();
        }

        function rename_send(id) {
            document.getElementById("thread_" + id).href = "${initParam['siteurl']}thread/" + id;
            document.getElementById("thread_" + id).innerHTML = document.getElementById("selected").value;

            if (window.XMLHttpRequest) {
                xhttp = new XMLHttpRequest();
            } else {
                xhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState == 4 && xhttp.status == 200) {
                    if (xhttp.responseText == "1") {
                        document.getElementById("thread_" + id).href = "${initParam['siteurl']}thread/" + id;
                        document.getElementById("thread_" + id).innerHTML = document.getElementById("selected").value;
                    }
                }
            }
            xhttp.open("GET", "http://truyen.skyrule.net/api/reader/search/stub/a", true);
            xhttp.send();
        }
    </script>

</html>
