/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.modelo;

/**
 *
 * @author Alejandro
 */
public class Tarjeta {
    private int id_tarjeta;
    private int estado;
    private int saldo;
    private int id_estacion_venta;
    private String fecha_venta;

    public Tarjeta(int id_tarjeta, int estado, int saldo, int id_estacion_venta, String fecha_venta) {
        this.id_tarjeta = id_tarjeta;
        this.estado = estado;
        this.saldo = saldo;
        this.id_estacion_venta = id_estacion_venta;
        this.fecha_venta = fecha_venta;
    }

    public Tarjeta() {
    }

    public int getId_tarjeta() {
        return id_tarjeta;
    }

    public void setId_tarjeta(int id_tarjeta) {
        this.id_tarjeta = id_tarjeta;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getSaldo() {
        return saldo;
    }

    public void setSaldo(int saldo) {
        this.saldo = saldo;
    }

    public int getId_estacion_venta() {
        return id_estacion_venta;
    }

    public void setId_estacion_venta(int id_estacion_venta) {
        this.id_estacion_venta = id_estacion_venta;
    }

    public String getFecha_venta() {
        return fecha_venta;
    }

    public void setFecha_venta(String fecha_venta) {
        this.fecha_venta = fecha_venta;
    }
    
}
