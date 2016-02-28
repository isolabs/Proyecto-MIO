<%-- 
    Document   : ingresar_tarjeta
    Created on : 27-feb-2016, 17:42:43
    Author     : Alejandro
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="proyectomio.controlador.Controlador_Estaciones"%>

<%@page import="proyectomio.modelo.Estacion"%>
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
    Registro de la tarjeta<br>
        </div>
         <div class="panel-body">
        <form action="procesador_ingreso_tarjeta.jsp" class="form-group" method="post" >
           
           <label for="">
              Precio de la tarjeta $3200
               </label>
            <br />
            <br />
            
            <label for="nombres">
                    Nombre:
               </label>
               <input type="text" name="nombres" pattern="[a-z ñ A-Z]{4,}" id="nombres" class ="form-control" >
         
                   
              <label for="id_estacion">
                   Nombre de la estaci&oacute;n:
               </label>
              
              <%
                   Controlador_Estaciones controlador_estaciones = new Controlador_Estaciones();
                   ArrayList<Estacion> estaciones = controlador_estaciones.get_estaciones();
                   
                   %>
                  <select class="form-control" name="id_estacion" id="id_estacion"  required="required">
                      <% 
                          for(int i = 0; i < estaciones.size(); i++)
                          {%>
                          <option value="<% out.print(estaciones.get(i).getId_estacion()) ;%>"> <% out.print(estaciones.get(i).getNombre()+" "+estaciones.get(i).getDireccion());%></option>
                          <%} %>
                                                </select>
                
              

             
                  
                   <br></br>
                     <center>
                   <input type="submit" class="btn btn-primary" value="Registrar tarjeta"></center>
                                
           
          
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

