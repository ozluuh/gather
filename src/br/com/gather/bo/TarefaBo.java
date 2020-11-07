package br.com.gather.bo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import br.com.gather.bean.Tarefa;
import br.com.gather.dao.TarefaDao;
import br.com.gather.exception.DadoInvalidoException;
import br.com.gather.factory.AbstractDaoFactory;
import br.com.gather.util.StringUtils;

public class TarefaBo {

	private TarefaDao dao;
	private ReuniaoBo reuniaoBo;
	private Connection conexao;

	public TarefaBo(Connection conexao) throws ClassNotFoundException, SQLException {
		this.conexao = conexao;
		dao = AbstractDaoFactory.getDaoFactory(AbstractDaoFactory.MYSQL).getTarefaDao(conexao);
		reuniaoBo = new ReuniaoBo(conexao);
	}

	/**
	 * Método desponsável por realizar a validação do objeto Tarefa
	 * 
	 * @param tarefa objeto tarefa
	 * @throws DadoInvalidoException
	 */
	private void validacao(Tarefa tarefa) throws DadoInvalidoException {
		if (StringUtils.isNullOrEmpty(tarefa.getTitulo())) {
			throw new DadoInvalidoException("Título é obrigatório");
		}
		if (StringUtils.isSizeMoreThan(tarefa.getTitulo(), 120)) {
			throw new DadoInvalidoException("Título não pode ser superior a 120 caracteres");
		}
		if (tarefa.getObservacao() != null && StringUtils.isSizeMoreThan(tarefa.getObservacao(), 400)) {
			throw new DadoInvalidoException("Descrição da tarefa não pode ser superior a 400 caracteres");
		}
		if (tarefa.getFuncionario().getCodigo() == 0) {
			throw new DadoInvalidoException("Funcionário não informado");
		}
		if (tarefa.getReuniao().getCodigo() == 0) {
			throw new DadoInvalidoException("Tarefa precisa pertencer a uma Reunião");
		}
	}

	/**
	 * Método responsável por realizar a atualização de um objeto tarefa
	 * 
	 * @param tarefa objeto tarefa
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	public void atualizar(Tarefa tarefa) throws SQLException, DadoInvalidoException {
		validacao(tarefa);

		dao.atualizar(tarefa);
	}

	/**
	 * Método responsável por realizar a deleção de uma tarefa
	 * 
	 * @param id código identificador da tarefa
	 * @throws SQLException
	 */
	public void deletar(int id) throws SQLException {
		dao.deletar(id);
	}

	/**
	 * Método que realiza a busca de uma tarefa
	 * 
	 * @param id código identificador da tarefa
	 * @return Tarefa objeto tarefa
	 * @throws Exception
	 */
	public Tarefa pesquisar(int id) throws Exception {
		return dao.pesquisar(id);
	}

	/**
	 * Método responsável por realizar o cadastro das tarefas. O mesmo realiza o
	 * processo de cadastrar a reunião, caso ela não exista
	 * 
	 * @param tarefas lista de tarefas
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	public void cadastrar(List<Tarefa> tarefas) throws SQLException, DadoInvalidoException {
		boolean cadastraReuniao = true;
		conexao.setAutoCommit(false);

		for (Tarefa tarefa : tarefas) {
			if (cadastraReuniao) {
				reuniaoBo.cadastrar(tarefa.getReuniao());

				cadastraReuniao = tarefa.getReuniao().getCodigo() != 0 ? false : true;
			}

			validacao(tarefa);

			tarefa.setStatus("P");
			dao.cadastrar(tarefa);
		}

		try {
			conexao.commit();
		} catch (SQLException e) {
			conexao.rollback();
		} finally {
			conexao.setAutoCommit(true);
		}

	}

	/**
	 * Método responsável por realizar a listagem de tarefas por funcionário
	 * 
	 * @param funcionarioId código identificador do funcionário
	 * @return List<Tarefa> lista de tarefas
	 * @throws SQLException
	 */
	public List<Tarefa> listar(int funcionarioId) throws SQLException {
		return dao.listar(funcionarioId);
	}

	/**
	 * Método responsável por realizar a listagem de tarefas por reunião
	 * 
	 * @param reuniaoId código identificador da reunião
	 * @return List<Tarefa> lista de tarefas
	 * @throws SQLException
	 */
	public List<Tarefa> listarPorReuniao(int reuniaoId) throws SQLException {
		return dao.listarPorReuniao(reuniaoId);
	}

	/**
	 * Método responsável por realizar a listagem de tarefas pendentes por
	 * funcionário
	 * 
	 * @param funcionarioId código identificador do funcionário
	 * @return List<Tarefa> lista de tarefas
	 * @throws SQLException
	 */
	public List<Tarefa> listarPendentes(int funcionarioId) throws SQLException {
		return dao.listarPendentes(funcionarioId);
	}

}
