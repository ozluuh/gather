package br.com.gather.bo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import br.com.gather.bean.Reuniao;
import br.com.gather.dao.ReuniaoDao;
import br.com.gather.exception.DadoInvalidoException;
import br.com.gather.factory.AbstractDaoFactory;
import br.com.gather.util.StringUtils;

public class ReuniaoBo {

	private ReuniaoDao dao;
	private Connection conexao;

	public ReuniaoBo(Connection conexao) throws ClassNotFoundException, SQLException {
		dao = AbstractDaoFactory.getDaoFactory(AbstractDaoFactory.MYSQL).getReuniaoDao(conexao);
		this.conexao = conexao;
	}

	/**
	 * Método responsável por realizar a validação dos dados recebidos
	 * 
	 * @param reuniao objeto reunião
	 * @throws DadoInvalidoException
	 */
	private void validacao(Reuniao reuniao) throws DadoInvalidoException {
		if (reuniao.getGestor().getCodigo() == 0) {
			throw new DadoInvalidoException("Gestor não informado");
		}
		if (StringUtils.isNullOrEmpty(reuniao.getTitulo())) {
			throw new DadoInvalidoException("Título da reunião não informado");
		}
		if (StringUtils.isSizeMoreThan(reuniao.getTitulo(), 120)) {
			throw new DadoInvalidoException("Título não pode ultrapassar 120 caracteres");
		}
	}

	/**
	 * Método responsável por realizar o cadastro de uma reunião
	 * 
	 * @param reuniao objeto reunião
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	public void cadastrar(Reuniao reuniao) throws SQLException, DadoInvalidoException {
		validacao(reuniao);

		reuniao.setStatus("P");
		dao.cadastrar(reuniao);
	}

	/**
	 * Método responsável por realizar a atualização de uma reunião
	 * 
	 * @param reuniao objeto reunião
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	public void atualizar(Reuniao reuniao) throws SQLException, DadoInvalidoException {
		validacao(reuniao);

		dao.atualizar(reuniao);
	}

	/**
	 * Método responsável por realizar a remoção de uma reunião
	 * 
	 * @param id código identificador da reunião
	 * @throws SQLException
	 */
	public void deletar(int id) throws SQLException {
		dao.deletar(id);
	}

	/**
	 * Método responsável por realizar a busca de uma reunião
	 * 
	 * @param id código identificador da reunião
	 * @return Reuniao objeto reunião
	 * @throws SQLException
	 */
	public Reuniao pesquisar(int id) throws SQLException {
		return dao.pesquisar(id);
	}

	/**
	 * Método responsável por realizar a listagem de reuniões por gestor
	 * 
	 * @param codigo código identificador do gestor
	 * @return List<Reuniao> lista de reuniões
	 * @throws SQLException
	 */
	public List<Reuniao> listar(int codigo) throws SQLException {
		return dao.listar(codigo);
	}

	/**
	 * Método responsável por realizar a listagem geral
	 * 
	 * @return List<Reuniao> lista de reuniões
	 * @throws SQLException
	 */
	public List<Reuniao> listar() throws SQLException {
		return dao.listar();
	}

	/**
	 * Método responsável por realizar a listagem de reuniões pendentes por gestor
	 * 
	 * @param gestorId código identificador do gestor
	 * @return List<Reuniao> lista de reuniões
	 * @throws SQLException
	 */
	public List<Reuniao> listarPendentes(int gestorId) throws SQLException {
		return dao.listarPendentes(gestorId);
	}

}
