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
public class Reclamo {

    private int id_tiquete;
    private String fecha;
    private String motivo;
    private String descripcion;
    private int estado;
    private int id_pasajero_interpone;
    private int id_empleado_anota;
    private int id_empleado_resuelve;
    private int id_estacion_interpone;
    public Reclamo() {
         this.id_tiquete = 0;
        this.fecha = "";
        this.motivo = "";
        this.descripcion = "";
        this.estado = 0;
        this.id_pasajero_interpone = 0;
        this.id_empleado_anota = 0;
        this.id_empleado_resuelve = 0;
        this.id_estacion_interpone = 0;
    }

    public Reclamo(int id_tiquete, String fecha, String motivo, String descripcion, int estado, int id_pasajero_interpone, int id_empleado_anota, int id_empleado_resuelve, int id_estacion_interpone) {
        this.id_tiquete = id_tiquete;
        this.fecha = fecha;
        this.motivo = motivo;
        this.descripcion = descripcion;
        this.estado = estado;
        this.id_pasajero_interpone = id_pasajero_interpone;
        this.id_empleado_anota = id_empleado_anota;
        this.id_empleado_resuelve = id_empleado_resuelve;
        this.id_estacion_interpone=id_estacion_interpone;
    }

    public int getId_tiquete() {
        return id_tiquete;
    }

    public void setId_tiquete(int id_tiquete) {
        this.id_tiquete = id_tiquete;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motico) {
        this.motivo = motico;
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

    public int getId_pasajero_interpone() {
        return id_pasajero_interpone;
    }

    public void setId_pasajero_interpone(int id_pasajero_interpone) {
        this.id_pasajero_interpone = id_pasajero_interpone;
    }

    public int getId_empleado_anota() {
        return id_empleado_anota;
    }

    public void setId_empleado_anota(int id_empleado_anota) {
        this.id_empleado_anota = id_empleado_anota;
    }

    public int getId_empleado_resuelve() {
        return id_empleado_resuelve;
    }

    public void setId_empleado_resuelve(int id_empleado_resuelve) {
        this.id_empleado_resuelve = id_empleado_resuelve;
    }

    /**
     * @return the id_estacion_interpone
     */
    public int getId_estacion_interpone() {
        return id_estacion_interpone;
    }

    /**
     * @param id_estacion_interpone the id_estacion_interpone to set
     */
    public void setId_estacion_interpone(int id_estacion_interpone) {
        this.id_estacion_interpone = id_estacion_interpone;
    }

}
