/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import accesoDatos.DaoTarjeta;
import proyectomio.modelo.Tarjeta;

/**
 *
 * @author Jul
 */
public class ControladorTarjeta {
    DaoTarjeta data_acces_object;

    public ControladorTarjeta() {
        this.data_acces_object = new DaoTarjeta();
    }
    
    public int adicionar_tarjeta(int id_tarjeta, int estado, int saldo, int id_estacion_venta, String fecha_venta){
        Tarjeta adicionar_tarjeta = new Tarjeta();
        adicionar_tarjeta.setId_tarjeta(id_tarjeta);
        adicionar_tarjeta.setEstado(estado);
        adicionar_tarjeta.setSaldo(saldo);
        adicionar_tarjeta.setId_estacion_venta(id_estacion_venta);
        adicionar_tarjeta.setFecha_venta(fecha_venta);
        data_acces_object.adicionar_tarjeta(adicionar_tarjeta);
        return 0;
    }
}
