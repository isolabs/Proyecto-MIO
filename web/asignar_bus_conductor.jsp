<%@page import="java.util.ArrayList"%>
<%@page import="proyectomio.controlador.Controlador_Buses"%>
<%@page import="proyectomio.modelo.Bus"%>
<%@ include file="verificadorLogin.jsp" %>
<!DOCTYPE html>

<!--  Bus( placa, tipo, id_ruta,  numero_pasajeros); -->
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Asignar bus a conductor</title>
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
                <form action="procesador_asignacion_bus_conductor.jsp" class="form-group" method="post" >



                    <label for="id_empleado">
                        Id conductor:
                    </label>
                    <input type="text" name="id_empleado"  pattern="[0-9]{2,}" title="Debe ingresar un dato correcto" id="id_empleado" class ="form-control" required="required"></input>

                    <label for="lista_buses">
                        Bus:
                    </label>
                    <%
                        Controlador_Buses controlador_buses = new Controlador_Buses();
                        ArrayList<Bus> buses = controlador_buses.get_buses();

                    %>
                    <select class="form-control" name="placa_bus" id="placa_bus"  required="required">
                        <%  for (int i = 0; i < buses.size(); i++) {%>
                        <option value="<% out.print(buses.get(i).getPlaca());%>"> <% out.print(buses.get(i).getPlaca());%></option>
                        <%}%>
                    </select>

                    <label for="turno">
                        Turno:
                    </label>

                    <select class="form-control" name="turno" id="turno" required="required">
                        <option value = "0"> Lun - Vie (Mañana) [05:00 am - 11:59 am]</option>
                        <option value = "1"> Lun - Vie (Tarde)  [12:00 pm - 05:59 pm]</option>
                        <option value = "2"> Lun - Vie (Noche)  [06:00 pm - 10:59 pm]</option>
                        <option value = "3"> Sab - Dom (Mañana) [05:00 am - 11:59 am]</option>
                        <option value = "4"> Sab - Dom (Tarde)  [12:00 pm - 05:59 pm]</option>
                        <option value = "5"> Sab - Dom (Noche)  [06:00 pm - 10:59 pm]</option>
                    </select>


                    <center>    <input   style="margin-top: 10px"  type="submit" class="btn btn-primary" value="Asignar Bus"></center>


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
