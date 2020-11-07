package br.com.gather.exception;

public class DadoInvalidoException extends Exception {

	private static final long serialVersionUID = 1L;

	public DadoInvalidoException() {
		super("Dado inválido");
	}

	public DadoInvalidoException(String mensagem) {
		super(mensagem);
	}

}
