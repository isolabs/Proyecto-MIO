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
public class Columna {
    private String nombre;
    private String tipo_de_dato;
    private int codigo_tipo_de_dato;
    private ArrayList <String> filas;

    public Columna(String nombre, String tipo_de_dato, int codigo_tipo_de_dato) {
        this.nombre = nombre;
        this.tipo_de_dato = tipo_de_dato;
        this.codigo_tipo_de_dato = codigo_tipo_de_dato;
        this.filas = new ArrayList<>();
    }
    
    public String getNombre() {
        return nombre;
    }

    public String getTipo_de_dato() {
        return tipo_de_dato;
    }

    public int getCodigo_tipo_de_dato() {
        return codigo_tipo_de_dato;
    }

    public ArrayList<String> getFilas() {
        return filas;
    }
    
    public void insertarFila(String dato){
        this.filas.add(dato);
    }
    
    public String getFila(int posicion){
        if ((posicion >= 0)&&(posicion<=filas.size())&&(this.filas.size()>0)){
            return filas.get(posicion);
        }else{
            return "-1";
        }
    }
    
    public void print(){
    
        System.out.print("{\n");
        System.out.print("  Columna:" + this.nombre + ";\n");
        System.out.print("  Dato:" + this.tipo_de_dato + "(Codigo:" + this.codigo_tipo_de_dato + ");\n");
        System.out.print("  #Filas:" + this.filas.size() + ";\n");
        for (int i = 0; i < this.filas.size(); i++) {
            System.out.print("  " + i + ":"  + this.filas.get(i) + ";\n");
        }
        System.out.print("}\n");
        
    }
    
}
