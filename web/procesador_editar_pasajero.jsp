<%-- 
    Document   : procesador_editar_pasajero
    Created on : 28-feb-2016, 20:29:08
    Author     : Alejandro
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="proyectomio.modelo.Pasajero"%>
<%@page import="proyectomio.controlador.Controlador_Pasajero"%>
<%
Controlador_Pasajero uncontrolador = new Controlador_Pasajero();
       Pasajero unPasajero = new Pasajero();
    
      int id_pasajero = Integer.valueOf(request.getParameter("id_pasajero"));
      int id_tarjeta = Integer.valueOf(request.getParameter("id_tarjeta"));
      String nombres = request.getParameter("nombres");
      String apellidos = request.getParameter("apellidos");
      String fecha_nacimiento = request.getParameter("fecha_nacimiento");
      String direccion =  request.getParameter("direccion");
      String telefono = request.getParameter("telefono");
      String correo_electronico = request.getParameter("correo_electronico");
      
      
       int resultado = uncontrolador.modificar_pasajero(id_pasajero, id_tarjeta, nombres, apellidos, fecha_nacimiento, direccion, telefono, correo_electronico);
       %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Procesador de editar pasajero</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
 <body>
    <div class="<% 
         if(resultado==0){      
          out.print("panel panel-primary");
                   }
         else{
             out.print("panel panel-danger");
         }

          %>">
        <div class ="panel-heading">
            <% if(resultado ==0){
        out.print("Mensaje");
            }
            else
            {
                out.print("Error");
            }%>
        </div>
            <div class="panel-body">
                
      
        <center>
    <h5>
 
    <%
        
       
       
   
       switch(resultado){
           case 0: out.println("El pasajero "+nombres+" con n&uacute;mero de identificaci&oacute;n "+ id_pasajero +" ha sido modificado");break;
           case 1: out.println("El pasajero "+nombres+" con n&uacute;mero de identificaci&oacute;n "+ id_pasajero +" ya existe en nuestros registros");break;
           default: out.println("Se ha generado un error inesperado en el programa");
       }
       
    
    %>
     <br></br>
        <button class="<%
            if(resultado==0){
                out.print("btn btn-primary");
            }
            else
            {
                out.print("btn btn-danger");
            }%>" onclick="goBack()">Volver</button> </center>
  <script>
function goBack() {
    <%if(resultado == 0) {%>
       location.href="<%out.print("pasajeros.jsp");%> "<%}
    else{
    out.print("window.history.back()");
    }%>;
    
    
}
</script>  
        </h5>
</div>
    
    
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
   
</body>
</html>
