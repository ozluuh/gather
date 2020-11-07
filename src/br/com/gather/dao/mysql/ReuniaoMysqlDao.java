package br.com.gather.dao.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.gather.bean.Funcionario;
import br.com.gather.bean.Reuniao;
import br.com.gather.dao.ReuniaoDao;

public class ReuniaoMysqlDao implements ReuniaoDao {

	private Connection conexao;
	private ResultSet resultado;
	private PreparedStatement stmt;
	private FuncionarioMysqlDao funcionarioMysqlDao;

	public ReuniaoMysqlDao(Connection conexao) throws ClassNotFoundException, SQLException {
		this.conexao = conexao;
		funcionarioMysqlDao = new FuncionarioMysqlDao(conexao);
	}

	/**
	 * Método responsável por realizar a análise de criação do objeto Reuniao
	 * 
	 * @param rs ResultSet da consulta
	 * @return Reuniao objeto reuniao
	 * @throws SQLException
	 */
	private Reuniao parse(ResultSet rs) throws SQLException {
		Reuniao reuniao = null;
		Funcionario gestor = null;

		int codigo = rs.getInt("ID_REUNIAO");
		int codigoGestor = rs.getInt("ID_GESTOR");
		String titulo = rs.getString("DS_REUNIAO");
		String status = rs.getString("IN_STATUS");

		if (codigoGestor != 0) {
			gestor = funcionarioMysqlDao.pesquisar(codigoGestor);
		}

		reuniao = new Reuniao(codigo, gestor, status, titulo);

		return reuniao;
	}

	@Override
	public void cadastrar(Reuniao reuniao) throws SQLException {
		String sql = "INSERT INTO T_GTR_REUNIAO(ID_GESTOR,DS_REUNIAO,IN_STATUS,DT_CRIACAO)"
				+ " VALUES(?,?,?,CURRENT_TIMESTAMP)";

		stmt = conexao.prepareStatement(sql, new String[] { "ID_REUNIAO" });
		stmt.setInt(1, reuniao.getGestor().getCodigo());
		stmt.setString(2, reuniao.getTitulo());
		stmt.setString(3, reuniao.getStatus());

		stmt.executeUpdate();

		resultado = stmt.getGeneratedKeys();

		if (resultado.next()) {
			int codigo = resultado.getInt(1);
			reuniao.setCodigo(codigo);
		}

		resultado.close();
		stmt.close();
	}

	@Override
	public void atualizar(Reuniao reuniao) throws SQLException {
		String sql = "UPDATE T_GTR_REUNIAO SET "
				+ "ID_GESTOR = ?, DS_REUNIAO = ?, IN_STATUS = ?, DT_ATUALIZACAO = CURRENT_TIMESTAMP"
				+ " WHERE ID_REUNIAO = ?";

		stmt = conexao.prepareStatement(sql);
		stmt.setInt(1, reuniao.getGestor().getCodigo());
		stmt.setString(2, reuniao.getTitulo());
		stmt.setString(3, reuniao.getStatus());
		stmt.setInt(4, reuniao.getCodigo());

		stmt.executeUpdate();

		stmt.close();
	}

	@Override
	public void deletar(int id) throws SQLException {
		String sql = "UPDATE T_GTR_REUNIAO SET DT_EXCLUSAO = CURRENT_TIMESTAMP WHERE ID_REUNIAO = ?";

		stmt = conexao.prepareStatement(sql);
		stmt.setInt(1, id);

		stmt.executeUpdate();

		stmt.close();
	}

	@Override
	public Reuniao pesquisar(int id) throws SQLException {
		String sql = "SELECT * FROM T_GTR_REUNIAO WHERE ID_REUNIAO = ? AND DT_EXCLUSAO IS NULL";

		stmt = conexao.prepareStatement(sql);
		stmt.setInt(1, id);

		resultado = stmt.executeQuery();

		Reuniao reuniao = null;
		if (resultado.next()) {
			reuniao = parse(resultado);
		}

		resultado.close();
		stmt.close();

		return reuniao;
	}

	@Override
	public List<Reuniao> listar(int gestorId) throws SQLException {
		String sql = "SELECT * FROM T_GTR_REUNIAO WHERE ID_GESTOR = ? AND DT_EXCLUSAO IS NULL";
		List<Reuniao> listagemReuniao = new ArrayList<Reuniao>();
		stmt = conexao.prepareStatement(sql);
		stmt.setInt(1, gestorId);

		resultado = stmt.executeQuery();
		while (resultado.next()) {
			listagemReuniao.add(parse(resultado));
		}

		resultado.close();
		stmt.close();

		return listagemReuniao;
	}

	@Override
	public List<Reuniao> listar() throws SQLException {
		String sql = "SELECT * FROM T_GTR_REUNIAO WHERE DT_EXCLUSAO IS NULL";
		List<Reuniao> listagemReuniao = new ArrayList<Reuniao>();
		stmt = conexao.prepareStatement(sql);

		resultado = stmt.executeQuery();
		while (resultado.next()) {
			listagemReuniao.add(parse(resultado));
		}

		resultado.close();
		stmt.close();

		return listagemReuniao;
	}

	@Override
	public List<Reuniao> listarPendentes(int gestorId) throws SQLException {
		String sql = "SELECT * FROM T_GTR_REUNIAO WHERE ID_GESTOR = ? AND IN_STATUS = 'P' AND DT_EXCLUSAO IS NULL";
		List<Reuniao> listagem = new ArrayList<Reuniao>();
		stmt = conexao.prepareStatement(sql);
		stmt.setInt(1, gestorId);

		resultado = stmt.executeQuery();
		while (resultado.next()) {
			listagem.add(parse(resultado));
		}

		resultado.close();
		stmt.close();

		return listagem;
	}

}
