<%@page import="java.util.ArrayList"%>
<%@page import="proyectomio.controlador.Controlador_Empleado"%>
<%@page import="proyectomio.modelo.Empleado"%>
<%@page import="proyectomio.controlador.Controlador_Rutas"%>
<%@page import="proyectomio.modelo.Ruta"%>
<!DOCTYPE html>

<!--  Bus( placa, tipo, id_ruta,  numero_pasajeros); -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Ingresar Estaci&oacute;n</title>
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
            Registro de estaciones
        </div>
        <div class="panel-body">
        <form action="procesador_ingreso_estacion.jsp" class="form-group" method="post" >
           
           
          
               <label for="nombre">
                   Nombre:
               </label>
            <input type="nombre" name="nombre"  pattern="[^<>]+" title="Debe ingresar un dato correcto" id="placa" class ="form-control" required="required"></input>
         
               <label for="direccion">
                   Direcci&oacute;n:
               </label>
            
            
              <input type="direccion" name="direccion"  pattern="[^<>]+"  title="Debe ingresar un dato correcto" id="placa" class ="form-control" required="required"></input>
                 <label for="id_empleado_a_cargo">
                   Empleado a cargo:
               </label>
              
              <%
                   Controlador_Empleado controlador_empleados = new Controlador_Empleado();
                   ArrayList<Empleado> empleados = controlador_empleados.get_empleados(-1);
                   
                   %>
                  <select class="form-control" name="id_empleado_a_cargo" id="id_empleado_a_cargo"  required="required">
                      <% 
                          for(int i = 0; i < empleados.size(); i++)
                          {%>
                          <option value="<% out.print(empleados.get(i).getId_empleado()) ;%>"> <% out.print(empleados.get(i).getNombres()+" "+empleados.get(i).getApellidos());%></option>
                          <%} %>
                                                </select>
                
              
             
               <center>
                   <input   style="margin-top: 10px"  type="submit" class="btn btn-default" value="Registrar estaci&oacute;n"></center>
                                
           
          
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
