package br.com.gather.dao.oracle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.gather.bean.Acesso;
import br.com.gather.bean.Departamento;
import br.com.gather.bean.Funcionario;
import br.com.gather.dao.FuncionarioDao;
import br.com.gather.exception.EntidadeNaoEncontradaException;

public class FuncionarioOracleDao implements FuncionarioDao {

	private Connection conexao;
	private DepartamentoOracleDao departamentoDao;
	private ResultSet resultado;
	private PreparedStatement stmt;

	public FuncionarioOracleDao(Connection conexao) throws ClassNotFoundException, SQLException {
		this.conexao = conexao;
		this.departamentoDao = new DepartamentoOracleDao(conexao);
	}

	/**
	 * Método responsável por realizar a análise de criação do objeto Funcionario
	 * 
	 * @param rs ResultSet da consulta
	 * @return Funcionario objeto funcionario
	 * @throws SQLException
	 */
	private Funcionario parse(ResultSet rs) throws SQLException {
		Funcionario funcionario;
		Acesso acesso = null;
		Departamento departamento = null;

		int codigoFuncionario = rs.getInt("ID_FUNCIONARIO");
		int codigoDepartamento = rs.getInt("ID_DEPARTAMENTO");
		String tipoAcesso = rs.getString("ID_ACESSO");
		String cpfCnpj = rs.getString("NR_CPF_CNPJ");
		String nome = rs.getString("NM_FUNCIONARIO");
		String email = rs.getString("DS_EMAIL");
		String senha = rs.getString("DS_SENHA");
		boolean ativo = rs.getInt("IN_ATIVO") == 1;
		boolean primeiroAcesso = rs.getInt("ST_PRIMEIRO_ACESSO") == 1;

		if (!tipoAcesso.isEmpty() || tipoAcesso != null) {
			acesso = Acesso.valueOf(tipoAcesso);
		}
		if (codigoDepartamento != 0) {
			departamento = departamentoDao.pesquisar(codigoDepartamento);
		}

		funcionario = new Funcionario(codigoFuncionario, cpfCnpj, nome, email, senha, departamento, acesso, ativo,
				primeiroAcesso);

		return funcionario;
	}

	@Override
	public void cadastrar(Funcionario funcionario) throws SQLException {
		String sql = "INSERT INTO T_GTR_FUNCIONARIO(ID_FUNCIONARIO,ID_ACESSO,ID_DEPARTAMENTO,NR_CPF_CNPJ,NM_FUNCIONARIO,DS_EMAIL,DS_SENHA,IN_ATIVO,ST_PRIMEIRO_ACESSO,DT_CRIACAO)"
				+ " VALUES(SQ_GTR_FUNCIONARIO.NEXTVAL,?,?,?,?,?,?,?,?,SYSDATE)";

		stmt = conexao.prepareStatement(sql, new String[] { "ID_FUNCIONARIO" });
		stmt.setString(1, funcionario.getAcesso().toString());
		stmt.setInt(2, funcionario.getDepartamento().getCodigo());
		stmt.setString(3, funcionario.getCpfCnpj());
		stmt.setString(4, funcionario.getNome());
		stmt.setString(5, funcionario.getEmail());
		stmt.setString(6, funcionario.getSenha());
		stmt.setInt(7, funcionario.isAtivo() ? 1 : 0);
		stmt.setInt(8, funcionario.isPrimeiroAcesso() ? 1 : 0);

		stmt.executeUpdate();

		resultado = stmt.getGeneratedKeys();

		if (resultado.next()) {
			int codigo = resultado.getInt(1);
			funcionario.setCodigo(codigo);
		}

		stmt.close();
	}

