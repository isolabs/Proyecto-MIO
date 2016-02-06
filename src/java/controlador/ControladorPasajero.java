/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import accesoDatos.DaoPasajero;
import java.util.HashSet;
import java.util.Set;
import proyectomio.modelo.Pasajero;

/**
 *
 * @author Alejandro
 */
public class ControladorPasajero {
    DaoPasajero data_acces_object;

    public ControladorPasajero() {
        this.data_acces_object = new DaoPasajero();
    }
    
    public int adicionar_pasajero(int id_pasajero, int id_tarjeta, String nombres, String apellidos, String fecha_nacimiento, String direccion, String telefono, String correo_electronico){
        Pasajero pasajero_adicionar = new Pasajero();
        pasajero_adicionar.setId_pasajero(id_pasajero);
        pasajero_adicionar.setId_tarjeta(id_tarjeta);
        pasajero_adicionar.setNombres(nombres);
        pasajero_adicionar.setApellidos(apellidos);
        pasajero_adicionar.setFecha_nacimiento(fecha_nacimiento);
        pasajero_adicionar.setDireccion(direccion);
        pasajero_adicionar.setTelefono(telefono);
        pasajero_adicionar.setCorreo_electronico(correo_electronico);
        data_acces_object.adicionar_pasajero(pasajero_adicionar);
        return 0;
    }
    
    
    
}
