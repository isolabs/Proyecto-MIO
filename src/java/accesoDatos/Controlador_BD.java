/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package accesoDatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import proyectomio.modelo.Columna;
import proyectomio.modelo.ConexionBD;
import proyectomio.modelo.Consulta;

/**
 *
 * @author jeisonOS
 */
public class Controlador_BD {

    public Consulta consultarBD(String consulta) {
        
        ConexionBD conexionDB = new ConexionBD("localhost", "ProyectoMIO", "root", "root");
        
        Connection conn = null;
        Statement stmt = null;
        try {

            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(conexionDB.getDb_URL(), conexionDB.getUser(), conexionDB.getPass());

            stmt = conn.createStatement();
            String sql;
            sql = consulta;
            
            if (!sql.contains("SELECT")) {

                boolean rs = stmt.execute(sql);
                Consulta retorno = new Consulta();
                
                Columna tmp = new Columna("0", "0", 0);
                tmp.insertarFila("0");
                retorno.insertarColumna(tmp);
                
                return retorno;

            }
            ResultSet rs = stmt.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();
            int cantidadColumnas = rsmd.getColumnCount();
            ArrayList<String> tipo_columna = new ArrayList<>();
            Consulta consulta_Tablas = new Consulta();
            for (int i = 0; i < cantidadColumnas; i++) {
                Columna tmp = new Columna(rsmd.getColumnName(i + 1), rsmd.getColumnTypeName(i + 1), rsmd.getColumnType(i + 1));
                //System.out.println(rsmd.getColumnName(i+1) + " " + rsmd.getColumnTypeName(i+1));
                consulta_Tablas.insertarColumna(tmp);
            }
            // TIMESTAMP
            // DATE
            // VARCHAR
            // INT

            while (rs.next()) {

                for (int i = 0; i < cantidadColumnas; i++) {

                    consulta_Tablas.getColumnas().get(i).insertarFila(rs.getString(i + 1));
                }

            }
            rs.close();
            stmt.close();
            conn.close();
            return consulta_Tablas;
        } catch (SQLException  se0) {
            System.err.println("SQLDriver se0: " + se0.getMessage());
                Consulta tmp = new Consulta();
                Columna tmp_col = new Columna("Error",se0.getMessage(), se0.getErrorCode());
                tmp_col.insertarFila(String.valueOf(se0.getErrorCode()));
                tmp.insertarColumna(tmp_col);
                
                return tmp;

        } catch (ClassNotFoundException ex) {
            System.err.println("SQLDriver ex: " + ex.getMessage());
        } //Error de la clase
        finally {
            //Limpieza
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se2) {
                
                System.err.println("SQLDriver se2: " + se2.getMessage());
                Consulta tmp = new Consulta();
                Columna tmp_col = new Columna("Error",se2.getMessage(), se2.getErrorCode());
                tmp_col.insertarFila(String.valueOf(se2.getErrorCode()));
                tmp.insertarColumna(tmp_col);
                
                return tmp;
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                System.err.println("SQLDriver se: " + se.getMessage());
                Consulta tmp = new Consulta();
                Columna tmp_col = new Columna("Error",se.getMessage(), se.getErrorCode());
                tmp_col.insertarFila(String.valueOf(se.getErrorCode()));
                tmp.insertarColumna(tmp_col);
                
                return tmp;
            }
        }//end try

        return new Consulta();
    }

}
