<%-- 
    Document   : procesador_recarga
    Created on : Feb 26, 2016, 10:54:05 PM
    Author     : jeisonOS
--%>

<%@page import="proyectomio.controlador.Controlador_Tarjeta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Controlador_Tarjeta controlador_tarjeta = new Controlador_Tarjeta();

    String id_tarjeta = request.getParameter("id_tarjeta");
    String valor_Recargar = request.getParameter("valor_Recargar");

    int resultado = controlador_tarjeta.recargar_tarjeta(Integer.valueOf(id_tarjeta), Integer.valueOf(valor_Recargar));

%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Procesador de ingreso de buses</title>
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

       <div class="<%
            if (resultado == 0) {
                out.print("panel panel-primary");
            } else {
                out.print("panel panel-danger");
            }

             %>">
            <div class ="panel-heading">
                <% if (resultado == 0) {
                        out.print("Mensaje");
                    } else {
                        out.print("Error");
                }%>
            </div>
            <div class="panel-body">
                <center>
                                    <div class="panel-body">
                                        <%

                                            switch (resultado) {
                                                case 0:
                                                    out.println("Se recarg&oacute; la tarjeta n&uacute;mero: <b>" + id_tarjeta + "</b> con <b>$" + valor_Recargar + "</b><br>");
                                                    out.println("Nuevo saldo: <b>$" + controlador_tarjeta.get_una_tarjeta(Integer.valueOf(id_tarjeta)).get(0).getSaldo() + "</b>");
                                                    break;
                                                case 1:
                                                    out.println("No existe la tarjeta n&uacute;mero: <b>" + id_tarjeta + "</b> en nuestros registros");
                                                    break;
                                                default:
                                                    out.println("Se ha generado un error inesperado en el programa");
                                            }


                                        %>
                                        <br></br>
                                        <button class="<%            if (resultado == 0) {
                                                out.print("btn btn-primary");
                                            } else {
                                                out.print("btn btn-danger");
                                            }%>" onclick="goBack()">Volver</button> </center>
                           

                        </div>
                    </div>
                </div>
                <!-- /. ROW  -->
                <hr />

            </div>
            <!-- /. PAGE INNER  -->

            <!-- /. PAGE WRAPPER  -->
        </div>
        <script>
            function goBack() {
            <%if (resultado == 0) {%>
                location.href = "<%out.print("recargar.jsp");%> "<%} else {
                        out.print("window.history.back()");
                    }
            %>;


            }
        </script>  
        <br>
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
