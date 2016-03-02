<%@page import="java.util.ArrayList"%>
<%@page import="proyectomio.controlador.Controlador_Empleado"%>
<%@page import="proyectomio.modelo.Empleado"%>
<%@ include file="verificadorLogin.jsp" %>
<%    Controlador_Empleado controlador_empleado = new Controlador_Empleado();
    ArrayList<Empleado> empleado = controlador_empleado.get_empleados(Integer.valueOf(session.getAttribute("userid").toString()));
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Panel Administrativo</title>
        <!-- BOOTSTRAP STYLES-->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
        <link href="assets/css/custom.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

        <script>
            <%if (empleado.get(0).getCargo_String().equals("Director")) {%>


            function goEmpleados() {
                if (!document.getElementById("contenedor"))
                    return false;
                document.getElementById("contenedor").setAttribute('data', "empleados.jsp");
            }

            function goEstaciones() {
                if (!document.getElementById("contenedor"))
                    return false;
                document.getElementById("contenedor").setAttribute('data', "estaciones.jsp");

            }

            function goRutas() {
                if (!document.getElementById("contenedor"))
                    return false;
                document.getElementById("contenedor").setAttribute('data', "rutas.jsp");
            }

            function goBuses() {
                if (!document.getElementById("contenedor"))
                    return false;
                document.getElementById("contenedor").setAttribute('data', "buses.jsp");
            }

            function goRecarga() {
                if (!document.getElementById("contenedor"))
                    return false;
                document.getElementById("contenedor").setAttribute('data', "recargar.jsp");
            }
            function goPasajeros() {
                if (!document.getElementById("contenedor"))
                    return false;
                document.getElementById("contenedor").setAttribute('data', "pasajeros.jsp");
            }
            function goAsignarBusConductor() {
                if (!document.getElementById("contenedor"))
                    return false;
                document.getElementById("contenedor").setAttribute('data', "asignar_bus_conductor.jsp");
            }
            function goVenderTarjeta() {
                if (!document.getElementById("contenedor"))
                    return false;
                document.getElementById("contenedor").setAttribute('data', "ingresar_tarjeta.jsp");
            }
             
            function goReclamos() {
                if (!document.getElementById("contenedor"))
                    return false;
                document.getElementById("contenedor").setAttribute('data', "reclamos.jsp");
            }
              
            function goAsignaRutaEstacion() {
                if (!document.getElementById("contenedor"))
                    return false;
                document.getElementById("contenedor").setAttribute('data', "asignar_ruta_estacion.jsp");
            }
              function goAsignacionBusesAdmin() {
                if (!document.getElementById("contenedor"))
                    return false;
                document.getElementById("contenedor").setAttribute('data', "procesador_consultar_buses_asignados_turno.jsp?id_conductor=0");
            }
                    <%}%>
                        
             <%if (empleado.get(0).getCargo_String().equals("Conductor")) {%>
              function goAsignacionBusesEmpleado() {
                if (!document.getElementById("contenedor"))
                    return false;
                var id_empleado = <%out.print(session.getAttribute("userid").toString());%>;
                var url_id_empleado ="procesador_consultar_buses_asignados_turno.jsp?id_conductor="+ <%out.print(empleado.get(0).getId_empleado());%>; ;
                document.getElementById("contenedor").setAttribute('data', "procesador_consultar_buses_asignados_turno.jsp?id_conductor="+id_empleado);
            }
            <%}%>
   <%if (empleado.get(0).getCargo_String().equals("Conductor")) {%>
              function goAsignacionBusesEmpleado() {
                if (!document.getElementById("contenedor"))
                    return false;
                var id_empleado = <%out.print(session.getAttribute("userid").toString());%>;
                var url_id_empleado ="procesador_consultar_buses_asignados_turno.jsp?id_conductor="+ <%out.print(empleado.get(0).getId_empleado());%>; ;
                document.getElementById("contenedor").setAttribute('data', "procesador_consultar_buses_asignados_turno.jsp?id_conductor="+id_empleado);
            }
            <%}%>

        </script>


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
                    <a class="navbar-brand" href="index.html">MIO</a> 
                </div>
                <div style="color: white;
                     padding: 15px 50px 5px 50px;
                     float: right;
                     font-size: 16px;"> Bienvenido: <%=empleado.get(0).getNombres() + " " + empleado.get(0).getApellidos() + " (" + empleado.get(0).getCargo_String() + ")"%> &nbsp; <a href="login/logout.jsp" class="btn btn-danger square-btn-adjust">Salir</a> </div>
            </nav>   
            <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">
                        <li class="text-center">
                            <img src="assets/img/find_user.png" class="user-image img-responsive"/>
                        </li>

                        <%
                            if (empleado.get(0).getCargo_String().equals("Director")) {

                                out.print("<li><a  href=\"#\" onClick=\"goEmpleados();\">Empleados</a> </li>");
                                
                                out.print("<li><a href=\"#\"><i class= \"fa fa-sitemap fa-1x\"></i> Pasajeros</a><ul class=\"nav nav-second-level\">");
                                
                                out.print("<li><a  href=\"#\" onClick=\"goPasajeros();\">Pasajeros</a> </li>");
                                out.print("<li><a  href=\"#\" onClick=\"goVenderTarjeta();\">Vender tarjeta</a> </li>");
                                out.print("<li><a  href=\"#\" onClick=\"goRecarga();\">Recargar tarjetas</a> </li>");
                                
                                out.print("</ul></li>");
                                
                                out.print("<li><a  href=\"#\" onClick=\"goEstaciones();\">Estaciones</a> </li>");
                                out.print("<li><a  href=\"#\" onClick=\"goBuses();\">Buses</a> </li>");
                                out.print("<li><a  href=\"#\" onClick=\"goRutas();\">Rutas</a> </li>");
                                out.print("<li><a  href=\"#\" onClick=\"goAsignaRutaEstacion();\">Asignar ruta - Estaci&oacute;n</a> </li>");
                                out.print("<li><a  href=\"#\" onClick=\"goAsignarBusConductor();\">Asignar bus a un conductor</a> </li>");
                                out.print("<li><a  href=\"#\" onClick=\"goReclamos();\">Reclamos</a> </li>");
                                out.print("<li><a  href=\"#\" onClick=\"goAsignacionBusesAdmin();\">Buses asignados a conductores</a> </li>");
                           
                            }
                            
                    if (empleado.get(0).getCargo_String().equals("Conductor")) {
                        out.print("<li><a  href=\"#\" onClick=\"goAsignacionBusesEmpleado();\">Buses asignados</a> </li>"); 
                    }
                    
                        %>

                        

                    </ul>

                </div>

            </nav>  
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>Panel de trabajo</h2>   
                          
                            <object id="contenedor" name="contenedor" data="<%
                                if (empleado.get(0).getCargo_String().equals("Director")) {
                                    out.print("empleados.jsp");
                                } 
                                 if (empleado.get(0).getCargo_String().equals("Conductor")) {
                                    out.print("procesador_consultar_buses_asignados_turno.jsp?id_conductor="+empleado.get(0).getId_empleado());
                                }
                                 %>"
                                frameborder="0" height="900px" width="100%" type="text/html"><p></p></object>
                        </div>
                    </div>
                    <!-- /. ROW  -->
                    <hr />

                </div>
                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
        <!-- /. WRAPPER  -->
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
