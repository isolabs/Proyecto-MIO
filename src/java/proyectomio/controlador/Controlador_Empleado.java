/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.controlador;

import java.util.ArrayList;
import proyectomio.accesoDatos.DaoEmpleado;
import proyectomio.modelo.Empleado;

/**
 *
 * @author Alejandro
 */
public class Controlador_Empleado {

    private final DaoEmpleado DATA_ACCES_OBJECT;

    public Controlador_Empleado() {
        this.DATA_ACCES_OBJECT = new DaoEmpleado();
    }

    public int adicionar_empleado(int id_empleado, String nombres, String apellidos, String fecha_nacimiento, String direccion, String telefono, String correo_electronico, String cargo, String password) {
        Empleado empleado = new Empleado();
        empleado.setId_empleado(id_empleado);
        empleado.setNombres(nombres);
        empleado.setApellidos(apellidos);
        empleado.setFecha_nacimiento(fecha_nacimiento);
        empleado.setDireccion(direccion);
        empleado.setTelefono(telefono);
        empleado.setCorreo_electronico(correo_electronico);
        empleado.setCargo(cargo);
        empleado.setPassword(password);
        return DATA_ACCES_OBJECT.adicionar_empleado(empleado);
    }

    /*
    si retorna 0 se modifico el empleado
    si retorna 1 id_empleado no existe
     */
    public int modificar_empleado(int id_empleado, String nombres, String apellidos, String fecha_nacimiento, String direccion, String telefono, String correo_electronico, String cargo, String password) {
        Empleado empleado = new Empleado();
        empleado.setId_empleado(id_empleado);
        empleado.setNombres(nombres);
        empleado.setApellidos(apellidos);
        empleado.setFecha_nacimiento(fecha_nacimiento);
        empleado.setDireccion(direccion);
        empleado.setTelefono(telefono);
        empleado.setCorreo_electronico(correo_electronico);
        empleado.setCargo(cargo);
        empleado.setPassword(password);
        return DATA_ACCES_OBJECT.modificar_empleado(id_empleado,empleado);
    }

    /*
    si retorna 0 se elimino el empleado
    si retorna 1 id_empleado no existe
     */
    public int eliminar_empleado(int id_empleado) {
        int resultado = DATA_ACCES_OBJECT.eliminar_empleado(id_empleado);
        return resultado;
    }

    /*
    esta consulta por su naturaleza no presentara errores, los dos unicos casos posibles es uqe retorne algo
    o no lo haga (por que no hallan buses registrados en la bd, por lo tanto en caso de que no halla se sabra 
    por el echo de que el array estara vacio.
     */
    public ArrayList<Empleado> get_empleados(int id_empleado) {

        ArrayList<Empleado> empleados = new ArrayList<>();
        empleados = this.DATA_ACCES_OBJECT.get_empleados(id_empleado);
        return empleados;

    }
    
    

}

