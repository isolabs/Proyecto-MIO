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
}
