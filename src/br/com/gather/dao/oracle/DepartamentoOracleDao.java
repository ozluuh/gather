package br.com.gather.dao.oracle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.gather.bean.Departamento;
import br.com.gather.dao.DepartamentoDao;
import br.com.gather.exception.EntidadeNaoEncontradaException;

public class DepartamentoOracleDao implements DepartamentoDao {

	private Connection conexao;
	private ResultSet resultado;
	private PreparedStatement stmt;

	public DepartamentoOracleDao(Connection conexao) throws ClassNotFoundException, SQLException {
		this.conexao = conexao;
	}

	/**
	 * Método responsável por realizar a análise de criação do objeto Departamento
	 * 
	 * @param rs ResultSet da consulta
	 * @return Departamento objeto departamento
	 * @throws SQLException
	 */
	private Departamento parse(ResultSet rs) throws SQLException {
		Departamento departamento = null;
		int codigo = rs.getInt("ID_DEPARTAMENTO");
		String nome = rs.getString("NM_DEPARTAMENTO");

		departamento = new Departamento(codigo, nome);

		return departamento;
	}

	@Override
	public void cadastrar(Departamento departamento) throws SQLException {
		String sql = "INSERT INTO T_GTR_DEPARTAMENTO(ID_DEPARTAMENTO, NM_DEPARTAMENTO, DT_CRIACAO)"
				+ " VALUES(SQ_GTR_DEPARTAMENTO.NEXTVAL,?,SYSDATE)";

		stmt = conexao.prepareStatement(sql, new String[] { "ID_DEPARTAMENTO" });
		stmt.setString(1, departamento.getNome());

		stmt.executeUpdate();

		resultado = stmt.getGeneratedKeys();

		if (resultado.next()) {
			int codigo = resultado.getInt(1);
			departamento.setCodigo(codigo);
		}

		stmt.close();

	}

	@Override
	public void atualizar(Departamento departamento) throws SQLException, EntidadeNaoEncontradaException {
		String sql = "UPDATE T_GTR_DEPARTAMENTO SET " + "NM_DEPARTAMENTO = ?, DT_ATUALIZACAO = SYSDATE"
				+ " WHERE ID_DEPARTAMENTO = ? AND DT_EXCLUSAO IS NULL";

		stmt = conexao.prepareStatement(sql);
		stmt.setString(1, departamento.getNome());
		stmt.setInt(2, departamento.getCodigo());

		int transaction = stmt.executeUpdate();

		stmt.close();

		if (transaction == 0) {
			throw new EntidadeNaoEncontradaException("Departamento não encontrado");
		}
	}

	@Override
	public void deletar(int codigo) throws SQLException {
		String sql = "UPDATE T_GTR_DEPARTAMENTO SET DT_EXCLUSAO = SYSDATE WHERE ID_DEPARTAMENTO = ?";

		stmt = conexao.prepareStatement(sql);
		stmt.setInt(1, codigo);

		stmt.executeUpdate();

		stmt.close();
	}

	@Override
	public Departamento pesquisar(int codigo) throws SQLException {
		String sql = "SELECT * FROM T_GTR_DEPARTAMENTO WHERE ID_DEPARTAMENTO = ? AND DT_EXCLUSAO IS NULL";

		stmt = conexao.prepareStatement(sql);
		stmt.setInt(1, codigo);

		resultado = stmt.executeQuery();

		Departamento departamento = null;
		if (resultado.next()) {
			departamento = parse(resultado);
		}

		resultado.close();
		stmt.close();

		return departamento;
	}

	@Override
	public List<Departamento> listar() throws SQLException {
		String sql = "SELECT * FROM T_GTR_DEPARTAMENTO WHERE DT_EXCLUSAO IS NULL";
		List<Departamento> listagem = new ArrayList<Departamento>();

		stmt = conexao.prepareStatement(sql);

		resultado = stmt.executeQuery();

		while (resultado.next()) {
			listagem.add(parse(resultado));
		}

		resultado.close();
		stmt.close();

		return listagem;
	}
}
