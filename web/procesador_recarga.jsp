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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <!-- BOOTSTRAP STYLES-->
        <link href="../assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="../assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
        <link href="../assets/css/custom.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    </head>
    <body>

        <div id="wrapper">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">

                    <a class="navbar-brand" href="index.jsp">Men&uacute;</a> 
                </div>
            </nav>   

            <!-- /. NAV SIDE  -->

            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h2>Recargar</h2> 
                            <div class="<%                            if (resultado == 0) {
                                    out.print("panel panel-primary");
                                } else {
                                    out.print("panel panel-danger");
                                }

                                 %>" >

                                <div class ="panel-heading">
                                    <% if (resultado == 0) {
                                            out.print("Mensaje");
                                        } else {
                                            out.print("Error");
                                        }%>
                                </div><center>
                                    <div class="panel-body">
                                        <%

                                            switch (resultado) {
                                                case 0:
                                                    out.println("Se recarg&oacute; la tarjeta n&uacute;umero: '" + id_tarjeta + "' con $" + valor_Recargar);
                                                    break;
                                                case 1:
                                                    out.println("No existe la tarjeta n&uacute;mero '" + id_tarjeta + "' en nuestros registros");
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
