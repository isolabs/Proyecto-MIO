/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package accesoDatos;

import java.util.ArrayList;
import proyectomio.modelo.Consulta;
import proyectomio.modelo.Reclamo;

/**
 *
 * @author jeisonOS
 */
public class DaoReclamo {
    
    private final Controlador_BD CONTROLADOR_BD = new Controlador_BD();
    
    /**
     * obtenerReclamo() Retorna uno o todos los tiquetes que se
     * encuentren registrados en la base de datos dentro de un
     * {@link ArrayList} de tipo {@link Reclamo}.
     * 
     * @param id_tiquete Identificador del {@link Reclamo} a consultar,
     * si es igual a -1 retornará todos los Reclamos registrados
     * en el sistema.
     * 
     * @return Retorna un {@link ArrayList} de tipo {@link Reclamo}.
     **/
    public ArrayList <Reclamo> obtenerReclamo(int id_tiquete){
        ArrayList <Reclamo> reclamos = new ArrayList <>();
        if (id_tiquete == -1){
            Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM reclamo");
            int cantidad_filas = consulta.getColumnas().get(0).getFilas().size();
        }else{
            //return CONTROLADOR_BD.consultarBD("SELECT * FROM reclamo WHERE id_reclamo = '" + id_tiquete + "'");
        }
        return reclamos;
    }
    
    private Consulta ingresarReclamo(Reclamo reclamo){
        
        return new Consulta();
    }
    private Consulta eliminarReclamo(Reclamo reclamo){
    
        return new Consulta();
    }
    private Consulta actualizarReclamo(Reclamo reclamo){
                                                                                    
        return new Consulta();
    }
    
    
    
    
    
}
