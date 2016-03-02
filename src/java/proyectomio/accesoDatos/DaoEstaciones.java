/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.accesoDatos;

import java.util.ArrayList;
import proyectomio.modelo.Consulta;
import proyectomio.modelo.Estacion;
import proyectomio.modelo.Ruta;

/**
 *
 * @author root
 */
public class DaoEstaciones {

    private final Controlador_BD CONTROLADOR_BD = new Controlador_BD();

    public Estacion getEstacion(int id_estacion) {
        Estacion estacion = new Estacion();
        String nombre;
        String direccion;
        int id_empleado_a_cargo;
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM estacion where id_estacion = " + id_estacion );
        if (consulta.getColumna("id_estacion").getFilas().isEmpty()) {
            return estacion;
        } else {
          nombre = consulta.getColumna("nombre").getFila(0);
          direccion = consulta.getColumna("direccion").getFila(0);
          id_empleado_a_cargo=Integer.parseInt(consulta.getColumna("id_empleado_a_cargo").getFila(0));
          estacion = new Estacion(id_estacion,nombre,direccion,id_empleado_a_cargo);
          return estacion;
        }
        
    }

    /*
    en caso que la llave primaria sea duplicada retorna 1
    en caso que la llave fornaea a id_empleado_acargo no se cumpla se retorna 2
    en caso que la operacion se termine exitosamente retorna 0
     */
    public int adicionar_estacion(Estacion una_estacion) {
        Consulta consulta = CONTROLADOR_BD.consultarBD("INSERT INTO estacion (nombre, direccion, id_empleado_a_cargo) VALUES ('"
                + una_estacion.getNombre() + "','"
                + una_estacion.getDireccion() + "',"
                + una_estacion.getId_empleado_a_cargo() + ");");

        int codigo_error = consulta.getColumna("Error").getCodigo_tipo_de_dato();
        switch (codigo_error) {
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

    /* en caso que la ruta no exista se retornara 1
    si se piensa hacer una modificaicon a nombre de estacion tal que el nuevo nombre sea igual a uno ya existente y viole el constrain unique de este campo se retornara 2
    en caso que la consulta se halla ejecutado bien se retornara 0*/
    public int modificar_estacion(int id_estacion_modificar, Estacion nueva_estacion) {
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT *  FROM estacion WHERE estacion.id_estacion=" + id_estacion_modificar + ";");
        if ("-1".equals(consulta.getColumna("nombre").getFila(0))) {
            return 1;
        }

        consulta = CONTROLADOR_BD.consultarBD("UPDATE estacion SET "
                + "nombre='" + nueva_estacion.getNombre()
                + "', direccion='" + nueva_estacion.getDireccion()
                + "', id_empleado_a_cargo = " + nueva_estacion.getId_empleado_a_cargo()
                + " where id_estacion=" + id_estacion_modificar + ";");
        System.out.println(consulta.getColumna("Error").getCodigo_tipo_de_dato());
        if (consulta.getColumna("Error").getCodigo_tipo_de_dato() == 1062) {
            return 2;
        }
        return 0;

    }

    /*
    en caso que la ruta a eliminar no exista, se retornara 1, 
    si la operacion se realizo con exito se retorna 0
     */
    public int eliminar_estacion(String nombre_estacion_eliminar) {

        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT *  FROM estacion WHERE estacion.nombre='" + nombre_estacion_eliminar + "';");
        if ("-1".equals(consulta.getColumna("nombre").getFila(0))) {
            return 1;
        }

        CONTROLADOR_BD.consultarBD("DELETE FROM estacion WHERE nombre='" + nombre_estacion_eliminar + "';");
        return 0;
    }

    public ArrayList<String> get_nombre_estaciones() {
        ArrayList<String> lista_rutas = new ArrayList<>();
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT *  FROM estacion;");
        if ("-1".equals(consulta.getColumna("nombre").getFila(0))) {
            return lista_rutas;
        } else {
            lista_rutas = consulta.getColumna("nombre").getFilas();
            return lista_rutas;
        }

    }

    /*
    esta consulta por su naturaleza no presentara errores, los dos unicos casos posibles es que retorne algo
    o no lo haga (por que no hallan estaciones registradas en la bd, por lo tanto en caso de que no halla se sabra 
    por el echo de que el array estara vacio.
     */
    public ArrayList<Estacion> get_estaciones() {
        ArrayList<Estacion> estaciones_encontradas = new ArrayList<>();
        Estacion estacion_temporal = new Estacion();
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM estacion");
        for (int i = 0; i < consulta.getColumna("id_estacion").getFilas().size(); i++) {
            estacion_temporal.setId_estacion(Integer.valueOf(consulta.getColumna("id_estacion").getFila(i)));
            estacion_temporal.setNombre(consulta.getColumna("nombre").getFila(i));
            estacion_temporal.setDireccion(consulta.getColumna("direccion").getFila(i));
            estacion_temporal.setId_empleado_a_cargo(Integer.valueOf(consulta.getColumna("id_empleado_a_cargo").getFila(i)));
            estaciones_encontradas.add(estacion_temporal);
            estacion_temporal = new Estacion();
        }
        return estaciones_encontradas;
    }
    
     public ArrayList<Ruta> get_rutas_estacion(int id_estacion) {
        ArrayList<Ruta> rutas_encontradas = new ArrayList<>();
       
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM ruta_estacion WHERE id_estacion = " + id_estacion);
        for (int i = 0; i < consulta.getColumnas().get(0).getFilas().size(); i++) {
            Ruta ruta = new Ruta();
            ruta.setId_ruta(Integer.valueOf(consulta.getColumna("id_ruta").getFila(i)));
            ruta.setId_estacion_asociada(Integer.valueOf(consulta.getColumna("id_estacion").getFila(i)));
            rutas_encontradas.add(ruta);
        }
        return rutas_encontradas;
    }

}
