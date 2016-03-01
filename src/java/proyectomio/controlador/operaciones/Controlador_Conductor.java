/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.controlador.operaciones;

import proyectomio.accesoDatos.Controlador_BD;
import proyectomio.modelo.Consulta;

/**
 *
 * @author root
 */
public class Controlador_Conductor {

    private final Controlador_BD CONTROLADOR_BD = new Controlador_BD();

    public Consulta consultar_buses_asignados(int id_conductor) {
        if (id_conductor != 0) {
            Consulta consulta = new Consulta();
            consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM bus_empleado inner join bus on bus_empleado.placa_bus = bus.placa inner join ruta on ruta.id_ruta = bus.id_ruta where bus_empleado.id_empleado = " + id_conductor);
            return consulta;
        }
        else{
            Consulta consulta = new Consulta();
            consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM (bus_empleado inner join bus on bus_empleado.placa_bus = bus.placa) inner join ruta on ruta.id_ruta = bus.id_ruta;");
            return consulta;
        }
        
    }
}
