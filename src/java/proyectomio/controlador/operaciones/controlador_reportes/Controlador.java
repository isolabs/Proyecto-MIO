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
import proyectomio.controlador.Controlador_Tarjeta;

/**
 *
 * @author Alejandro
 */
public class Controlador {
     public void fecha(String FD01, String FD02){
         BufferedReader br = null;
         String documento = "";
		try {
			String sCurrentLine;
			br = new BufferedReader(new FileReader("C:\\Users\\Jul\\Google Drive\\bases de datos\\PROYECTO 2016-03-01 4\\Proyecto-MIO\\src\\java\\proyectomio\\reportes\\\\TarjetasVendidasEstacionFecha.jrxml"));
			while ((sCurrentLine = br.readLine()) != null) {
                                
				documento = documento + sCurrentLine;
			}
                        documento = documento.replace("FD01", FD01);
                        documento = documento.replace("FD02", FD02);
                        
                        File file = new File("C:\\Users\\Jul\\Google Drive\\archivo.jrxml");
                        file.createNewFile();
                        FileWriter writer = new FileWriter(file);
                        writer.write(documento);
                        writer.flush();
                        writer.close();
                        JasperCompileManager.compileReportToFile("archivo.jrxml", "nuevo.jasper");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JRException ex) {
            Logger.getLogger(Controlador_Tarjeta.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
			try {
				if (br != null)br.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
    }
}
