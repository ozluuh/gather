package br.com.gather.dao;

import java.sql.SQLException;
import java.util.List;

import br.com.gather.bean.Funcionario;
import br.com.gather.exception.DadoInvalidoException;
import br.com.gather.exception.EntidadeNaoEncontradaException;

public interface FuncionarioDao {

	/**
	 * Método que realiza o cadastro do usuário
	 * @param funcionario
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	public void cadastrar(Funcionario funcionario) throws SQLException, DadoInvalidoException;

	/**
	 * Método responsável por atualizar as informações do usuário
	 * @param funcionario Recebe o objeto Funcionario
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 * @throws EntidadeNaoEncontradaException
	 */
	public void atualizar(Funcionario funcionario) throws SQLException, DadoInvalidoException, EntidadeNaoEncontradaException;

	/**
	 * Método que faz a deleção lógica do usuário informado
	 * @param id Recebe o usuário a ser excluído
	 * @throws SQLException
	 * @throws EntidadeNaoEncontradaException 
	 */
	public void deletar(int id) throws SQLException, EntidadeNaoEncontradaException;

	/**
	 * Método que pesquisa 1 usuário na base de dados
	 * @param id Recebe o código a ser pesquisado
	 * @return Funcionario retorna o objeto funcionário
	 * @throws SQLException
	 */
	public Funcionario pesquisar(int id) throws SQLException;

	/**
	 * Método que realiza a pesquisa de 1 usuário pelo objeto Funcionario. Implementação usada no acesso do usuário a aplicação.
	 * @param funcionario Recebe o objeto funcionário, necessário preenchido CPFCNPJ e SENHA
	 * @return Funcionario Retorna o próprio objeto passado, alimentando os dados faltantes
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	public Funcionario pesquisar(Funcionario funcionario) throws SQLException, DadoInvalidoException;

	/**
	 * Faz a listagem de todos os usuários da base de dados
	 * @return List<Funcionario> Lista de Funcionarios
	 * @throws SQLException
	 */
	public List<Funcionario> listar() throws SQLException;
	
	/**
	 * Método que faz a listagem dos usuários de acordo com o Departamento
	 * @param funcionario Recebe um objeto Funcionario
	 * @return List<Funcionario> Lista de Funcionarios específicos do Departamento
	 * @throws SQLException
	 */
	public List<Funcionario> listar(Funcionario funcionario) throws SQLException;
}
