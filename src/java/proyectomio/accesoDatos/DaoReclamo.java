/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.accesoDatos;

import java.util.ArrayList;
import proyectomio.controlador.Controlador_Empleado;
import proyectomio.modelo.Consulta;
import proyectomio.modelo.Reclamo;

/**
 *
 * @author jeisonOS
 */
public class DaoReclamo {
    
    private final Controlador_BD CONTROLADOR_BD = new Controlador_BD();
    
    public ArrayList<Reclamo> obtenerReclamo(int id_tiquete) {
        ArrayList<Reclamo> reclamos = new ArrayList<>();
        if (id_tiquete == -1) {
            Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM reclamo");
            int cantidad_filas = consulta.getColumnas().get(0).getFilas().size();
            for (int i = 0; i < cantidad_filas; i++) {
                Reclamo tmp = new Reclamo();
                tmp.setId_tiquete(Integer.valueOf(consulta.getColumna("id_tiquete").getFila(i)));
                tmp.setDescripcion(consulta.getColumna("descripcion").getFila(i));
                tmp.setEstado(Integer.valueOf(consulta.getColumna("estado").getFila(i)));
                tmp.setFecha(consulta.getColumna("fecha").getFila(i));
                tmp.setId_empleado_anota(Integer.valueOf(consulta.getColumna("id_empleado_anota").getFila(i)));
                tmp.setId_pasajero_interpone(Integer.valueOf(consulta.getColumna("id_pasajero_interpone").getFila(i)));
                tmp.setId_empleado_resuelve(Integer.valueOf(consulta.getColumna("id_empleado_resuelve").getFila(i)));
                tmp.setMotivo(consulta.getColumna("id_motivo").getFila(i));
                reclamos.add(tmp);
            }
        } else {
            Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM reclamo WHERE id_tiquete = '" + id_tiquete + "'");
            int cantidad_filas = consulta.getColumnas().get(0).getFilas().size();
            for (int i = 0; i < cantidad_filas; i++) {
                Reclamo tmp = new Reclamo();
                tmp.setId_tiquete(Integer.valueOf(consulta.getColumna("id_tiquete").getFila(i)));
                tmp.setDescripcion(consulta.getColumna("descripcion").getFila(i));
                tmp.setEstado(Integer.valueOf(consulta.getColumna("estado").getFila(i)));
                tmp.setFecha(consulta.getColumna("fecha").getFila(i));
                tmp.setId_empleado_anota(Integer.valueOf(consulta.getColumna("id_empleado_anota").getFila(i)));
                tmp.setId_pasajero_interpone(Integer.valueOf(consulta.getColumna("id_pasajero_interpone").getFila(i)));
                try {
                    tmp.setId_empleado_resuelve(Integer.valueOf(consulta.getColumna("id_empleado_resuelve").getFila(i)));
                }catch(Exception ex){
                    tmp.setId_empleado_resuelve(-1);
                }
                
                tmp.setMotivo(consulta.getColumna("id_motivo").getFila(i));
                reclamos.add(tmp);
            }
            //return CONTROLADOR_BD.consultarBD("SELECT * FROM reclamo WHERE id_reclamo = '" + id_tiquete + "'");
        }
        return reclamos;
    }
    
    public int ingresarReclamo(Reclamo reclamo) {
        Consulta consulta = CONTROLADOR_BD.consultarBD("INSERT INTO reclamo "
                + "(id_tiquete,fecha,motivo,descripcion,estado,"
                + "id_pasajero_interpone,id_empleado_anota)"
                + " VALUES ('"+ reclamo.getId_tiquete() +"',"
                + "'"+ reclamo.getFecha()+"',"
                + "'"+ reclamo.getMotivo()+"',"
                + "'"+ reclamo.getDescripcion()+"',"
                + "'"+ 0 +"',"
                + "'"+ reclamo.getId_pasajero_interpone()+"',"
                + "'"+ reclamo.getId_empleado_anota()+"')");
        
        switch (consulta.getColumna("Error").getCodigo_tipo_de_dato()) {
            case -1:
                return 0;
            case 1062:
                return 1;
            case 1452:
                return 2;
            default:
                return -1;
        }
    }

    public int resolverReclamo(int id_tiquete, int id_empleado_resuelve) {
        
        if (obtenerReclamo(id_tiquete).isEmpty()){
        
            return -1;
        }  
        Controlador_Empleado controlador_empleado = new Controlador_Empleado();
        if (controlador_empleado.get_empleados(id_empleado_resuelve).isEmpty()){
        
            return -2;
        } 
        
        Consulta consulta = CONTROLADOR_BD.consultarBD("UPDATE reclamo SET estado = 1,id_empleado_resuelve = '"+id_empleado_resuelve+"'  WHERE id_tiquete = '" + id_tiquete + " '");
        switch (consulta.getColumna("Error").getCodigo_tipo_de_dato()) {
            case -1:
                return 0;
            case 1062:
                return 1;
            case 1452:
                return 2;
            default:
                return -1;
        }
    }
    
}
