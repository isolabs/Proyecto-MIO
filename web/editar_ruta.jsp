<%@page import="proyectomio.modelo.Ruta"%>
<%@page import="proyectomio.controlador.Controlador_Rutas"%>
<%@ include file="verificadorLogin.jsp" %>
<%
Controlador_Rutas controlador_rutas = new Controlador_Rutas();
Ruta ruta = new Ruta();
ruta = controlador_rutas.getRuta(Integer.valueOf(request.getParameter("id_ruta")));
%>
<!DOCTYPE html>

<!--  Bus( placa, tipo, id_ruta,  numero_pasajeros); -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Ingresar Ruta</title>
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
    Registro de rutas
        </div>

   
        <div class="panel-body">
        <form action="procesador_edicion_rutas.jsp?id_ruta=<%out.print(ruta.getId_ruta()); %>" class="form-group" method="post" >
           
           
          
             
         
               <label for="Nombre">
                   Nombre de la ruta:
               </label>
            <input type="text" value ="<%out.print(ruta.getNombre()); %>" name="nombre" pattern="[^<>]+"  id="nombre" class ="form-control" required="required"></input>
                
               <label for="descripcion">
                   Descripci&oacute;n:
               </label>
                   <textarea   class="form-control" name="descripcion" id="descripcion" class ="form-control" required="required">  <%out.print(ruta.getDescripcion()); %></textarea>
                   
                   <br></br>
             
             
               <center>
                   <input type="submit" class="btn btn-primary" value="Modificar ruta"></center>
                                
           
          
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
