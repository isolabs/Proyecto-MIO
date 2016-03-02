/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.controlador.operaciones;

/**
 *
 * @author jeisonOS
 */
public class Secuencia {
    private int id_Estacion;
        private int id_ruta;

        public Secuencia() {
        }

        public Secuencia(int id_Estacion, int id_ruta) {
            this.id_Estacion = id_Estacion;
            this.id_ruta = id_ruta;
        }

        public int getId_Estacion() {
            return id_Estacion;
        }

        public void setId_Estacion(int id_Estacion) {
            this.id_Estacion = id_Estacion;
        }

        public int getId_ruta() {
            return id_ruta;
        }

        public void setId_ruta(int id_ruta) {
            this.id_ruta = id_ruta;
        }
}
