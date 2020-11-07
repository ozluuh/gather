package br.com.gather.bo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import br.com.gather.bean.Funcionario;
import br.com.gather.dao.FuncionarioDao;
import br.com.gather.exception.DadoInvalidoException;
import br.com.gather.exception.EntidadeNaoEncontradaException;
import br.com.gather.factory.AbstractDaoFactory;
import br.com.gather.util.StringUtils;

public class FuncionarioBo {

	private FuncionarioDao dao;
	private Connection conexao;

	public FuncionarioBo(Connection conexao) throws ClassNotFoundException, SQLException {
		dao = AbstractDaoFactory.getDaoFactory(AbstractDaoFactory.MYSQL).getFuncionarioDao(conexao);
		this.conexao = conexao;
	}

	/**
	 * Método responsável por realizar a validação dos dados do funcionário
	 * @param funcionario objeto funcionário
	 * @throws DadoInvalidoException
	 */
	private void validacao(Funcionario funcionario) throws DadoInvalidoException {
		if (funcionario.getAcesso() == null) {
			throw new DadoInvalidoException("Tipo de acesso não informado");
		}
		if (funcionario.getDepartamento().getCodigo() == 0) {
			throw new DadoInvalidoException("Departamento não informado");
		}
		if (StringUtils.isNullOrEmpty(funcionario.getCpfCnpj())) {
			throw new DadoInvalidoException("Número do CPF/CNPJ não informado");
		}
		if (StringUtils.isSizeLessThan(funcionario.getCpfCnpj(), 11)
				|| StringUtils.isSizeMoreThan(funcionario.getCpfCnpj(), 14)
				|| StringUtils.isSizeBetween(funcionario.getCpfCnpj(), 11, 14)) {
			throw new DadoInvalidoException("CPF/CNPJ informado incorretamente");
		}
		if (StringUtils.isNullOrEmpty(funcionario.getNome())) {
			throw new DadoInvalidoException("Nome não informado");
		}
		if (StringUtils.isSizeMoreThan(funcionario.getNome(), 60)) {
			throw new DadoInvalidoException("Nome não pode exceder 60 caracteres");
		}
		if (StringUtils.isNullOrEmpty(funcionario.getEmail())) {
			throw new DadoInvalidoException("Email não informado");
		}
		if (StringUtils.isSizeMoreThan(funcionario.getEmail(), 120)) {
			throw new DadoInvalidoException("Email não pode exceder 120 caracteres");
		}
	}

	/**
	 * Método responsável por realizar o registro de um funcionário
	 * @param funcionario objeto funcionário
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	public void cadastrar(Funcionario funcionario) throws SQLException, DadoInvalidoException {
		validacao(funcionario);

		funcionario.setAtivo(true);
		funcionario.setPrimeiroAcesso(true);

		dao.cadastrar(funcionario);
	}

	/**
	 * Método responsável por realizar a atualização de um funcionario
	 * @param funcionario objeto funcionario
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 * @throws EntidadeNaoEncontradaException
	 */
	public void atualizar(Funcionario funcionario)
			throws SQLException, DadoInvalidoException, EntidadeNaoEncontradaException {
		validacao(funcionario);

		dao.atualizar(funcionario);
	}

	/**
	 * Método responsável por realizar a remoção de um funcionário
	 * @param funcionario objeto funcionário
	 * @throws SQLException
	 * @throws EntidadeNaoEncontradaException
	 * @throws DadoInvalidoException
	 */
	public void deletar(Funcionario funcionario)
			throws SQLException, EntidadeNaoEncontradaException, DadoInvalidoException {
		if (funcionario == null) {
			throw new DadoInvalidoException("Funcionário não encontrado");
		}
		if (funcionario.isAtivo()) {
			throw new DadoInvalidoException("Não pode deletar funcionário ativo");
		}

		dao.deletar(funcionario.getCodigo());
	}

	/**
	 * Método responsável por realizar a busca de um funcionário
	 * @param id código identificador do funcionário
	 * @return Funcionario objeto Funcionario
	 * @throws SQLException
	 */
	public Funcionario pesquisar(int id) throws SQLException {
		return dao.pesquisar(id);
	}

	/**
	 * Método responsável por realizar a busca de um funcionário por CPF/CNPJ e Senha
	 * @param funcionario objeto funcionário
	 * @return Funcionario retorna o funcionário registrado
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	public Funcionario pesquisar(Funcionario funcionario) throws SQLException, DadoInvalidoException {
		if (StringUtils.isNullOrEmpty(funcionario.getCpfCnpj())) {
			throw new DadoInvalidoException("Número do CPF/CNPJ não informado");
		}
		if (StringUtils.isSizeLessThan(funcionario.getCpfCnpj(), 11)
				|| StringUtils.isSizeMoreThan(funcionario.getCpfCnpj(), 14)
				|| StringUtils.isSizeBetween(funcionario.getCpfCnpj(), 11, 14)) {
			throw new DadoInvalidoException("CPF/CNPJ informado incorretamente");
		}
		if (StringUtils.isNullOrEmpty(funcionario.getSenha())) {
			throw new DadoInvalidoException("Senha não informada");
		}

		return dao.pesquisar(funcionario);
	}

	/**
	 * Método responsável por realizar a listagem geral de funcionários
	 * @return List<Funcionario> lista de funcionários
	 * @throws SQLException
	 */
	public List<Funcionario> listar() throws SQLException {
		return dao.listar();
	}

	/**
	 * Método responsável por realizar a listagem de funcionários por departamento
	 * @param funcionario objeto funcionário
	 * @return List<Funcionario> lista de funcionários
	 * @throws SQLException
	 */
	public List<Funcionario> listar(Funcionario funcionario) throws SQLException {
		return dao.listar(funcionario);
	}

}
