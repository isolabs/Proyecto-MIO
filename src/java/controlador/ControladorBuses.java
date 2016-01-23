/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.util.ArrayList;
import proyectomio.modelo.Bus;
import proyectomio.modelo.Consulta;

/**
 *
 * @author root
 */
public class ControladorBuses {
     public int adicionar_bus_bd(Bus un_bus) {
        
     return 0;
    }
    
    /*
    en caso que la operacion sea correcta se retornara 0
    en caso de que la placa ingresada no corresponda a un bus existente se retornara 1
    cualquier otro error sera retornado -1;
     */
    public int eliminar_bus(String placa_bus) {
       return 0;
    }

    /*
    en caso que la operacion sea correcta se retornara 0
    en caso de que la placa ingresada no corresponda a un bus existente se retornara 1
    en caso que se cambie el numero de ruta por uno que no existe en ruta retornara 2
    cualquier otro error sera retornado -1;
     */
    
    public int modificar_bus(String placa_bus_existente, Bus un_bus) {

      return 0;
    }
/*
    esta consulta por su naturaleza no presentara errores, los dos unicos casos posibles es uqe retorne algo
    o no lo haga (por que no hallan buses registrados en la bd, por lo tanto en caso de que no halla se sabra 
    por el echo de que el array estara vacio.
    */
    public ArrayList<Bus> get_buses()
    {
        ArrayList<Bus> buses_encontrados = new ArrayList<>();
       
        return buses_encontrados;
    }
    
    
    /*
    en caso de que el conductor no tenga buses asignados se retornara -1
    si se ha echo la operacion correctamente retorna 0
     */
 /*
        WARNING!!!WARNING!!!WARNING!!!WARNING!!!WARNING!!!WARNING!!!WARNING
     */
    public int get_buses_asignados_por_id_conductor(String id_conductor) {
       
            return 0;
        

    }
    
    /*
    este metodo permite cambiarle la ruta a un bus especificado por una placa
    en el caso que la placa ingresada no corresponda a ningun bus existente se retornara 1
    en el caso que la ruta ingresada no exista se retornara 2
    si la operacion se realiza correcamente se retornara 0
    */
    public int cambiar_ruta(String placa_bus,int nueva_ruta)
    {
        return 0;
    }
    /*
    este metodo permite asignar un bus a un conductor en determinado turno
    en caso que la llave primaria se duplique y se quiera asignar el mismo bus en el mismo turno al mismo conductor se retornara 1
    en el caso que se viole la llave foranea de empleado o de placa bus se retornara 2
    si la operacion se realiza correcamente se retornara 0
    */
    public int asignar_bus_conductor(int id_conductor, String placa_bus, int turno)
    {
        return 0;
    }
}
