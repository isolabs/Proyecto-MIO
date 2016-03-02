<%-- 
    Document   : procesador_saldo_tarjeta
    Created on : 01-mar-2016, 9:30:26
    Author     : Alejandro
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="proyectomio.modelo.Tarjeta"%>
<%@page import="proyectomio.controlador.Controlador_Tarjeta"%>
<%
Controlador_Tarjeta uncontrolador = new Controlador_Tarjeta();
       Tarjeta unTarjeta = new Tarjeta();
    
      int saldo = Integer.valueOf(request.getParameter("id_tarjeta"));
           
       int resultado = uncontrolador.ver_saldo_tarjeta(saldo);
       %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Procesador para ver el saldo de la tarjeta</title>
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
      <div id="wrapper">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="start/index.jsp">MIO</a> 
                </div>
                <div style="color: white;
                     padding: 15px 50px 5px 50px;
                     float: right;
                     font-size: 16px;"> Bienvenido &nbsp; </div>
                   
            </nav>   
        </div>
    <br></br>




        
    <div class="<% 
         if(resultado!=-7456321){      
          out.print("panel panel-primary");
                   }
         else{
             out.print("panel panel-danger");
         }

          %>" style="margin: auto;width:87%; margin-top: 3%;">
        <div class ="panel-heading">
            <% if(resultado!=-7456321){
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
        
       
       
       if (resultado!=-7456321) {
               out.println("El saldo de su tarjeta es "+ resultado );
           }else{
           out.println("la tarjeta con numero de identificaci&oacute;n "+ saldo+" no existe en nuestros registros" );
       }
      
       
    
    %>
     <br></br>
        <button class="<%
            if(resultado!=-7456321){
                out.print("btn btn-primary");
            }
            else
            {
                out.print("btn btn-danger");
            }%>" onclick="goBack()">Volver</button> </center>
  <script>
function goBack() {
window.history.back();
    
    
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


