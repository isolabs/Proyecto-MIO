<%-- 
    Document   : empleados
    Created on : Feb 24, 2016, 11:43:04 AM
    Author     : jeisonOS
--%>


<%@page import="proyectomio.modelo.Consulta"%>
<%@page import="proyectomio.controlador.Controlador_Tarjeta"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Controlador_Tarjeta controlador_tarjeta = new Controlador_Tarjeta();
    Consulta consulta = new Consulta();
     consulta = controlador_tarjeta.ver_uso_tarjeta_ruta(Integer.valueOf(request.getParameter("id_tarjeta")));
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de pasajeros</title>
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
                Pasajeros
            </div>
            <div class="panel-body">
                
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>
                                <th>Id tarjeta</th>
                                <th>Id Pasajero</th>
                                 <th>Pasajero</th>
                                <th>Id ruta abordada</th>
                                <th>Fecha abordaje</th>
                              
                                
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for(int i = 0; i < consulta.getColumna("id_ruta").getFilas().size();i++){
                                    
                                    out.println("<tr class=\"odd gradeX\">");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"id_tarjeta_" + i + "\">" + consulta.getColumna("id_tarjeta").getFila(i)+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"id_pasajero_" + i + "\">" + consulta.getColumna("id_pasajero").getFila(i)+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"nombres_" + i + "\">" + consulta.getColumna("nombres").getFila(i)+ "</td>");
                                     out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"id_tarjeta_" + i + "\">" + consulta.getColumna("id_ruta").getFila(i)+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"fecha_" + i + "\">" + consulta.getColumna("fecha").getFila(i)+ "</td>");
                                   
                                    out.println("</tr>");
                                    
                                };
                            
                            %>
                            <!--<tr class="odd gradeX">
                                <td>Trident</td>
                                <td>Internet Explorer 4.0</td>
                                <td>Win 95+</td>
                                <td class="center">4</td>
                            </tr>-->
                            
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
                      if (document.getElementById("seleccion_id").getAttribute("value")=="") {
                         alert("No ha seleccionado un empleado de la tabla");
                     }                        };
        </script>
        <!-- CUSTOM SCRIPTS -->
        <script src="assets/js/custom.js"></script>


    </body>
</html>
