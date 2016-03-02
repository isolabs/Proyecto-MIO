/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.controlador.operaciones.controlador_reportes;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import proyectomio.controlador.Controlador_Tarjeta;
import proyectomio.modelo.ConexionBD;

/**
 *
 * @author Alejandro
 */
public class Controlador_Reportes {

    public void reportesTarjetasVendidas(String FD01, String FD02)  {
        
        BufferedReader br = null;
        String documento = "";
        System.out.println(System.getProperty("user.dir"));
        try {
            String sCurrentLine;
            br = new BufferedReader(new FileReader("src/java/proyectomio/controlador/operaciones/controlador_reportes/TarjetasVendidasEstacionFecha.jrxml"));
            while ((sCurrentLine = br.readLine()) != null) {

                documento = documento + sCurrentLine + "\n";
            }
            documento = documento.replace("FD01", FD01);
            documento = documento.replace("FD02", FD02);
            br.close();

            File file = new File("src/java/proyectomio/controlador/operaciones/controlador_reportes/TarjetasVendidasEstacionFecha.jrxml");
            file.createNewFile();
            FileWriter writer = new FileWriter(file);
            writer.write(documento);
            writer.flush();
            writer.close();
            
            //JasperCompileManager.compileReportToFile("src/java/proyectomio/controlador/operaciones/controlador_reportes/TarjetasVendidasEstacionFecha.jrxml");
            JasperDesign jasperDesign = JRXmlLoader.load("src/java/proyectomio/controlador/operaciones/controlador_reportes/TarjetasVendidasEstacionFecha.jrxml");
         JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
        
            
            
        } catch (IOException e) {
            e.printStackTrace();
        } catch (JRException ex) {
            Logger.getLogger(Controlador_Tarjeta.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
    public void reportesPasajerosTarjetas(){
    
        try {
            
            ConexionBD conexionDB = new ConexionBD("localhost", "ProyectoMIO", "root", "root");
            
            Connection conn = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                
            }
            
            try {
                conn = DriverManager.getConnection(conexionDB.getDb_URL(), conexionDB.getUser(), conexionDB.getPass());
            } catch (SQLException ex) {
                Logger.getLogger(Controlador_Reportes.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            JasperReport jasperReport = JasperCompileManager.compileReport("report.jrxml");
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,new HashMap(), new JREmptyDataSource());
            JasperExportManager.exportReportToPdfFile(jasperPrint, "sample.pdf");
            
            /*JasperReport jasperReport;
            JasperPrint jasperPrint = null;
            System.out.println(new File("/home/jeisonOS/Proyecto/Proyecto-MIO/src/java/proyectomio/controlador/operaciones/controlador_reportes/ListadosPasajerosTarjetas.jasper").exists());
            try
            {
            //se carga el reporte
            URL  in=this.getClass().getResource( "/home/jeisonOS/Proyecto/Proyecto-MIO/src/java/proyectomio/controlador/operaciones/controlador_reportes/ListadosPasajerosTarjetas.jasper" );
            jasperReport=(JasperReport)JRLoader.loadObject(in);
            //se procesa el archivo jasper
            jasperPrint = JasperFillManager.fillReport(jasperReport, new HashMap(), conn );
            //se crea el archivo PDF
            JasperExportManager.exportReportToPdfFile( jasperPrint, "reporte.pdf");
            }
            catch (JRException ex)
            {
            System.err.println( "Error iReport: " + ex.getMessage() );
            }*/
        } catch (JRException ex) {
            Logger.getLogger(Controlador_Reportes.class.getName()).log(Level.SEVERE, null, ex);
            
        }
    }
}
