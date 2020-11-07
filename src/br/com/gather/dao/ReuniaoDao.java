package br.com.gather.dao;

import java.sql.SQLException;
import java.util.List;

import br.com.gather.bean.Reuniao;
import br.com.gather.exception.DadoInvalidoException;

public interface ReuniaoDao {
	/**
	 * Método responsável por realizar o cadastro da reuniao
	 * 
	 * @param reuniao objeto reuniao
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	public void cadastrar(Reuniao reuniao) throws SQLException, DadoInvalidoException;

	/**
	 * Método responsável por atualizar os dados de uma reunião
	 * 
	 * @param reuniao objeto reuniao
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	public void atualizar(Reuniao reuniao) throws SQLException, DadoInvalidoException;

	/**
	 * Método responsável por realizar a deleção lógica
	 * 
	 * @param id código identificador da reunião
	 * @throws SQLException
	 */
	public void deletar(int id) throws SQLException;

	/**
	 * Método responsável por realizar a busca de uma reunião
	 * 
	 * @param id código identificador da reunião
	 * @return Reuniao objeto reuniao
	 * @throws SQLException
	 */
	public Reuniao pesquisar(int id) throws SQLException;

	/**
	 * Método responsável por realizar a listagem de reuniões por gestor
	 * 
	 * @param id código identificador do gestor
	 * @return List<Reuniao> lista de reuniões
	 * @throws SQLException
	 */
	public List<Reuniao> listar(int id) throws SQLException;

	/**
	 * Método responsável por realizar a listagem das reuniões
	 * 
	 * @return List<Reuniao> lista de reuniões
	 * @throws SQLException
	 */
	public List<Reuniao> listar() throws SQLException;

	/**
	 * Método responsável por realizar a listagem de reuniões pendentes
	 * 
	 * @param gestorId código identificador do gestor
	 * @return List<Reuniao> lista de reuniões
	 * @throws SQLException
	 */
	public List<Reuniao> listarPendentes(int gestorId) throws SQLException;
}
