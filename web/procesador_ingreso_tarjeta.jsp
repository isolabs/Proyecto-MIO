<%-- 
    Document   : procesador_ingreso_tarjeta
    Created on : 27-feb-2016, 21:14:03
    Author     : Alejandro
--%>


<%@page import="proyectomio.controlador.Controlador_Pasajero"%>
<%@page import="proyectomio.modelo.Pasajero"%>
<%@page import="proyectomio.controlador.Controlador_Tarjeta"%>
<% Controlador_Tarjeta uncontrolador = new Controlador_Tarjeta();
       
    
       int id_estacion =  Integer.valueOf(request.getParameter("id_estacion"));
       int id_usuario = Integer.valueOf(request.getParameter("id_usuario"));
       
       int resultado = -1;
       
       if(id_usuario != -1){
           
           Controlador_Pasajero c_pasajero = new Controlador_Pasajero();
           
           if(c_pasajero.get_pasajeros(id_usuario).size() == 0){
               
               resultado = uncontrolador.adicionar_tarjeta(id_estacion);
               response.sendRedirect("ingresar_pasajero.jsp?id_usuario=" + id_usuario + "&id_tarjeta=" + resultado);
           }else{
               resultado = -3;
           }
       }else{
           
           resultado = uncontrolador.adicionar_tarjeta(id_estacion);
       }
       
       
       int aux_error = -1;
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Procesador de ingreso de la tarjeta</title>
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
         if((resultado != 0)&&(resultado != 1)&&(resultado != -1)&&(resultado != -3)){ 
             aux_error = 0;    
          out.print("panel panel-primary");
                   }
         else{
             aux_error = resultado;
             out.print("panel panel-danger");
         }

          %>">
        <div class ="panel-heading">
            <% if(aux_error==0){
               
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
        
       
      
       
       switch(aux_error){
           case 0: out.println("Felicitaciones ha comprado una tarjeta, el n&uacute;mero es: <b>" + resultado + "</b>");break;
           case -3: out.println("Error, ya existe un pasajero con el n&uacute;mero: <b>" + id_usuario + "</b> en el sistema.");break;
           default: out.println("Se ha generado un error inesperado en el programa");
       }
       
    
    %>
      <br></br>
        <button class="<%
            if(aux_error==0){
                out.print("btn btn-primary");
            }
            else
            {
                out.print("btn btn-danger");
            }%>" onclick="goBack()">Volver</button> </center>
  <script>
function goBack() {
    <%if(aux_error == 0) {%>
       location.href="<%out.print("ingresar_tarjeta.jsp");%> "<%}
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

