package br.com.trips.service;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.trips.model.Viagem;
import br.com.trips.repository.ViagemRepository;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;

@Service
public class ViagemService {
	
	@Autowired
	ViagemRepository viagemRepository;
	
	public List<Viagem> load(Long id){
		
		List<Viagem> v = viagemRepository.preencheRelatorio(id);
		
		
		/*
		 * InputStream jasperStream =
		 * this.getClass().getResourceAsStream("/relatorios/Comprovante.jasper");
		 * 
		 * JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
		 * 
		 * JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null,
		 * new JRBeanCollectionDataSource(viagemRepository.preencheRelatorio(id)));
		 * 
		 * response.setContentType("application/pdf");
		 * 
		 * response.setHeader("Content-Disposition",
		 * "inline; filename=comprovante.pdf");
		 * 
		 * final OutputStream outStream = response.getOutputStream();
		 * JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
		 */
		
		return v;
		
	}
	
}
