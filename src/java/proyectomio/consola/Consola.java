/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.consola;

//import proyectomio.controlador.Controlador_BD;
import proyectomio.controlador.Controlador_Reclamo;
import proyectomio.modelo.Reclamo;

/**
 *
 * @author jeisonOS
 */
public class Consola {
    
    public static void main(String [] args)
	{
            
            /*Controlador_BD controlador = new Controlador_BD();
            Consulta consulta = controlador.consultarBD("INSERT INTO bus VALUES ('B-03','1','1')");
            System.out.println(consulta.getColumna("Error").getTipo_de_dato());
            System.out.println(consulta.getColumna("Error").getCodigo_tipo_de_dato());*/
            Controlador_Reclamo cr = new Controlador_Reclamo();
            //Reclamo rc = new Reclamo(106, "2016-01-16", "MotivoX", "DesX", 0, 1143, 1058847076, -1);
            System.out.println(cr.resolverReclamo(105, 1058847076));
            //System.out.println(cr.obtenerReclamo(-1).get(1).getId_tiquete());
            
        }

    
}
