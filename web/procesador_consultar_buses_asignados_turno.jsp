<%-- 
    Document   : buses
    Created on : Feb 24, 2016, 11:50:42 AM
    Author     : jeisonOS
--%>

<%@page import="proyectomio.modelo.Consulta"%>
<%@page import="proyectomio.controlador.operaciones.Controlador_Conductor"%>
<%@page import="proyectomio.controlador.Controlador_Rutas"%>
<%@page import="proyectomio.modelo.Turno"%>
<%@page import="proyectomio.modelo.Ruta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    Controlador_Conductor controlador_conductor = new Controlador_Conductor();
    Consulta consulta = controlador_conductor.consultar_buses_asignados(Integer.valueOf(request.getParameter("id_conductor")));
    Controlador_Rutas controlador_ruta = new Controlador_Rutas();
    Ruta ruta = new Ruta();
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- BOOTSTRAP STYLES-->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- MORRIS CHART STYLES-->

        <!-- CUSTOM STYLES-->
        <link href="assets/css/custom.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <!-- TABLE STYLES-->
        <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

        
    </head>
    <body>
        
   
         
                
                
       
        
        <!-- Advanced Tables -->
        <div class="panel panel-primary">
            <div class="panel-heading">
                Buses Asignados
            </div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>
                                <th>Placa</th>
                                <th>Ruta</th>
                                <th>Descripcion</th>
                                <th>Turno</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String turno ="";
                               
                                for(int i = 0; i < consulta.getColumna("placa_bus").getFilas().size(); i++){
                               
                                    out.println("<tr class=\"odd gradeX\">");
                                    out.println("<td>" + consulta.getColumna("placa_bus").getFila(i)+ "</td>");
                                    out.println("<td>" + consulta.getColumna("nombre").getFila(i) + "</td>");
                                    out.println("<td>" + consulta.getColumna("descripcion").getFila(i) + "</td>");
                                    out.println("<td>" + Turno.FinSemanaManiana.get_string_desde_int(Integer.valueOf(consulta.getColumna("turno").getFila(i)))+ "</td>");
                                    out.println("</tr>");
                                    
                                };
                            
                            %>
                            
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
        <!--End Advanced Tables -->
        <!-- JQUERY SCRIPTS -->
        <script src="assets/js/jquery-1.10.2.js"></script>
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- METISMENU SCRIPTS -->
        <script src="assets/js/jquery.metisMenu.js"></script>
        <!-- DATA TABLE SCRIPTS -->
        <script src="assets/js/dataTables/jquery.dataTables.js"></script>
        <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
            function goEdicion() {
                      if (document.getElementById("seleccion_placa").getAttribute("value")=="") {
                         alert("No ha seleccionado un bus de la tabla");
                     }                        };
        </script>
        <!-- CUSTOM SCRIPTS -->
        <script src="assets/js/custom.js"></script>
    </body>
</html>
