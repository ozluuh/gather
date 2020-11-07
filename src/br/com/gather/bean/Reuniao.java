package br.com.gather.bean;

/**
 * Classe que define o modelo Reuniao
 * 
 * @author luis
 * @version 1.0
 */
public class Reuniao {

	private int codigo;
	private String titulo;
	private String status;
	private Funcionario gestor;

	@Override
	public String toString() {
		return codigo + "," + gestor + "," + status + "," + titulo;
	}

	public Reuniao() {
		super();
	}

	public Reuniao(int codigo, Funcionario gestor, String status, String titulo) {
		super();
		this.codigo = codigo;
		this.gestor = gestor;
		this.status = status;
		this.titulo = titulo;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public Funcionario getGestor() {
		return gestor;
	}

	public void setGestor(Funcionario gestor) {
		this.gestor = gestor;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String descricao) {
		this.titulo = descricao;
	}

}
