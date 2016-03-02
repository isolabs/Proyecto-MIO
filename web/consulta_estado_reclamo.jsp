
<%@page import="proyectomio.controlador.Controlador_Reclamo"%>
<%@page import="proyectomio.modelo.Reclamo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList <Reclamo> reclamos = new ArrayList<Reclamo>();
    Controlador_Reclamo controlador_reclamo = new Controlador_Reclamo();
    reclamos = controlador_reclamo.obtenerReclamoIdPasajero(-1,Integer.valueOf(request.getParameter("id_pasajero")));
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reclamos interpuestos</title>
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
                
                document.getElementById('seleccion_id').innerHTML =  document.getElementById ( "id_tiquete_" + id ).innerText;
                document.getElementById("seleccion_id").setAttribute("value",document.getElementById ( "id_tiquete_" + id ).innerText);
                document.getElementById('seleccion_motivo').innerHTML = document.getElementById ( "motivo_" + id ).innerText ;
                var editar_completo = "manejador_reclamos.jsp?opcion=1&id_tiquete=";
                var editar_con_id=editar_completo.concat(document.getElementById("seleccion_id").getAttribute("value"));
                document.getElementById("boton_gestion").setAttribute("href",editar_con_id);
            }
            
        </script>
    </head>
    <body>
        
        <div class="panel panel-info">
                        <div class="panel-heading">
                            <b>Selecci&oacute;n</b>
                            
                            <a href="#" onclick="goEdicion();" type="submit" id="boton_gestion" name="boton_gestion" class="btn btn-default btn-xs" style="float: right;margin-right: 5px;">Ver estado</a>
                        </div>
            <div class="panel-body">
                <table>
                    <tr><td align="right"><b>Id Reclamo:&nbsp </b> </td><td id="seleccion_id" value = "" name="seleccion_id"></td></tr>
                    <tr><td align="right"><b>Motivo:&nbsp </b></td><td id="seleccion_motivo" name="seleccion_motivo"></td></tr>
                </table>
                
                
                
            </div>
        </div>

        <!-- Advanced Tables -->
        <div class="panel panel-primary">
            <div class="panel-heading">
                Reclamos
            </div>
            <div class="panel-body">
                
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>
                                <th>Id tiquete</th>
                                <th>Fecha </th>
                                <th>Motivo</th>
                                <th>Estado</th>
                                <th>Pasajero</th>
                                <th>Auxiliar recepcionista</th>
                                <th>Empleado que resuelve</th>
                                <th>Estaci&oacute;n</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for(int i = 0; i < reclamos.size(); i++){
                                    
                                    out.println("<tr class=\"odd gradeX\">");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"id_tiquete_" + i + "\">" + reclamos.get(i).getId_tiquete()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"fecha_" + i + "\">" + reclamos.get(i).getFecha()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" id=\"motivo_" + i + "\">" + reclamos.get(i).getMotivo()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\">" + reclamos.get(i).getEstado()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\">" + reclamos.get(i).getId_pasajero_interpone()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" class=\"center\">" + reclamos.get(i).getId_empleado_anota()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" class=\"center\">" + reclamos.get(i).getId_empleado_resuelve()+ "</td>");
                                    out.println("<td onClick=\"seleccionar(" + i + ");\" class=\"center\">" + reclamos.get(i).getId_estacion_interpone()+ "</td>");
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
                         alert("No ha seleccionado un reclamo de la tabla");
                     }                        };
        </script>
        <!-- CUSTOM SCRIPTS -->
        <script src="assets/js/custom.js"></script>


    </body>
</html>
