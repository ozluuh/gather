package br.com.gather.dao;

import java.sql.SQLException;
import java.util.List;

import br.com.gather.bean.Departamento;
import br.com.gather.exception.DadoInvalidoException;
import br.com.gather.exception.EntidadeNaoEncontradaException;

public interface DepartamentoDao {
	/**
	 * Método responsável por realizar o cadastro de um departamento
	 * 
	 * @param departamento objeto departamento
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	public void cadastrar(Departamento departamento) throws SQLException, DadoInvalidoException;

	/**
	 * Método responsável por atualizar os dados de uma reunião
	 * 
	 * @param departamento objeto departamento
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 * @throws EntidadeNaoEncontradaException
	 */
	public void atualizar(Departamento departamento)
			throws SQLException, DadoInvalidoException, EntidadeNaoEncontradaException;

	/**
	 * Método responsável por realizar a busca de um departamento
	 * 
	 * @param codigo código identificador do departamento
	 * @return Departamento objeto departamento
	 * @throws SQLException
	 */
	public Departamento pesquisar(int codigo) throws SQLException;

	/**
	 * Método responsável por realizar a deleção lógica
	 * 
	 * @param codigo código identificador do departamento
	 * @throws SQLException
	 */
	public void deletar(int codigo) throws SQLException;

	/**
	 * Método responsável por realizar a listagem de departamentos
	 * 
	 * @return List<Departamento> lista de departamentos
	 * @throws SQLException
	 */
	public List<Departamento> listar() throws SQLException;

}
