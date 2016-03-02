<%-- 
    Document   : tarjetas
    Created on : 28-feb-2016, 23:05:13
    Author     : Alejandro
--%>


<%@page import="proyectomio.controlador.Controlador_Tarjeta"%>
<%@page import="proyectomio.modelo.Tarjeta"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="verificadorLogin.jsp" %>
<%
    ArrayList <Tarjeta> tarjetas;
    Controlador_Tarjeta controlador_tarjetas = new Controlador_Tarjeta();
    tarjetas = controlador_tarjetas.get_tarjeta();
    
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
                
                document.getElementById('seleccion_id').innerHTML =  document.getElementById ( "id_tarjeta_" + id ).innerText;
                document.getElementById("seleccion_id").setAttribute("value",document.getElementById ( "id_tarjeta_" + id ).innerText);
                //document.getElementById('seleccion_nombre').innerHTML = document.getElementById ( "nombres_" + id ).innerText + " " + document.getElementById ( "apellidos_" + id ).innerText ;
                var cambiar_estado_tarjeta = "procesador_cambiar_estado_tarjeta.jsp?id_tarjeta="+document.getElementById("seleccion_id").getAttribute("value");
                //var editar_con_id=editar_completo.concat(document.getElementById("seleccion_id").getAttribute("value"));
                document.getElementById("boton_bloquear").setAttribute("href",cambiar_estado_tarjeta);
            }
            
        </script>
    </head>
    <body>
        
        <div class="panel panel-info">
                        <div class="panel-heading">
                            <b>Selecci&oacute;n</b>
                            
                            <a href="#" id="boton_bloquear" name="boton_bloquear" type="submit" class="btn btn-danger btn-xs" style="float: right;margin-right: 5px;">Bloquear/Desbloquear</a>
                          
                            <a href="ingresar_tarjeta.jsp" type="submit" class="btn btn-success btn-xs" style="float: right;margin-right: 5px;">Adicionar</a>
                            
                        </div>
            <div class="panel-body">
                <table>
                    <tr><td align="right"><b>Identificaci&oacute;n:&nbsp;</b> </td><td id="seleccion_id" value = "" name="seleccion_id"></td></tr>
                    
                </table>
                
                
                
            </div>
        </div>

        <!-- Advanced Tables -->
        <div class="panel panel-primary">
            <div class="panel-heading">
                Tarjetas
            </div>
            <div class="panel-body">
                
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>
                                <th>Identificaci&oacute;n tarjeta</th>
                                <th>Estado</th>
                                <th>Saldo</th>
                                <th>Identificaci&oacute;n estaci&oacute;n</th>
                                <th>Fecha venta</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for(int i = 0; i < tarjetas.size(); i++){
                                    
                                    out.println("<tr class=\"odd gradeX\">");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"id_tarjeta_" + i + "\">" + tarjetas.get(i).getId_tarjeta()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"estado_" + i + "\">" + tarjetas.get(i).getEstado()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"saldo_" + i + "\">" + tarjetas.get(i).getSaldo()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\">" + tarjetas.get(i).getId_estacion_venta()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\">" + tarjetas.get(i).getFecha_venta()+ "</td>");
                                    
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
                         alert("No ha seleccionado una tarjeta");
                     }                        };
        </script>
        <!-- CUSTOM SCRIPTS -->
        <script src="assets/js/custom.js"></script>


    </body>
</html>
