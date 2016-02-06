<%-- 
    Document   : validar_login
    Created on : 30/01/2016, 05:05:26 PM
    Author     : root
--%>
<%@page import="ObjetosdeNegocio.ControladorEmpleado"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
       String email= request.getParameter("email");
       out.println("datos de secion: "+email+request.getParameter("password"));
       ControladorEmpleado uncontrolador = new ControladorEmpleado();
       if(uncontrolador.login(request.getParameter("email"), request.getParameter("password")))
       out.print("sesion correcta");
       else
       out.print("sesion fallida");
    %>
    </body>
</html>
