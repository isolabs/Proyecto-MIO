<%-- 
    Document   : logout.jsp
    Created on : Feb 24, 2016, 5:15:06 AM
    Author     : jeisonOS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <%
            session.setAttribute("userid", "");
            session.invalidate();
            response.sendRedirect("login.jsp");

        %>
    </body>
</html>
