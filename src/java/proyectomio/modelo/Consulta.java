/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.modelo;

import java.util.ArrayList;

/**
 *
 * @author jeisonOS
 */
public class Consulta {
    
    private ArrayList <Columna> columnas;

    public Consulta() {
        this.columnas = new ArrayList<>();
    }

    public Consulta(ArrayList<Columna> columnas) {
        this.columnas = columnas;
    }
    

    public ArrayList<Columna> getColumnas() {
        return columnas;
    }
    
    public void insertarColumna(Columna columna){
        this.columnas.add(columna);
    }
    
    public Columna getColumna(String nombre) {
        
        for (int i = 0; i < columnas.size(); i++) {
            if(columnas.get(i).getNombre().equals(nombre)){
                return columnas.get(i); 
            }
        }
        return new Columna("-1", "-1", -1);
    }
    
    public Consulta getFila(int posicion) {
        Consulta retorno = new Consulta();
        for (int i = 0; i < columnas.size(); i++) {
            Columna tmp =  new Columna(columnas.get(i).getNombre(), columnas.get(i).getTipo_de_dato(), columnas.get(i).getCodigo_tipo_de_dato());
            tmp.insertarFila(columnas.get(i).getFila(posicion));
            retorno.insertarColumna(tmp);
        }
        return retorno;
    }

    public void setColumnas(ArrayList<Columna> columnas) {
        this.columnas = columnas;
    }
    
    
    public void imprimirFila(int pos){
         System.out.print("{");
        for (int i = 0; i < this.columnas.size(); i++) {
            if (i==this.columnas.size()-1){
            System.out.print(this.columnas.get(i).getFila(pos));}
            else{
            System.out.print(this.columnas.get(i).getFila(pos) + ",");
            }
        }
        System.out.print("}\n");
    }
    
}
