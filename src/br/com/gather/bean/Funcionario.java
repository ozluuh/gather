package br.com.gather.bean;

/**
 * Classe que define o modelo Funcionario
 * 
 * @author luis
 * @version 1.0
 */
public class Funcionario {

	private int codigo;
	private String cpfCnpj;
	private String nome;
	private String email;
	private String senha;
	private Departamento departamento;
	private Acesso acesso;
	private boolean ativo;
	private boolean primeiroAcesso;

	@Override
	public String toString() {
		return codigo + "," + cpfCnpj + "," + nome + "," + email + "," + senha + "," + departamento + ","
				+ acesso.getDescricao();
	}

	public Funcionario() {
		super();
	}

	public Funcionario(int codigo, String cpfCnpj, String nome, String email, String senha, Departamento departamento,
			Acesso acesso, boolean ativo, boolean primeiroAcesso) {
		super();
		this.codigo = codigo;
		this.cpfCnpj = cpfCnpj;
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.departamento = departamento;
		this.acesso = acesso;
		this.ativo = ativo;
		this.primeiroAcesso = primeiroAcesso;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getCpfCnpj() {
		return cpfCnpj;
	}

	public void setCpfCnpj(String cpfCnpj) {
		this.cpfCnpj = cpfCnpj;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Departamento getDepartamento() {
		return departamento;
	}

	public void setDepartamento(Departamento departamento) {
		this.departamento = departamento;
	}

	public Acesso getAcesso() {
		return acesso;
	}

	public void setAcesso(Acesso acesso) {
		this.acesso = acesso;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public boolean isPrimeiroAcesso() {
		return primeiroAcesso;
	}

	public void setPrimeiroAcesso(boolean primeiroAcesso) {
		this.primeiroAcesso = primeiroAcesso;
	}

}
