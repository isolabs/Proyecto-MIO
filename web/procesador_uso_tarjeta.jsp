<%-- 
    Document   : procesador_uso_tarjeta
    Created on : 27-feb-2016, 23:33:34
    Author     : Alejandro
--%>

<%@page import="proyectomio.controlador.Controlador_Tarjeta"%>
<%@page import="proyectomio.controlador.Controlador_Rutas"%>
<%@page import="proyectomio.modelo.Ruta"%>
<% Controlador_Tarjeta uncontrolador = new Controlador_Tarjeta();
       
    
      int id_tarjeta =  Integer.valueOf(request.getParameter("id_tarjeta"));
      int id_ruta =  Integer.valueOf(request.getParameter("id_ruta"));
        
       int resultado = uncontrolador.registrar_uso_tarjeta(id_ruta, id_tarjeta);
       
       
       Controlador_Rutas controlador_rutas = new Controlador_Rutas();
       Ruta ruta = controlador_rutas.getRuta(id_ruta);
       String nombre_ruta = ruta.getNombre();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Procesador de ingreso uso tarjeta</title>
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
    <%
        
       
      
       
       switch(resultado){
           case 0: out.println("El pasajero con la tarjeta numero "+id_tarjeta+" abordo la ruta "+nombre_ruta);break;
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
            }%>" onclick="goBack()">Volver</button> </center>
  <script>
function goBack() {
    <%if(resultado == 0) {%>
       location.href="<%out.print("ingresar_uso_tarjeta.jsp");%> "<%}
    else{
    out.print("window.history.back()");
    }
   %>;
    
    
}
</script>  
        </h5><br>
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


