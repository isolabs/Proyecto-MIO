<%@page import="proyectomio.controlador.Controlador_Estaciones"%>
<%

    Controlador_Estaciones c_estaciones = new Controlador_Estaciones();
    


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


    </head>
    <body>



        <div id="wrapper">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">MIO</a> 
                </div>
                <div style="color: white;
                     padding: 15px 50px 5px 50px;
                     float: right;
                     font-size: 16px;"> Bienvenido &nbsp; </div>
            </nav>   
        </div>
        <!-- /. WRAPPER  -->
        <div class="panel panel-primary" style="margin: auto;width: 50%; margin-top: 10%;">
            <div class ="panel-heading">
                Abordar
            </div>
            <div class="panel-body">
                <form action="selector_de_viaje.jsp" class="form-group" method="post"  >
                    <label>Costo del pasaje: $1800</label><br><br>

                    <label for="id_tarjeta">
                        N&uacute;mero de tarjeta:
                    </label>
                    <input type="text" value="" name="id_tarjeta" pattern="[0-9]{4,}" id="id_tarjeta" class ="form-control" required="required">
                    
                    <label for="id_Estacion_actual">
                        Seleccione la estaci&oacute;n en la que est&aacute; ubicado(a):
                    </label>

                    <select class="form-control" name="id_Estacion_actual" id="id_Estacion_actual" required="required">
                         <%
                                for(int i = 0 ; i < c_estaciones.get_estaciones().size();i++){
                                    out.print("<option value=\"" + c_estaciones.get_estaciones().get(i).getId_estacion() +  "\">" + c_estaciones.get_estaciones().get(i).getNombre() + " - " + c_estaciones.get_estaciones().get(i).getDireccion() + "</option>");
                                }

                        %>
                    </select>
                        
                    <label for="id_Estacion_llegada">
                        Seleccione la estaci&oacute;n de destino:
                    </label>

                    <select class="form-control" name="id_Estacion_llegada" id="id_Estacion_llegada" required="required">
                        
                        <%
                                for(int i = 0 ; i < c_estaciones.get_estaciones().size();i++){
                                    out.print("<option value=\"" + c_estaciones.get_estaciones().get(i).getId_estacion() +  "\">" + c_estaciones.get_estaciones().get(i).getNombre() + " - " + c_estaciones.get_estaciones().get(i).getDireccion() + "</option>");
                                }

                        %>
                        
                       
                    </select>
                        
                        <br></br>
                        <center>
                            <input type="submit" class="btn btn-primary" value="Programar viaje">
                        </center>     

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
