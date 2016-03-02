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
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import proyectomio.controlador.Controlador_Tarjeta;

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
    
            
        
    }
}
