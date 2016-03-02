<%@page import="java.sql.Timestamp"%>
<%@page import="proyectomio.modelo.Reclamo"%>
<%@page import="proyectomio.modelo.Reclamo_medida"%>
<%@page import="proyectomio.controlador.Controlador_Reclamo"%>
<%@ include file="verificadorLogin.jsp" %>
<%
  Controlador_Reclamo uncontrolador = new Controlador_Reclamo();
      Reclamo_medida medida = new Reclamo_medida();
      String descipcion = request.getParameter("descripcion");

       java.util.Date today = new java.util.Date();
        Timestamp s = new java.sql.Timestamp(today.getTime());
        String hora_fecha_registro = s.toString();
       
       int resultado = uncontrolador.ingresarMedida(Integer.valueOf(request.getParameter("id_tiquete")),descipcion, hora_fecha_registro );%>
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
           case 0: out.println("Se ha adicionado la medida");break;
           case 1: out.println("La medida no puede ser a la misma hora y al mismo tiquete");break;
           case 2: out.println("El tiquete que se esta referenciando no existe");break;
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
       location.href="<%out.print("manejador_reclamos.jsp?id_tiquete="+request.getParameter("id_tiquete")); %>"<%}
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
