/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package accesoDatos;

import java.util.ArrayList;
import proyectomio.modelo.Consulta;
import proyectomio.modelo.Empleado;

/**
 *
 * @author Alejandro
 */
public class DaoEmpleado {
    
    private final Controlador_BD CONTROLADOR_BD = new Controlador_BD();
    
    public int adicionar_empleado(Empleado un_empleado)
    { 
         Consulta consulta = CONTROLADOR_BD.consultarBD("INSERT INTO empleado VALUES "
                 + "(" + un_empleado.getId_empleado()+",'"+un_empleado.getNombres()+"','"+ un_empleado.getApellidos()+ "','" +un_empleado.getFecha_nacimiento()+"','"+un_empleado.getDireccion()+"','"+un_empleado.getTelefono()+"','"+un_empleado.getCorreo_electronico()+"','"+ un_empleado.getCargo()+"');");
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
    si retorna 0 se modifico el empleado
    si retorna 1 id_empleado no existe
    */
    
    public int modificar_empleado(int id_empleado_a_modificar, Empleado nuevo_empleado)
    {
        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM empleado WHERE id_empleado="+id_empleado_a_modificar);
        if (consulta.getColumnas().get(0).getFila(0).equals("-1")) {
            return 1;
        }else{
        Consulta consulta2 = CONTROLADOR_BD.consultarBD("UPDATE empleado SET id_empleado="+nuevo_empleado.getId_empleado()+",nombres='"+nuevo_empleado.getNombres()+"', apellidos='"+nuevo_empleado.getApellidos()+"', fecha_nacimiento='"+nuevo_empleado.getFecha_nacimiento()+"', direccion='"+nuevo_empleado.getDireccion()+"', telefono='"+nuevo_empleado.getTelefono()+"', correo_electronico='"+nuevo_empleado.getCorreo_electronico()+"', cargo='"+nuevo_empleado.getCargo()+"' where id_empleado="+id_empleado_a_modificar+";");

        return 0;
        }
    }
    
    /*
    si retorna 0 se elimino el empleado
    si retorna 1 id_empleado no existe
    */
    
    public int eliminar_empleado(int id_empleado)
    {
       Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM empleado WHERE id_empleado="+id_empleado);
        if (consulta.getColumnas().get(0).getFila(0).equals("-1")) {
            return 1;
        }else{ 
       Consulta consulta1 = CONTROLADOR_BD.consultarBD("DELETE FROM empleado WHERE id_empleado="+id_empleado+";");  
       return 0;
        }
    }
    
    
    
    
     public boolean login(String email, String nombre)
   {
       Consulta consulta = new Consulta();
       String enunciado_consulta = "Select * from empleado where correo_electronico = '"+email+"' and nombres = '"+nombre+"'";
       consulta = CONTROLADOR_BD.consultarBD(enunciado_consulta);
       if(consulta.getColumna("nombre").getFilas().size()>0)
           return true;
       return false;
   }
     /*
    esta consulta por su naturaleza no presentara errores, los dos unicos casos posibles es uqe retorne algo
    o no lo haga (por que no hallan buses registrados en la bd, por lo tanto en caso de que no halla se sabra 
    por el echo de que el array estara vacio.
    */
     
     public ArrayList<Empleado> get_empleados(int id_empleado) {
        ArrayList<Empleado> empleados_encontrados = new ArrayList<>();

        if (id_empleado == -1) {

            Empleado empleado_temporal = new Empleado();
            Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM empleado");
            for (int i = 0; i < consulta.getColumna("id_empleado").getFilas().size(); i++) {
                empleado_temporal.setId_empleado(Integer.valueOf(consulta.getColumna("id_empleado").getFila(i)));
                empleado_temporal.setNombres(consulta.getColumna("nombres").getFila(i));
                empleado_temporal.setApellidos(consulta.getColumna("apellidos").getFila(i));
                empleado_temporal.setFecha_nacimiento(consulta.getColumna("fecha_nacimiento").getFila(i));
                empleado_temporal.setDireccion(consulta.getColumna("direccion").getFila(i));
                empleado_temporal.setTelefono(consulta.getColumna("telefono").getFila(i));
                empleado_temporal.setCorreo_electronico(consulta.getColumna("correo_electronico").getFila(i));
                empleado_temporal.setCargo(consulta.getColumna("cargo").getFila(i));
                empleados_encontrados.add(empleado_temporal);
                empleado_temporal = new Empleado();
            }
            return empleados_encontrados;
        } else {
            
            Empleado empleado_temporal = new Empleado();
            Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT * FROM empleado WHERE id_empleado = " + id_empleado + ";");
            for (int i = 0; i < consulta.getColumna("id_empleado").getFilas().size(); i++) {
                empleado_temporal.setId_empleado(Integer.valueOf(consulta.getColumna("id_empleado").getFila(i)));
                empleado_temporal.setNombres(consulta.getColumna("nombres").getFila(i));
                empleado_temporal.setApellidos(consulta.getColumna("apellidos").getFila(i));
                empleado_temporal.setFecha_nacimiento(consulta.getColumna("fecha_nacimiento").getFila(i));
                empleado_temporal.setDireccion(consulta.getColumna("direccion").getFila(i));
                empleado_temporal.setTelefono(consulta.getColumna("telefono").getFila(i));
                empleado_temporal.setCorreo_electronico(consulta.getColumna("correo_electronico").getFila(i));
                empleado_temporal.setCargo(consulta.getColumna("cargo").getFila(i));
                empleados_encontrados.add(empleado_temporal);
                empleado_temporal = new Empleado();
            }
            return empleados_encontrados;

        }

    }
}
