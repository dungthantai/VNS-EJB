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
        <script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>
    </head>

    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        <table style="padding: 0px 10px;" border="0" width="100%" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td>

                        <script type="text/javascript">
                            function verify_passwords(password1, password2)
                            {
                                // do various checks, this will save people noticing mistakes on next page
                                if (password1.value == '' || password2.value == '')
                                {
                                    alert('Vui lòng nhập cả 2 ô mật khẩu.');
                                    return false;
                                }
                                else if (password1.value != password2.value)
                                {
                                    alert('Mật khẩu nhập vào không trùng khớp.');
                                    return false;
                                }
                                else
                                {
                                    return true;
                                }
                                return false;
                            }
                        </script>
                        <form id="registerform" action="${initParam['siteurl']}register" method="POST" class="vbform block">
                            <h2 class="blockhead">Đăng ký tài khoản</h2>
                            <div class="blockbody formcontrols">
                                <h3 class="blocksubhead">Thông tin cần phải nhập</h3>
                                <div class="section">
                                    <div class="blockrow">
                                        <label for="regusername">Tài khoản:</label>
                                        <div class="rightcol">
                                            <input class="primary textbox" id="regusername" type="text" name="username" maxlength="20" value="" tabindex="1" autocomplete="off">

                                            <div id="reg_verif_div" class="primary" style="display:none;"></div>
                                            <p class="description">Vui lòng nhập tên bạn muốn đăng nhập trên diễn đàn.</p>
                                        </div>
                                    </div>
                                    <div class="blockrow">
                                        <ul class="group">
                                            <li>
                                                <label for="password">Mật khẩu:</label>
                                                <input type="password" class="textbox" name="password" id="password" maxlength="50" value="" tabindex="1">
                                            </li>
                                            <li>
                                                <label for="passwordconfirm">Nhập lại mật khẩu:</label>
                                                <input type="password" class="textbox" name="passwordconfirm" id="passwordconfirm" maxlength="50" value="" tabindex="1">
                                            </li>
                                        </ul>
                                        <p class="description">Nhập mật khẩu cho tài khoản của bạn. Lưu ý mật khẩu phân biệt chữ Hoa và chữ thường.</p>
                                    </div>
                                    <div class="blockrow">
                                        <ul class="group">
                                            <li>
                                                <label for="email">Địa chỉ Email:</label>
                                                <input type="text" class="textbox" name="email" id="email" maxlength="50" value="" dir="ltr" tabindex="1">
                                            </li>
                                            <li>
                                                <label for="emailconfirm">Nhập lại Email:</label>
                                                <input type="text" class="textbox" name="emailconfirm" id="emailconfirm" maxlength="50" value="" dir="ltr" tabindex="1">
                                            </li>
                                        </ul>
                                        <p class="description">Xin mời nhập địa chỉ Email của bạn.</p>
                                    </div>
                                    <div class="blockrow">
                                        <div class="g-recaptcha" data-sitekey="6LfClx0TAAAAAJ6kpkV6r74S6eqKYbdyBAZ47ScG"></div>
                                    </div>
                                    <div class="blockrow">
                                        <label for="nospamimghumanverify">Verification Question:</label>
                                        <div class="rightcol">
                                            <p class="description">để đấy thôi không cần trả lời?</p>
                                            <input type="text" class="primary textbox" name="nospamimg">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h2 class="blockhead">Quy định</h2>
                            <div class="blockbody formcontrols">
                                <div class="section">
                                    <div class="blockrow">
                                        <p class="label">Để tiếp tục đăng ký, bạn phải đồng ý với Quy định sau:</p>
                                        <p><strong>Quẩy hết mình, HẾT</strong></p>
                                    </div>
                                    <div class="blockrow singlecheck">
                                        <label for="cb_rules_agree" class="full">
                                            <input type="checkbox" name="agree" id="cb_rules_agree" tabindex="1" value="1"> 
                                            <strong>Tôi đồng ý với quy định của diễn đàn.</strong>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <input type="submit" class="button" value="Hoàn tất đăng ký" tabindex="1" accesskey="s">
                        </form>
                    </td>
                </tr>
            </tbody></table>

        <%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>

</html>
