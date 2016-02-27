<%@page import="proyectomio.modelo.Bus"%>
<%@page import="proyectomio.controlador.Controlador_Buses"%>
<%
  Controlador_Buses uncontrolador = new Controlador_Buses();
       Bus unbus = new Bus();
    
      String placa = request.getParameter("placa");
      int numero_pasajeros = Integer.valueOf(request.getParameter("num_pasajeros"));
      String tipo = request.getParameter("tipo_bus");
      int id_ruta = Integer.valueOf(request.getParameter("id_ruta"));
       
       
       int resultado = uncontrolador.adicionar_bus_bd(placa,id_ruta,numero_pasajeros,tipo);%>
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
           case 0: out.println("El bus con placa "+placa+" ha sido ingresado con exito");break;
           case 1: out.println("El bus con placa "+placa+" ya existe en nuestros registros");break;
           case 2: out.println("La ruta con id "+id_ruta+" no existe");break;
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
       location.href="<%out.print("ingresar_bus.jsp");%> "<%}
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
