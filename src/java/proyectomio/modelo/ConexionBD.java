/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.modelo;

/**
 *
 * @author jeisonOS
 */
public class ConexionBD {

    // JDBC driver y URL de la base de datos
    private String db_URL;

    //  Datos de acceso a la base de datos.
    private String user;
    private String pass;

    public ConexionBD(String host, String db_name, String user, String pass) {
        this.db_URL = "jdbc:mysql://" + host + "/" + db_name;
        this.user = user;
        this.pass = pass;
    }

    public String getDb_URL() {
        return db_URL;
    }

    public String getUser() {
        return user;
    }

    public String getPass() {
        return pass;
    }

}
