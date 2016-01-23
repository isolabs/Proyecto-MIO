/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.consola;
import java.util.ArrayList;
import accesoDatos.DaoRutas;
import accesoDatos.Controlador_BD;
import accesoDatos.DaoBuses;
import accesoDatos.DaoEstaciones;
import proyectomio.modelo.Bus;
import proyectomio.modelo.Consulta;
import proyectomio.modelo.Estacion;
import proyectomio.modelo.Ruta;

/**
 *
 * @author jeisonOS
 */
public class Consola {
    
    public static void main(String [] args)
	{
            
         /*  ConexionBD conector = new ConexionBD("localhost", "ProyectoMIO", "root", "root");
            Controlador_BD controlador = new Controlador_BD();
            Consulta consulta = controlador.consultarBD(conector, "SELECT * FROM tarjeta");
            consulta.imprimirFila(0);*/
            Bus un_bus=new Bus();
            Ruta una_ruta = new Ruta(0,"T31","recorrido universidades hasta chiminangos");       
            un_bus.setId_ruta(7);
            un_bus.setNumero_pasajeros(35);
            un_bus.setPlaca("AS-56");
            un_bus.setTipo("Alimentador");
            DaoBuses controlador_buses = new DaoBuses();
           System.out.println("resultado modificacion bus: "+ controlador_buses.modificar_bus("AS-56", un_bus));
            DaoRutas controlador_rutas = new DaoRutas();
            //System.out.print(controlador_buses.adicionar_bus_bd(un_bus));
           // System.out.println(controlador_buses.eliminar_bus("AS-56"));
            //un_bus.setId_ruta(2);
          // System.out.println(controlador_buses.modificar_bus("AS-56",un_bus));
         
           //  controlador_buses.elimiar_bus("AS-56");
          // System.out.println(controlador_rutas.adicionar_ruta(una_ruta));
           // una_ruta.setDescripcion("va desde universidades a chiminangos");
           // System.out.println( controlador_rutas.modificar_ruta("T31", una_ruta));
         //  System.out.println( controlador_rutas.eliminar_ruta("T31"));
         //  System.out.print(controlador_buses.get_buses_asignados_por_id_conductor("1058847076"));
         for(int i = 0; i<controlador_rutas.get_nombre_rutas().size(); i++)
         {
         System.out.println(controlador_rutas.get_nombre_rutas().get(i));
         }
        

              
            Estacion estacion = new Estacion(0,"Chiminangos","Calle 54 #32 a 120",1058847076);
            DaoEstaciones controlador_estaciones=new DaoEstaciones();
         //  System.out.println(controlador_estaciones.adicionar_estacion(estacion));
         // System.out.println(controlador_estaciones.modificar_ruta("Pampa Linda", estacion));
         //System.out.println(controlador_estaciones.eliminar_ruta("Andres sanin"));
        /* ArrayList<String> nombre_estaciones = controlador_estaciones.get_nombre_estaciones();
         for(int i = 0; i< nombre_estaciones.size();i++)
         {
             System.out.println(nombre_estaciones.get(i));
         }*/
     
       // System.out.println(controlador_buses.cambiar_ruta("AS", 4));
     //  System.out.println(controlador_buses.asignar_bus_conductor(1058847076, "AS-55", 0));
       ArrayList<Bus> buses = controlador_buses.get_buses();
       for(int i =0; i<buses.size();i++)
       {
           System.out.println(buses.get(i).getPlaca()+"-----"+buses.get(i).getNumero_pasajeros()+"----"+buses.get(i).getId_ruta());
       }
       
        }


    
}
