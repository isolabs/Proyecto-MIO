/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.controlador;

import proyectomio.accesoDatos.DaoTarjeta;
import java.util.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import proyectomio.modelo.Reg_uso_tarjeta;
import proyectomio.modelo.Ruta;
import proyectomio.modelo.Tarjeta;

/**
 *
 * @author Alejandro
 */
public class Controlador_Tarjeta {
    DaoTarjeta data_acces_object;

    public Controlador_Tarjeta() {
        this.data_acces_object = new DaoTarjeta();
    }
    
    public int adicionar_tarjeta(int id_estacion_venta){
        Date utilDate = new Date(); //fecha actual
        long lnMilisegundos = utilDate.getTime();
        Date sqlDate = new java.sql.Date(lnMilisegundos);
        String fecha_venta = ""+ sqlDate;
        Tarjeta adicionar_tarjeta = new Tarjeta();
        adicionar_tarjeta.setId_tarjeta(0);
        adicionar_tarjeta.setEstado(0);
        adicionar_tarjeta.setSaldo(0);
        adicionar_tarjeta.setId_estacion_venta(id_estacion_venta);
        adicionar_tarjeta.setFecha_venta(fecha_venta);
        int resultado = data_acces_object.adicionar_tarjeta(adicionar_tarjeta);
        return resultado;
    }
    
    public int modificar_tarjeta(int id_tarjeta_a_modificar, int id_tarjeta, int estado, int saldo, int id_estacion_venta, String fecha_venta){
        Tarjeta adicionar_tarjeta = new Tarjeta();
        adicionar_tarjeta.setId_tarjeta(id_tarjeta);
        adicionar_tarjeta.setEstado(estado);
        adicionar_tarjeta.setSaldo(saldo);
        adicionar_tarjeta.setId_estacion_venta(id_estacion_venta);
        adicionar_tarjeta.setFecha_venta(fecha_venta);
        int resultado = data_acces_object.modificar_tarjeta(id_tarjeta_a_modificar, adicionar_tarjeta);
        return resultado;
    }
    
    public int eliminar_tarjeta(int id_tarjeta)
    {
        int resultado = data_acces_object.eliminar_tarjeta(id_tarjeta);
        return resultado;
    }
    
    public int descontar_pasaje_tarjeta (int id_tarjeta)
    {
        int resultado = data_acces_object.descontar_pasaje_tarjeta(id_tarjeta);
        return resultado;
    }
    
    public int tres_pasajes_adicionales (int id_tarjeta)
    {
        int resultado = data_acces_object.tres_pasajes_adicionales(id_tarjeta);
        return resultado;
    }
    
    public ArrayList<Tarjeta> get_tarjeta()
    {
        ArrayList<Tarjeta> lista_tarjetas = new ArrayList<>();
        lista_tarjetas = data_acces_object.get_tarjeta();
        return lista_tarjetas;
    }
    
    public ArrayList<Tarjeta> get_una_tarjeta(int id_tarjeta)
    {
        ArrayList<Tarjeta> lista_una_tarjeta = new ArrayList<>();
        lista_una_tarjeta = data_acces_object.get_una_tarjeta(id_tarjeta);
        return lista_una_tarjeta;
    }
    
    public int recargar_tarjeta (int id_tarjeta, int recarga)
    {
        int resultado = data_acces_object.recargar_tarjeta(id_tarjeta, recarga);
        return resultado;
    }
    
    public int cambiar_estado_tarjeta (int id_tarjeta)
    {
        int resultado = data_acces_object.cambiar_estado_tarjeta(id_tarjeta);
        return resultado;
    }
    
    public ArrayList<Tarjeta> tarjeta_vendida_estacion (String fecha_desde, String fecha_hasta){
        ArrayList<Tarjeta> lista_tarjetas_vendidas = new ArrayList<>();
        lista_tarjetas_vendidas = data_acces_object.tarjeta_vendida_estacion(fecha_desde, fecha_hasta);
        return lista_tarjetas_vendidas;
    }
    
    public ArrayList<Ruta> rutas_demanda_pasajero (){
        ArrayList<Ruta> lista_pasajeros = new ArrayList<>();
        lista_pasajeros = data_acces_object.rutas_demanda_pasajero();
        return lista_pasajeros;
    }
    
    public int registrar_uso_tarjeta(int id_ruta, int id_tarjeta){
        Date fecha = new Date ();
        long lnMilisegundos = fecha.getTime();
        Timestamp sqlTimestamp = new Timestamp(lnMilisegundos);
        String timestamp = ""+sqlTimestamp;
        Reg_uso_tarjeta reg_uso_tarjeta = new Reg_uso_tarjeta();
        reg_uso_tarjeta.setId_ruta(id_ruta);
        reg_uso_tarjeta.setId_tarjeta(id_tarjeta);
        reg_uso_tarjeta.setFecha(timestamp);
        int resultado = data_acces_object.registrar_uso_tarjeta(reg_uso_tarjeta);
        return resultado;
    }
    
    public int ver_saldo_tarjeta(int id_tarjeta){
        int resultado = data_acces_object.ver_saldo_tarjeta(id_tarjeta);
        return resultado;
    }
}

