/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.controlador;

import java.util.ArrayList;
import proyectomio.accesoDatos.DaoReclamo;
import proyectomio.modelo.Reclamo;

/**
 *
 * @author jeisonOS
 */
public class Controlador_Reclamo {
    
    private final DaoReclamo DATA_ACCES_OBJECT = new DaoReclamo();

    /**
     * obtenerReclamo() Retorna uno o todos los tiquetes que se encuentren
     * registrados en la base de datos dentro de un {@link ArrayList} de tipo
     * {@link Reclamo}.
     *
     * @param id_tiquete Identificador del {@link Reclamo} a consultar, si es
     * igual a -1 retornará todos los Reclamos registrados en el sistema.
     *
     * @return Retorna un {@link ArrayList} de tipo {@link Reclamo}.
     *
     */
    public ArrayList<Reclamo> obtenerReclamo(int id_tiquete) {
        return DATA_ACCES_OBJECT.obtenerReclamo(id_tiquete);
    }

    public int ingresarReclamo(String fecha,String motivo,
                                String descripcion, int estado,
                                int id_pasajero_interpone,
                                int id_empleado_anota,
                                int id_empleado_resuelve,
                                int id_estacion_interpone) {
                                
        Reclamo reclamo = new Reclamo();
        reclamo.setFecha(fecha);
        reclamo.setMotivo(motivo);
        reclamo.setDescripcion(descripcion);
        reclamo.setEstado(estado);
        reclamo.setId_pasajero_interpone(id_pasajero_interpone);
        reclamo.setId_empleado_anota(id_empleado_anota);
        reclamo.setId_empleado_resuelve(id_empleado_resuelve);
        reclamo.setId_estacion_interpone(id_estacion_interpone);
        return DATA_ACCES_OBJECT.ingresarReclamo(reclamo);
    }

    public int resolverReclamo(int id_tiquete, int id_empleado_resuelve) {
        return DATA_ACCES_OBJECT.resolverReclamo(id_tiquete, id_empleado_resuelve);
    }
    
    public int ingresarMedida(int id_tiquete, String descripcion){
        
        return 0;
    }

}
