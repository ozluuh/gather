package br.com.gather.dao.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.gather.bean.Funcionario;
import br.com.gather.bean.Reuniao;
import br.com.gather.bean.Tarefa;
import br.com.gather.dao.TarefaDao;

public class TarefaMysqlDao implements TarefaDao {

	private Connection conexao;
	private PreparedStatement stmt;
	private ResultSet resultado;
	private ReuniaoMysqlDao reuniaoMysqlDao;
	private FuncionarioMysqlDao funcionarioMysqlDao;

	public TarefaMysqlDao(Connection conexao) throws ClassNotFoundException, SQLException {
		this.conexao = conexao;
		reuniaoMysqlDao = new ReuniaoMysqlDao(conexao);
		funcionarioMysqlDao = new FuncionarioMysqlDao(conexao);
	}

	/**
	 * Método responsável por realizar a análise de criação do objeto Tarefa
	 * 
	 * @param rs ResultSet da consulta
	 * @return Tarefa
	 * @throws SQLException
	 */
	private Tarefa parse(ResultSet rs) throws SQLException {
		Tarefa tarefa = null;
		Funcionario funcionario = null;
		Reuniao reuniao = null;

		int codigo = rs.getInt("ID_TAREFA");
		int codigoFuncionario = rs.getInt("ID_FUNCIONARIO");
		int codigoReuniao = rs.getInt("ID_REUNIAO");
		String titulo = rs.getString("DS_TAREFA");
		String observacao = rs.getString("OB_TAREFA");
		String status = rs.getString("IN_STATUS");

		if (codigoFuncionario != 0) {
			funcionario = funcionarioMysqlDao.pesquisar(codigoFuncionario);
		}

		if (codigoReuniao != 0) {
			reuniao = reuniaoMysqlDao.pesquisar(codigoReuniao);
		}

		tarefa = new Tarefa(codigo, titulo, status, funcionario, reuniao, observacao);

		return tarefa;
	}

	@Override
	public void cadastrar(Tarefa tarefa) throws SQLException {
		String sql = "INSERT INTO T_GTR_TAREFA(ID_REUNIAO, ID_FUNCIONARIO, DS_TAREFA, OB_TAREFA, IN_STATUS, DT_CRIACAO)"
				+ " VALUES(?,?,?,?,?,CURRENT_TIMESTAMP)";

		stmt = conexao.prepareStatement(sql, new String[] { "ID_TAREFA" });
		stmt.setInt(1, tarefa.getReuniao().getCodigo());
		stmt.setInt(2, tarefa.getFuncionario().getCodigo());
		stmt.setString(3, tarefa.getTitulo());
		stmt.setString(4, tarefa.getObservacao());
		stmt.setString(5, tarefa.getStatus());

		stmt.executeUpdate();

		resultado = stmt.getGeneratedKeys();

		if (resultado.next()) {
			int codigo = resultado.getInt(1);
			tarefa.setCodigo(codigo);
		}

		resultado.close();
		stmt.close();
	}

	@Override
	public void atualizar(Tarefa tarefa) throws SQLException {
		String sql = "UPDATE T_GTR_TAREFA SET " + "DS_TAREFA = ?, IN_STATUS = ?, DT_ATUALIZACAO = CURRENT_TIMESTAMP"
				+ " WHERE ID_TAREFA = ? AND DT_EXCLUSAO IS NULL";

		stmt = conexao.prepareStatement(sql);
		stmt.setString(1, tarefa.getTitulo());
		stmt.setString(2, tarefa.getStatus());
		stmt.setInt(3, tarefa.getCodigo());

		stmt.executeUpdate();

		stmt.close();
	}

	@Override
	public void deletar(int id) throws SQLException {
		String sql = "UPDATE T_GTR_TAREFA SET DT_EXCLUSAO = CURRENT_TIMESTAMP WHERE ID_TAREFA = ?";

		stmt = conexao.prepareStatement(sql);
		stmt.setInt(1, id);

		stmt.executeUpdate();

		stmt.close();
	}

	@Override
	public Tarefa pesquisar(int id) throws SQLException {
		String sql = "SELECT * FROM T_GTR_TAREFA WHERE ID_TAREFA = ? AND DT_EXCLUSAO IS NULL";

		stmt = conexao.prepareStatement(sql);
		stmt.setInt(1, id);

		resultado = stmt.executeQuery();

		Tarefa tarefa = null;
		if (resultado.next()) {
			tarefa = parse(resultado);
		}

		resultado.close();
		stmt.close();

		return tarefa;
	}

	@Override
	public List<Tarefa> listar(int funcionarioId) throws SQLException {
		String sql = "SELECT * FROM T_GTR_TAREFA WHERE ID_FUNCIONARIO = ? AND DT_EXCLUSAO IS NULL";
		List<Tarefa> listagem = new ArrayList<Tarefa>();

		stmt = conexao.prepareStatement(sql);
		stmt.setInt(1, funcionarioId);

		resultado = stmt.executeQuery();
		while (resultado.next()) {
			listagem.add(parse(resultado));
		}

		resultado.close();
		stmt.close();

		return listagem;
	}

	@Override
	public List<Tarefa> listarPorReuniao(int reuniaoId) throws SQLException {
		String sql = "SELECT * FROM T_GTR_TAREFA WHERE ID_REUNIAO = ? AND DT_EXCLUSAO IS NULL";
		List<Tarefa> listagem = new ArrayList<Tarefa>();

		stmt = conexao.prepareStatement(sql);
		stmt.setInt(1, reuniaoId);

		resultado = stmt.executeQuery();
		while (resultado.next()) {
			listagem.add(parse(resultado));
		}

		resultado.close();
		stmt.close();

		return listagem;
	}

	@Override
	public List<Tarefa> listarPendentes(int funcionarioId) throws SQLException {
		String sql = "SELECT * FROM T_GTR_TAREFA WHERE ID_FUNCIONARIO = ? AND IN_STATUS = 'P' AND DT_EXCLUSAO IS NULL";
		List<Tarefa> listagem = new ArrayList<Tarefa>();

		stmt = conexao.prepareStatement(sql);
		stmt.setInt(1, funcionarioId);

		resultado = stmt.executeQuery();
		while (resultado.next()) {
			listagem.add(parse(resultado));
		}

		resultado.close();
		stmt.close();

		return listagem;
	}

}
