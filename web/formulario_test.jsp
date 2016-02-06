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
    <h5>Registro de empleado. </h5><br>
    
        
        <form action="procesador_formulario_test.jsp" class="form-group" method="post" >
           
           
          
               <label for="nombre">
                    Nombre:
               </label>
               <input type="text" name="nombre" id="nombre" class ="form-control" required="required">
         
               <label for="apellido">
                    Apellidos:
               </label>
               <input type="text" name="apellido" id="apellido" class ="form-control" required="required">
                
               <label for="fecha">
                    Fecha de nacimiento:
               </label>
               <input type="date" name="fecha" id="fecha" class ="form-control" required="required">
                   
               <label for="direccion">
                   Direcci&oacute;n:
               </label>
               <input type="text" name="direccion" id="direccion" class ="form-control" required="required">
                   
               <label for="telefono">
                   Tel&eacute;fono:
               </label>
               <input type="text" name="telefono" id="telefono" class ="form-control" required="required">
                   
               <label for="correo">
                   Correo electr&oacute;nico:
               </label>
               <input type="text" name="correo" id="correo" class ="form-control" required="required">
                   
               <label for="cargo">
                    Cargo:
               </label>
               <div class="form-group" name="cargo" id="cargo">
                                            
                                            <select class="form-control">
                                                <option>Gerente</option>
                                                <option>Administrador</option>
                                                <option>Motorista</option>
                                                <option>Cajero</option>
                                                <option>Oficios varios</option>
                                            </select>
                                        </div>

               <center>
                   <input type="submit" class="btn btn-default" value="Registrar empleado"></center>
                                
           
          
     </form>
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
