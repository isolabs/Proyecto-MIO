<!DOCTYPE html>

<!--  Bus( placa, tipo, id_ruta,  numero_pasajeros); -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Ingresar Bus</title>
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
    <h5>Ingreso de nuevos buses. </h5><br>
    
        
        <form action="procesador_ingreso_bus.jsp" class="form-group" method="post" >
           
           
          
               <label for="Placa">
                   Placa:
               </label>
            <input type="text" name="placa"  placeholder="Ejemplo: ABC-123" title="Debe ingresar un dato correcto" id="placa" class ="form-control" required="required">
         
               <label for="id_ruta">
                   N&uacute;mero de ruta a la que pertenece:
               </label>
               <input type="text" name="id_ruta"   id="id_ruta" class ="form-control" required="required">
                
               <label for="num_pasajeros">
                   N&uacute;mero de pasajeros:
               </label>
               <input type="text" name="num_pasajeros" id="num_pasajeros" class ="form-control" required="required">
                   
              
               <label for="tipo_bus">
                    Tipo de bus:
               </label>
                   
                  <select class="form-control" name="tipo_bus" id="tipo_bus" multiple required="required">
                                                <option>Articulado</option>
                                                <option>Padrone</option>
                                                <option>Complementario</option>
                                                </select>
             
               <center>
                   <input type="submit" class="btn btn-default" value="Registrar bus"></center>
                                
           
          
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
