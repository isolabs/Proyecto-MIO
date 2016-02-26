/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.modelo;

/**
 *
 * @author jeisonOS
 */
public class Reclamo_medida {
    private int id_reclamo;
    private String descripcion;
    private int estado;
    private String fecha_hora;

    public Reclamo_medida() {
    }
    
    public Reclamo_medida(int id_reclamo, String descripcion, int estado, String fecha_hora) {
        this.id_reclamo = id_reclamo;
        this.descripcion = descripcion;
        this.estado = estado;
        this.fecha_hora = fecha_hora;
    }

    public int getId_reclamo() {
        return id_reclamo;
    }

    public void setId_reclamo(int id_reclamo) {
        this.id_reclamo = id_reclamo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getFecha_hora() {
        return fecha_hora;
    }

    public void setFecha_hora(String fecha_hora) {
        this.fecha_hora = fecha_hora;
    }
    
}
