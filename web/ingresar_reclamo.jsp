<%@page import="java.util.ArrayList"%>
<%@page import="proyectomio.modelo.Estacion"%>
<%@page import="proyectomio.controlador.Controlador_Estaciones"%>
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
    Registro de reclamos<br>
        </div>
         <div class="panel-body">
        <form action="procesador_ingreso_reclamo.jsp" class="form-group" method="post" >
           
           
          <label for="motivo">
              Motivo del reclamo:
               </label>
               <input type="text" name="motivo"  id="motivo" class ="form-control" required="required">
               
                   <label for="descripcion">
                       Descripci&oacute;n:
               </label>
                   <textarea name="descripcion"  id="descripcion" class ="form-control" required="required"></textarea>
         
               <label for="id_pasajero_interpone">
                   Identificaci&oacute;n del pasajero que interpone el reclamo :
               </label>
               <input type="text" name="id_pasajero_interpone" pattern="[0-9]{4,}"  id="id_pasajero_interpone" class ="form-control" required="required">
                <label for="id_pasajero_interpone">
                    Estaci&oacute;n en la que se genera el reclamo:
               </label>
              <%
                   Controlador_Estaciones controlador_estaciones = new Controlador_Estaciones();
                   ArrayList<Estacion> estaciones = controlador_estaciones.get_estaciones();
                   
                   %>
                  <select class="form-control" name="id_estacion" id="id_estacion"  required="required">
                      <% 
                          for(int i = 0; i < estaciones.size(); i++)
                          {%>
                          <option value="<% out.print(estaciones.get(i).getId_estacion()) ;%>"> <% out.print(estaciones.get(i).getNombre());%></option>
                          <%} %>
                                                </select>
           
           <br></br>
                     <center>
                   <input type="submit" class="btn btn-primary" value="Registrar reclamo"></center>
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
