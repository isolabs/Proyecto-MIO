<%@page import="java.util.ArrayList"%>
<%@page import="proyectomio.controlador.Controlador_Rutas"%>
<%@page import="proyectomio.modelo.Ruta"%>
<%@page import="proyectomio.controlador.Controlador_Estaciones"%>
<%@page import="proyectomio.modelo.Estacion"%>
<%@ include file="verificadorLogin.jsp" %>
<!DOCTYPE html>

<!--  Bus( placa, tipo, id_ruta,  numero_pasajeros); -->
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Asignar ruta a estacion</title>
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
                Asignacion de estaciones para las rutas
            </div>
            <div class="panel-body">
                <form action="procesador_asignacion_ruta_estacion.jsp" class="form-group" method="post" >



                    
                    <label for="rutas">
                        Rutas:
                    </label>
                    <%
                        Controlador_Rutas controlador_rutas = new Controlador_Rutas();
                        ArrayList<Ruta> rutas = controlador_rutas.get_rutas();

                    %>
                    <select class="form-control" name="id_ruta" id="id_ruta"  required="required">
                        <%  for (int i = 0; i < rutas.size(); i++) {%>
                        <option value="<% out.print(rutas.get(i).getId_ruta());%>"> <% out.print(rutas.get(i).getNombre());%></option>
                        <%}%>
                    </select>

                     <label for="rutas">
                        Estaciones:
                    </label>
                    <%
                        Controlador_Estaciones controlador_estaciones = new Controlador_Estaciones();
                        ArrayList<Estacion> estaciones = controlador_estaciones.get_estaciones();

                    %>
                    <select class="form-control" name="id_estacion" id="id_estacion"  required="required">
                        <%  for (int i = 0; i < estaciones.size(); i++) {%>
                        <option value="<% out.print(estaciones.get(i).getId_estacion());%>"> <% out.print(estaciones.get(i).getNombre());%></option>
                        <%}%>
                    </select>


                    <center>    <input   style="margin-top: 10px"  type="submit" class="btn btn-primary" value="Asignar Estaci&oacute;n"></center>


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
