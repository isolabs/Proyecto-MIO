
<%@page import="proyectomio.controlador.operaciones.Secuencia"%>
<%@page import="proyectomio.controlador.operaciones.Viajes_encontrados"%>
<%@page import="proyectomio.controlador.operaciones.Controlador_Pasajero_operaciones.*"%>
<%@page import="proyectomio.controlador.operaciones.Controlador_Pasajero_operaciones"%>
<%@page import="java.util.ArrayList"%>
<%@page import="proyectomio.controlador.Controlador_Estaciones"%>
<%@page import="proyectomio.controlador.Controlador_Rutas"%>
<%@page import="java.util.Enumeration"%>
<%

    /*Enumeration<String> x = request.getParameterNames();

    out.println(x.nextElement());
    out.println(x.nextElement());
    out.println(x.nextElement());*/

    String id_estacion_inicial = request.getParameter("id_Estacion_actual");
    String id_estacion_final = request.getParameter("id_Estacion_llegada");
    String id_tarjeta = request.getParameter("id_tarjeta");
    
    int codigo_de_error = 0;
    
    Controlador_Estaciones c_estaciones = new Controlador_Estaciones();
    
    
    Controlador_Pasajero_operaciones c_poperaciones = new Controlador_Pasajero_operaciones();
    

    int tmp_0 =c_estaciones.get_rutas_estacion(Integer.valueOf(id_estacion_inicial)).size();
    int tmp_1 =c_estaciones.get_rutas_estacion(Integer.valueOf(id_estacion_final)).size();
   
    
    
    
    if((tmp_0>0)&&(tmp_1>0)){
        
        ArrayList<String> secuencia_usuario = new ArrayList<String>();
        ArrayList<String> secuencia_formateada = new ArrayList<String>();
        
        
        Viajes_encontrados v_enc = new Viajes_encontrados();
        v_enc =  c_poperaciones.getRutaN(Integer.valueOf(id_estacion_inicial),Integer.valueOf(id_estacion_final));
    
        //viajes = c_poperaciones.getRutaN(Integer.valueOf(id_estacion_inicial), Integer.valueOf(id_estacion_final));
        int cantidad = -1;
            if ( v_enc.getSecuencias().size()>5){
               cantidad = 5;
            }else{
                cantidad =  v_enc.getSecuencias().size();
            }
         for (int i = 0; i < cantidad; i++){
            ArrayList<Secuencia> viajes_rutas = new ArrayList<Secuencia>();
                viajes_rutas =    v_enc.getSecuencias().get(i);
            
            
           for (int j = 0; j < viajes_rutas.size(); j++){
                
                out.println(viajes_rutas.get(j).getId_Estacion() + " - " + viajes_rutas.get(j).getId_ruta() + "\n");
                
            }
           out.println("----------------");
            
        }
        
    }else{
        codigo_de_error = -1;
        out.print(codigo_de_error);
    }
    
    
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
