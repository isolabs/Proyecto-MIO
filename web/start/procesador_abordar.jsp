
<%@page import="proyectomio.controlador.Controlador_Tarjeta"%>
<%@page import="proyectomio.controlador.Controlador_Pasajero"%>
<%

    String id_tarjeta = request.getParameter("id_tarjeta");

    Controlador_Tarjeta c_tarjeta = new Controlador_Tarjeta();
    Controlador_Pasajero c_pasajero = new Controlador_Pasajero();

    int resultado = -1; // -1 = no existe; 0 - descontado; 1 - No se puede escontar

    if (c_pasajero.get_pasajerosTarjeta(Integer.valueOf(id_tarjeta)).size() == 1) {

         
         
         resultado = c_tarjeta.tres_pasajes_adicionales(Integer.valueOf(id_tarjeta));
        if (resultado == 0){
            resultado = 0;
        }else{
            resultado = 1;
        }
        

    } else if (c_tarjeta.get_una_tarjeta(Integer.valueOf(id_tarjeta)).size() == 1) {

        resultado = c_tarjeta.descontar_pasaje_tarjeta(Integer.valueOf(id_tarjeta));
        if (resultado == 7){
            resultado = 0;
        }else{
            resultado = 1;
        }
        
    } 

    out.print(resultado);
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title></title>
        <!-- BOOTSTRAP STYLES-->
        <link href="../assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="../assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
        <link href="../assets/css/custom.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <script>
            function goBack() {
            
                location.href = "abordar.jsp";

            }
        </script>

    </head>
    <body>



        <div id="wrapper">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.html">MIO</a> 
                </div>
                <div style="color: white;
                     padding: 15px 50px 5px 50px;
                     float: right;
                     font-size: 16px;"> </div>
            </nav>   
        </div>
        <!-- /. WRAPPER  -->
        <div class="<%
            if (resultado == 0) {
                out.print("panel panel-primary");
            } else {
                out.print("panel panel-danger");
            }

             %>" style="margin: auto;width: 50%; margin-top: 10%;">
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
                                out.println("Se descont&oacute; un pasaje<br>");
                                out.println("Nuevo saldo: <b>$" + c_tarjeta.get_una_tarjeta(Integer.valueOf(id_tarjeta)).get(0).getSaldo() + "</b>");
                                break;
                            case 1:
                                out.println("Saldo insuficiente: <b>$" + c_tarjeta.get_una_tarjeta(Integer.valueOf(id_tarjeta)).get(0).getSaldo() + "</b>");
                                break;
                            default:
                                out.println("Se ha generado un error inesperado en el programa");
                        }


                    %>

                    <br></br>
                    <button class="<%  if (resultado == 0) {
                            out.print("btn btn-primary");
                        } else {
                            out.print("btn btn-danger");
                    }%>" onclick="goBack();">Volver</button> </center>
            </div>
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
