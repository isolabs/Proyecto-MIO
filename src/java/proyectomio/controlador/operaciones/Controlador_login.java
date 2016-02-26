/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.controlador.operaciones;

import proyectomio.accesoDatos.Controlador_BD;
import proyectomio.modelo.Consulta;

/**
 *
 * @author jeisonOS
 */
public class Controlador_login {
    
    private final Controlador_BD CONTROLADOR_BD;

    public Controlador_login() {
        this.CONTROLADOR_BD = new Controlador_BD();
    }
    
    public boolean login(String identificacion,String password){
        
        Consulta consulta = this.CONTROLADOR_BD.consultarBD("SELECT nombres,"
                + "apellidos,correo_electronico,cargo FROM empleado WHERE "
                + "id_empleado = '" + identificacion + "' AND password = '" + password + "'");
        
        return (consulta.getColumnas().get(0).getFilas().size() == 1);
        
    }
    
}
