<%-- 
    Document   : createthread
    Created on : Feb 18, 2016, 11:54:40 PM
    Author     : DTT
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
        <script src="${initParam['siteurl']}ckeditor/ckeditor.js"></script>
    </head>

    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>


        <form class="vbform block" action="${initParam['siteurl']}newthread/${box_id}" method="post">
            <h2 class="blockhead">Nội dung bài viết</h2>
            <div class="blockbody formcontrols">
                <div class="section">
                    <div class="blockrow">
                        <label for="subject" class="full">Tiêu đề:</label>
                        <input type="text" class="primary full textbox" name="title" value="" maxlength="250" tabindex="1">
                        &nbsp;<img id="display_posticon" src="${initParam['imageurl']}clear.gif" alt="">
                    </div>


                    <div class="blockrow texteditor forum">
                        <div class="editor">
                            <textarea id="editor" name="content" rows="10" cols="80"></textarea>
                            <script>
                                $(function () {
                                    CKEDITOR.replace('editor');
                                });
                            </script>
                        </div>
                    </div>
                </div>
            </div>
            <div class="blockfoot actionbuttons">
                <div class="group">
                    <input type="submit" class="button" name="sbutton" value="Gửi chủ đề mới" accesskey="s" tabindex="1">
                    <input type="submit" class="button" name="preview" value="Xem lại bài viết" accesskey="r" tabindex="1">
                </div>
            </div>
            <h3 class="blockhead">Tùy chọn thêm</h3>
            <div class="blockbody formcontrols">
                <div class="section">
                    <div class="blockrow">
                        <label>Tùy chọn hỗn hợp:</label>
                        <ul class="checkradio group rightcol">
                            <li>
                                <label for="cb_parseurl"><input type="checkbox" name="parseurl" value="1" tabindex="1" checked="checked"> Tự động chèn liên kết trong bài</label>
                                <p class="description">Sẽ chuyển http://google.com thành [URL]http://google.com[/URL].</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="blockfoot actionbuttons">
                <div class="group">
                    <input type="submit" class="button" name="sbutton" value="Gửi chủ đề mới" accesskey="s" tabindex="1">
                    <input type="submit" class="button" name="preview" value="Xem lại bài viết" accesskey="r" tabindex="1">
                </div>
            </div>
        </form>



        <%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>

</html>
