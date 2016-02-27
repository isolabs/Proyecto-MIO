/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.controlador;

import proyectomio.accesoDatos.DaoBuses;
import java.util.ArrayList;
import proyectomio.modelo.Bus;
import proyectomio.modelo.Consulta;

/**
 *
 * @author root
 */
public class Controlador_Buses {

    private final DaoBuses data_acces_object;
 public Bus get_bus(String placa)
    {
     Bus un_bus = data_acces_object.get_bus(placa);
     return un_bus;
    }
    
    public Controlador_Buses() {
        this.data_acces_object = new DaoBuses();
    }

    /**
     *
     * @param placa
     * @param id_ruta
     * @param numero_pasajeros
     * @param tipo
     * @return
     */
    public int adicionar_bus_bd(String placa, int id_ruta, int numero_pasajeros, String tipo) {
        Bus bus_adicionar = new Bus();
        bus_adicionar.setPlaca(placa);
        bus_adicionar.setId_ruta(id_ruta);
        bus_adicionar.setNumero_pasajeros(numero_pasajeros);
        bus_adicionar.setTipo(tipo);
        int resultado = data_acces_object.adicionar_bus_bd(bus_adicionar);
        return resultado;
    }

    /*
    en caso que la operacion sea correcta se retornara 0
    en caso de que la placa ingresada no corresponda a un bus existente se retornara 1
    cualquier otro error sera retornado -1;
     */
    public int eliminar_bus(String placa_bus) {
        int resultado = data_acces_object.eliminar_bus(placa_bus);
        return resultado;
    }

    /*
    en caso que la operacion sea correcta se retornara 0
    en caso de que la placa ingresada no corresponda a un bus existente se retornara 1
    en caso que se cambie el numero de ruta por uno que no existe en ruta retornara 2
    cualquier otro error sera retornado -1;
     */
    public int modificar_bus(String placa_modificar, String nueva_placa, int nuevo_id_ruta, int nuevo_numero_pasajeros, String nuevo_tipo) {
        Bus nuevo_bus = new Bus();
        nuevo_bus.setPlaca(nueva_placa);
        nuevo_bus.setNumero_pasajeros(nuevo_numero_pasajeros);
        nuevo_bus.setId_ruta(nuevo_id_ruta);
        nuevo_bus.setTipo(nuevo_tipo);
        int resultado = data_acces_object.modificar_bus(placa_modificar, nuevo_bus);
        return resultado;

    }

    /*
    esta consulta por su naturaleza no presentara errores, los dos unicos casos posibles es uqe retorne algo
    o no lo haga (por que no hallan buses registrados en la bd, por lo tanto en caso de que no halla se sabra 
    por el echo de que el array estara vacio.
     */
    public ArrayList<Bus> get_buses() {
        ArrayList<Bus> buses_encontrados = new ArrayList<>();
        buses_encontrados = data_acces_object.get_buses();
        return buses_encontrados;
    }

    /*
    en caso de que el conductor no tenga buses asignados se retornara -1
    si se ha echo la operacion correctamente retorna 0
     */
    public Consulta get_buses_asignados_por_id_conductor(String id_conductor) {

        return data_acces_object.get_buses_asignados_por_id_conductor(id_conductor);

    }

    /*
    este metodo permite cambiarle la ruta a un bus especificado por una placa
    en el caso que la placa ingresada no corresponda a ningun bus existente se retornara 1
    en el caso que la ruta ingresada no exista se retornara 2
    si la operacion se realiza correcamente se retornara 0
     */
    public int cambiar_ruta(String placa_bus, int nueva_ruta) {
        int resultado = data_acces_object.cambiar_ruta(placa_bus, nueva_ruta);
        return resultado;
    }



}
