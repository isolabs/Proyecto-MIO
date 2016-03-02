<%-- 
    Document   : ingresar_uso_tarjeta
    Created on : 27-feb-2016, 23:00:18
    Author     : Alejandro
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="proyectomio.controlador.Controlador_Pasajero"%>
<%@page import="proyectomio.modelo.Pasajero"%>
<%@page import="proyectomio.controlador.Controlador_Tarjeta"%>

<%@page import="proyectomio.modelo.Ruta"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Seguimiento de pasajeros</title>
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
  
        <!-- /. WRAPPER  -->
    <div class="panel panel-primary" style="margin: auto;width:70%; margin-top: 10%;">
        <div class ="panel-heading">
   Seguimiento de pasajeros 
        </div>
         <div class="panel-body"  >
        <form name = "form" id = "form" action="mostrar_usos_tarjeta.jsp" class="form-group" method="post" >
           
           <label for="id_tarjeta">
              N&uacute;mero de la tarjeta:
               </label>
               <input type="text" name="id_tarjeta" pattern="[0-9]{4,}" id="id_tarjeta" class ="form-control" required="required">
               </input>
                   
       
                
              

             
                  
                   <br></br>
                     <center>
                   <input type="submit" class="btn btn-primary" value="Consultar"></center>
                                
           
          
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
