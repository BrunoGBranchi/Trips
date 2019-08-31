package br.com.trips.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class ArquivoNaoEncontradoException extends RuntimeException{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ArquivoNaoEncontradoException(String message) {
		super(message);
	}
	
	public ArquivoNaoEncontradoException(String message, Throwable cause) {
		super(message, cause);
	}
	
}
