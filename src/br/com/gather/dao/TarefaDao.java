package br.com.gather.dao;

import java.sql.SQLException;
import java.util.List;

import br.com.gather.bean.Tarefa;
import br.com.gather.exception.DadoInvalidoException;

public interface TarefaDao {

	/**
	 * Método responsável por realizar o cadastro das tarefas
	 * 
	 * @param tarefa Objeto tarefa
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	public void cadastrar(Tarefa tarefa) throws SQLException, DadoInvalidoException;

	/**
	 * Método responsável por atualizar os dados de uma determinada tarefa
	 * 
	 * @param tarefa Objeto tarefa
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	public void atualizar(Tarefa tarefa) throws SQLException, DadoInvalidoException;

	/**
	 * Método responsável por realizar a deleção lógica de uma determinada tarefa
	 * 
	 * @param id código identificador da tarefa
	 * @throws SQLException
	 */
	public void deletar(int id) throws SQLException;

	/**
	 * Método que realiza a pesquisa de uma tarefa
	 * 
	 * @param id código identificador da tarefa
	 * @return Tarefa
	 * @throws Exception
	 */
	public Tarefa pesquisar(int id) throws Exception;

	/**
	 * Método responsável por realizar a listagem de tarefas por reunião
	 * 
	 * @param reuniaoId código identificador da reunião
	 * @return List<Tarefa> lista de tarefas
	 * @throws Exception
	 */
	public List<Tarefa> listarPorReuniao(int reuniaoId) throws SQLException;

	/**
	 * Método responsável por realizar a listagem de tarefas
	 * 
	 * @param funcionarioId
	 * @return List<Tarefa> lista de tarefas
	 * @throws SQLException
	 */
	public List<Tarefa> listar(int funcionarioId) throws SQLException;

	/**
	 * Método responsável por realizar a listagem de tarefas pendentes
	 * 
	 * @param funcionarioId código identificador do funcionário
	 * @return List<Tarefa> lista de tarefas
	 * @throws SQLException
	 */
	public List<Tarefa> listarPendentes(int funcionarioId) throws SQLException;
}
