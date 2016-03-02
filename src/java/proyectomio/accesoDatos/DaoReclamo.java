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
import proyectomio.modelo.Reclamo_medida;

/**
 *
 * @author jeisonOS
 */
public class DaoReclamo {
    
    private final Controlador_BD CONTROLADOR_BD = new Controlador_BD();
    public ArrayList<Reclamo> obtenerReclamoIdPasajero(int id_tiquete, int id_pasajero) {
        ArrayList<Reclamo> reclamos = new ArrayList<>();
        int id_empleado_resuelve=0;
        if (id_tiquete == -1) {
            Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM reclamo where id_pasajero_interpone="+id_pasajero);
            int cantidad_filas = consulta.getColumnas().get(0).getFilas().size();
            for (int i = 0; i < cantidad_filas; i++) {
                Reclamo tmp = new Reclamo();
                 try{
                    id_empleado_resuelve=Integer.valueOf(consulta.getColumna("id_empleado_resuelve").getFila(i));
                 }
                 catch(NumberFormatException exc)
                 {
                     id_empleado_resuelve = 0;
                 }
                tmp.setId_tiquete(Integer.valueOf(consulta.getColumna("id_tiquete").getFila(i)));
                tmp.setDescripcion(consulta.getColumna("descripcion").getFila(i));
                tmp.setEstado(Integer.valueOf(consulta.getColumna("estado").getFila(i)));
                tmp.setFecha(consulta.getColumna("fecha").getFila(i));
                tmp.setId_empleado_anota(Integer.valueOf(consulta.getColumna("id_empleado_anota").getFila(i)));
                tmp.setId_pasajero_interpone(Integer.valueOf(consulta.getColumna("id_pasajero_interpone").getFila(i)));
                tmp.setId_empleado_resuelve(id_empleado_resuelve);
                tmp.setMotivo(consulta.getColumna("motivo").getFila(i));
                tmp.setId_estacion_interpone(Integer.valueOf(consulta.getColumna("id_estacion_interpone").getFila(i)));
                reclamos.add(tmp);
            }
        } else {
            Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM reclamo WHERE id_tiquete = '" + id_tiquete + "' AND id_pasajero_interpone="+id_pasajero);
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
                
                tmp.setMotivo(consulta.getColumna("motivo").getFila(i));
                tmp.setId_estacion_interpone(Integer.valueOf(consulta.getColumna("id_estacion_interpone").getFila(i)));
                reclamos.add(tmp);
            }
            //return CONTROLADOR_BD.consultarBD("SELECT * FROM reclamo WHERE id_reclamo = '" + id_tiquete + "'");
        }
        return reclamos;
    }
    public ArrayList<Reclamo> obtenerReclamo(int id_tiquete) {
        ArrayList<Reclamo> reclamos = new ArrayList<>();
        int id_empleado_resuelve=0;
        if (id_tiquete == -1) {
            Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM reclamo");
            int cantidad_filas = consulta.getColumnas().get(0).getFilas().size();
            for (int i = 0; i < cantidad_filas; i++) {
                Reclamo tmp = new Reclamo();
                 try{
                    id_empleado_resuelve=Integer.valueOf(consulta.getColumna("id_empleado_resuelve").getFila(i));
                 }
                 catch(NumberFormatException exc)
                 {
                     id_empleado_resuelve = 0;
                 }
                tmp.setId_tiquete(Integer.valueOf(consulta.getColumna("id_tiquete").getFila(i)));
                tmp.setDescripcion(consulta.getColumna("descripcion").getFila(i));
                tmp.setEstado(Integer.valueOf(consulta.getColumna("estado").getFila(i)));
                tmp.setFecha(consulta.getColumna("fecha").getFila(i));
                tmp.setId_empleado_anota(Integer.valueOf(consulta.getColumna("id_empleado_anota").getFila(i)));
                tmp.setId_pasajero_interpone(Integer.valueOf(consulta.getColumna("id_pasajero_interpone").getFila(i)));
                tmp.setId_empleado_resuelve(id_empleado_resuelve);
                tmp.setMotivo(consulta.getColumna("motivo").getFila(i));
                tmp.setId_estacion_interpone(Integer.valueOf(consulta.getColumna("id_estacion_interpone").getFila(i)));
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
                
                tmp.setMotivo(consulta.getColumna("motivo").getFila(i));
                tmp.setId_estacion_interpone(Integer.valueOf(consulta.getColumna("id_estacion_interpone").getFila(i)));
                reclamos.add(tmp);
            }
            //return CONTROLADOR_BD.consultarBD("SELECT * FROM reclamo WHERE id_reclamo = '" + id_tiquete + "'");
        }
        return reclamos;
    }
    /*  en caso que se ingrese correctamente se retornara 0
        en caso que la llave primaria se duplique se retornara 1,
        en caso que el id de el usuario que la interpone no exista se retorna 2, no puede suceder que 
        el id del empleado que la interpone no exista, ya que para hacer esta operacion se debe 
       ser un empleado y estar logueado, por lo tanto se garantiza que no se violara la llave foranea a empleado
       que interpone 
        cualquier otro error sera retornado un -1.
    
     */
    public int ingresarReclamo(Reclamo reclamo) {
        Consulta consulta = CONTROLADOR_BD.consultarBD("INSERT INTO reclamo "
                + "(fecha,motivo,descripcion,estado,"
                + "id_pasajero_interpone,id_empleado_anota, id_estacion_interpone)"
                + " VALUES ('"+ reclamo.getFecha()+"',"
                + "'"+ reclamo.getMotivo()+"',"
                + "'"+ reclamo.getDescripcion()+"',"
                + "'"+ 0 +"',"
                + "'"+ reclamo.getId_pasajero_interpone()+"','"
                + reclamo.getId_empleado_anota()+"',"
                + "'"+ reclamo.getId_estacion_interpone()+"')");
        
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

    public ArrayList<Reclamo_medida> obtenerMedida(int id_reclamo, String hora_fecha_registro) {
        ArrayList<Reclamo_medida> medidas = new ArrayList<>();
        if (hora_fecha_registro.equals("")) {
            Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM medida_reclamo "
                    + "WHERE id_reclamo = '" + id_reclamo + "'");
            int cantidad_filas = consulta.getColumnas().get(0).getFilas().size();
            for (int i = 0; i < cantidad_filas; i++) {
                Reclamo_medida tmp = new Reclamo_medida();
                tmp.setId_reclamo(Integer.valueOf(consulta.getColumna("id_reclamo").getFila(i)));
                tmp.setDescripcion(consulta.getColumna("descripcion").getFila(i));
                tmp.setEstado(Integer.valueOf(consulta.getColumna("estado").getFila(i)));
                tmp.setFecha_hora(consulta.getColumna("hora_fecha_registro").getFila(i));
                medidas.add(tmp);
            }

        }else{
        
            Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM medida_reclamo "
                    + "WHERE id_reclamo = '" + id_reclamo + "' AND hora_fecha_registro = '"
                    + hora_fecha_registro + "'");
            int cantidad_filas = consulta.getColumnas().get(0).getFilas().size();
            for (int i = 0; i < cantidad_filas; i++) {
                Reclamo_medida tmp = new Reclamo_medida();
                tmp.setId_reclamo(Integer.valueOf(consulta.getColumna("id_reclamo").getFila(i)));
                tmp.setDescripcion(consulta.getColumna("descripcion").getFila(i));
                tmp.setEstado(Integer.valueOf(consulta.getColumna("estado").getFila(i)));
                tmp.setFecha_hora(consulta.getColumna("hora_fecha_registro").getFila(i));
                medidas.add(tmp);
            }
            
        }

        return medidas;
    }

    public int ingresarMedida(int id_tiquete, String descripcion,String hora_fecha_registro){
        Consulta consulta = CONTROLADOR_BD.consultarBD("INSERT INTO medida_reclamo"
                + "(id_reclamo,descripcion,estado, hora_fecha_registro) "
                + "VALUES( '" + id_tiquete + "','" + descripcion + "',0,'"+hora_fecha_registro+"' )");
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
    
    public int resolverMedida(int id_reclamo, String hora_fecha_registro, int nuevo_estado){
        Consulta consulta = CONTROLADOR_BD.consultarBD("UPDATE medida_reclamo "
                + "SET estado = "+nuevo_estado+" WHERE id_reclamo = '" + id_reclamo + "' AND "
                + "hora_fecha_registro = '" + hora_fecha_registro + "'");
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

    public int cambiar_estado(int nuevo_estado, int id_tiquete, int id_empleado_resuelve, String fecha) {
        
        if (obtenerReclamo(id_tiquete).isEmpty()){
        
            return -1;
        }  
        Controlador_Empleado controlador_empleado = new Controlador_Empleado();
        if (controlador_empleado.get_empleados(id_empleado_resuelve).isEmpty()){
        
            return -2;
        } 
        if(nuevo_estado==2)
        {
        Consulta consulta = CONTROLADOR_BD.consultarBD("UPDATE reclamo SET estado = " + nuevo_estado + ",id_empleado_resuelve = '"+id_empleado_resuelve+"',fecha = '"+ fecha+"'  WHERE id_tiquete = '" + id_tiquete + " '");
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
        if(nuevo_estado==0 || nuevo_estado==1)
        {
          Consulta consulta = CONTROLADOR_BD.consultarBD("UPDATE reclamo SET estado = " + nuevo_estado +",fecha = '"+ fecha+"'  WHERE id_tiquete = '" + id_tiquete + " '");
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
        else{
            return -1;
        }
    }
    
}
