<%-- 
    Document   : usercp
    Created on : Mar 6, 2016, 1:45:32 AM
    Author     : root
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
            <%--@include file="/WEB-INF/jspf/style_mainrollup.jspf" %>
            <%@include file="/WEB-INF/jspf/style_additional.jspf" --%>
            <%@include file="/WEB-INF/jspf/style_usercp.jspf" %>

        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>

    </head>

    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>



        <table class="usercp" width="100%" border="0" cellSpacing="0" cellPadding="0">
            <tbody>
                <tr>
                    <td>

                        <c:if test="${cp == 'rep'}">

                            <div id="usercp_content">
                                <div class="cp_content">
                                    <form class="block" onsubmit="return confirm('Bạn có chắc chắn muốn chuyển rep?');" action="${initParam['siteurl']}usercp/rep" method="post">
                                        <h2 class="blockhead">VnSharing Shop</h2>
                                        <div class="blockbody formcontrols settings_form_border">

                                            <h3 class="blocksubhead">Chuyển rep</h3>
                                            <div class="section">
                                                <div class="blockrow">
                                                    <ul class="group">
                                                        <li>
                                                            ${response}
                                                        </li>
                                                        <li>
                                                            <label>Người nhận:</label>
                                                            <input name="touser" id="nguoinhan" maxLength="250">
                                                        </li>
                                                        <li>
                                                            <label>Số rep chuyển (chưa thuế):</label>
                                                            <input name="rep" id="sorepchuyen" maxLength="15">
                                                        </li>
                                                        <li>
                                                            <label>Nội dung:</label>
                                                            <textarea name="desciption" rows="4"></textarea>
                                                        </li>
                                                    </ul>
                                                    <br>
                                                    <p class="description">Lưu ý: <br>- Người gửi sẽ chịu thuế. Kiễm tra kỹ tên người nhận.<br>- Lover không bị tính thuế.</p>
                                                </div>
                                            </div>


                                        </div>
                                        <div class="blockfoot actionbuttons settings_form_border">
                                            <div class="group">
                                                <input class="button" type="submit" value="Xác nhận">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </c:if>



                        <c:if test="${cp == 'relationship'}">

                            <div id="usercp_content">
                                <div class="cp_content">
                                    <form class="block" action="${initParam['siteurl']}usercp/relationship" method="post">
                                        <h2 class="blockhead">VnSharing Shop</h2>
                                        <div class="blockbody formcontrols settings_form_border">

                                            <h3 class="blocksubhead">Cầu hôn</h3>
                                            <div class="section">
                                                <div class="blockrow">
                                                    <ul class="group">
                                                        <li>
                                                            ${response}
                                                        </li>
                                                        <li>
                                                            <label>Người cầu hôn: </label>
                                                            <input name="touser" id="nguoinhan" maxLength="250">
                                                        </li>
                                                        <li>
                                                            <label>Nội dung:</label>
                                                            <textarea name="desciption" rows="4"></textarea>
                                                        </li>
                                                    </ul>
                                                    <br>
                                                    <p class="description">Lưu ý: <br>- Cầu hôn 1 lần hết 1000 rep bất kể thành công hay không.</p>
                                                </div>
                                            </div>
                                            <div class="section">
                                                <div class="blockrow">
                                                    <ul class="group">

                                                        <c:catch var="exception">
                                                            <c:set var="tester" value="${urs.get(0)}"/>
                                                        </c:catch>
                                                        <c:if test="${exception==null}">
                                                            <c:forEach items="${urs}" var="ur">
                                                                <c:if test="${ur.relationship == 'marry'}">
                                                                    <li>
                                                                        Bạn đang là lover của: <a href="#">XXX</a> <3 <a href="#">Hủy</a>
                                                                    </li>
                                                                </c:if>
                                                                <c:if test="${ur.relationship == 'woo' && ur.userId.id == user.id}">
                                                                    <li>
                                                                        Bạn đang cầu hôn: <a href="${initParam['siteurl']}member/${ur.userIdRef.id}">${ur.userIdRef.displayName}</a> <3 <a href="${initParam['siteurl']}usercp/relationship?unmarry=${ur.userIdRef.id}">Hủy</a>
                                                                    </li>
                                                                </c:if>

                                                                <c:if test="${ur.relationship == 'woo' && ur.userIdRef.id == user.id}">
                                                                    <li>
                                                                        Người đang cầu hôn bạn: <a href="${initParam['siteurl']}member/${ur.userId.id}">${ur.userId.displayName}</a> <3 <a href="${initParam['siteurl']}usercp/relationship?marry=${ur.userId.id}">Nhận lời</a>
                                                                    </li>
                                                                </c:if>

                                                                <c:if test="${ur.relationship == 'unmarry'}">
                                                                    <li>
                                                                        Bạn đã hủy chức năng lover với: <a href="${initParam['siteurl']}member/${ur.userId.id}">${ur.userId.displayName}</a> >>> <a href="${initParam['siteurl']}member/${ur.userIdRef.id}">${ur.userIdRef.displayName}</a>
                                                                    </li>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                    </ul>
                                                    <br>
                                                    <p class="description">Lưu ý: <br>- Bạn sẽ hủy bỏ kết hôn với Lover hiện tại nếu nhận lời cầu hôn khác.</p>
                                                </div>
                                            </div>


                                        </div>
                                        <div class="blockfoot actionbuttons settings_form_border">
                                            <div class="group">
                                                <input class="button" type="submit" value="Xác nhận">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </c:if>

                        <div id="usercp_nav">
                            <div class="block">
                                <h2 class="blockhead">Cài đặt của tôi</h2>
                                <div class="blockbody">
                                    <ul>
                                        <li>
                                            <h3 class="blocksubhead profile"><img title="Lý lịch" class="usercpimage" alt="Lý lịch" src="http://vnsharing.site/forum/images/site_icons/profile.png" border="0"> <b>VnSharing Shop</b></h3>
                                            <ul class="blockrow">
                                                <li><a href="${initParam['siteurl']}usercp/rep">Chuyển rep</a></li>
                                                <hr>
                                                <li><a href="${initParam['siteurl']}usercp/relationship">Cầu hôn</a></li>
                                                <hr>
                                                <li><a href="${initParam['siteurl']}usercp/buypartner">Partner</a></li>
                                                <li><a href="${initParam['siteurl']}usercp/partner">Partner của bạn</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <h3 class="blocksubhead profile"><img title="Lý lịch" class="usercpimage" alt="Lý lịch" src="http://vnsharing.site/forum/images/site_icons/profile.png" border="0"> Lý lịch</h3>
                                            <ul class="blockrow">
                                                <li class="inactive"><a href="profile.php?do=editprofile">Sửa lý lịch</a></li>
                                                <li class="inactive"><a href="profile.php?do=editavatar">Sửa hình đại diện</a></li>
                                                <li class="inactive"><a href="profile.php?do=editsignature">Sửa chữ ký</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <h3 class="blocksubhead"><img title="Tài khoản của tôi" class="usercpimage" alt="Tài khoản của tôi" src="http://vnsharing.site/forum/images/site_icons/account.png" border="0"> Tài khoản của tôi</h3>
                                            <ul class="blockrow">
                                                <li class="inactive"><a href="profile.php?do=editoptions">Cài đặt chung</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <h3 class="blocksubhead"><img title="Cộng đồng" class="usercpimage" alt="Cộng đồng" src="http://vnsharing.site/forum/images/site_icons/network.png" border="0"> Cộng đồng</h3>
                                            <ul class="blockrow">
                                                <li class="inactive"><a href="profile.php?do=buddylist">Bạn &amp; Danh sách liên hệ</a></li>
                                                <li class="inactive"><a href="calendar.php?do=viewreminder">Nhắc nhở sự kiện</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <h3 class="blocksubhead"><img title="Diễn đàn" class="usercpimage" alt="Diễn đàn" src="http://vnsharing.site/forum/images/site_icons/forum.png" border="0"> Linh tinh</h3>
                                            <ul class="blockrow">
                                                <li class="inactive"><a href="profile.php?do=editattachments">Đính kèm</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <h3 class="blocksubhead"><img title="Settings" class="usercpimage" alt="Settings" src="http://vnsharing.site/forum/images/site_icons/account.png" border="0"> User Tagging</h3>
                                            <ul class="blockrow">
                                                <li class="inactive"><a href="usertag.php?do=profile&amp;action=options">Settings</a></li>
                                                <li class="inactive"><a href="usertag.php?do=profile&amp;action=hashsubscription">Hash Tag Subscriptions</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>




        <%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
