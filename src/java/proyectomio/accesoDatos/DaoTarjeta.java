/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.accesoDatos;

import java.util.ArrayList;
import proyectomio.modelo.Consulta;
import proyectomio.modelo.Reg_uso_tarjeta;
import proyectomio.modelo.Tarjeta;
import proyectomio.modelo.Ruta;

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
        if (consulta.getColumnas().get(0).getNombre().equals("ID")){
            System.err.println(consulta.getColumnas().get(0).getFila(0));
            return Integer.valueOf(consulta.getColumnas().get(0).getFila(0));
        }
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

            consulta = CONTROLADOR_BD.consultarBD("UPDATE tarjeta SET id_tarjeta="+nueva_tarjeta.getId_tarjeta()+",estado="+nueva_tarjeta.getEstado()+", saldo="+nueva_tarjeta.getSaldo()+", id_estacion_venta="+nueva_tarjeta.getId_estacion_venta()+",fecha_venta='"+nueva_tarjeta.getFecha_venta()+"' where id_tarjeta="+id_tarjeta_a_modificar+";");
            
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
    retorna 5 si el id_tarjeta no existe
    retorna 6 si el saldo de la tarjeta no le alcanza 
    retorna 7 si se le desconto el pasaje
    */
    public int descontar_pasaje_tarjeta (int id_tarjeta)
    {
        String saldo = "";
        Consulta consulta1 = CONTROLADOR_BD.consultarBD("SELECT saldo FROM tarjeta WHERE id_tarjeta="+id_tarjeta+";");
        saldo = consulta1.getColumna("saldo").getFila(0);
            
        int saldoTarjeta = Integer.parseInt(saldo);
        saldoTarjeta = saldoTarjeta - 1800;
        if("-1".equals(saldo)){
            return 5;
        }
        
        else if (0 > saldoTarjeta) {
            System.out.println("No se puede descontar pasaje");
            return 6;
        }
        else{
            CONTROLADOR_BD.consultarBD("UPDATE tarjeta SET saldo = "+saldoTarjeta+" where id_tarjeta="+id_tarjeta+";");
            System.out.println("nuevo saldo "+saldoTarjeta);
            return 7;
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
           saldoTarjeta = saldoTarjeta - 1800;
        
           if ("-1".equals(saldo)) {
               return 1;
           }
        
           else if (-5400 > saldoTarjeta) {
            System.out.println("No se puede descontar pasaje, tiene avance de tres pasajes");
            return 2;
        }
        else{
            CONTROLADOR_BD.consultarBD("UPDATE tarjeta SET saldo = "+saldoTarjeta+" where id_tarjeta="+id_tarjeta+";");
            System.out.println("nuevo saldo "+saldoTarjeta);
            return 0;
        }
       }
    
     public ArrayList<Tarjeta> get_tarjeta()
    {
        ArrayList<Tarjeta> tarjetas_encontrados = new ArrayList<Tarjeta>();
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
     
     public ArrayList<Tarjeta> get_una_tarjeta(int id_tarjeta)
    {
        ArrayList<Tarjeta> tarjetas_encontrados = new ArrayList<Tarjeta>();
        Tarjeta tarjeta_temporal=new Tarjeta();
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM tarjeta WHERE id_tarjeta="+id_tarjeta +";");
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
     si retorna 2 no se puede hacer la recarga porque la tarjeta esta bloqueada
    */
    public int recargar_tarjeta (int id_tarjeta, int recarga)
    {
        Consulta consulta1 = CONTROLADOR_BD.consultarBD("SELECT saldo FROM tarjeta WHERE id_tarjeta="+id_tarjeta+";");
        String saldo = consulta1.getColumna("saldo").getFila(0);
        if ("-1".equals(saldo)) {
            return 1;
        }else{
            Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT estado FROM tarjeta WHERE id_tarjeta="+id_tarjeta);
            String estado = consulta.getColumna("estado").getFila(0);
            int estadoTarjeta = Integer.parseInt(estado);
            if (estadoTarjeta == 1) {
                return 2;
            }else{
                int saldoTarjeta = Integer.parseInt(saldo);
                saldoTarjeta = saldoTarjeta + recarga;
                CONTROLADOR_BD.consultarBD("UPDATE tarjeta SET saldo = "+saldoTarjeta+" where id_tarjeta="+id_tarjeta+";");
                System.out.println("nuevo saldo "+saldoTarjeta);
                return 0;
            }
        }
    }
    
    /*
    cambiar el estado de la tarjeta
       
    si retorna 0 cambia de estado
    si retorna -1 no existe
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
            CONTROLADOR_BD.consultarBD("UPDATE tarjeta SET estado = "+bloqueada+" where id_tarjeta="+id_tarjeta+";");
            return 0;
        }else {
            int activa = 0;
            CONTROLADOR_BD.consultarBD("UPDATE tarjeta SET estado = "+activa+" where id_tarjeta="+id_tarjeta+";");
            return 0;
        }             
    }
    
    /*
    El valor en tarjetas vendidas por cada estación durante una fecha especificada. 
    */
    
    public ArrayList<Tarjeta> tarjeta_vendida_estacion (String fecha_desde, String fecha_hasta){
        ArrayList<Tarjeta> tarjeta_vendidas = new ArrayList<Tarjeta>();
        Tarjeta tarjeta_temporal=new Tarjeta();
        //Estacion estacion_temporal = new Estacion();
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT id_estacion_venta,count(id_tarjeta), nombre  FROM tarjeta INNER JOIN estacion ON estacion.id_estacion = tarjeta.id_estacion_venta WHERE fecha_venta BETWEEN '"+fecha_desde+"' AND '"+fecha_hasta+"'GROUP BY id_estacion_venta;");
        for(int i = 0; i < consulta.getColumna("id_estacion_venta").getFilas().size(); i++)
        {
            tarjeta_temporal.setId_estacion_venta(Integer.valueOf(consulta.getColumna("id_estacion_venta").getFila(i)));
            tarjeta_temporal.setId_tarjeta(calcular_valor_total_tarjeta_estacion(Integer.valueOf(consulta.getColumna("count(id_tarjeta)").getFila(i))));
            tarjeta_temporal.setFecha_venta(consulta.getColumna("nombre").getFila(i));
            tarjeta_vendidas.add(tarjeta_temporal);
            tarjeta_temporal=new Tarjeta();
        }
        return tarjeta_vendidas;
    }
    
    /*
    Mostrar las rutas que más demanda de pasajeros tienen
    */
    public ArrayList<Ruta> rutas_demanda_pasajero (){
        ArrayList<Ruta> rutas = new ArrayList<Ruta>();
        Ruta ruta_temporal = new Ruta();
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT id_ruta, count(id_tarjeta), nombre FROM ruta NATURAL JOIN reg_uso_tarjeta GROUP BY id_ruta ;");
        for(int i = 0; i < consulta.getColumna("id_ruta").getFilas().size(); i++)
        {
            ruta_temporal.setId_ruta(Integer.valueOf(consulta.getColumna("id_ruta").getFila(i)));
            ruta_temporal.setNombre(consulta.getColumna("nombre").getFila(i));
            ruta_temporal.setDescripcion(consulta.getColumna("count(id_tarjeta)").getFila(i));
            rutas.add(ruta_temporal);
            ruta_temporal = new Ruta();
        }
        return rutas;
    }
    
    /*
    registra el uso de las tarjeta en las rutas
    */
    public int registrar_uso_tarjeta(Reg_uso_tarjeta reg_uso_tarjeta){
        
        Consulta consulta1 = CONTROLADOR_BD.consultarBD("SELECT * FROM tarjeta WHERE id_tarjeta="+reg_uso_tarjeta.getId_tarjeta());
        int descontar_tres_pasajes = tres_pasajes_adicionales(reg_uso_tarjeta.getId_tarjeta());
        int descontar_un_pasaje = descontar_pasaje_tarjeta (reg_uso_tarjeta.getId_tarjeta());
        if ("-1".equals(consulta1.getColumna("id_tarjeta").getFila(0))) {
            return 2;
        }else{
            if (descontar_tres_pasajes != 1 ) {
                if (descontar_tres_pasajes == 2) {
                   System.out.println("No se puede descontar pasaje, tiene avance de tres pasajes");
                   return 3; 
                }else 
                {
                    Consulta consulta = CONTROLADOR_BD.consultarBD("INSERT INTO reg_uso_tarjeta VALUES ("+reg_uso_tarjeta.getId_ruta()+","+reg_uso_tarjeta.getId_tarjeta()+",'"+ reg_uso_tarjeta.getFecha()+"');");
                    return 0;
                }
            }else {
                if (descontar_un_pasaje == 6) {
                    System.out.println("No se puede descontar pasaje");
                    return 3;
                }else 
                {
                    Consulta consulta = CONTROLADOR_BD.consultarBD("INSERT INTO reg_uso_tarjeta VALUES ("+reg_uso_tarjeta.getId_ruta()+","+reg_uso_tarjeta.getId_tarjeta()+",'"+ reg_uso_tarjeta.getFecha()+"');");
                    return 0;
                }
            }
        
        }
        
       
    }
    
   public int ver_saldo_tarjeta (int id_tarjeta){
        
           Consulta consulta1 = CONTROLADOR_BD.consultarBD("SELECT saldo FROM tarjeta WHERE id_tarjeta="+id_tarjeta);
           if ("-1".equals(consulta1.getColumna("saldo").getFila(0))){
               return -7456321;
           }else{
                int saldo = Integer.parseInt(consulta1.getColumna("saldo").getFila(0));
                return saldo;
            }
    }
       
    /*
    valor total de tarjetas (una tarjeta cuesta 3200)  vendidas en una estacion
    
    */
    
    public int calcular_valor_total_tarjeta_estacion(int cantidad){
        int calcular = 3200 * cantidad;
        return calcular;
    }
    
}

