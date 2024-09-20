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
            <%@include file="/WEB-INF/jspf/style_member.jspf" %>
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
        <script src="${initParam['siteurl']}ckeditor/ckeditor.js"></script>
        <script>
            $(document).ready(function () {
                $(".multi_tab>ul>li").click(function (event) {
                    $(".multi_tab>ul>li").removeClass("selected");
                    $(this).addClass("selected");
                    $(".multi_tab>div").removeClass("selected");
                    $(".multi_tab>." + event.target.id).addClass("selected");
                });
            });
        </script>
    </head>

    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>



        <div class="usercp">
            <div class="left_usercp">
                <div>
                    <div class="info">
                        <table>
                            <tbody>
                                <tr>
                                    <td>
                                        <div>
                                            <div class="rep">
                                                <img alt="${member.displayName} has a reputation beyond repute" src="${initParam['imageurl']}reputation_green.gif" title="${member.displayName} has a reputation beyond repute">
                                                <img alt="${member.displayName} has a reputation beyond repute" src="${initParam['imageurl']}reputation_green.gif" title="${member.displayName} has a reputation beyond repute">
                                                <img alt="${member.displayName} has a reputation beyond repute" src="${initParam['imageurl']}reputation_greenh.gif" title="${member.displayName} has a reputation beyond repute">
                                            </div>
                                        </div>
                                        <h1><b>${member.displayName}</b>
                                            <img alt="${member.displayName} is offline" src="https://archive.li/HWaTz/37b284dba448f68a43b72884d5171d58796393e7.gif" title="${member.displayName} is offline">
                                        </h1>
                                        <h2>Rook</h2>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div>
                            <ul>
                                <li>Gửi tin</a>
                                    <img src="data:image/gif;base64,R0lGODlhCwAHAKIEAP///wAAAOjo6NXV1QAAAAAAAAAAAAAAACH5BAEAAAQALAAAAAALAAcAAAMXGLqs8PAJJSIcgYQaMfnblX1g5ZHkgiYAOw==">
                                </li>
                                <span class="spanclear">.</span>
                            </ul>
                            <div>
                                <div>
                                    <span style="color:rgb(119, 119, 119);text-decoration:none;">Lần cuối:</span>
                                    Hôm qua <span style="color:rgb(85, 85, 85);">16:31</span>
                                </div>
                                <span class="spanclear">.</span>
                            </div>
                        </div>
                        <ul>
                            <li>User Lists</li>
                        </ul>
                        <ul>
                            <li>Chat</li>
                            <li>
                                <img src="https://archive.li/HWaTz/157c009b208dd10a4e5d782c5ae38f469a599c84.gif">
                                <a href="${initParam['siteurl']}member/${member.id}">Send a Yahoo! message to ${member.displayName}</a>
                            </li>
                        </ul>
                        <span class="spanclear">.</span>
                    </div>
                    <div class="multi_tab">
                        <ul>
                            <li id="membermessage" class="selected">Visitor Messages</li>
                            <li id="aboutme">About Me</li>
                            <li id="stat">Statistics</li>
                            <li id="reputation">Reputation</li>
                            <li id="friendlist">Friends</li>
                        </ul>
                        <div class="blue_space"></div>
                        <div class="membermessage selected">
                            <div>
                                <div class="info">
                                    Showing Visitor Messages
                                    <span class="spanclear">.</span>
                                </div>
                                <ol>
                                    <c:forEach items="${chats}" var="chat">
                                        <li>
                                            <div class="user_img">
                                                <a href="${initParam['siteurl']}member/${chat.userSendId.id}">
                                                    <img alt="${chat.userSendId.displayName}" src="${initParam['imageurl']}dfavatar.jpg" title="tamio">
                                                </a>
                                            </div>
                                            <div class="user_message">
                                                <div class="desc">
                                                    <div>
                                                        <div>02-08-2014
                                                            <span>07:53</span>
                                                        </div>
                                                        <a href="${initParam['siteurl']}member/${chat.userSendId.id}">
                                                            <b><font color="#FA8072">${chat.userSendId.displayName}</font></b>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="content">${chat.content}</div>
                                                <ul>
                                                    <li>
                                                        <a href="${initParam['siteurl']}converse?send=${chat.userSendId.id}&receive=${member.id}" title="View Conversation Between ${member.displayName} and tamio">View Conversation</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <span class="spanclear">.</span>
                                        </li>
                                    </c:forEach>
                                    <span class="spanclear">.</span>
                                </ol>
                                <div class="paged">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td align="right">
                                                    <div align="right">
                                                        <table class="paged_tab">
                                                            <tbody>
                                                                <tr>
                                                                    <td style="background-image:url(${initParam['imageurl']}tcat.gif);background-color: rgb(0, 117, 201); color:rgb(255, 255, 255);font:normal normal bold 11px/normal tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;font-weight:normal;background-position: 0% 0%; background-repeat: repeat-x; padding: 2px 4px; ">Trang ${paged.current_page}/${paged.total_pages}</td>
                                                                    <c:if test="${paged.has_previous}">
                                                                        <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                                            <a href="${initParam['siteurl']}member/${member.id}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&lt;&lt;</a>
                                                                        </td>
                                                                        <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                                            <a href="${initParam['siteurl']}member/${member.id}?page=${paged.previous_page}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&lt;</a>
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
                                                                                    <a href="${initParam['siteurl']}member/${member.id}?page=${i}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">${i}</a>
                                                                                </td>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach>

                                                                    <c:if test="${paged.has_next}">
                                                                        <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                                            <a href="${initParam['siteurl']}member/${member.id}?page=${paged.next_page}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&gt;</a>
                                                                        </td>
                                                                        <td style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;background-color: rgb(255, 255, 255); color:rgb(0, 0, 0);font-size:10pt;padding: 2px 4px; ">
                                                                            <a href="${initParam['siteurl']}member/${member.id}?page=${paged.total_pages}" style="font:normal normal normal 11px/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;color:rgb(0, 89, 189);text-decoration:none;">&gt;&gt;</a>
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
                                    <span class="spanclear">.</span>
                                </div>
                            </div>

                            <c:if test="${not empty user.id}">
                                <div>
                                    <form method="POST" action="${initParam['siteurl']}newchat/${member.id}">
                                        <textarea id="editor" name="content" rows="10" cols="80"></textarea>
                                        <input type="submit" class="button" value="Gửi tin nhắn nhanh" name="sbutton" tabindex="1">
                                        <input type="reset" class="button" value="Hủy bỏ" name="cancel" tabindex="4">
                                    </form>
                                    <script>
                                        $(function () {
                                            CKEDITOR.replace('editor');
                                        });
                                    </script>
                                </div>    
                            </c:if>
                        </div>
                        <div class="aboutme">
                            <h4>
                                <a href="#">
                                    <img src="${initParam['imageurl']}goup.gif"></a>
                                <a name="aboutme"></a>
                                <span>About Me</span>
                            </h4>
                            <div>
                                <div>
                                    <ul>
                                        <li>
                                            About ${member.displayName}
                                            <dl>
                                                <dt>Chủng tộc</dt>
                                                <dd>Yao Ming</dd>
                                            </dl>
                                        </li>
                                        <fieldset>
                                            <legend>
                                                <a href="member/${member.id}">K-pop Idol</a>
                                            </legend>
                                            <div>
                                                <img src="${initParam['imageurl']}dfavatar.jpg"><br>
                                                <b>SP:</b>&nbsp;0
                                            </div>
                                        </fieldset>
                                        <div class="clear">&nbsp;</div>
                                        <br><br><br><br>
                                    </ul>
                                    <span class="spanclear">.</span>
                                </div>
                            </div>
                        </div>
                        <div class="stat">
                            <h4>
                                <a href="#">
                                    <img src="${initParam['imageurl']}goup.gif"></a>
                                <a name="stats"></a>
                                <span>Statistics</span>
                            </h4>
                            <div>
                                <div>
                                    <fieldset>
                                        <legend>Tổng số bài</legend>
                                        <ul>
                                            <li>Tổng số bài:</span>
                                                366
                                            </li>
                                            <li>
                                                <span>Posts Per Day:</span>
                                                0.49
                                            </li>
                                            <li>
                                                <a href="${initParam['siteurl']}member/">Tìm bài gửi bởi ${member.displayName}</a>
                                            </li>
                                            <li>
                                                <a href="${initParam['siteurl']}member/">Tìm chủ đề bắt đầu bởi ${member.displayName}</a>
                                            </li>
                                        </ul>
                                    </fieldset>
                                    <fieldset>
                                        <legend>Visitor Messages</legend>
                                        <ul>
                                            <li>
                                                <span style="color:rgb(119, 119, 119);text-decoration:none;">Total Messages:</span>
                                                62
                                            </li>
                                            <li>
                                                <span style="color:rgb(119, 119, 119);text-decoration:none;">Most Recent Message:</span>
                                                02-08-2014 07:53 
                                            </li>
                                            <li>
                                                <a href="${initParam['siteurl']}member/${member.id}visitor_messaging">Visitor Messages for ${member.displayName}</a>
                                            </li>
                                        </ul>
                                    </fieldset>
                                    <fieldset>
                                        <legend>General Information</legend>
                                        <ul>
                                            <li>
                                                <span>Lần cuối:</span>
                                                Hôm qua <span>16:31</span>
                                            </li>
                                            <li><span>Tham gia ngày:</span>
                                                21-07-2012
                                            </li>
                                            <li>
                                                <span>Ðã giới thiệu:</span>
                                                0
                                            </li>
                                        </ul>
                                    </fieldset>
                                    <span class="spanclear">.</span>
                                </div>
                            </div>
                        </div>
                        <div class="reputation">
                            <h4>
                                <a href="${initParam['siteurl']}member/${member.id}top">
                                    <img src="${initParam['imageurl']}goup.gif">
                                </a>
                                <a name="member_rep"></a>
                                <span>Reputation</span>
                            </h4>
                            <div>
                                <table align="center">
                                    <tbody>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="center">Ðề tài</td>
                                            <td align="center">Ngày</td>
                                            <td align="center">Lời nhận xét</td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <img src="${initParam['imageurl']}reputation_green.gif" style="border-width: 0px; ">
                                            </td>

                                            <td>
                                                <a href="${initParam['siteurl']}member/">Bakuman S3</a>
                                            </td>
                                            <td>
                                                <span>15-02-2014
                                                    <span style="color:rgb(85, 85, 85);">20:05</span></span>
                                            </td>

                                            <td>
                                                <span>(+412) http://vnsharing.net/forum/showpost.php?p=14661502&amp;postcount=975</span>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">
                                                <span> 2899 tổng số điểm </span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="friendlist">
                            <h4>
                                <a href="${initParam['siteurl']}member/${member.id}top">
                                    <img src="${initParam['imageurl']}goup.gif"></a>
                                <a name="friends"></a>
                                <span>Friends</span>
                            </h4>
                            <div>
                                <div>
                                    Showing Friends 1 to 5 of 5 
                                </div>
                                <ul>
                                    <li>
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td rowspan="2">
                                                        <div>
                                                            <a href="${initParam['siteurl']}member/">
                                                                <img alt="ducloi" src="${initParam['imageurl']}dfavatar.jpg">
                                                            </a>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <ul>
                                                                <li class="name">
                                                                    <a href="${initParam['siteurl']}member/">
                                                                        <b><font color="DarkOrchid">ducloi</font></b>
                                                                    </a>
                                                                </li>
                                                                <li class="desc">Yêu Oni-chan~~ Moa~moa~</li>
                                                            </ul>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="color:rgb(0, 0, 0);font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;padding: 0px; ">
                                                        <ul style="list-style-type:none;margin: 0px; padding: 0px; ">
                                                            <li style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;display:inline;margin-right:3px;"><img alt="ducloi is offline" src="https://archive.li/HWaTz/37b284dba448f68a43b72884d5171d58796393e7.gif" title="ducloi is offline" style="vertical-align:middle;border-width: 0px; "></li>
                                                            <li style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;display:inline;margin-right:3px;"><a href="${initParam['siteurl']}member/${member.id}" style="color:rgb(0, 89, 189);text-decoration:none;"><img alt="Gửi tin nhắn qua Yahoo chat tới ducloi" src="https://archive.li/HWaTz/157c009b208dd10a4e5d782c5ae38f469a599c84.gif" title="Gửi tin nhắn qua Yahoo chat tới ducloi" style="vertical-align:middle;border-width: 0px; "></a></li>
                                                            <li style="font:normal normal normal 10pt/normal arial, verdana, geneva, lucida, 'lucida grande', helvetica, sans-serif;display:inline;margin-right:3px;"><a href="${initParam['siteurl']}member/${member.id}" style="color:rgb(0, 89, 189);text-decoration:none;"><img alt="Gửi tin nhắn qua Skype™ tới ducloi" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAA3NCSVQICAjb4U/gAAAANlBMVEX////////29/fy8/Pu7+/l5+fh4+Pd39/a3d3W2NjMzMzDx8fAxMS6vr62u7uxtbWvtLSssLAwgBwiAAAAAXRSTlMAQObYZgAAAAlwSFlzAAAK8AAACvABQqw0mAAAABV0RVh0Q3JlYXRpb24gVGltZQA4LzE4LzA1oj6Z/QAAACV0RVh0U29mdHdhcmUATWFjcm9tZWRpYSBGaXJld29ya3MgTVggMjAwNId2rM8AAAB6SURBVBhXXc9BDsQgCEBRUForjij3v2xBSdsMu/9CIgKA2sBntBwHf9D7LLVWDlLvy5q5LVHrM3ln7i5ay5UwMSekANs3SZhljC2VW0brOecC7lP+QAhzRnJZ73TrYUixMqVRF+nURGSf8nsnrlWO2ccuMvT/RD8IcAMCGwfk9MNc3gAAAABJRU5ErkJggg==" title="Gửi tin nhắn qua Skype™ tới ducloi" style="vertical-align:middle;border-width: 0px; "></a></li>
                                                        </ul>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </li>
                                    <span class="spanclear">.</span>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right_usercp">
                <div>
                    <h4>
                        <a href="${initParam['siteurl']}member/${member.id}top">
                            <img src="${initParam['imageurl']}goup.gif">
                        </a>
                        <a name="stats_mini"></a>
                        <span>Mini Statistics</span>
                    </h4>
                    <div>
                        <div>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <dl>
                                                <dt>Tham gia ngày</dt>
                                                <dd>21-07-2012</dd>
                                                <dt>Tổng số bài</dt>
                                                <dd>366</dd>
                                            </dl>
                                        </td>
                                        <td>
                                            <img alt="${member.displayName}'s Avatar" src="${initParam['imageurl']}dfavatar.jpg" title="${member.displayName}'s Avatar">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <span class="spanclear">.</span>
                        </div>
                        <div>
                            <a href="${initParam['siteurl']}member/${member.id}stats">Show All Statistics</a>
                            <span class="spanclear">.</span>
                        </div>
                    </div>
                </div>

                <div>
                    <h4>
                        <a href="${initParam['siteurl']}member/${member.id}top">
                            <img src="${initParam['imageurl']}goup.gif">
                        </a>
                        <a name="friends_mini"></a>
                        <span>Friends</span>
                    </h4>
                    <div>
                        <div class="title">
                            <div>Showing 5 of 5 Friend(s)</div>
                            <ul>
                                <li>
                                    <a href="${initParam['siteurl']}member/">
                                        <img src="${initParam['imageurl']}dfavatar.jpg">
                                    </a>
                                    <div>
                                        <a href="${initParam['siteurl']}member/">
                                            <b><font color="brown">Mochizuki</font></b>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                            <span class="spanclear">.</span>
                        </div>
                        <div class="list">
                            <a href="${initParam['siteurl']}member/${member.id}friends">Show All Friends</a>
                            <span class="spanclear">.</span>
                        </div>
                    </div>
                </div>
            </div>
            <span class="spanclear">.</span>
        </div>




        <%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>

</html>
