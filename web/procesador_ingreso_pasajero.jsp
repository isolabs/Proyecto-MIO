<%-- 
    Document   : procesador_ingreso_pasajero
    Created on : 27-feb-2016, 12:58:06
    Author     : Alejandro
--%>

<%@page import="proyectomio.modelo.Pasajero"%>
<%@page import="proyectomio.controlador.Controlador_Pasajero"%>
<%@ include file="verificadorLogin.jsp" %>
<%
Controlador_Pasajero uncontrolador = new Controlador_Pasajero();
       Pasajero unEmpleado = new Pasajero();
    
      int id_pasajero = Integer.valueOf(request.getParameter("id_pasajero"));
      int id_tarjeta = Integer.valueOf(request.getParameter("id_tarjeta"));
      String nombres = request.getParameter("nombres");
      String apellidos = request.getParameter("apellidos");
      String fecha_nacimiento = request.getParameter("fecha_nacimiento");
      String direccion =  request.getParameter("direccion");
      String telefono = request.getParameter("telefono");
      String correo_electronico = request.getParameter("correo_electronico");
         
       
       int resultado = uncontrolador.adicionar_pasajero(id_pasajero, id_tarjeta, nombres, apellidos, fecha_nacimiento, direccion, telefono, correo_electronico);
       %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Procesador de ingreso de pasajero</title>
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
           case 0: out.println("El pasajero "+nombres+" con n&uacute;mero de identificaci&oacute;n <b>"+ id_pasajero +"</b> ha sido ingresado con exito. Tarjeta #: <b>" + id_tarjeta + "</b> asociada.");break;
           case 1: out.println("El pasajero "+nombres+" con n&uacute;mero de identificaci&oacute;n "+ id_pasajero +" o el numero de la identificacion de la tarjeta " + id_tarjeta+" ya existe en nuestros registros");break;
           case 2: out.println("la tarjeta con el id "+id_tarjeta+" no existe en nuestro registro");break;
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
            }%>" onclick="goBack()">Ok</button> </center>
  <script>
function goBack() {
    <%if(resultado == 0) {%>
       location.href="<%out.print("pasajeros.jsp");%> "<%}
    else{
    out.print("window.history.back()");
    }
   %>;
    
    
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
