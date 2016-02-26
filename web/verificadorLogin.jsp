<%-- 
    Document   : verificadorLogin
    Created on : Feb 24, 2016, 5:10:48 AM
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
           
            if (session.getAttribute("userid")==null){
                response.sendRedirect("login/login.jsp");
            }
        %>
    </body>
</html>
