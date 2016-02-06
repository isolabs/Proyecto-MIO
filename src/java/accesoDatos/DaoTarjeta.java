/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package accesoDatos;

import proyectomio.modelo.Consulta;
import proyectomio.modelo.Tarjeta;

/**
 *
 * @author Alejandro
 */
public class DaoTarjeta {
    private final Controlador_BD CONTROLADOR_BD = new Controlador_BD();
    
    
    /*  en caso que se ingrese correctamente se retornara 0
        en caso que la llave primaria se duplique se retornara 1,
        cualquier otro error sera retornado un -1.
    */
    public int adicionar_tarjeta(Tarjeta una_tarjeta)
    { 
         Consulta consulta = CONTROLADOR_BD.consultarBD("INSERT INTO tarjeta VALUES (" + una_tarjeta.getId_tarjeta()+","+una_tarjeta.getEstado()+","+una_tarjeta.getSaldo()+","+una_tarjeta.getId_estacion_venta()+",'"+una_tarjeta.getFecha_venta()+"');");
         int codigo_error = consulta.getColumna("Error").getCodigo_tipo_de_dato();
        switch (codigo_error) {
            case -1:
                return 0;
            case 1062:
                return 1;
            default:
                return -1;
        }
    }
    
    /*
    en caso que la operacion sea correcta se retornara 0
    en caso de que la id_tarjeta ingresada no corresponda a una tarjeta existente se retornara 1
    en caso que se cambie el numero de tarjeta por uno que  existe en tarjeta retornara 2
    cualquier otro error sera retornado -1;
     */
    
    public int modificar_tarjeta(int id_tarjeta_a_modificar, Tarjeta nueva_tarjeta)
    {
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT *  FROM tarjeta WHERE tarjeta.id_tarjeta=" + id_tarjeta_a_modificar + ";");
        
        if ("-1".equals(consulta.getColumna("id_tarjeta").getFila(0))) {
            return 1;
        } else {

            consulta = CONTROLADOR_BD.consultarBD("UPDATE tarjeta SET id_tarjeta="+nueva_tarjeta.getId_tarjeta()+",estado="+nueva_tarjeta.getEstado()+", saldo="+nueva_tarjeta.getSaldo()+",id_estacion_tarjeta="+nueva_tarjeta.getId_estacion_venta()+",fecha_venta='"+nueva_tarjeta.getFecha_venta()+"' where id_tarjeta="+id_tarjeta_a_modificar+";");
            
            if (consulta.getColumna("Error").getCodigo_tipo_de_dato() == 1062) {
                return 2;
            } else {
                return 0;
            }
        }
    }
    
    /*
    en caso que la operacion sea correcta se retornara 0
    en caso de que la id_tarjeta ingresada no corresponda a una tarjeta existente se retornara 1
    
     */
    public int eliminar_tarjeta(int id_tarjeta)
    {
        
       
       Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT *  FROM tarjeta WHERE tarjeta.id_tarjeta=" + id_tarjeta + ";");
       if ("-1".equals(consulta.getColumna("id_tarjeta").getFila(0))) {
            return 1;
        } else {
            CONTROLADOR_BD.consultarBD("DELETE FROM tarjeta WHERE id_tarjeta="+id_tarjeta+";");  
            return 0;
        }
       
    }
    
    /*-----
    Si la tarjeta tiene el saldo en 0 o menor no se puede descontar el pasaje,
    de lo contrario se le descontara 1700
    retorna 1 si el id_tarjeta no existe
    retorna 2 si el saldo de la tarjeta no le alcanza 
    retorna 0 si se le desconto el pasaje
    */
    public int descontar_pasaje_tarjeta (int id_tarjeta)
    {
        String saldo = "";
        Consulta consulta1 = CONTROLADOR_BD.consultarBD("SELECT saldo FROM tarjeta WHERE id_tarjeta="+id_tarjeta+";");
        saldo = consulta1.getColumna("saldo").getFila(0);
            
        int saldoTarjeta = Integer.parseInt(saldo);
        saldoTarjeta = saldoTarjeta - 1700;
        if("-1".equals(saldo)){
            return 1;
        }
        
        else if (0 >= saldoTarjeta) {
            System.out.println("No se puede descontar pasaje");
            return 2;
        }
        else{
            Consulta consulta2 = CONTROLADOR_BD.consultarBD("UPDATE tarjeta SET saldo = "+saldoTarjeta+" where id_tarjeta="+id_tarjeta+";");
            System.out.println("nuevo saldo "+saldoTarjeta);
            return 0;
        }
       
    }
    
