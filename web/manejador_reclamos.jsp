<%@page import="proyectomio.controlador.Controlador_Reclamo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="proyectomio.modelo.Estacion"%>
<%@page import="proyectomio.modelo.Reclamo"%>
<%@page import="proyectomio.modelo.Reclamo_medida"%>
<%@page import="proyectomio.controlador.Controlador_Estaciones"%>
<%@page import="proyectomio.modelo.Empleado"%>
<%@page import="proyectomio.controlador.Controlador_Empleado"%>
<%@page import="proyectomio.modelo.Pasajero"%>
<%@page import="proyectomio.controlador.Controlador_Pasajero"%>

<% Controlador_Reclamo controlador_reclamo = new Controlador_Reclamo();
   Controlador_Empleado controlador_empleado = new Controlador_Empleado();
   Controlador_Pasajero controlador_pasajero = new Controlador_Pasajero();
   Reclamo reclamo = new Reclamo();
   reclamo = controlador_reclamo.obtenerReclamo(Integer.valueOf(request.getParameter("id_tiquete"))).get(0);
   Empleado empleado_anota = controlador_empleado.get_empleados(reclamo.getId_empleado_anota()).get(0);
   Pasajero pasajero_reclamo = controlador_pasajero.get_pasajeros(reclamo.getId_pasajero_interpone()).get(0);
   ArrayList<Reclamo_medida> medidas = controlador_reclamo.obtenerMedida(Integer.valueOf(request.getParameter("id_tiquete")), "");
   %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gesti&oacute;n de reclamos</title>
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
    Registro de reclamos<br>
        </div>
         <div class="panel-body">
        <form action="procesador_ingreso_reclamo.jsp" class="form-group" method="post" >
           
         <label for="id_tiquete">
              Id reclamo:
               </label>
               <input value="<% out.print(reclamo.getId_tiquete()) ;%>" type="text" name="id_tiquete"  id="id_tiquete" class ="form-control" readonly>
           <label for="fecha">
                    Fecha en que se presento:
               </label>
                   <input  value="<% out.print(reclamo.getFecha().subSequence(0, 19)) ;%>" type="text" name="fecha" id="fecha" class ="form-control" readonly>        
          <label for="motivo">
              Motivo del reclamo:
               </label>
               <input type="text" value="<% out.print(reclamo.getMotivo()) ;%>" name="motivo"  id="motivo" class ="form-control" readonly>
               
                   <label for="descripcion">
                       Descripci&oacute;n:
               </label>
                   <textarea name="descripcion" id="descripcion" class ="form-control" readonly> <% out.print(reclamo.getDescripcion()) ;%></textarea>
                <label for="estado">
                    Estado:
               </label>    
          <select class="form-control" name="estado" id="estado"  required="required">
                    <option value="0" <%if(reclamo.getEstado()==0){out.print("selected");}%>>Iniciado </option>
                    <option value="1" <%if(reclamo.getEstado()==1){out.print("selected");}%>>En proceso </option>
                    <option value="2" <%if(reclamo.getEstado()==2){out.print("selected");}%>> Solucionado </option>
                   
                     </select>
               <label for="id_pasajero_interpone">
                   Identificaci&oacute;n del pasajero que interpone el reclamo :
               </label>
               <input value="<% out.print(reclamo.getId_pasajero_interpone()+" - "+pasajero_reclamo.getNombres()+" "+pasajero_reclamo.getApellidos()) ;%>" type="text" name="id_pasajero_interpone" pattern="[0-9]{4,}"  id="id_pasajero_interpone" class ="form-control" readonly>
              
                   <label for="id_empleado_anota">
                   Identificaci&oacute;n del empleado que anoto el reclamo :
               </label>
               <input value="<% out.print(reclamo.getId_empleado_anota()+" - "+ empleado_anota.getNombres()+" "+empleado_anota.getApellidos()) ;%>" type="text" name="id_empleado_anota" pattern="[0-9]{4,}"  id="id_empleado_anota" class ="form-control" readonly>
                   
                   
                   <label for="id_estacion_interpone">
                    Estaci&oacute;n en la que se genera el reclamo:
               </label>
                 <input  value="<% out.print(reclamo.getId_estacion_interpone()) ;%>" type="text" name="id_estacion_interpone" pattern="[0-9]{4,}"  id="id_estacion_interpone" class ="form-control" readonly>
           
           <br></br>
                     <center>
                   <input type="submit" class="btn btn-primary" value="Modificar estado"></center>
     </form>
</div>
</div>
                  
     <div class="panel panel panel-success">
        <div class ="panel-heading">
    Adicionar de medida<br>
        </div>
         <div class="panel-body">
        <form action="adicionar_medida_reclamo.jsp?id_tiquete=<%out.print(request.getParameter("id_tiquete"));%>" class="form-group" method="post" >
            <label for="id_tiquete">
                Descripci&oacute;n:
               </label>
            <input type="text" name="id_tiquete"  id="id_tiquete" class ="form-control" required> </input>
              <! <label for="estado">
                    Estado:
               </label>    
          <select class="form-control" name="estado" id="estado"  required="required">
                    <option value="0" <%if(reclamo.getEstado()==0){out.print("selected");}%>>Iniciada </option>
                    <option value="1" <%if(reclamo.getEstado()==1){out.print("selected");}%>>En proceso </option>
                    <option value="2" <%if(reclamo.getEstado()==2){out.print("selected");}%>>Implementada </option>
                    <option value="3" <%if(reclamo.getEstado()==3){out.print("selected");}%>>Fallida </option>
                     </select>
                     
                      <br></br>
                     <center>
                   <input type="submit" class="btn btn-success" value="Adicionar medida"></center>
     </form>
</div>

                     </div>
            <% for(int i =0; i<medidas.size();i++){ %>    
            <div class="col-md-6">
                         <div class="panel panel-info">
        <div class ="panel-heading">
    Medida<br>
        </div>
         <div class="panel-body">
             <form action="modificar_medida_reclamo.jsp?id_tiquete=<%out.print(request.getParameter("id_tiquete"));%>&hora_fecha_registro=<%out.print(medidas.get(i).getFecha_hora());%>" class="form-group" method="post" >
            <label for="descripcion">
                Descripci&oacute;n:
               </label>
            <textarea name="descripcion"  id="descripcion" class ="form-control" readonly><%out.print(medidas.get(i).getDescripcion());%> </textarea>>
                 
                 <label for="fecha">
                Fecha de registro:
               </label>
                 <input type="text" value ="<%out.print(medidas.get(i).getFecha_hora().subSequence(0, 16));%> "name="fecha"  id="fecha" class ="form-control" readonly> </input>
               <label for="estado">
                    Estado:
               </label>    
          <select class="form-control" name="estado" id="estado"  required="required">
              <option value="0" <%if(medidas.get(i).getEstado()==0){out.print("selected");}%>>Iniciada </option>
                    <option value="1" <%if(medidas.get(i).getEstado()==1){out.print("selected");}%>>En proceso </option>
                    <option value="2" <%if(medidas.get(i).getEstado()==2){out.print("selected");}%>>Implementada </option>
                    <option value="3" <%if(medidas.get(i).getEstado()==3){out.print("selected");}%>>Fallida </option>
                     </select>
                     
                      <br></br>
                     <center>
                   <input type="submit" class="btn btn-info" value="Cambiar estado"></center>
     </form>
</div>
</div>
                     </div>
                     <%}%>
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
