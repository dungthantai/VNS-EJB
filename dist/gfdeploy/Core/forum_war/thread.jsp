<%-- 
    Document   : thread
    Created on : Feb 15, 2016, 11:44:23 PM
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

            fieldset{
                margin-left: 2px;
                margin-right: 2px;
                padding: 0.35em 0.75em 0.625em 0.75em;                                                                                             border-color: rgb(192, 192, 192);
                border-style: groove;
                border-width: 2px;
                border-collapse: separate;
                border-image-outset: 0px;
                border-image-repeat: stretch;
                border-image-slice: 100%;
                border-image-source: none;
                border-image-width: 1;
            }
            
            <%@include file="/WEB-INF/jspf/reset.jspf" %>
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
        <script src="${initParam['siteurl']}ckeditor/ckeditor.js"></script>
    </head>


    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>


        <div class="body" style="vertical-align:bottom;color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;overflow-x:visible;overflow-y:visible;margin: 0px; padding: 0px; ">
            <div align="center">
                <div style="background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);width:100%;">
                    <div align="left" style="padding: 0px 10px; ">
                        <br>
                        <table style="border-collapse:separate;border-spacing:0px;width:100%;margin-bottom:3px;border-width: 0px; border-style: outset; border-color: #999; ">
                            <tbody>
                                <tr style="vertical-align:bottom;">
                                    <td style="color:rgb(51, 51, 51);font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; "><a href="${initParam['siteurl']}createpost/" style="color:rgb(0, 89, 189);text-decoration:none;"><img alt="Trả lời" src="${initParam['imageurl']}newreply.jpg" title="Trả lời" style="border-width: 0px; "></a></td>
                                    <td align="right" style="color:rgb(51, 51, 51);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; ">
                                        <div align="right">
                                            <table style="border-collapse:separate;border-spacing:1px;background-color: rgb(227, 227, 227); color:rgb(0, 0, 0);border-width: 1px; border-style: solid; border-color: rgb(0, 117, 201); ">
                                                <tbody>
                                                    <tr>
                                                        <td style="background-image:url(${initParam['imageurl']}tcat.gif);background-color: rgb(0, 117, 201); color:rgb(255, 255, 255);font:normal normal bold 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;font-weight:normal;background-position: 0% 0%; background-repeat: repeat-x; padding: 2px 4px; ">Trang ${paged.current_page}/${paged.total_pages}</td>
                                                        <c:if test="${paged.has_previous}">
                                                            <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                                <a href="${initParam['siteurl']}thread/${posts.get(0).threadId.id}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&lt;&lt;</a>
                                                            </td>
                                                            <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                                <a href="${initParam['siteurl']}thread/${posts.get(0).threadId.id}?page=${paged.previous_page}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&lt;</a>
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
                                                                        <a href="${initParam['siteurl']}thread/${posts.get(0).threadId.id}?page=${i}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">${i}</a>
                                                                    </td>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>

                                                        <c:if test="${paged.has_next}">
                                                            <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                                <a href="${initParam['siteurl']}thread/${posts.get(0).threadId.id}?page=${paged.next_page}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&gt;</a>
                                                            </td>
                                                            <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                                <a href="${initParam['siteurl']}thread/${posts.get(0).threadId.id}?page=${paged.total_pages}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&gt;&gt;</a>
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
                                    <td style="width:100%;background-image:url(${initParam['imageurl']}tcat.gif);background-color: rgb(0, 117, 201); color:rgb(255, 255, 255);font:normal normal bold 10pt/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 6px; ">
                                        <div style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                            &nbsp; 
                                        </div>
                                    </td>
                                    <td style="white-space:nowrap;background-image:url(${initParam['imageurl']}tcat.gif);background-color: rgb(0, 117, 201); color:rgb(255, 255, 255);font:normal normal bold 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;cursor:pointer;background-position: 0% 0%; background-repeat: repeat-x; padding: 6px; ">
                                        <a href="x" style="color:rgb(255, 255, 255);text-decoration:none;">Ðiều Chỉnh</a>
                                        <img src="${initParam['imageurl']}download.gif" style="border-width: 0px; ">
                                    </td>
                                    <td style="white-space:nowrap;background-image:url(${initParam['imageurl']}tcat.gif);background-color: rgb(0, 117, 201); color:rgb(255, 255, 255);font:normal normal bold 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;cursor:pointer;background-position: 0% 0%; background-repeat: repeat-x; padding: 6px; ">
                                        <a href="x" style="color:rgb(255, 255, 255);text-decoration:none;">Xếp Bài</a>
                                        <img src="${initParam['imageurl']}download.gif" style="border-width: 0px; ">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div>
                <div align="center">
                    <c:forEach items="${posts}" var="post">
                        <div style="background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);width:100%;">
                            <div align="left" style="padding: 0px 10px; ">
                                <div style="padding: 0px 0px 6px; ">
                                    <table align="center" style="border-collapse:separate;border-spacing:1px;width:100%;background-color: rgb(227, 227, 227); color:rgb(0, 0, 0);border-width: 1px; border-style: solid; border-color: rgb(0, 117, 201); ">
                                        <tbody>
                                            <tr>
                                                <td style="background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; ">
                                                    <div style="font-weight:normal;float:right;">
                                                        &nbsp; #<a href="${initParam['siteurl']}post/${post.id}" name="${post.id}" style="color:rgb(51, 51, 51);text-decoration:none;"><strong>${post.id}</strong></a>
                                                        &nbsp; 
                                                    </div>
                                                    <div style="font-weight:normal;">
                                                        <a name="post5128081"><img alt="Old" src="${initParam['imageurl']}lrpost.gif" title="Old" style="vertical-align:middle;border-width: 0px; "></a>
                                                            ${post.created}
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 0px; ">
                                                    <table style="border-collapse:separate;border-spacing:6px;width:100%;border-width: 0px; border-style: outset; border-color: #999; ">
                                                        <tbody>
                                                            <tr>
                                                                <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 0px; "><a href="${initParam['siteurl']}member/${post.userId.id}" style="color:rgb(0, 89, 189);text-decoration:none;"><img alt="${post.userId.displayName}'s Avatar" src="${initParam['imageurl']}dfavatar.jpg" title="${post.userId.displayName}'s Avatar" style="max-height:150px;max-width:150px;border-width: 0px; "></a></td>
                                                                <td style="white-space:nowrap;color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; ">
                                                                    <div>
                                                                        <a href="${initParam['siteurl']}member/${post.userId.id}" style="font-size:14pt;color:rgb(0, 89, 189);text-decoration:none;"><b><font color="brown">${post.userId.displayName}</font></b></a>
                                                                        <img alt="${post.userId.displayName} is offline" src="${initParam['imageurl']}user_offline.gif" title="${post.userId.displayName} is offline" style="vertical-align:middle;border-width: 0px; ">
                                                                    </div>
                                                                    <div style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">&zwj;</div>
                                                                </td>
                                                                <td style="width:82%;color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; ">
                                                                    <table style="width:100%;">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td style="width:57%;color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">&nbsp;</td>
                                                                                <td style="width:20%;vertical-align:top;color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                                                                    <fieldset style="background-image:url(${initParam['imageurl']}lover/lover_bg/bghoaanhdao.jpg);background-color: transparent; ">
                                                                                        <legend style="color:rgb(0, 100, 0);font:normal normal normal 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;">Lover</legend>
                                                                                        <table style="border-collapse:separate;border-spacing:0px;border-width: 0px; border-style: outset; border-color: #999; ">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td style="color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; "><img src="${initParam['imageurl']}lover/lover_icon/doremon.png"></td>
                                                                                                    <td style="white-space:nowrap;color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;font-size:19px;padding: 0px 5px; "><a href="${initParam['siteurl']}user/${post.userId.id}" style="color:rgb(0, 89, 189);text-decoration:none;"><b><font color="brown">${post.userId.displayName}</font></b></a></td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </fieldset>
                                                                                </td>
                                                                                <td style="width:155px;vertical-align:top;color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;"></td>
                                                                                <td style="width:23%;vertical-align:top;color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                                                                    <fieldset>
                                                                                        <legend style="color:rgb(0, 100, 0);font:normal normal normal 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;">
                                                                                            <a href="${initParam['siteurl']}myawards/$" title="more»" style="color:rgb(0, 89, 189);text-decoration:none;">Phòng trưng bày huy hiệu</a>
                                                                                        </legend>
                                                                                        <div>
                                                                                            <table style="border-collapse:separate;border-spacing:0px;border-width: 0px; border-style: outset; border-color: #999; ">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td style="color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; ">
                                                                                                            <a href="${initParam['siteurl']}member/${post.userId.id}" style="color:rgb(0, 89, 189);text-decoration:none;">
                                                                                                                <img alt="DOS Tan" src="${initParam['imageurl']}awards/dos_tan.png" title="DOS Tan" style="border-width: 0px; ">
                                                                                                            </a>&nbsp;
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; ">
                                                                                                            <a href="${initParam['siteurl']}member/${post.userId.id}&amp;tab=myawards%23aw_issue21967" style="color:rgb(0, 89, 189);text-decoration:none;">
                                                                                                                <img alt="Windows 98 Tan" src="${initParam['imageurl']}awards/dos_tan.png" title="Windows 98 Tan" style="border-width: 0px; ">
                                                                                                            </a>&nbsp;
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                            <a href="${initParam['siteurl']}myawards/$" title="more»" style="color:rgb(0, 89, 189);text-decoration:none;">Tổng số huy hiệu</a>: 17
                                                                                        </div>
                                                                                    </fieldset>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                                <td style="width:18%;vertical-align:top;color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; ">
                                                                    <div style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                                                        <div>Tham gia ngày: 03-01-2010</div>
                                                                        <div>Chủng tộc:
                                                                            <img alt="Chocobo" src="${initParam['imageurl']}races/chocobo.png" title="Chocobo" style="vertical-align:middle;border-width: 0px; ">
                                                                        </div>
                                                                        <div>
                                                                            <b><font color="green">Bài gửi:</font>
                                                                                7,042<b>
                                                                                </b></b>
                                                                        </div>
                                                                        <b>
                                                                            <b>
                                                                                <font color="green"><b>Cấp Độ</b></font>:
                                                                                <span><b>0</b></span>
                                                                                <div><span><font color="green"><b>Rep</b></font>:
                                                                                        <b>${post.userId.reputation}</b><br><img alt="${post.userId.displayName} has a reputation beyond repute" src="${initParam['imageurl']}reputation_goldstar.png" title="${post.userId.displayName} has a reputation beyond repute" style="vertical-align:middle;border-width: 0px; "><br><img alt="${post.userId.displayName} has a reputation beyond repute" src="${initParam['imageurl']}reputation_green.gif" title="${post.userId.displayName} has a reputation beyond repute" style="vertical-align:middle;border-width: 0px; "><img alt="${post.userId.displayName} has a reputation beyond repute" src="${initParam['imageurl']}reputation_greenh.gif" title="${post.userId.displayName} has a reputation beyond repute" style="vertical-align:middle;border-width: 0px; "></span>
                                                                                </div>
                                                                                <br>
                                                                                <div></div>
                                                                            </b>
                                                                        </b>
                                                                    </div>
                                                                    <b><b>
                                                                        </b></b>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 6px; ">
                                                    <div class="reset">
                                                        ${post.content} 
                                                    </div>
                                                    <table style="width:100%;border-collapse:collapse;border-width: medium; border-style: none; border-color: white; ">
                                                        <tbody>
                                                            <tr>
                                                                <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;">
                                                                    <div>
                                                                        __________________<br>
                                                                        <div style="max-height:250px;overflow-y:auto;overflow-x:hidden;">
                                                                            ${post.userId.displayName}
                                                                        </div>
                                                                    </div>
                                                                    <div style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;">
                                                                        <hr size="1" style="color:rgb(227, 227, 227);background-color: rgb(227, 227, 227); ">
                                                                        <em>
                                                                            thay đổi nội dung bởi:<strong>
                                                                                ${post.userId.displayName}</strong>, 26-12-2010 lúc
                                                                            <span style="color:rgb(85, 85, 85);">06:22</span>
                                                                        </em>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <div align="right" style="margin-top:10px;">
                                                        <a href="${initParam['siteurl']}editpost/${post.id}" style="color:rgb(0, 89, 189);text-decoration:none;">
                                                            EDIT
                                                        </a>
                                                        <a href="${initParam['siteurl']}newpost/${posts.get(0).threadId.id}?quote=${post.id}" style="color:rgb(0, 89, 189);text-decoration:none;">
                                                            <img alt="Trả Lời Với Trích Dẫn" src="${initParam['imageurl']}quote.jpg" title="Trả Lời Với Trích Dẫn" style="border-width: 0px; ">
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div style="background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);display:none;border-width: 1px; border-style: solid; border-color: rgb(236, 236, 236); ">
                                        <table style="border-collapse:separate;border-spacing:1px;border-width: 0px; border-style: outset; border-color: #999; ">
                                            <tbody>
                                                <tr>
                                                    <td style="background-image:url(${initParam['imageurl']}thead2.gif);background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);font:normal normal bold 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-position: 0% 0%; background-repeat: repeat-x; padding: 4px; ">${post.userId.displayName}</td>
                                                </tr>
                                                <tr>
                                                    <td style="background-color: rgb(239, 239, 239); color:rgb(51, 51, 51);font:normal normal normal 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;white-space:nowrap;cursor:pointer;padding: 4px; "><a href="${initParam['siteurl']}member/${post.userId.id}" style="color:rgb(0, 0, 0);text-decoration:none;">Xem hồ sơ</a></td>
                                                </tr>
                                                <tr>
                                                    <td style="background-color: rgb(239, 239, 239); color:rgb(51, 51, 51);font:normal normal normal 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;white-space:nowrap;cursor:pointer;padding: 4px; "><a href="x" style="color:rgb(0, 0, 0);text-decoration:none;">Gởi tin nhắn tới ${post.userId.displayName}</a></td>
                                                </tr>
                                                <tr>
                                                    <td style="background-color: rgb(239, 239, 239); color:rgb(51, 51, 51);font:normal normal normal 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;white-space:nowrap;cursor:pointer;padding: 4px; "><a href="x" style="color:rgb(0, 0, 0);text-decoration:none;">Tìm bài gởi bởi ${post.userId.displayName}</a></td>
                                                </tr>
                                                <tr>
                                                    <td style="background-color: rgb(239, 239, 239); color:rgb(51, 51, 51);font:normal normal normal 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;white-space:nowrap;cursor:pointer;padding: 4px; "><a href="x" style="color:rgb(0, 0, 0);text-decoration:none;">Chuyển Rep cho ${post.userId.displayName}</a></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div align="center">
                <div style="background-color: rgb(255, 255, 255); color:rgb(51, 51, 51);width:100%;">
                    <div align="left" style="padding: 0px 10px; ">
                        <table style="border-collapse:separate;border-spacing:0px;width:100%;margin-top:-3px;border-width: 0px; border-style: outset; border-color: #999; ">
                            <tbody>
                                <tr style="vertical-align:top;">
                                    <td style="color:rgb(51, 51, 51);font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; "><a href="${initParam['siteurl']}creatpost/${posts.get(0).threadId.id}" style="color:rgb(0, 89, 189);text-decoration:none;"><img alt="Trả lời" src="${initParam['imageurl']}newreply.jpg" title="Trả lời" style="border-width: 0px; "></a></td>
                                    <td align="right" style="color:rgb(51, 51, 51);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; ">
                                        <div align="right">
                                            <table style="border-collapse:separate;border-spacing:1px;background-color: rgb(227, 227, 227); color:rgb(0, 0, 0);border-width: 1px; border-style: solid; border-color: rgb(0, 117, 201); ">
                                                <tbody>

                                                    <tr>
                                                        <td style="background-image:url(${initParam['imageurl']}tcat.gif);background-color: rgb(0, 117, 201); color:rgb(255, 255, 255);font:normal normal bold 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;font-weight:normal;background-position: 0% 0%; background-repeat: repeat-x; padding: 2px 4px; ">Trang ${paged.current_page}/${paged.total_pages}</td>
                                                        <c:if test="${paged.has_previous}">
                                                            <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                                <a href="${initParam['siteurl']}thread/${posts.get(0).threadId.id}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&lt;&lt;</a>
                                                            </td>
                                                            <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                                <a href="${initParam['siteurl']}thread/${posts.get(0).threadId.id}?page=${paged.previous_page}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&lt;</a>
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
                                                                        <a href="${initParam['siteurl']}thread/${posts.get(0).threadId.id}?page=${i}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">${i}</a>
                                                                    </td>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>

                                                        <c:if test="${paged.has_next}">
                                                            <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                                <a href="${initParam['siteurl']}thread/${posts.get(0).threadId.id}?page=${paged.next_page}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&gt;</a>
                                                            </td>
                                                            <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                                <a href="${initParam['siteurl']}thread/${posts.get(0).threadId.id}?page=${paged.total_pages}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&gt;&gt;</a>
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
                    </div>
                </div>
            </div>
        </div>

        <c:if test="${not empty user.id}">
            <div id="qr_defaultcontainer" class="blockfoot floatcontainer qrcontainer" style="margin: 0px 10px 0px 10px; ">
                <div class="fullwidth">
                    <h3 id="quickreply_title" class="blockhead">
                        <img src="${initParam['imageurl']}reply_40b.png" alt="Trả lời nhanh" style="float:left;padding-right:10px" title="Trả lời nhanh"> Trả lời nhanh
                        <a name="quickreply"></a> 
                    </h3>
                </div>
                <form method="POST" action="${initParam['siteurl']}newpost/${posts.get(0).threadId.id}">
                    <textarea id="editor" name="content" rows="10" cols="80"></textarea>
                    <input type="submit" class="button" value="Gửi trả lời nhanh" name="sbutton" tabindex="1">
                    <input type="reset" class="button" value="Hủy bỏ" name="cancel" tabindex="4">
                </form>


                <script>
                    $(function () {
                        CKEDITOR.replace('editor');
                    });
                </script>
            </div>

        </c:if>


        <div class="navlinks">
            <strong>«</strong>
            <a href="showthread.php?t=99457&amp;goto=nextoldest" rel="nofollow">Chủ đề trước</a>
            |
            <a href="showthread.php?t=99457&amp;goto=nextnewest" rel="nofollow">Chủ đề kế tiếp</a>
            <strong>»</strong>
        </div>


        <%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>

</html>