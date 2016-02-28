<%@page import="proyectomio.controlador.Controlador_Empleado"%>
<%@page import="proyectomio.modelo.Empleado"%>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Free Bootstrap Admin Template : Binary Admin</title>
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
    <% Controlador_Empleado controlador = new Controlador_Empleado();
   Empleado empleado = new Empleado();
   empleado = controlador.get_empleados(Integer.parseInt(request.getParameter("id_empleado"))).get(0);
   %>
    <div class="panel panel-primary">
        <div class ="panel-heading">
            Edici&oacute;n de empleados<br>
        </div>
         <div class="panel-body">
        <form action="procesador_editar_empleado.jsp?id_empleado=<%out.println(request.getParameter("id_empleado"));%>" class="form-group" method="post" >
           
           
          <label for="id_empleado_midificar">
              N&uacute;mero de identificaci&oacute;n:
               </label>
            <input type="text" value="<%out.println(request.getParameter("id_empleado"));%>" name="id_empleado" pattern="[0-9]{4,}" id="id_empleado" class ="form-control" disabled>
               
                   <label for="nombres">
                    Nombres:
               </label>
               <input type="text" name="nombres" value="<%out.println(empleado.getNombres());%>" pattern="[a-z ñ A-Z]{4,}" id="nombres" class ="form-control" required="required">
         
               <label for="apellidos">
                    Apellidos:
               </label>
               <input type="text" name="apellidos"  value="<%out.println(empleado.getApellidos());%>" pattern="[a-z ñ A-Z]{4,}"  id="apellidos" class ="form-control" required="required">
                
               <label for="fecha_nacimiento">
                    Fecha de nacimiento:
               </label>
               <input type="date" name="fecha_nacimiento" value="<%out.println(empleado.getFecha_nacimiento());%>"id="fecha_nacimiento" class ="form-control" required="required">
                   
               <label for="direccion">
                   Direcci&oacute;n:
               </label>
               <input type="text" name="direccion" value="<%out.println(empleado.getDireccion());%>" id="direccion" class ="form-control">
                   
               <label for="telefono">
                   Tel&eacute;fono:
               </label>
               <input type="text" name="telefono" value="<%out.println(empleado.getTelefono());%>" pattern="[0-9]{4,}" id="telefono" class ="form-control" >
                   
               <label for="correo_electronico">
                   Correo electr&oacute;nico:
               </label>
               <input type="email" value="<%out.println(empleado.getCorreo_electronico());%>" name="correo_electronico" id="correo_electronico" class ="form-control" >
                   
               <label for="cargo">
                    Cargo:
               </label>
               <div class="form-group" >
                                            
                                            <select  name="cargo" id="cargo" class="form-control">
                                                <option value="0">Gerente</option>
                                                <option value="1">Director</option>
                                                <option value="2">Auxiliar</option>
                                                <option value="3">Conductor</option>
                                            </select>
                                        </div>

             
            <label for="password">
                   Contraseña del sistema:
               </label>
               <input type="password" name="password" value="<%out.println(empleado.getPassword());%>" id="password" class ="form-control" required="required">        
                   <br></br>
                     <center>
                   <input type="submit" class="btn btn-primary" value="Modificar empleado"></center>
                    <input type="hidden" name="accion" id="accion"  value="1">            
           
          
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