    /*
        Permite hacer un avance de hasta tres pasajes en el caso de que la tarjeta sea
        personalizada.
    si retorna 1 no existe numero id_tarjeta
    si retorna 2 No se puede descontar pasaje
    si retorna 0 se adiciono un pasaje 
    */
    public int tres_pasajes_adicionales (int id_tarjeta)
       {
           String saldo = "";
           Consulta consulta1 = CONTROLADOR_BD.consultarBD("SELECT tarjeta.saldo FROM tarjeta NATURAL JOIN pasajero WHERE id_tarjeta="+id_tarjeta+";");
           saldo = consulta1.getColumna("saldo").getFila(0);
           int saldoTarjeta = Integer.parseInt(saldo);
        saldoTarjeta = saldoTarjeta - 1700;
           if ("-1".equals(saldo)) {
               return 1;
           }
        
           else if (-5100 >= saldoTarjeta) {
            System.out.println("No se puede descontar pasaje, tiene avance de tres pasajes");
            return 2;
        }
        else{
            Consulta consulta2 = CONTROLADOR_BD.consultarBD("UPDATE tarjeta SET saldo = "+saldoTarjeta+" where id_tarjeta="+id_tarjeta+";");
            System.out.println("nuevo saldo "+saldoTarjeta);
            return 0;
        }
       }
    
     public ArrayList<Tarjeta> get_tarjeta()
    {
        ArrayList<Tarjeta> tarjetas_encontrados = new ArrayList<>();
        Tarjeta tarjeta_temporal=new Tarjeta();
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM tarjeta");
        for(int i = 0; i < consulta.getColumna("id_tarjeta").getFilas().size(); i++)
        {
            tarjeta_temporal.setId_tarjeta(Integer.valueOf(consulta.getColumna("id_tarjeta").getFila(i)));
            tarjeta_temporal.setEstado(Integer.valueOf(consulta.getColumna("estado").getFila(i)));
            tarjeta_temporal.setSaldo(Integer.valueOf(consulta.getColumna("saldo").getFila(i)));
            tarjeta_temporal.setId_estacion_venta(Integer.valueOf(consulta.getColumna("id_estacion_venta").getFila(i)));
            tarjeta_temporal.setFecha_venta(consulta.getColumna("fecha_venta").getFila(i));
            tarjetas_encontrados.add(tarjeta_temporal);
            tarjeta_temporal=new Tarjeta();
        }
        return tarjetas_encontrados;
    }
     
     /*
    Recargar la tarjeta
     si  retorna 1 no existe numero id_tarjeta
     si retorna 0 se realizo la recarga
    */
    public int recargar_tarjeta (int id_tarjeta, int recarga)
    {
        String saldo = "";
        Consulta consulta1 = CONTROLADOR_BD.consultarBD("SELECT saldo FROM tarjeta WHERE id_tarjeta="+id_tarjeta+";");
        saldo = consulta1.getColumna("saldo").getFila(0);
        if ("-1".equals(saldo)) {
            return 1;
        }else{
           
        int saldoTarjeta = Integer.parseInt(saldo);
        saldoTarjeta = saldoTarjeta + recarga;
        Consulta consulta2 = CONTROLADOR_BD.consultarBD("UPDATE tarjeta SET saldo = "+saldoTarjeta+" where id_tarjeta="+id_tarjeta+";");
        System.out.println("nuevo saldo "+saldoTarjeta);
        return 0;
        }
    }
    
    /*
    cambiar el estado de la tarjeta
       
    si retorna 0 esta activa
    si retorna 1 esta bloqueada
    */
    public int cambiar_estado_tarjeta (int id_tarjeta)
    {
        String estado = "";
        Consulta consulta1 = CONTROLADOR_BD.consultarBD("SELECT estado FROM tarjeta WHERE id_tarjeta="+id_tarjeta+";");
        estado = consulta1.getColumna("estado").getFila(0);
        
        if ("-1".equals(estado)) {
            return -1;
        }
        else if ("0".equals(estado)) {
            int bloqueada = 1;
            Consulta consulta2 = CONTROLADOR_BD.consultarBD("UPDATE tarjeta SET estado = "+bloqueada+" where id_tarjeta="+id_tarjeta+";");
            return 1;
        }else {
            int activa = 0;
            Consulta consulta2 = CONTROLADOR_BD.consultarBD("UPDATE tarjeta SET estado = "+activa+" where id_tarjeta="+id_tarjeta+";");
            return 0;
        }             
    }
    
    /*
    El valor en tarjetas vendidas por cada estación durante una fecha especificada. 
    */
    
    public ArrayList<Tarjeta> tarjeta_vendida_estacion (String fecha_desde, String fecha_hasta){
        ArrayList<Tarjeta> tarjeta_vendidas = new ArrayList<>();
        Tarjeta tarjeta_temporal=new Tarjeta();
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT id_estacion_venta,count(id_tarjeta) AS id_tarjeta FROM tarjeta WHERE fecha_venta BETWEEN '"+fecha_desde+"' AND '"+fecha_hasta+"';");
        for(int i = 0; i < consulta.getColumna("id_estacion_venta").getFilas().size(); i++)
        {
            tarjeta_temporal.setId_estacion_venta(Integer.valueOf(consulta.getColumna("id_estacion_venta").getFila(i)));
            tarjeta_temporal.setId_tarjeta(Integer.valueOf(consulta.getColumna("id_tarjeta").getFila(i)));
            tarjeta_vendidas.add(tarjeta_temporal);
            tarjeta_temporal=new Tarjeta();
        }
        return tarjeta_vendidas;
    }
    
    /*
    Mostrar las rutas que más demanda de pasajeros tienen
    */
    public int registrar_uso_tarjeta(int id_ruta, int id_tarjeta){
        return 0;
    }
    
}
