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
 * @author jeisonOS
 */
public class Controlador_Director {
    private final Controlador_BD CONTROLADOR_BD = new Controlador_BD();
    
     /*
    este metodo permite asignar un bus a un conductor en determinado turno
    en caso que la llave primaria se duplique y se quiera asignar el mismo bus en el mismo turno al mismo conductor se retornara 1
    en el caso que se viole la llave foranea de empleado o de placa bus se retornara 2
    si la operacion se realiza correcamente se retornara 0
    */
    public int asignar_bus_conductor(int id_conductor, String placa_bus, int turno)
    {
        
        Consulta consulta = CONTROLADOR_BD.consultarBD("INSERT INTO bus_empleado values ('"+placa_bus+"',"+id_conductor+","+turno+");");
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
}
