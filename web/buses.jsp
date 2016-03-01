<%-- 
    Document   : buses
    Created on : Feb 24, 2016, 11:50:42 AM
    Author     : jeisonOS
--%>

<%@page import="proyectomio.controlador.Controlador_Rutas"%>
<%@page import="proyectomio.modelo.Bus"%>
<%@page import="java.util.ArrayList"%>
<%@page import="proyectomio.controlador.Controlador_Buses"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="verificadorLogin.jsp" %>
<%
    
    Controlador_Buses controlador_buses = new Controlador_Buses();
    ArrayList <Bus> buses = controlador_buses.get_buses();
    Controlador_Rutas controlador_rutas = new Controlador_Rutas();
    
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
                
                document.getElementById('seleccion_placa').innerHTML =  document.getElementById ( "placa_" + id ).innerText;
                document.getElementById("seleccion_placa").setAttribute("value",document.getElementById ( "placa_" + id ).innerText);
                document.getElementById('seleccion_tipo').innerHTML = document.getElementById ( "tipo_" + id ).innerText;
                document.getElementById('seleccion_ruta').innerHTML = document.getElementById ( "ruta_" + id ).innerText;
                var editar_completo = "editar_bus.jsp?placa=";
                var editar_con_id=editar_completo.concat(document.getElementById("seleccion_placa").getAttribute("value"));
                var eliminar_con_id = "procesador_eliminar_bus.jsp?placa="+document.getElementById("seleccion_placa").getAttribute("value");
                document.getElementById("boton_borrar").setAttribute("href",eliminar_con_id);
                document.getElementById("boton_editar").setAttribute("href",editar_con_id);
            }
            
        </script>
        
    </head>
    <body>
        
        <div class="panel panel-info">
                        <div class="panel-heading">
                            <b>Selecci&oacute;n</b>
                            
                            <a href="#" id="boton_borrar" name="boton_borrar" type="submit" class="btn btn-danger btn-xs" style="float: right;margin-right: 5px;">Borrar</a>
                            <a href="#" id="boton_editar" name="boton_editar" onclick="goEdicion();" type="submit" class="btn btn-primary btn-xs" style="float: right;margin-right: 5px;">Editar</a>
                            <a href="ingresar_bus.jsp" type="submit" class="btn btn-success btn-xs" style="float: right;margin-right: 5px;">Adicionar</a>
                            
                        </div>
            <div class="panel-body">
                <table>
                    <tr><td align="right"><b>Placa:&nbsp;</b> </td><td id="seleccion_placa" value="" name="seleccion_placa"></td></tr>
                    <tr><td align="right"><b>Tipo:&nbsp;</b></td><td id="seleccion_tipo" name="seleccion_tipo"></td></tr>
                    <tr><td align="right"><b>Ruta:&nbsp;</b></td><td id="seleccion_ruta" name="seleccion_ruta"></td></tr>
                    
                </table>
                
                
                
            </div>
        </div>
        
        <!-- Advanced Tables -->
        <div class="panel panel-primary">
            <div class="panel-heading">
                Buses
            </div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>
                                <th>Placa</th>
                                <th>Tipo</th>
                                <th>Ruta</th>
                                <th>Capacidad</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for(int i = 0; i < buses.size(); i++){
                                    
                                    out.println("<tr class=\"odd gradeX\">");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"placa_" + i + "\">" + buses.get(i).getPlaca()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"tipo_" + i + "\">" + buses.get(i).getTipo()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"ruta_" + i + "\">" + controlador_rutas.getRuta(Integer.valueOf(buses.get(i).getId_ruta())).getNombre()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" class=\"center\">" + buses.get(i).getNumero_pasajeros()+ "</td>");
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
