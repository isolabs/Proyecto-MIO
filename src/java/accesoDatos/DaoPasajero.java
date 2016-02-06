/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package accesoDatos;

import java.util.ArrayList;
import proyectomio.modelo.Consulta;
import proyectomio.modelo.Pasajero;

/**
 *
 * @author Alejandro
 */
public class DaoPasajero {
    
    private final Controlador_BD CONTROLADOR_BD = new Controlador_BD();
    
    public int adicionar_pasajero(Pasajero un_pasajero)
    { 
         Consulta consulta = CONTROLADOR_BD.consultarBD("INSERT INTO pasajero VALUES "
                 + "(" + un_pasajero.getId_pasajero()+","+un_pasajero.getId_tarjeta()+",'"+un_pasajero.getNombres()+"','"+ un_pasajero.getApellidos()+ "','" +un_pasajero.getFecha_nacimiento()+"','"+un_pasajero.getDireccion()+"','"+un_pasajero.getTelefono()+"','"+un_pasajero.getCorreo_electronico()+"');");
         
         /*Extracción del mensaje de error*/ 
         System.out.println(consulta.getColumna("Error").getTipo_de_dato());
         /*Extracción del codigo numerico del error*/
         System.out.println(consulta.getColumna("Error").getCodigo_tipo_de_dato());
         int codigo_error = consulta.getColumna("Error").getCodigo_tipo_de_dato();
        switch (codigo_error) {
            case -1:
                return 0;
            case 1062:
                return 1;
            default:
                return -1;
    }
    }
    
    /*
    si retorna 0 se modifico el pasajero
    si retorna 1 id_pasajero no existe
    */
    public int modificar_pasajero(int id_pasajero_a_modificar, Pasajero nuevo_pasajero)
    {
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM pasajero WHERE id_pasajero="+id_pasajero_a_modificar);
        if (consulta.getColumnas().get(0).getFila(0).equals("-1")) {
            return 1;
        }else{
        Consulta consulta1 = CONTROLADOR_BD.consultarBD("UPDATE pasajero SET id_pasajero="+nuevo_pasajero.getId_pasajero()+",id_tarjeta="+nuevo_pasajero.getId_tarjeta()+",nombres='"+nuevo_pasajero.getNombres()+"', apellidos='"+nuevo_pasajero.getApellidos()+"', fecha_nacimiento='"+nuevo_pasajero.getFecha_nacimiento()+"', direccion='"+nuevo_pasajero.getDireccion()+"', telefono='"+nuevo_pasajero.getTelefono()+"', correo_electronico='"+nuevo_pasajero.getCorreo_electronico()+"' where id_pasajero="+id_pasajero_a_modificar+";");
                
        return 0;
        }
    }
    
    public int eliminar_pasajero(int id_pasajero)
    {
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM pasajero WHERE id_pasajero="+id_pasajero);
        if (consulta.getColumnas().get(0).getFila(0).equals("-1")) {
            return 1;
        }else{
       
       Consulta consulta1 = CONTROLADOR_BD.consultarBD("DELETE FROM pasajero WHERE id_pasajero="+id_pasajero+";");  
       return 0;
        }
    }
    
     public ArrayList<Pasajero> get_pasajeros()
    {
        ArrayList<Pasajero> pasajeros_encontrados = new ArrayList<>();
        Pasajero pasajero_temporal=new Pasajero();
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM pasajero");
        for(int i = 0; i < consulta.getColumna("id_pasajero").getFilas().size(); i++)
        {
            pasajero_temporal.setId_pasajero(Integer.valueOf(consulta.getColumna("id_pasajero").getFila(i)));
            pasajero_temporal.setId_tarjeta(Integer.valueOf(consulta.getColumna("id_tarjeta").getFila(i)));
            pasajero_temporal.setNombres(consulta.getColumna("nombres").getFila(i));
            pasajero_temporal.setApellidos(consulta.getColumna("apellidos").getFila(i));
            pasajero_temporal.setFecha_nacimiento(consulta.getColumna("fecha_nacimiento").getFila(i));
            pasajero_temporal.setDireccion(consulta.getColumna("direccion").getFila(i));
            pasajero_temporal.setTelefono(consulta.getColumna("telefono").getFila(i));
            pasajero_temporal.setCorreo_electronico(consulta.getColumna("correo_electronico").getFila(i));
            
            pasajeros_encontrados.add(pasajero_temporal);
            pasajero_temporal=new Pasajero();
        }
        return pasajeros_encontrados;
    }
}
