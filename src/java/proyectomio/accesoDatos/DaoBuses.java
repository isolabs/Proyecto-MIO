/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.accesoDatos;

import java.util.ArrayList;
import proyectomio.modelo.Bus;
import proyectomio.modelo.Consulta;

/**
 *
 * @author lusho
 */
public class DaoBuses {

    private final Controlador_BD CONTROLADOR_BD = new Controlador_BD();
    /*recibe una placa, consulta la base de datos y si existe un bus con dicha placa en esta
    construye y retorna un bus, de no ser asi, retorna un bus vacio.
    */
    public Bus get_bus(String placa)
    {
   int id_ruta=0;
   int numero_pasajeros=0;
   String tipo="";/*0 alimentador,  1 bus de un solo bagon, 2 bus de doble bagon*/
   Bus un_bus = new Bus();
   Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM bus WHERE bus.placa = '"+placa+"'");
   if(consulta.getColumna("placa").getFilas().size()==0)
   {
       return un_bus;
   }
   else
   {
       id_ruta=Integer.parseInt(consulta.getColumna("id_ruta").getFila(0));
       numero_pasajeros=Integer.parseInt(consulta.getColumna("numero_pasajeros").getFila(0));
       tipo = consulta.getColumna("tipo").getFila(0);
       un_bus = new Bus(placa,id_ruta,numero_pasajeros,tipo);
       return un_bus;
   }
    }
    
    
    
    /*  en caso que se ingrese correctamente se retornara 0
        en caso que la llave primaria se duplique se retornara 1,
        en caso que no exista la ruta ingresada y viole la integridad de la llave foranea se retornara 2 
        cualquier otro error sera retornado un -1.
    
     */
    public int adicionar_bus_bd(Bus un_bus) {
        Consulta consulta = CONTROLADOR_BD.consultarBD("INSERT INTO bus VALUES ('" + un_bus.getPlaca() + "','" + un_bus.getTipo() + "'," + un_bus.getId_ruta() + "," + un_bus.getNumero_pasajeros() + ");");

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
    
    /*
    en caso que la operacion sea correcta se retornara 0
    en caso de que la placa ingresada no corresponda a un bus existente se retornara 1
    cualquier otro error sera retornado -1;
     */
    public int eliminar_bus(String placa_bus) {
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT *  FROM bus WHERE bus.placa='" + placa_bus + "';");

        if ("-1".equals(consulta.getColumna("placa").getFila(0))) {
            return 1;
        } else {
            CONTROLADOR_BD.consultarBD("DELETE FROM bus WHERE bus.placa='" + placa_bus + "';");
            return 0;
        }
    }

    /*
    en caso que la operacion sea correcta se retornara 0
    en caso de que la placa ingresada no corresponda a un bus existente se retornara 1
    en caso que se cambie el numero de ruta por uno que no existe en ruta retornara 2
    cualquier otro error sera retornado -1;
     */
    
    public int modificar_bus(String placa_bus_existente, Bus un_bus) {

        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT *  FROM bus WHERE bus.placa='" + placa_bus_existente + "';");

        if ("-1".equals(consulta.getColumna("placa").getFila(0))) {
            return 1;
        } else {

            consulta = CONTROLADOR_BD.consultarBD("UPDATE bus SET bus.tipo='" + un_bus.getTipo() + "',bus.id_ruta=" + un_bus.getId_ruta() + ",bus.numero_pasajeros =" + un_bus.getNumero_pasajeros() + " where bus.placa='" + un_bus.getPlaca() + "';");
            if (consulta.getColumna("Error").getCodigo_tipo_de_dato() == 1452) {
                return 2;
            } else {
                return 0;
            }
        }
    }
/*
    esta consulta por su naturaleza no presentara errores, los dos unicos casos posibles es uqe retorne algo
    o no lo haga (por que no hallan buses registrados en la bd, por lo tanto en caso de que no halla se sabra 
    por el echo de que el array estara vacio.
    */
    public ArrayList<Bus> get_buses()
    {
        ArrayList<Bus> buses_encontrados = new ArrayList<>();
        Bus bus_temporal=new Bus();
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM bus");
        for(int i = 0; i < consulta.getColumna("placa").getFilas().size(); i++)
        {
            bus_temporal.setPlaca(consulta.getColumna("placa").getFila(i));
            bus_temporal.setNumero_pasajeros(Integer.valueOf(consulta.getColumna("numero_pasajeros").getFila(i)));
            bus_temporal.setTipo(consulta.getColumna("tipo").getFila(i));
            bus_temporal.setId_ruta(Integer.valueOf(consulta.getColumna("id_ruta").getFila(i)));
            buses_encontrados.add(bus_temporal);
            bus_temporal=new Bus();
        }
        return buses_encontrados;
    }
    
    
    /*
    en caso de que el conductor no tenga buses asignados se retornara -1
    si se ha echo la operacion correctamente retorna 0
     */
    
    /*
        
     */
    public Consulta get_buses_asignados_por_id_conductor(String id_conductor) {
        Bus bus_temporal = new Bus();
        ArrayList<Bus> buses_encontrados = new ArrayList<>();
        String enunciado_consulta = "SELECT bus_empleado.id_empleado, bus.placa,ruta.nombre as nombre_ruta,bus_empleado.turno  FROM (bus_empleado INNER JOIN bus ON bus_empleado.placa_bus=bus.placa) INNER JOIN ruta ON bus.id_ruta = ruta.id_ruta  "
                + "WHERE bus_empleado.id_empleado=" + id_conductor + ";";
        System.out.println(enunciado_consulta);
        Consulta consulta = CONTROLADOR_BD.consultarBD(enunciado_consulta);
        if ("-1".equals(consulta.getColumna("placa").getFila(0))) {
            return consulta;
        } else {
            for (int i = 0; i < consulta.getColumna("placa").getFilas().size(); i++) {
                System.out.println(consulta.getColumna("id_empleado").getFila(i) + "  " + consulta.getColumna("placa").getFila(i) + "  " + consulta.getColumna("nombre").getFila(i) + "  " + consulta.getColumna("turno").getFila(i));
            }
            return consulta;
        }

    }
    
    /*
    este metodo permite cambiarle la ruta a un bus especificado por una placa
    en el caso que la placa ingresada no corresponda a ningun bus existente se retornara 1
    en el caso que la ruta ingresada no exista se retornara 2
    si la operacion se realiza correcamente se retornara 0
    */
    public int cambiar_ruta(String placa_bus,int nueva_ruta)
    {
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT *  FROM bus WHERE bus.placa='" + placa_bus + "';");

        if ("-1".equals(consulta.getColumna("placa").getFila(0))) {
            return 1;
        }
        consulta = CONTROLADOR_BD.consultarBD("UPDATE bus SET bus.id_ruta=" + nueva_ruta + " where bus.placa='"+placa_bus+"';");  
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
