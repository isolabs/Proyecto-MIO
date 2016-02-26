/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.accesoDatos;

import java.util.ArrayList;
import proyectomio.modelo.Consulta;
import proyectomio.modelo.Ruta;

/**
 *
 * @author lusho
 */
public class DaoRutas {

    private final Controlador_BD CONTROLADOR_BD = new Controlador_BD();

    public Ruta getRuta(int id_ruta) {
        String nombre;
        String descripcion;
        Ruta ruta = new Ruta();
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM ruta where id_ruta = "+id_ruta);
        if(consulta.getColumna("id_ruta").getFilas().isEmpty())
        {
            return ruta;
        }
        else
        {
        nombre = consulta.getColumna("nombre").getFila(0);
        descripcion = consulta.getColumna("descripcion").getFila(0);
        ruta = new Ruta(id_ruta,nombre,descripcion);
        
        return ruta;
        }
    }

    /*
    en caso que la llave primaria sea duplicada retorna 1
    en caso que la operacion se termine exitosamente retorna 0
     */
    public int adicionar_ruta(Ruta una_ruta) {
        Consulta consulta = CONTROLADOR_BD.consultarBD("INSERT INTO ruta VALUES (" + una_ruta.getId_ruta() + ",'" + una_ruta.getNombre() + "','" + una_ruta.getDescripcion() + "');");
        int codigo_error = consulta.getColumna("Error").getCodigo_tipo_de_dato();
        if (codigo_error == 1062) {
            return 1;
        }

        return 0;
    }

    /* en caso que la ruta no exista se retornara 1
    si se piensa hacer una modificaicon a nombre ruta tal que el nuevo nombre sea igual a uno ya existente y viole el constrain unique de este campo se retornara 2
    en caso que la consulta se halla ejecutado bien se retornara 0*/
    public int modificar_ruta(String nombre_ruta_modificar, Ruta nueva_ruta) {
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT *  FROM ruta WHERE ruta.nombre='" + nombre_ruta_modificar + "';");
        if ("-1".equals(consulta.getColumna("id_ruta").getFila(0))) {
            return 1;
        } else {

            consulta = CONTROLADOR_BD.consultarBD("UPDATE ruta SET nombre='" + nueva_ruta.getNombre() + "', descripcion='" + nueva_ruta.getDescripcion() + "' where nombre='" + nombre_ruta_modificar + "';");
            System.out.println(consulta.getColumna("Error").getCodigo_tipo_de_dato());
            if (consulta.getColumna("Error").getCodigo_tipo_de_dato() == 1062) {
                return 2;
            }
            return 0;
        }
    }

    /*
    esta consulta por su naturaleza no presentara errores, los dos unicos casos posibles es que retorne algo
    o no lo haga (por que no hallan rutas registrados en la bd, por lo tanto en caso de que no halla se sabra 
    por el echo de que el array estara vacio.
     */
    public ArrayList<Ruta> get_rutas() {
        ArrayList<Ruta> rutas_encontradas = new ArrayList<>();
        Ruta ruta_temporal = new Ruta();
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM ruta");
        for (int i = 0; i < consulta.getColumna("id_ruta").getFilas().size(); i++) {
            ruta_temporal.setDescripcion(consulta.getColumna("descripcion").getFila(i));
            ruta_temporal.setId_ruta(Integer.valueOf(consulta.getColumna("id_ruta").getFila(i)));
            ruta_temporal.setNombre(consulta.getColumna("nombre").getFila(i));
            rutas_encontradas.add(ruta_temporal);
            ruta_temporal = new Ruta();
        }
        return rutas_encontradas;
    }


    /*
    en caso que la ruta a eliminar no exista, se retornara 1, 
    si la operacion se realizo con exito se retorna 0
     */
    public int eliminar_ruta(String nombre_ruta_eliminar) {

        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT *  FROM ruta WHERE ruta.nombre='" + nombre_ruta_eliminar + "';");
        if ("-1".equals(consulta.getColumna("id_ruta").getFila(0))) {
            return 1;
        }

        CONTROLADOR_BD.consultarBD("DELETE FROM ruta WHERE nombre='" + nombre_ruta_eliminar + "';");
        return 0;
    }

    public ArrayList<String> get_nombre_rutas() {
        ArrayList<String> lista_rutas = new ArrayList<>();
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT *  FROM ruta;");
        if ("-1".equals(consulta.getColumna("id_ruta").getFila(0))) {
            return lista_rutas;
        } else {
            lista_rutas = consulta.getColumna("nombre").getFilas();
            return lista_rutas;
        }

    }

}
