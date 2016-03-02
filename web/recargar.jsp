<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="verificadorLogin.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Recargar</title>
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






        <div class="panel panel-primary" >

            <div class ="panel-heading">
                Datos de la tarjeta y valor de la recarga
            </div>
            <div class="panel-body">
                <form action="procesador_recarga.jsp" class="form-group" method="post" >
                    <label for="id_tarjeta">
                        N&uacute;mero de tarjeta:
                    </label>
                    <input type="text" name="id_tarjeta"  pattern="[0-9]{0,}" title="Debe ingresar un n&uacute;mero de tarjeta correcto" id="id_tarjeta" class ="form-control" required="required"></input>

                    <label for="valor_Recargar">
                        Valor a recargar:
                    </label>
                    <input type="text" name="valor_Recargar"  pattern="[0-9]{0,}" title="Debe ingresar un valor valido" id="placa" class ="form-control" required="required"></input>
                    <center>    <input   style="margin-top: 10px"  type="submit" class="btn btn-primary" value="Recargar"></center>
                </form>
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
