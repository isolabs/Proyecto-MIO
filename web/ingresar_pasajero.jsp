<%-- 
    Document   : ingresar_pasajero
    Created on : 27-feb-2016, 12:39:59
    Author     : Alejandro
--%>
<%@ include file="verificadorLogin.jsp" %>
<%
    int id_usuario = Integer.valueOf(request.getParameter("id_usuario"));
    int id_tarjeta = Integer.valueOf(request.getParameter("id_tarjeta"));


%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Free Bootstrap Admin Template : Binary Admin</title>
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
    <div class="panel panel-primary">
        <div class ="panel-heading">
    Registro de pasajero<br>
        </div>
         <div class="panel-body">
        <form action="procesador_ingreso_pasajero.jsp" class="form-group" method="post" >
           
           
          <label for="id_pasajero">
              N&uacute;mero de identificaci&oacute;n:
               </label>
               <input type="text" name="id_pasajero" pattern="[0-9]{4,}" id="id_pasajero" value="<% out.print(id_usuario);  %>" class ="form-control" required="required">
               
                    <label for="id_tarjeta">
              N&uacute;mero de identificaci&oacute;n de la tarjeta:
               </label>
                   <input type="text" name="id_tarjeta" pattern="[0-9]{4,}" id="id_tarjeta" value="<% out.print(id_tarjeta);  %>" class ="form-control" required="required" readonly>
               
                   
                   <label for="nombres">
                    Nombres:
               </label>
               <input type="text" name="nombres" pattern="[a-z ñ A-Z]{4,}" id="nombres" class ="form-control" required="required">
         
               <label for="apellidos">
                    Apellidos:
               </label>
               <input type="text" name="apellidos" pattern="[a-z ñ A-Z]{4,}"  id="apellidos" class ="form-control" required="required">
                
               <label for="fecha_nacimiento">
                    Fecha de nacimiento:
               </label>
               <input type="date" name="fecha_nacimiento" id="fecha_nacimiento" class ="form-control" required="required">
                   
               <label for="direccion">
                   Direcci&oacute;n:
               </label>
               <input type="text" name="direccion" id="direccion" class ="form-control">
                   
               <label for="telefono">
                   Tel&eacute;fono:
               </label>
               <input type="text" name="telefono"  pattern="[0-9]{4,}" id="telefono" class ="form-control" >
                   
               <label for="correo_electronico">
                   Correo electr&oacute;nico:
               </label>
               <input type="email" name="correo_electronico" id="correo_electronico" class ="form-control" >
                   
               

             
                  
                   <br></br>
                     <center>
                   <input type="submit" class="btn btn-primary" value="Registrar pasajero"></center>
                                
           
          
     </form>
</div>
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

