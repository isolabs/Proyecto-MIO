

<%@page import="proyectomio.controlador.Controlador_Pasajero"%>
<%@page import="proyectomio.modelo.Pasajero"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Editar datos personales</title>
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
    <% Controlador_Pasajero controlador = new Controlador_Pasajero();
   Pasajero pasajero = new Pasajero();
   int resultado =0;
   try{
   pasajero = controlador.get_pasajerosTarjeta(Integer.parseInt(request.getParameter("id_tarjeta"))).get(0);
   resultado =0;
   }
   catch(Exception eo)
   {%>
     <div id="wrapper">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                   
                </div>
                <div style="color: white;
                     padding: 15px 50px 5px 50px;
                     float: right;
                     font-size: 16px;"> Bienvenido &nbsp; </div>
                     
            </nav>   
        </div>
    <br></br>
     <div class="panel panel-danger" style="margin: auto;width:70%; margin-top: 10%;">
       
         <div class ="panel-heading">
               <%
                out.print("Error");
            %>
        </div>
            <div class="panel-body">
                
      
        <center>
    <h5>
 
    <%
        
       

           out.println("El pasajero  con n&uacute;mero de tarjeta "+ request.getParameter("id_tarjeta") +" no existe");
           resultado  = -1;
       
       
    
    %>
  
     <br></br>
        <button class="btn btn-danger"onclick="goBack()">Volver </button> </center>
  <script>
function goBack() {
       location.href="editar_pasajero_id_tarjeta.jsp";

    out.print("window.history.back()");
    }
    
</script>  
        </h5>
</div>
         </div>    
   <%}%>
      <% if(resultado == 0){%>
      <div id="wrapper">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="start/index.jsp">MIO</a> 
                </div>
                <div style="color: white;
                     padding: 15px 50px 5px 50px;
                     float: right;
                     font-size: 16px;"> Bienvenido &nbsp; </div>
                     
            </nav>   
        </div>
    <br></br>
    <div class="panel panel-primary"  style="margin: auto;width:70%; margin-top: 10%;">
        <div class ="panel-heading">
            Edici&oacute;n de pasajeros<br>
        </div>
         <div class="panel-body">
        <form action="procesador_editar_pasajero.jsp?id_pasajero=<%out.print(pasajero.getId_pasajero());%>&id_tarjeta=<%out.println(pasajero.getId_tarjeta());%>&origen=1" class="form-group" method="post" >
           
           
          <label for="id_pasajero">
              N&uacute;mero de identificaci&oacute;n:
               </label>
            <input type="text" value="<%out.println(pasajero.getId_pasajero());%>" name="id_pasajero" pattern="[0-9]{4,}" id="id_pasajero" class ="form-control" disabled>
               
                <label for="id_tarjeta">
              N&uacute;mero de identificaci&oacute;n de la tarjeta:
               </label>
              <input type="text" value="<%out.println(pasajero.getId_tarjeta());%>" name="id_tarjeta" pattern="[0-9]{4,}" id="id_tarjeta" class ="form-control" disabled>

                
                   <label for="nombres">
                    Nombres:
               </label>
               <input type="text" name="nombres" value="<%out.println(pasajero.getNombres());%>" pattern="[a-z ñ A-Z]{4,}" id="nombres" class ="form-control" required="required">
         
               <label for="apellidos">
                    Apellidos:
               </label>
               <input type="text" name="apellidos"  value="<%out.println(pasajero.getApellidos());%>" pattern="[a-z ñ A-Z]{4,}"  id="apellidos" class ="form-control" required="required">
                
               <label for="fecha_nacimiento">
                    Fecha de nacimiento:
               </label>
               <input type="date" name="fecha_nacimiento" value="<%out.print(pasajero.getFecha_nacimiento());%>"id="fecha_nacimiento" class ="form-control" required="required">
                   
               <label for="direccion">
                   Direcci&oacute;n:
               </label>
               <input type="text" name="direccion" value="<%out.println(pasajero.getDireccion());%>" id="direccion" class ="form-control">
                   
               <label for="telefono">
                   Tel&eacute;fono:
               </label>
               <input type="text" name="telefono" value="<%out.println(pasajero.getTelefono());%>" pattern="[0-9]{4,}" id="telefono" class ="form-control" >
                   
               <label for="correo_electronico">
                   Correo electr&oacute;nico:
               </label>
               <input type="email" value="<%out.println(pasajero.getCorreo_electronico());%>" name="correo_electronico" id="correo_electronico" class ="form-control" >
                   
                      
            
                       
                   <br></br>
                     <center>
                   <input type="submit" class="btn btn-primary" value="Modificar pasajero"></center>
                    <input type="hidden" name="accion" id="accion"  value="1">            
            <script>

   
</script>
          
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
<%}%>