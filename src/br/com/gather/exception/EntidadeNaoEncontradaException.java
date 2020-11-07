package br.com.gather.exception;

public class EntidadeNaoEncontradaException extends Exception {

	private static final long serialVersionUID = 1L;

	public EntidadeNaoEncontradaException() {
		super("Entidade não encontrada");
	}

	public EntidadeNaoEncontradaException(String mensagem) {
		super(mensagem);
	}

}
