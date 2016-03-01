/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.controlador.operaciones;

import java.io.IOException;
import java.util.ArrayList;
import proyectomio.accesoDatos.Controlador_BD;
import proyectomio.modelo.Columna;
import proyectomio.modelo.Consulta;

/**
 *
 * @author jeisonOS
 */
public class Controlador_Pasajero_operaciones {

    private class Nivel {

        private int id_nivel;
        private int id_estacion_atras;
        private int id_actual;
        private int ruta_mediadora;
        private ArrayList<Nivel> hijos;

        public Nivel() {
        }

        public Nivel(int id_nivel, int id_estacion_atras, int id_actual, int ruta_mediadora, ArrayList<Nivel> hijos) {
            this.id_nivel = id_nivel;
            this.id_estacion_atras = id_estacion_atras;
            this.id_actual = id_actual;
            this.ruta_mediadora = ruta_mediadora;
            this.hijos = hijos;
        }

        public int getId_nivel() {
            return id_nivel;
        }

        public void setId_nivel(int id_nivel) {
            this.id_nivel = id_nivel;
        }

        public int getId_estacion_atras() {
            return id_estacion_atras;
        }

        public void setId_estacion_atras(int id_estacion_atras) {
            this.id_estacion_atras = id_estacion_atras;
        }

        public int getId_actual() {
            return id_actual;
        }

        public void setId_actual(int id_actual) {
            this.id_actual = id_actual;
        }

        public int getRuta_mediadora() {
            return ruta_mediadora;
        }

        public void setRuta_mediadora(int ruta_mediadora) {
            this.ruta_mediadora = ruta_mediadora;
        }

        public ArrayList<Nivel> getHijos() {
            return hijos;
        }

        public void setHijos(ArrayList<Nivel> hijos) {
            this.hijos = hijos;
        }

    }

    private class Interseccion {

        private int id_estacion_A;
        private int id_estacion_b;
        ArrayList<Integer> intersecciones;

        public Interseccion() {
        }

        public Interseccion(int id_estacion_A, int id_estacion_b, ArrayList<Integer> intersecciones) {
            this.id_estacion_A = id_estacion_A;
            this.id_estacion_b = id_estacion_b;
            this.intersecciones = intersecciones;
        }

        public int getId_estacion_A() {
            return id_estacion_A;
        }

        public void setId_estacion_A(int id_estacion_A) {
            this.id_estacion_A = id_estacion_A;
        }

        public int getId_estacion_b() {
            return id_estacion_b;
        }

        public void setId_estacion_b(int id_estacion_b) {
            this.id_estacion_b = id_estacion_b;
        }

        public ArrayList<Integer> getIntersecciones() {
            return intersecciones;
        }

        public void setIntersecciones(ArrayList<Integer> intersecciones) {
            this.intersecciones = intersecciones;
        }

    }

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

    private ArrayList<Integer> interceptar(ArrayList<Integer> arreglo_A, ArrayList<Integer> arreglo_B) {

        ArrayList<Integer> valores_interceptados = new ArrayList<>();

        for (int i = 0; i < arreglo_A.size(); i++) {

            for (int j = 0; j < arreglo_B.size(); j++) {

                int tmp_0 = arreglo_A.get(i);
                int tmp_1 = arreglo_B.get(j);
                if (tmp_0 == tmp_1) {
                    valores_interceptados.add(tmp_0);
                }

            }

        }

        return valores_interceptados;

    }

    public void getRutaN(int id_estacion_inicial, int id_estacion_final) {

        Consulta consulta = llegada(id_estacion_inicial, id_estacion_final, 1, "");
        System.out.println(consulta.getColumnas().size());
        for (int i = 0; i < consulta.getColumnas().get(0).getFilas().size(); i++) {
            int tmp_0 = Integer.valueOf(consulta.getColumnas().get(consulta.getColumnas().size() - 1).getFila(i));
            if (tmp_0 == id_estacion_inicial) {
                consulta.imprimirFila(i);
            }

        }
    }

    private Consulta llegada(int id_estacion_inicial, int id_estacion_final, int contador, String consulta_anterior) {
        String sql = generarConsulta(id_estacion_final, consulta_anterior, contador);
        Consulta consulta = CONTROLADOR_BD.consultarBD(sql);
        if (consulta.getColumnas().get(consulta.getColumnas().size() - 1).getFilas().contains(String.valueOf(id_estacion_inicial))) {
            return consulta;
        } else {
            return llegada(id_estacion_inicial, id_estacion_final, (contador + 1), sql);
        }

    }

    private String generarConsulta(int id_estacion_final, String consultaPrevia, int contador_nivel) {
        //Estacion-Ruta = 1 Vez

        if (contador_nivel == 1) {
            String back = "SELECT R.id_ruta,R.id_estacion,A.id_ruta AS id_ruta_1,A.id_estacion AS id_estacion_1 FROM ruta_estacion A INNER JOIN (";
            String base = "SELECT id_ruta,id_estacion FROM ruta_estacion WHERE id_estacion = " + id_estacion_final;
            String next = ")R ON A.id_ruta = R.id_ruta";

            return back + base + next;
        } else {

            //Estacion
            String columnas_a_mostrar = "SELECT ";
            for (int i = 0; i < contador_nivel + 1; i++) {
                if (i == 0) {
                    columnas_a_mostrar = columnas_a_mostrar + "R.id_ruta" + ",R.id_estacion,";
                } else if (i == contador_nivel) {
                    columnas_a_mostrar = columnas_a_mostrar + "A.id_ruta AS id_ruta_" + (i) + ",A.id_estacion AS id_estacion_" + (i);
                } else {
                    columnas_a_mostrar = columnas_a_mostrar + "R.id_ruta_" + i + ",R.id_estacion_" + i + ",\n";
                }
            }
            columnas_a_mostrar = columnas_a_mostrar + " FROM ruta_estacion A INNER JOIN (\n";

            String base = consultaPrevia;

            String next = ")R \nON A.id_estacion = R.id_estacion_" + (contador_nivel - 1);

            String consulta_estacion = columnas_a_mostrar + "\n" + base + "\n" + next + "\n";
            /*System.out.println(columnas_a_mostrar);
            System.out.println(base);
            System.out.println(next);*/

            //Ruta
            String columnas_a_mostrar_rutas = "SELECT ";
            for (int i = 0; i < contador_nivel + 2; i++) {
                if (i == 0) {
                    columnas_a_mostrar_rutas = columnas_a_mostrar_rutas + "R.id_ruta" + ",R.id_estacion,";
                } else if (i == contador_nivel + 1) {
                    columnas_a_mostrar_rutas = columnas_a_mostrar_rutas + "A.id_ruta AS id_ruta_" + (i) + ",A.id_estacion AS id_estacion_" + (i);
                } else {
                    columnas_a_mostrar_rutas = columnas_a_mostrar_rutas + "R.id_ruta_" + i + ",R.id_estacion_" + i + ",\n";
                }
            }
            columnas_a_mostrar_rutas = columnas_a_mostrar_rutas + " FROM ruta_estacion A INNER JOIN (\n";

            String base_ruta = consulta_estacion;

            String next_ruta = ")R \nON A.id_ruta = R.id_ruta_" + (contador_nivel - 1);

            String consulta_final = columnas_a_mostrar_rutas + "\n" + base_ruta + "\n" + next_ruta + "\n";

            return consulta_final;
        }

    }

}
