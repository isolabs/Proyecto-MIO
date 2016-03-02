<%@page import="java.sql.Timestamp"%>
<%@page import="proyectomio.modelo.Reclamo"%>
<%@page import="proyectomio.controlador.Controlador_Reclamo"%>
<%@page import="proyectomio.controlador.Controlador_Empleado"%> 
<%@ include file="verificadorLogin.jsp" %>
<%
  
       Controlador_Reclamo controlador_reclamo = new Controlador_Reclamo();
        int id_tiquete = Integer.valueOf(request.getParameter("id_tiquete"));
        int estado = Integer.valueOf(request.getParameter("estado"));
        String fecha = request.getParameter("fecha");
        int resultado = controlador_reclamo.resolverMedida(id_tiquete, fecha, estado); 
        %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Procesador modificar reclamo</title>
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
           case 0: out.println("La medida interpuesta  ha sido modificado.");break;
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
       location.href="<%out.print("manejador_reclamos.jsp?opcion=0&id_tiquete="+id_tiquete);%> "<%}
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


  
