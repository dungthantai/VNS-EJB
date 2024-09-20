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
            <%@include file="/WEB-INF/jspf/style_mainrollup.jspf" %>
            <%@include file="/WEB-INF/jspf/style_additional.jspf" %>

        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>

    </head>

    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>




        <div>
            <form class="block" action="${initParam['siteurl']}login" method="post">
                <h2 class="blockhead">Login</h2>
                <div class="blockbody formcontrols settings_form_border">

                    <h3 class="blocksubhead">X</h3>
                    <div class="section">
                        <div class="blockrow">
                            <ul class="group">
                                <li>
                                    ${response}
                                </li>
                                <li>
                                    <label>Username:</label>
                                    <input name="username">
                                </li>
                                <li>
                                    <label>Password:</label>
                                    <input name="password">
                                </li>
                            </ul>
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




        <%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
