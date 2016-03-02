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
        <title>Mostrar rutas </title>
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
        
             <div id="wrapper">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="start/index.jsp">MIO</a> 
                </div>
                <div style="color: white;
                     padding: 15px 50px 5px 50px;
                     float: right;
                     font-size: 16px;"> Bienvenido &nbsp; </div>
                    
            </nav>   
        </div>
        <div class="panel panel-primary" style="margin: auto;width:70%; margin-top: 10%;">
            <div class ="panel-heading">
                Consutlar rutas que pasan por una estaci&oacute;
            </div>
            <div class="panel-body">
                <form action="mostrar_rutas_por_estacion.jsp" class="form-group" method="post" >



                  
                     <label for="rutas">
                         Estaci&oacute;n:
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


                    <center>    <input   style="margin-top: 10px"  type="submit" class="btn btn-primary" value="Consultar"></center>


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
