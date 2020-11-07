package br.com.gather.bean;

/**
 * Classe que define o tipo de acesso do usuário
 * 
 * @author luis
 * @version 1.0
 */
public enum Acesso {
	/**
	 * Código: 1<br />
	 * 
	 * Descrição: Administrador
	 */
	ADM(1, "Administrador"),
	/**
	 * Código: 2<br />
	 * 
	 * Descrição: Gestor
	 */
	GST(2, "Gestor"),
	/**
	 * Código: 3<br />
	 * Descrição: Funcionário
	 */
	FNC(3, "Funcionário");

	private int codigo;
	private String descricao;

	private Acesso(int codigo, String descricao) {
		this.descricao = descricao;
		this.codigo = codigo;
	}

	public String getDescricao() {
		return descricao;
	}

	public int getCodigo() {
		return codigo;
	}
}
