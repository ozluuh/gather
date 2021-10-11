package br.com.gather.bo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import br.com.gather.bean.Departamento;
import br.com.gather.dao.DepartamentoDao;
import br.com.gather.exception.DadoInvalidoException;
import br.com.gather.exception.EntidadeNaoEncontradaException;
import br.com.gather.factory.AbstractDaoFactory;
import br.com.gather.util.StringUtils;

public class DepartamentoBo {

	private DepartamentoDao dao;
	private Connection conexao;

	public DepartamentoBo(Connection conexao) throws ClassNotFoundException, SQLException {
		dao = AbstractDaoFactory.getDaoFactory(AbstractDaoFactory.ORACLE).getDepartamentoDao(conexao);
		this.conexao = conexao;
	}

	/**
	 * Método responsável por realizar a validação dos dados de um departamento
	 * 
	 * @param departamento objeto departamento
	 * @throws DadoInvalidoException
	 */
	private void validacao(Departamento departamento) throws DadoInvalidoException {
		if (StringUtils.isNullOrEmpty(departamento.getNome())) {
			throw new DadoInvalidoException("Nome do departamento não informado");
		}
		if (StringUtils.isSizeMoreThan(departamento.getNome(), 30)) {
			throw new DadoInvalidoException("Nome não pode exceder 30 caracteres");
		}
	}

	/**
	 * Método responsável por realizar o registro de um departamento
	 * 
	 * @param departamento objeto departamento
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	public void cadastrar(Departamento departamento) throws SQLException, DadoInvalidoException {
		validacao(departamento);

		dao.cadastrar(departamento);
	}

	/**
	 * Método responsável por realizar a atualização dos dados de um departamento
	 * 
	 * @param departamento objeto departamento
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 * @throws EntidadeNaoEncontradaException
	 */
	public void atualizar(Departamento departamento)
			throws SQLException, DadoInvalidoException, EntidadeNaoEncontradaException {
		validacao(departamento);

		if (departamento.getCodigo() == 0) {
			throw new DadoInvalidoException("Departamento informado incorretamente");
		}

		dao.atualizar(departamento);
	}

	/**
	 * Método responsável por realizar a busca de um departamento
	 * 
	 * @param codigo código identificador do departamento
	 * @return Departamento objeto departamento
	 * @throws SQLException
	 */
	public Departamento pesquisar(int codigo) throws SQLException {
		return dao.pesquisar(codigo);
	}

	/**
	 * Método responsável por realizar a remoção de um departamento
	 * 
	 * @param codigo código identificador de um departamento
	 * @throws SQLException
	 */
	public void deletar(int codigo) throws SQLException {
		dao.deletar(codigo);
	}

	/**
	 * Método responsável por realizar a listagem geral dos departamentos
	 * 
	 * @return List<Departamento> lista de departamentos
	 * @throws SQLException
	 */
	public List<Departamento> listar() throws SQLException {
		return dao.listar();
	}

}
