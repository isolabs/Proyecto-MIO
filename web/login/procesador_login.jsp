<%-- 
    Document   : procesador_login.jsp
    Created on : Feb 24, 2016, 4:04:57 AM
    Author     : jeisonOS
--%>

<%@page import="proyectomio.controlador.operaciones.Controlador_login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            String identificacion = request.getParameter("identificacion");
            String password = request.getParameter("password");
            
            Controlador_login controlador_login = new Controlador_login();
            if (controlador_login.login(identificacion, password)){
                session.setAttribute("userid", identificacion);
                response.sendRedirect("../index.jsp");
            }else{
                response.sendRedirect("login.jsp");
            }
        %>
    </body>
</html>
