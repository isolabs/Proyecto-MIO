/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.consola;

//import proyectomio.controlador.Controlador_BD;
import java.util.ArrayList;
import proyectomio.accesoDatos.Controlador_BD;
import proyectomio.accesoDatos.DaoBuses;
import proyectomio.controlador.*;
import proyectomio.controlador.operaciones.Controlador_Pasajero_operaciones;
import proyectomio.controlador.operaciones.Controlador_login;
import proyectomio.controlador.operaciones.Controlador_Director;
import proyectomio.modelo.Consulta;
import proyectomio.modelo.Reclamo;
//import proyectomio.controlador.Controlador_Reclamo;
//import proyectomio.modelo.Reclamo;

/**
 *
 * @author jeisonOS
 */
public class ensayos_lenon {
    
    public static void main(String [] args)
	{
        Controlador_BD CONTROLADOR_BD=new Controlador_BD();
     Controlador_Empleado controladr_e = new Controlador_Empleado();
        Consulta  consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM bus_empleado inner join bus on bus_empleado.placa_bus = bus.placa inner join ruta on ruta.id_ruta = bus.id_ruta");
    for(int i =0; i< consulta.getColumna("turno").getFilas().size();i++)
    {
        System.out.println(consulta.getColumna("descripcion").getFila(i) );
    }
  //        System.out.println(controlador.modificar_estacion(1, "Universidades", "Carrera 54 calle 100", 1058847076));
          
           
            
            
            /*Controlador_BD controlador = new Controlador_BD();
            Consulta consulta = controlador.consultarBD("INSERT INTO bus VALUES ('B-03','1','1')");
            System.out.println(consulta.getColumna("Error").getTipo_de_dato());
            System.out.println(consulta.getColumna("Error").getCodigo_tipo_de_dato());*/
            // Controlador_Reclamo cr = new Controlador_Reclamo();
            //Reclamo rc = new Reclamo(106, "2016-01-16", "MotivoX", "DesX", 0, 1143, 1058847076, -1);
            // System.out.println(cr.resolverReclamo(105, 1058847076));
            //System.out.println(cr.obtenerReclamo(-1).get(1).getId_tiquete());
            /*
            Controlador_login c_l = new Controlador_login();
            System.out.println(c_l.login("jeison@correp.com", "123456"));
            Controlador_Estaciones controlador_estaciones = new Controlador_Estaciones();
            System.out.println(controlador_estaciones.getEstacion(1).getId_estacion());
            Controlador_Rutas controlador_Rutas=new Controlador_Rutas();
            System.out.println(controlador_Rutas.getRuta(2).getDescripcion());*/
            
        }

    
}


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

