/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.controlador;

import proyectomio.accesoDatos.DaoEstaciones;
import java.util.ArrayList;
import proyectomio.modelo.Estacion;

/**
 *
 * @author root
 */
public class Controlador_Estaciones {
    private final DaoEstaciones DATA_ACCES_OBJECT;

    public Controlador_Estaciones() {
        DATA_ACCES_OBJECT = new DaoEstaciones();
    }
    
    public Estacion getEstacion(int id_estacion)
    {
        Estacion estacion = DATA_ACCES_OBJECT.getEstacion(id_estacion);
        return estacion;
    }
    
    /*
    en caso que la llave primaria sea duplicada retorna 1
    en caso que la llave fornaea a id_empleado_acargo no se cumpla se retorna 2
    en caso que la operacion se termine exitosamente retorna 0
     */
    public int adicionar_estacion(String nombre, String direccion, int id_empleado_a_cargo) {
        Estacion estacion_adicionar = new Estacion();
        estacion_adicionar.setDireccion(direccion);;
        estacion_adicionar.setId_empleado_a_cargo(id_empleado_a_cargo);
        estacion_adicionar.setNombre(nombre);
        int resultado = DATA_ACCES_OBJECT.adicionar_estacion(estacion_adicionar);
        return resultado;
    }

    /* en caso que la estacion no exista se retornara 1
    si se piensa hacer una modificaicon a nombre de estacion tal que el nuevo nombre sea igual a uno ya existente y viole el constrain unique de este campo se retornara 2
    en caso que la consulta se halla ejecutado bien se retornara 0*/
    public int modificar_estacion(String nombre_estacion_modificar, 
                                  int nueva_id_estacion, 
                                  String nuevo_nombre, String nueva_direccion, 
                                  int nuevo_id_empleado_a_cargo) {
       Estacion nueva_estacion = new Estacion();
       nueva_estacion.setDireccion(nueva_direccion);
       nueva_estacion.setId_empleado_a_cargo(nuevo_id_empleado_a_cargo);
       nueva_estacion.setId_estacion(nueva_id_estacion);
       nueva_estacion.setNombre(nuevo_nombre);
       int resultado = DATA_ACCES_OBJECT.modificar_estacion(nombre_estacion_modificar, nueva_estacion);
       return resultado;
        
    }

    /*
    en caso que la estacion a eliminar no exista, se retornara 1, 
    si la operacion se realizo con exito se retorna 0
     */
    public int eliminar_estacion(String nombre_estacion_eliminar) {

       int resultado = DATA_ACCES_OBJECT.eliminar_estacion(nombre_estacion_eliminar);
       return resultado;
    }
     public ArrayList <String> get_nombre_estaciones()
    {
      ArrayList<String> lista_estaciones = new ArrayList<>();
      lista_estaciones=DATA_ACCES_OBJECT.get_nombre_estaciones();
      return lista_estaciones;
      
    }
     
       /*
    esta consulta por su naturaleza no presentara errores, los dos unicos casos posibles es que retorne algo
    o no lo haga (por que no hallan estaciones registradas en la bd, por lo tanto en caso de que no halla se sabra 
    por el echo de que el array estara vacio.
    */
    public ArrayList<Estacion> get_estaciones()
    {
        ArrayList<Estacion> estaciones_encontradas = new ArrayList<>();
       estaciones_encontradas = DATA_ACCES_OBJECT.get_estaciones();
       return estaciones_encontradas;
    }
}
