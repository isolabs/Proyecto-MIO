<%-- 
    Document   : empleados
    Created on : Feb 24, 2016, 11:43:04 AM
    Author     : jeisonOS
--%>

<%@page import="proyectomio.controlador.Controlador_Empleado"%>
<%@page import="proyectomio.modelo.Empleado"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="verificadorLogin.jsp" %>
<%
    ArrayList <Empleado> empleados;
    Controlador_Empleado controlador_empleados = new Controlador_Empleado();
    empleados = controlador_empleados.get_empleados(-1);
    
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
        <script>
            
            function seleccionar(id){
                
                document.getElementById('seleccion_id').innerHTML =  document.getElementById ( "id_empleado_" + id ).innerText;
                document.getElementById('seleccion_nombre').innerHTML = document.getElementById ( "nombres_" + id ).innerText + " " + document.getElementById ( "apellidos_" + id ).innerText ;
                
            }
            
        </script>
    </head>
    <body>
        
        <div class="panel panel-default">
                        <div class="panel-heading">
                            Selecci&oacute;n
                        </div>
            <div class="panel-body">
                <table>
                    <tr><td align="right"><b>Identificaci&oacute;n:&nbsp;</b> </td><td id="seleccion_id" name="seleccion_id"></td></tr>
                    <tr><td align="right"><b>Nombre:&nbsp;</b></td><td id="seleccion_nombre" name="seleccion_nombre"></td></tr>
                </table>
                
                
                
            </div>
        </div>

        <!-- Advanced Tables -->
        <div class="panel panel-default">
            <div class="panel-heading">
                Empleados
            </div>
            <div class="panel-body">
                
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>
                                <th>Identificaci&oacute;n</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>F. Nacimiento</th>
                                <th>Direcci&oacute;n</th>
                                <th>Cargo</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for(int i = 0; i < empleados.size(); i++){
                                    
                                    out.println("<tr class=\"odd gradeX\">");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"id_empleado_" + i + "\">" + empleados.get(i).getId_empleado()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"nombres_" + i + "\">" + empleados.get(i).getNombres()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"apellidos_" + i + "\">" + empleados.get(i).getApellidos()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\">" + empleados.get(i).getFecha_nacimiento()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\">" + empleados.get(i).getDireccion()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" class=\"center\">" + empleados.get(i).getCargo_String()+ "</td>");
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
        </script>
        <!-- CUSTOM SCRIPTS -->
        <script src="assets/js/custom.js"></script>


    </body>
</html>
