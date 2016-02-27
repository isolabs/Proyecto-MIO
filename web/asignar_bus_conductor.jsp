<%@page import="java.util.ArrayList"%>
<%@page import="proyectomio.controlador.operaciones.Controlador_Director"%>
<%@page import="proyectomio.controlador.Controlador_Buses"%>
<%@page import="proyectomio.controlador.Controlador_Empleado"%>
<%@page import="proyectomio.modelo.Bus"%>
<%@page import="proyectomio.modelo.Empleado"%>
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
        <div class="panel panel-primary">
            <div class ="panel-heading">
                Asignacion de buses
            </div>
            <div class="panel-body">
                <form action="procesador_asignacion_buses.jsp" class="form-group" method="post" >



                    <label for="Placa">
                        Placa:
                    </label>
                    <input type="text" name="placa"  pattern="[^<>]+"placeholder="Ejemplo: ABC-123" title="Debe ingresar un dato correcto" id="placa" class ="form-control" required="required"></input>

                    <label for="lista_empleados:">
                        Lista de empleados:
                    </label>
                    <%
                        Controlador_Empleado controlador_empleados = new Controlador_Empleado();
                        ArrayList<Empleado> empleados = controlador_empleados.get_empleados(-1);

                    %>
                    <select class="form-control" name="id_empleado" id="id_empleado"  required="required">
                        <%                          for (int i = 0; i < empleados.size(); i++) {%>
                        <option value="<% out.print(empleados.get(i).getId_empleado());%>"> <% out.print(empleados.get(i).getNombres());%></option>
                        <%}%>
                    </select>

                    <label for="num_pasajeros">
                        N&uacute;mero de pasajeros:
                    </label>
                    <input type="text" pattern="[^<>][0-9].{0,2}" name="num_pasajeros" id="num_pasajeros" class ="form-control" required="required"></input>


                    <label for="tipo_bus">
                        Tipo de bus:
                    </label>

                    <select class="form-control" name="tipo_bus" id="tipo_bus" required="required">
                        <option>Articulado</option>
                        <option>Padron</option>
                        <option>Complementario</option>
                    </select>


                    <center>    <input   style="margin-top: 10px"  type="submit" class="btn btn-primary" value="Registrar bus"></center>


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
