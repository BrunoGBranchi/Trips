package br.com.trips.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.trips.model.Viagem;
import br.com.trips.repository.ViagemRepository;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

@Service
public class ViagemService {

	@Autowired
	ViagemRepository viagemRepository;

	public void load(Long id, HttpServletResponse response) throws JRException, IOException {

		Map<String, Object> v = new HashMap<>();
		
		Optional<Viagem> findById = viagemRepository.findById(id);
		
		if (findById.isPresent()) {
			
			v.put("viagem", findById.get()); 
			
			InputStream jasperStream = this.getClass().getResourceAsStream("/relatorios/comprovante.jrxml");
			
			JasperReport compilado = JasperCompileManager.compileReport(jasperStream);

			JasperPrint jasperPrint = JasperFillManager.fillReport(compilado, v);

			response.setContentType("application/pdf");

			response.setHeader("Content-Disposition", "inline; filename=comprovante.pdf");

			final OutputStream outStream = response.getOutputStream();
			JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
			
		}	
	}

}
