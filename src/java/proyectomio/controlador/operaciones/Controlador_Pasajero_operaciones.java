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

    public Viajes_encontrados getRutaN(int id_estacion_inicial, int id_estacion_final) {

        //ArrayList<Object>rutas_encontradas = new ArrayList<>();
        Viajes_encontrados v_encontrados = new Viajes_encontrados();
        
        Consulta consulta = llegada(id_estacion_inicial, id_estacion_final, 1, "");
        System.out.println(consulta.getColumnas().size());
        for (int i = 0; i < consulta.getColumnas().get(0).getFilas().size(); i++) {
            int tmp_0 = Integer.valueOf(consulta.getColumnas().get(consulta.getColumnas().size() - 1).getFila(i));
            if (tmp_0 == id_estacion_inicial) {
                consulta.imprimirFila(i);
                ArrayList<String>estaciones = new ArrayList<>();
                ArrayList<String>rutas = new ArrayList<>();
                for (int j = (consulta.getColumnas().size() - 1); j > 0; j=j-2) {
                    System.out.println(consulta.getColumnas().get(j).getFila(i));
                    estaciones.add(consulta.getColumnas().get(j).getFila(i));
                }
                for (int j = (consulta.getColumnas().size() - 2); j > -1; j=j-2) {
                    System.out.println(consulta.getColumnas().get(j).getFila(i));
                    rutas.add(consulta.getColumnas().get(j).getFila(i));
                }
                
                ArrayList<Integer>posiciones_tener_cuenta = new ArrayList<>();
                for (int j = estaciones.size()-1; j > -1; j--) {
                    String pivote = estaciones.get(j);
                    int contador = 0;
                    int posicion_ultima_repeticion = -1;
                    for (int k = estaciones.size()-1; k > -1; k--) {
                        if (estaciones.get(k).equals(pivote)){
                            contador++;
                            posicion_ultima_repeticion = k;
                        }
                        if ((estaciones.get(k).equals(pivote))&&(contador>1)){
                            posicion_ultima_repeticion = k;
                        }
                        
                    }
                    if (!(posiciones_tener_cuenta.contains(posicion_ultima_repeticion))){
                        posiciones_tener_cuenta.add(posicion_ultima_repeticion);
                    }
                }
                System.out.println(posiciones_tener_cuenta);
                ArrayList<Secuencia>secuencia_de_paradas = new ArrayList<>();
                for (int j = posiciones_tener_cuenta.size()-1; j > -1; j--) {
                    System.out.println(estaciones.get(posiciones_tener_cuenta.get(j)) + " RUTA " + rutas.get(posiciones_tener_cuenta.get(j)));
                    Secuencia tmp = new Secuencia();
                    tmp.setId_Estacion(Integer.valueOf(estaciones.get(posiciones_tener_cuenta.get(j))));
                    tmp.setId_ruta(Integer.valueOf(rutas.get(posiciones_tener_cuenta.get(j))));
                    secuencia_de_paradas.add(tmp);
                    
                }
                v_encontrados.addSecuencias(secuencia_de_paradas);
                
            }

        }
        
        return v_encontrados;
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
