/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import accesoDatos.DaoEmpleado;
import proyectomio.modelo.Empleado;

/**
 *
 * @author Alejandro
 */
public class ControladorEmpleado {
    DaoEmpleado data_acces_object;

    public ControladorEmpleado() {
        this.data_acces_object = new DaoEmpleado();
    }
    
    public int adicionar_empleado(int id_empleado, String nombres, String apellidos, String fecha_nacimiento, String direccion, String telefono, String correo_electronico, String cargo){
        Empleado empleado_adicionar = new Empleado();
        empleado_adicionar.setId_empleado(id_empleado);
        empleado_adicionar.setNombres(nombres);
        empleado_adicionar.setApellidos(apellidos);
        empleado_adicionar.setFecha_nacimiento(fecha_nacimiento);
        empleado_adicionar.setDireccion(direccion);
        empleado_adicionar.setTelefono(telefono);
        empleado_adicionar.setCorreo_electronico(correo_electronico);
        empleado_adicionar.setCargo(cargo);
        int resultado = data_acces_object.adicionar_empleado(empleado_adicionar);
        return resultado;
    }
    
    public int modificar_empleado(int id_empleado_a_modificar,int id_empleado, String nombres, String apellidos, String fecha_nacimiento, String direccion, String telefono, String correo_electronico, String cargo)
    {
        Empleado empleado_adicionar = new Empleado();
        empleado_adicionar.setId_empleado(id_empleado);
        empleado_adicionar.setNombres(nombres);
        empleado_adicionar.setApellidos(apellidos);
        empleado_adicionar.setFecha_nacimiento(fecha_nacimiento);
        empleado_adicionar.setDireccion(direccion);
        empleado_adicionar.setTelefono(telefono);
        empleado_adicionar.setCorreo_electronico(correo_electronico);
        empleado_adicionar.setCargo(cargo);
        int resultado = data_acces_object.modificar_empleado(id_empleado_a_modificar, empleado_adicionar);
        return resultado;
    }
    
    public int eliminar_empleado(int id_empleado)
    {
        int resultado = data_acces_object.eliminar_empleado(id_empleado);
        return resultado;
    }
    
      
     public ArrayList<Empleado> get_empleados(int id_empleado) {
         ArrayList<Empleado> lista_un_empleados = new ArrayList<>();
        lista_un_empleados = data_acces_object.get_empleados(id_empleado);
        return lista_un_empleados;
     }
}

