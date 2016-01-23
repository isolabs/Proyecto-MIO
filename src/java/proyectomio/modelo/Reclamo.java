/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.modelo;

import java.sql.Date;

/**
 *
 * @author jeisonOS
 */
public class Reclamo {
    
    private int id_tiquete;
    private Date fecha;
    private String motico;
    private String descripcion;
    private int estado;
    private int id_pasajero_interpone;
    private int id_empleado_anota;
    private int id_empleado_resuelve;

    public Reclamo() {
    }

    public Reclamo(int id_tiquete, Date fecha, String motico, String descripcion, int estado, int id_pasajero_interpone, int id_empleado_anota, int id_empleado_resuelve) {
        this.id_tiquete = id_tiquete;
        this.fecha = fecha;
        this.motico = motico;
        this.descripcion = descripcion;
        this.estado = estado;
        this.id_pasajero_interpone = id_pasajero_interpone;
        this.id_empleado_anota = id_empleado_anota;
        this.id_empleado_resuelve = id_empleado_resuelve;
    }

    public int getId_tiquete() {
        return id_tiquete;
    }

    public void setId_tiquete(int id_tiquete) {
        this.id_tiquete = id_tiquete;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getMotico() {
        return motico;
    }

    public void setMotico(String motico) {
        this.motico = motico;
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
    
    
    
    
}
