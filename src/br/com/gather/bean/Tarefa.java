package br.com.gather.bean;

/**
 * Classe que define o modelo Tarefa
 * 
 * @author luis
 * @version 1.0
 */
public class Tarefa {

	private int codigo;
	private String titulo;
	private String status;
	private Funcionario funcionario;
	private Reuniao reuniao;
	private String observacao;

	@Override
	public String toString() {
		return codigo + "," + titulo + "," + observacao + "," + status + "," + funcionario + "," + reuniao;
	}

	public Tarefa() {
		super();
	}

	public Tarefa(int codigo, String titulo, String status, Funcionario funcionario, Reuniao reuniao,
			String observacao) {
		super();
		this.codigo = codigo;
		this.titulo = titulo;
		this.status = status;
		this.funcionario = funcionario;
		this.reuniao = reuniao;
		this.observacao = observacao;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Funcionario getFuncionario() {
		return funcionario;
	}

	public void setFuncionario(Funcionario funcionario) {
		this.funcionario = funcionario;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public Reuniao getReuniao() {
		return reuniao;
	}

	public void setReuniao(Reuniao reuniao) {
		this.reuniao = reuniao;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

}
