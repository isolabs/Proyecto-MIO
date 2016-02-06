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
public class Reg_uso_tarjeta {
    private int id_ruta;
    private int id_tarjeta;
    private String fecha;

    public Reg_uso_tarjeta(int id_ruta, int id_tarjeta, String fecha) {
        this.id_ruta = id_ruta;
        this.id_tarjeta = id_tarjeta;
        this.fecha = fecha;
    }

    public Reg_uso_tarjeta() {
    }

    public int getId_ruta() {
        return id_ruta;
    }

    public void setId_ruta(int id_ruta) {
        this.id_ruta = id_ruta;
    }

    public int getId_tarjeta() {
        return id_tarjeta;
    }

    public void setId_tarjeta(int id_tarjeta) {
        this.id_tarjeta = id_tarjeta;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
}
