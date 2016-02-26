/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.modelo;

/**
 *
 * @author lusho
 */
public class Bus {

    private String placa;
    private int id_ruta;
    private int numero_pasajeros;
    private String tipo;/*0 alimentador,  1 bus de un solo bagon, 2 bus de doble bagon*/
    
    public Bus(String placa, int id_ruta, int numero_pasajeros, String tipo)
    {
        this.placa=placa;
        this.id_ruta=id_ruta;
        this.numero_pasajeros=numero_pasajeros;
        this.tipo = tipo;
    }
    
    public Bus(){
         this.placa="";
        this.id_ruta=0;
        this.numero_pasajeros=0;
        this.tipo = "";
    }

    /**
     * @return the placa
     */
    public String getPlaca() {
        return placa;
    }

    /**
     * @param placa the placa to set
     */
    public void setPlaca(String placa) {
        this.placa = placa;
    }

    /**
     * @return the id_ruta
     */
    public int getId_ruta() {
        return id_ruta;
    }

    /**
     * @param id_ruta the id_ruta to set
     */
    public void setId_ruta(int id_ruta) {
        this.id_ruta = id_ruta;
    }

    /**
     * @return the numero_pasajeros
     */
    public int getNumero_pasajeros() {
        return numero_pasajeros;
    }

    /**
     * @param numero_pasajeros the numero_pasajeros to set
     */
    public void setNumero_pasajeros(int numero_pasajeros) {
        this.numero_pasajeros = numero_pasajeros;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

}
