<%@page import="proyectomio.controlador.operaciones.Controlador_Director"%>
<%
  Controlador_Director uncontrolador = new Controlador_Director();
    
      int  id_empleado = Integer.parseInt(request.getParameter("id_empleado"));
      String placa_bus = request.getParameter("placa_bus");
      int turno = Integer.valueOf(request.getParameter("turno"));
       int resultado = uncontrolador.asignar_bus_conductor(id_empleado,placa_bus,turno);%>
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
           case 0: out.println("El bus con placa "+placa_bus +" ha sido asignado al conductor con id "+id_empleado);break;
           case 1: out.println("El bus con placa "+placa_bus+" ya ha sido asignado al conductor con id "+id_empleado);break;
           case 2: out.println("El empleado con id "+ id_empleado +" no existe");break;
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
       location.href="<%out.print("asignar_bus_conductor.jsp");%> "<%}
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
