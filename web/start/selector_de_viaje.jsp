
<%

    String id_estacion_inicial = request.getParameter("id_Estacion_actual");
    String id_estacion_final = request.getParameter("id_Estacion_llegada");
    out.print(id_estacion_inicial + " " + id_estacion_final);

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
                <form action="procesador_abordar.jsp" class="form-group" method="post"  >
                    <label>Costo del pasaje: $1800</label><br><br>

                        
                    <label for="seleccion_viaje">
                        Seleccione la opci&oacute;n de viaje:
                    </label>

                    <select class="form-control" name="seleccion_viaje" id="seleccion_viaje" required="required">
                        
                        <%
                                
                                    out.print("<option value=\"\"> </option>");
                               

                        %>
                        
                        
                    </select>
                        
                        <br></br>
                        <center>
                            <input type="submit" class="btn btn-primary" value="Abordar">
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
