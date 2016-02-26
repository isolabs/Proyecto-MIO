/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.modelo;

/**
 *
 * @author lusho
 */
public class Ruta {

    private int id_ruta;
    private String nombre;
    private String descripcion;

    public Ruta(int id_ruta, String nombre, String descripcion) {

        this.id_ruta = id_ruta;
        this.nombre = nombre;
        this.descripcion = descripcion;

    }

    public Ruta() {
        this.id_ruta = 0;
        this.nombre = "";
        this.descripcion = "";
    }

    /**
     * @return the id_ruta
     */
    public int getId_ruta() {
        return id_ruta;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param id_ruta the id_ruta to set
     */
    public void setId_ruta(int id_ruta) {
        this.id_ruta = id_ruta;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

}

