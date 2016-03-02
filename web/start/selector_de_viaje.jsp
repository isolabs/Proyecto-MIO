
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
   
    ArrayList<String> secuencia_usuario = new ArrayList<String>();
    ArrayList<String> secuencia_formateada = new ArrayList<String>();
    
    if (id_estacion_final.equals(id_estacion_inicial)){
    
        codigo_de_error = -2;
    
    }else{
    
    if((tmp_0>0)&&(tmp_1>0)){
        
        
        
        Controlador_Estaciones c_estacion = new Controlador_Estaciones();
        Controlador_Rutas c_ruta = new Controlador_Rutas();
        
        
        Viajes_encontrados v_enc = new Viajes_encontrados();
        v_enc =  c_poperaciones.getRutaN(Integer.valueOf(id_estacion_inicial),Integer.valueOf(id_estacion_final));
    
        //viajes = c_poperaciones.getRutaN(Integer.valueOf(id_estacion_inicial), Integer.valueOf(id_estacion_final));
        int cantidad = -1;
            if ( v_enc.getSecuencias().size()>5){
               cantidad = 5;
            }else{
                cantidad =  v_enc.getSecuencias().size();
            }
         String una_secuencia_usuario = "";
         String una_secuencia_formateada = "";
         for (int i = 0; i < cantidad; i++){
            ArrayList<Secuencia> viajes_rutas = new ArrayList<Secuencia>();
                viajes_rutas =    v_enc.getSecuencias().get(i);
               
            
            
           for (int j = 0; j < viajes_rutas.size(); j++){
                
                String tmp_string_0 = c_estacion.getEstacion(Integer.valueOf(viajes_rutas.get(j).getId_Estacion())).getNombre();
                String tmp_ruta_0 = c_ruta.getRuta(Integer.valueOf(viajes_rutas.get(j).getId_ruta())).getNombre();
                
                
                
                if (j == (viajes_rutas.size()-1)){
                
                    una_secuencia_formateada = una_secuencia_formateada + viajes_rutas.get(j).getId_Estacion() + "&[END]";
                    una_secuencia_usuario = una_secuencia_usuario  + tmp_string_0;

                }else{
                    una_secuencia_usuario = una_secuencia_usuario  + tmp_string_0 + ": (" + c_ruta.getRuta(Integer.valueOf(viajes_rutas.get(j+1).getId_ruta())).getNombre() + ")  =>  ";
                    una_secuencia_formateada = una_secuencia_formateada + viajes_rutas.get(j).getId_Estacion() + "," + viajes_rutas.get(j+1).getId_ruta() + "&";

                
                }
                
            }
           
            secuencia_formateada.add(una_secuencia_formateada);
            secuencia_usuario.add(una_secuencia_usuario);
            //out.print(una_secuencia_usuario + "<br>" + una_secuencia_formateada + "<br><br>");
            una_secuencia_usuario = "";
            una_secuencia_formateada = "";
        }
        
    }else{
        codigo_de_error = -1;
        //out.print(codigo_de_error);
    }
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
        <div class="<%
            if (codigo_de_error == 0) {
                out.print("panel panel-primary");
            } else {
                out.print("panel panel-danger");
            }

             %>" style="margin: auto;width: 50%; margin-top: 10%;">
            <div class ="panel-heading">
                <%
            if (codigo_de_error == 0) {
                out.print("Mensaje");
            } else {
                out.print("Error");
            }

             %>
            </div>
            <div class="panel-body">
                <form <%if (codigo_de_error == 0) {
                                                out.print("action=\"procesador_abordar.jsp\"");
                                            }%>  class="form-group" <%if (codigo_de_error == 0) {
                                                out.print("method=\"post\"");
                                            }%>   >
                    
                    
                    <%
            if (codigo_de_error == 0) {%>
                
                  <label>Costo del pasaje: $1800</label><br><br>
                    
                    <label for="id_tarjeta">
                        N&uacute;mero de tarjeta:
                    </label>
                            <input type="text" value="<% out.print(id_tarjeta); %>" name="id_tarjeta" pattern="[0-9]{4,}" id="id_tarjeta" class ="form-control" required="required">
                        
                    <label for="seleccion_viaje">
                        Seleccione la opci&oacute;n de viaje:
                    </label>

                    <select class="form-control" name="seleccion_viaje" id="seleccion_viaje" required="required">
                        
                        <%
                                for (int i = 0; i < secuencia_usuario.size(); i++){
                                    out.print("<option value=\"" + secuencia_formateada.get(i) + "\"> " + secuencia_usuario.get(i) + " </option><br>");
                                }

                        %>
                        
                    </select><%
                
            } else if (codigo_de_error == -1) {
                        out.print("<center>No se encontraron rutas.</center>");
                } else 
            {
                out.print("<center>Ha seleccionado la estaci&oacute;n de partida igual a la de llegada.</center>");
            }

             %>
                    
                    
                    
                    
                    
                        
                        <br></br>
                        <center>
                            <input type="submit" class="<%if (codigo_de_error == 0) {
                                                out.print("btn btn-primary");
                                            } else {
                                                out.print("btn btn-danger");
                            }%>" onclick="<%if (codigo_de_error == 0) {} else {out.print("goBack();");
                                                
                                            }%>" value="<%if (codigo_de_error == 0) {
                                                out.print("Abordar");
                                            } else {
                                                out.print("Atras");
                                            }%>">
                        </center>     

                </form>
            </div>
        </div>

        <script>
            function goBack() {
                location.href = window.history.back();
            }
        </script>                

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
