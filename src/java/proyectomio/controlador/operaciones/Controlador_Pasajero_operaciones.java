/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.controlador.operaciones;

import java.util.ArrayList;
import proyectomio.controlador.Controlador_Estaciones;
import proyectomio.controlador.Controlador_Rutas;
import proyectomio.modelo.Ruta;

/**
 *
 * @author jeisonOS
 */
public class Controlador_Pasajero_operaciones {
    
    public void getRuta(int id_estacion_inicial,int id_estacion_final){
        
        Controlador_Rutas controlador_rutas = new Controlador_Rutas();
        Controlador_Estaciones controlador_estaciones = new Controlador_Estaciones();
        ArrayList <Ruta> rutas = new ArrayList<>();
        for (int i = 0; i < controlador_rutas.get_rutas().size(); i++) {
            
           
        }
        rutas = controlador_rutas.get_rutas();
        
    }
    
}
