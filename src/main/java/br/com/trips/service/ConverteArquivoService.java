package br.com.trips.service;

import java.io.IOException;
import java.util.Base64;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ConverteArquivoService {
	
	public String converter(MultipartFile arquivo) throws IOException {
		String stArquivo = Base64.getEncoder().encodeToString(arquivo.getBytes());
		return stArquivo;
	}
	
}
