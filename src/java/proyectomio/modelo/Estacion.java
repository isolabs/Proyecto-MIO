/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.modelo;

/**
 *
 * @author root
 */
public class Estacion {
    private int id_estacion;
    private String nombre;
    private String direccion;
    private int id_empleado_a_cargo;

    
    public Estacion()
    {
        
    }
    public Estacion(int id_estacion, String nombre, String direccion, int id_empleado_a_cargo)
    {
        this.id_estacion=this.id_estacion;
        this.nombre=nombre;
        this.direccion=direccion;
        this.id_empleado_a_cargo=id_empleado_a_cargo;
    }
    /**
     * @return the id_estacion
     */
    public int getId_estacion() {
        return id_estacion;
    }

    /**
     * @param id_estacion the id_estacion to set
     */
    public void setId_estacion(int id_estacion) {
        this.id_estacion = id_estacion;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the direccion
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * @param direccion the direccion to set
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    /**
     * @return the id_empleado_a_cargo
     */
    public int getId_empleado_a_cargo() {
        return id_empleado_a_cargo;
    }

    /**
     * @param id_empleado_a_cargo the id_empleado_a_cargo to set
     */
    public void setId_empleado_a_cargo(int id_empleado_a_cargo) {
        this.id_empleado_a_cargo = id_empleado_a_cargo;
    }
    
}
