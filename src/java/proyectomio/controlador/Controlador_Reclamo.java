/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.controlador;

import java.util.ArrayList;
import proyectomio.accesoDatos.DaoReclamo;
import proyectomio.modelo.Reclamo;
import proyectomio.modelo.Reclamo_medida;

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
 public ArrayList<Reclamo> obtenerReclamoIdPasajero(int id_tiquete, int id_pasajero) {
        return DATA_ACCES_OBJECT.obtenerReclamoIdPasajero(id_tiquete,id_pasajero);
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

    public int cambiar_estado(int nuevo_estado, int id_tiquete, int id_empleado_resuelve, String fecha) {
        return DATA_ACCES_OBJECT.cambiar_estado(nuevo_estado, id_tiquete, id_empleado_resuelve, fecha);
    }
    
     public int ingresarMedida(int id_tiquete, String descripcion, String hora_fecha_registro)
     {    
        return DATA_ACCES_OBJECT.ingresarMedida(id_tiquete, descripcion, hora_fecha_registro);
    }
     
    public ArrayList<Reclamo_medida> obtenerMedida(int id_reclamo, String hora_fecha_registro) {
        return DATA_ACCES_OBJECT.obtenerMedida(id_reclamo, hora_fecha_registro);
    }
     public int resolverMedida(int id_reclamo, String hora_fecha_registro, int nuevo_estado){
     return DATA_ACCES_OBJECT.resolverMedida(id_reclamo, hora_fecha_registro, nuevo_estado);
     }
}