	@Override
	public void atualizar(Funcionario funcionario) throws SQLException, EntidadeNaoEncontradaException {
		String sql = "UPDATE T_GTR_FUNCIONARIO SET "
				+ "ID_DEPARTAMENTO = ?, ID_ACESSO = ?, NM_FUNCIONARIO = ?, DS_EMAIL = ?, DS_SENHA = ?, IN_ATIVO = ?, "
				+ "ST_PRIMEIRO_ACESSO = ?, DT_ATUALIZACAO = SYSDATE "
				+ "WHERE ID_FUNCIONARIO = ? AND DT_EXCLUSAO IS NULL";

		stmt = conexao.prepareStatement(sql);
		stmt.setInt(1, funcionario.getDepartamento().getCodigo());
		stmt.setString(2, funcionario.getAcesso().toString());
		stmt.setString(3, funcionario.getNome());
		stmt.setString(4, funcionario.getEmail());
		stmt.setString(5, funcionario.getSenha());
		stmt.setInt(6, funcionario.isAtivo() ? 1 : 0);
		stmt.setInt(7, funcionario.isPrimeiroAcesso() ? 1 : 0);
		stmt.setInt(8, funcionario.getCodigo());

		int transacao = stmt.executeUpdate();

		stmt.close();

		if (transacao == 0) {
			throw new EntidadeNaoEncontradaException("Funcionário não encontrado");
		}
	}

	@Override
	public void deletar(int id) throws SQLException, EntidadeNaoEncontradaException {
		String sql = "UPDATE T_GTR_FUNCIONARIO SET DT_EXCLUSAO = SYSDATE WHERE ID_FUNCIONARIO = ?";

		stmt = conexao.prepareStatement(sql);
		stmt.setInt(1, id);

		int transacao = stmt.executeUpdate();

		stmt.close();

		if (transacao == 0) {
			throw new EntidadeNaoEncontradaException("Funcionário não encontrado");
		}
	}

	@Override
	public Funcionario pesquisar(int id) throws SQLException {
		String sql = "SELECT * FROM T_GTR_FUNCIONARIO WHERE ID_FUNCIONARIO = ? AND DT_EXCLUSAO IS NULL";
		Funcionario funcionario = null;

		stmt = conexao.prepareStatement(sql);
		stmt.setInt(1, id);

		resultado = stmt.executeQuery();

		if (resultado.next()) {
			funcionario = parse(resultado);
		}

		resultado.close();
		stmt.close();

		return funcionario;
	}

	@Override
	public Funcionario pesquisar(Funcionario funcionario) throws SQLException {
		String sql = "SELECT * FROM T_GTR_FUNCIONARIO WHERE NR_CPF_CNPJ = ? AND DS_SENHA = ? AND DT_EXCLUSAO IS NULL AND IN_ATIVO = 1";
		Funcionario usuario = null;

		stmt = conexao.prepareStatement(sql);
		stmt.setString(1, funcionario.getCpfCnpj());
		stmt.setString(2, funcionario.getSenha());

		resultado = stmt.executeQuery();

		if (resultado.next()) {
			usuario = parse(resultado);
		}

		resultado.close();
		stmt.close();

		return usuario;
	}

	@Override
	public List<Funcionario> listar() throws SQLException {
		String sql = "SELECT * FROM T_GTR_FUNCIONARIO WHERE DT_EXCLUSAO IS NULL";

		stmt = conexao.prepareStatement(sql);
		resultado = stmt.executeQuery();

		List<Funcionario> listagem = new ArrayList<Funcionario>();
		while (resultado.next()) {
			Funcionario funcionario = null;
			funcionario = parse(resultado);

			listagem.add(funcionario);
		}

		resultado.close();
		stmt.close();

		return listagem;
	}

	@Override
	public List<Funcionario> listar(Funcionario funcionario) throws SQLException {
		String sql = "SELECT * FROM T_GTR_FUNCIONARIO WHERE ID_DEPARTAMENTO = ? AND DT_EXCLUSAO IS NULL";
		List<Funcionario> listagem = new ArrayList<Funcionario>();

		stmt = conexao.prepareStatement(sql);
		stmt.setInt(1, funcionario.getDepartamento().getCodigo());
		resultado = stmt.executeQuery();

		while (resultado.next()) {
			listagem.add(parse(resultado));
		}

		resultado.close();
		stmt.close();

		return listagem;
	}

}
