package br.com.gather.bean;

/**
 * Classe que define o modelo Departamento
 * 
 * @author luis
 * @version 1.0
 */
public class Departamento {

	int codigo;
	String nome;

	@Override
	public String toString() {
		return codigo + "," + nome;
	}

	public Departamento() {
		super();
	}

	public Departamento(int id, String nome) {
		super();
		this.codigo = id;
		this.nome = nome;
	}

	public Departamento(String nome) {
		super();
		this.nome = nome;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
