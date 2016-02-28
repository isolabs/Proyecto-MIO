<%@page import="proyectomio.modelo.Ruta"%>
<%@page import="proyectomio.modelo.Estacion"%>
<%@page import="proyectomio.controlador.operaciones.Controlador_Director"%>
<%
  Controlador_Director controlador_director = new Controlador_Director();
 
      int id_ruta = Integer.valueOf(request.getParameter("id_ruta"));
      int id_estacion = Integer.valueOf(request.getParameter("id_estacion"));
       
       
       int resultado = controlador_director.asignar_estacion_ruta(id_estacion,id_ruta);%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Procesador de ingreso de buses</title>
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
           case 0: out.println("La ruta "+id_ruta+" ha sido asignada a la estaci&oacute;n "+id_estacion);break;
           case 1: out.println("La ruta "+id_ruta+" ya se ha asignado antes a la estaci&oacute;n "+id_estacion);break;
           case 2: out.println("La ruta con id "+id_ruta+" o la estacion con id"+id_estacion+" no existe");break;
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

       <br>
        </div>
</div> 
  <script>
function goBack() {
    <%if(resultado == 0) {%>
       location.href="<%out.print("asignar_ruta_estacion.jsp");%> "<%}
    else{
    out.print("window.history.back()");
    }
   %>;
    
    
}
</script>  
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
