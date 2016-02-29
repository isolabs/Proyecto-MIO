/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.controlador.operaciones;

import java.util.ArrayList;
import proyectomio.accesoDatos.Controlador_BD;
import proyectomio.modelo.Consulta;

/**
 *
 * @author jeisonOS
 */
public class Controlador_Pasajero_operaciones {

    private class Rutas_Una_estacion {

        private int id_estacion;
        private ArrayList<Integer> rutas;

        public Rutas_Una_estacion() {
        }

        public Rutas_Una_estacion(int id_estacion, ArrayList<Integer> rutas) {
            this.id_estacion = id_estacion;
            this.rutas = rutas;
        }

        public int getId_estacion() {
            return id_estacion;
        }

        public void setId_estacion(int id_estacion) {
            this.id_estacion = id_estacion;
        }

        public ArrayList<Integer> getRutas() {
            return rutas;
        }

        public void setRutas(ArrayList<Integer> rutas) {
            this.rutas = rutas;
        }

    }

    private class Ruta_estacion {

        private int id_estacion;
        private String nombre_estacion;
        private int id_ruta;
        private String nombre_ruta;

        public Ruta_estacion() {
        }

        public Ruta_estacion(int id_estacion, String nombre_estacion, int id_ruta, String nombre_ruta) {
            this.id_estacion = id_estacion;
            this.nombre_estacion = nombre_estacion;
            this.id_ruta = id_ruta;
            this.nombre_ruta = nombre_ruta;
        }

        public int getId_estacion() {
            return id_estacion;
        }

        public void setId_estacion(int id_estacion) {
            this.id_estacion = id_estacion;
        }

        public String getNombre_estacion() {
            return nombre_estacion;
        }

        public void setNombre_estacion(String nombre_estacion) {
            this.nombre_estacion = nombre_estacion;
        }

        public int getId_ruta() {
            return id_ruta;
        }

        public void setId_ruta(int id_ruta) {
            this.id_ruta = id_ruta;
        }

        public String getNombre_ruta() {
            return nombre_ruta;
        }

        public void setNombre_ruta(String nombre_ruta) {
            this.nombre_ruta = nombre_ruta;
        }

        private void print() {
            System.out.println("{");
            System.out.println("    nombre_estacion:" + this.nombre_estacion);
            System.out.println("    id_estacion:" + this.id_estacion);
            System.out.println("    nombre_ruta:" + this.nombre_ruta);
            System.out.println("    id_ruta:" + this.id_ruta);
            System.out.println("}");
        }

    }

    public final Controlador_BD CONTROLADOR_BD;

    public Controlador_Pasajero_operaciones() {
        this.CONTROLADOR_BD = new Controlador_BD();
    }

    public void getRuta(int id_estacion_inicial, int id_estacion_final) {

        Consulta consulta = CONTROLADOR_BD.consultarBD("SELECT E.id_estacion,"
                + "E.nombre AS nombre_estacion,R1.id_ruta,R1.nombre AS nombre_ruta  "
                + "FROM estacion E INNER JOIN\n"
                + "(SELECT R.id_ruta,R.nombre,E.id_estacion \n"
                + "FROM ruta R INNER JOIN ruta_estacion \n"
                + "E ON R.id_ruta = E.id_ruta) R1 ON E.id_estacion = R1.id_estacion");

        ArrayList<Ruta_estacion> ruta_estacion = new ArrayList<>();

        for (int i = 0; i < consulta.getColumnas().get(0).getFilas().size(); i++) {
            Ruta_estacion tmp = new Ruta_estacion();
            tmp.setId_estacion(Integer.valueOf(consulta.getColumna("id_estacion").getFila(i)));
            tmp.setNombre_estacion(consulta.getColumnas().get(1).getFilas().get(i));
            tmp.setId_ruta(Integer.valueOf(consulta.getColumna("id_ruta").getFila(i)));
            tmp.setNombre_ruta(consulta.getColumnas().get(3).getFilas().get(i));
            ruta_estacion.add(tmp);
        }

        //for (int i = 0; i < ruta_estacion.size(); i++) {ruta_estacion.get(i).print();}
        ArrayList<Integer> id_estaciones = new ArrayList<>();
        for (int i = 0; i < ruta_estacion.size(); i++) {

            boolean flag = true;
            for (int j = 0; j < id_estaciones.size(); j++) {

                int tmp_0 = ruta_estacion.get(i).getId_estacion();
                int tmp_1 = id_estaciones.get(j);
                if (tmp_0 == tmp_1) {
                    flag = false;
                }

            }
            if (flag) {
                id_estaciones.add(ruta_estacion.get(i).getId_estacion());
            }
        }

        //System.out.println(id_estaciones);
        ArrayList<Rutas_Una_estacion> rutas_una_estacion = new ArrayList<>();

        for (int i = 0; i < id_estaciones.size(); i++) {
            Rutas_Una_estacion tmp = new Rutas_Una_estacion();
            tmp.setId_estacion(id_estaciones.get(i));
            ArrayList<Integer> rutas = new ArrayList<>();
            for (int j = 0; j < ruta_estacion.size(); j++) {

                int tmp_0 = ruta_estacion.get(j).getId_estacion();
                int tmp_1 = tmp.getId_estacion();

                if (tmp_0 == tmp_1) {
                    rutas.add(ruta_estacion.get(j).getId_ruta());
                }

            }
            tmp.setRutas(rutas);
            rutas_una_estacion.add(tmp);
        }
        
        //for (int i = 0; i < rutas_una_estacion.size(); i++) {System.out.print(rutas_una_estacion.get(i).getId_estacion());System.out.println(rutas_una_estacion.get(i).getRutas());}
        
        ArrayList<Integer> rutas_interceptadas = new ArrayList<>();
        Rutas_Una_estacion estacion_inicial = new Rutas_Una_estacion();
        Rutas_Una_estacion estacion_final = new Rutas_Una_estacion();
        
        for (int i = 0; i < rutas_una_estacion.size(); i++) {
            
            if(rutas_una_estacion.get(i).getId_estacion() == id_estacion_inicial){
                estacion_inicial = rutas_una_estacion.get(i);
            }
            
            if(rutas_una_estacion.get(i).getId_estacion() == id_estacion_final){
                estacion_final = rutas_una_estacion.get(i);
            }
            
        }
        
        for (int i = 0; i < estacion_inicial.getRutas().size(); i++) {
            
            for (int j = 0; j < estacion_final.getRutas().size(); j++) {
                
                int tmp_0 = estacion_inicial.getRutas().get(i);
                int tmp_1 = estacion_final.getRutas().get(j);
                if (tmp_0 == tmp_1){
                    rutas_interceptadas.add(tmp_0);
                }
                
            }
            
        }
        
        System.out.println(rutas_interceptadas);
        
    }

}
