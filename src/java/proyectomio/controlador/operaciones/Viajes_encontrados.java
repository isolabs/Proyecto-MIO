/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.controlador.operaciones;

import java.util.ArrayList;

/**
 *
 * @author jeisonOS
 */
public class Viajes_encontrados {
    private ArrayList<ArrayList<Secuencia>> secuencias;

        public Viajes_encontrados() {
            secuencias = new ArrayList<ArrayList<Secuencia>>();
        }

        public Viajes_encontrados(ArrayList<ArrayList<Secuencia>> secuencias) {
            this.secuencias = secuencias;
        }

        
        
        public ArrayList<ArrayList<Secuencia>> getSecuencias() {
            return secuencias;
        }

        public void setSecuencias(ArrayList<ArrayList<Secuencia>> secuencias) {
            this.secuencias = secuencias;
        }

        public void addSecuencias(ArrayList<Secuencia> secuencias) {
            this.secuencias.add(secuencias);
        }
}
