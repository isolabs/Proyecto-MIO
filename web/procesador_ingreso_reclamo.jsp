<%@page import="java.sql.Timestamp"%>
<%@page import="proyectomio.modelo.Reclamo"%>
<%@page import="proyectomio.controlador.Controlador_Reclamo"%>
<%@page import="proyectomio.controlador.Controlador_Empleado"%> 
<%@ include file="verificadorLogin.jsp" %>
<%
  
        java.util.Date today = new java.util.Date();
        Timestamp s = new java.sql.Timestamp(today.getTime());
        String fecha = s.toString();
        Controlador_Reclamo uncontrolador = new Controlador_Reclamo();
        Controlador_Empleado controlador_empleado = new Controlador_Empleado();
        Reclamo unReclamo = new Reclamo();

        String motivo = request.getParameter("motivo");
        String descripcion = request.getParameter("descripcion");
        int id_pasajero_interpone = Integer.valueOf(request.getParameter("id_pasajero_interpone"));
        int id_estacion_interpone = Integer.valueOf(request.getParameter("id_estacion_interpone"));
        int id_empleado_anota=Integer.valueOf(session.getAttribute("userid").toString());
        int resultado = uncontrolador.ingresarReclamo(fecha, motivo, descripcion, 0,id_pasajero_interpone,id_empleado_anota , 0, id_estacion_interpone);     %>
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
    <h5>
 
    <%
        
       
       
       
       switch(resultado){
           case 0: out.println("El reclamo interpuesto por el usuario con identifiaci&oacute;n "+id_pasajero_interpone+"  ha sido ingresado con exito");break;
           case 2: out.println("El usuario con n&uacute;mero de identifiaci&oacute;n "+id_pasajero_interpone+" no es un pasajero registrado");break;
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
       location.href="<%out.print("ingresar_reclamo.jsp");%> "<%}
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