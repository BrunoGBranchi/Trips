package br.com.trips.service;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.trips.model.Usuario;
import br.com.trips.model.Viagem;
import br.com.trips.repository.UsuarioRepository;
import br.com.trips.repository.ViagemRepository;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Service
public class ViagemService {

	@Autowired
	private ViagemRepository viagemRepository;

	@Autowired
	private UsuarioRepository usuarioRepository;

	@Autowired
	private QRCodeService qrCodeService;

	public void geraComprovantePassageiro(Long id, HttpServletResponse response, Principal principal) throws JRException, IOException {

		Map<String, Object> v = new HashMap<>();

		Optional<Viagem> findById = viagemRepository.findById(id);
		Usuario findUsuario = usuarioRepository.findByLogin(principal.getName());
		if (findById.isPresent()) {

			byte[] decodeBase64 = Base64
					.decodeBase64(qrCodeService.geraQRCode(findById.get().getId(), findUsuario.getId()).getBytes());
			
			v.put("viagem", findById.get());
			v.put("usuario", findUsuario);
			v.put("qrcode", new ByteArrayInputStream(decodeBase64));

			InputStream jasperStream = this.getClass().getResourceAsStream("/relatorios/comprovante.jrxml");

			JasperReport compilado = JasperCompileManager.compileReport(jasperStream);

			JasperPrint jasperPrint = JasperFillManager.fillReport(compilado, v);

			response.setContentType("application/pdf");

			response.setHeader("Content-Disposition", "attachment; filename=comprovante.pdf");

			final OutputStream outStream = response.getOutputStream();
			JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);

		}
	}
	
	public void geraListaPassageiros(Long id, HttpServletResponse response) throws JRException, IOException {

		Map<String, Object> v = new HashMap<>();

		Optional<Viagem> findById = viagemRepository.findById(id);
		//Usuario findUsuario = usuarioRepository.findByLogin(principal.getName());
		List<Usuario> passageiros = new ArrayList<>(findById.get().getPassageiros());
		if (findById.isPresent()) {
			
			v.put("viagem", findById.get());
			v.put("passageiros", passageiros);
			
			InputStream jasperStream = this.getClass().getResourceAsStream("/relatorios/Blank_A4.jrxml");

			JasperReport compilado = JasperCompileManager.compileReport(jasperStream);

			JasperPrint jasperPrint = JasperFillManager.fillReport(compilado, v, new JRBeanCollectionDataSource(passageiros));

			response.setContentType("application/pdf");

			response.setHeader("Content-Disposition", "inline; filename=ListaPassageiros.pdf");

			final OutputStream outStream = response.getOutputStream();
			JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);

		}
	}
	
	public void downloadRoteiro(Long id, HttpServletResponse response) throws JRException, IOException {

		Optional<Viagem> findById = viagemRepository.findById(id);
		if (findById.isPresent()) {

			byte[] decodeBase64 = Base64.decodeBase64(findById.get().getRoteiro());
			
			response.setContentType("application/pdf");

			response.setHeader("Content-Disposition", "attachment; filename=roteiro.pdf");

			final OutputStream outStream = response.getOutputStream();
			outStream.write(decodeBase64);
			outStream.flush();
		}
	}

}
