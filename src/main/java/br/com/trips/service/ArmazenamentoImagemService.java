package br.com.trips.service;

import org.springframework.stereotype.Service;

@Service
public class ArmazenamentoImagemService {
	
	//@Autowired
	//ImagensRepository imagensRepository;
	
	/*
	 * public Imagens armazenaArquivo(MultipartFile arquivo) throws Exception {
	 * 
	 * String nomeArquivo = StringUtils.cleanPath(arquivo.getOriginalFilename());
	 * 
	 * try { if (nomeArquivo.contains("..")) { throw new
	 * Exception("Nome de arquivo invalido: " + nomeArquivo); }
	 * 
	 * Imagens imagem = new Imagens(nomeArquivo, arquivo.getContentType(),
	 * arquivo.getBytes());
	 * 
	 * return imagensRepository.saveAndFlush(imagem);
	 * 
	 * } catch (IOException ex) { throw new
	 * FileStorageException("Não pode armazenar o arquivo "
	 * +nomeArquivo+", por favor tente novamente!"); }
	 * 
	 * }
	 */
	
	/*
	 * public Imagens getImagem(Long id) { return
	 * imagensRepository.findById(id).orElseThrow(() -> new
	 * ArquivoNaoEncontradoException("Arquivo não encontrado")); }
	 */
	
}
