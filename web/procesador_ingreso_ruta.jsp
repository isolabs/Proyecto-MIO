<%@page import="proyectomio.modelo.Ruta"%>
<%@page import="proyectomio.controlador.Controlador_Rutas"%>
<%

    Controlador_Rutas uncontrolador = new Controlador_Rutas();
    Ruta una_ruta = new Ruta();

    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");

    int resultado = uncontrolador.adicionar_ruta(nombre, descripcion);
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
                    <%

                        switch (resultado) {
                            case 0:
                                out.println("La ruta '" + nombre + "' ha sido ingresada con exito");
                                break;
                            case 1:
                                out.println("La ruta '" + nombre + "' ya existe en nuestros registros");
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
        </center>
        <script>
            function goBack() {
            <%if (resultado == 0) {%>
                location.href = "<%out.print("ingresar_ruta.jsp");%> "<%} else {
                     out.print("window.history.back()");
                 }
            %>;


            }
        </script>  
        <br>
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
