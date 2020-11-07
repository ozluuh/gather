package br.com.gather.factory;

import java.sql.Connection;
import java.sql.SQLException;

import br.com.gather.dao.DepartamentoDao;
import br.com.gather.dao.FuncionarioDao;
import br.com.gather.dao.ReuniaoDao;
import br.com.gather.dao.TarefaDao;
import br.com.gather.dao.oracle.DepartamentoOracleDao;
import br.com.gather.dao.oracle.FuncionarioOracleDao;
import br.com.gather.dao.oracle.ReuniaoOracleDao;
import br.com.gather.dao.oracle.TarefaOracleDao;

public class OracleDaoFactory extends AbstractDaoFactory {

	@Override
	public DepartamentoDao getDepartamentoDao(Connection conexao) throws ClassNotFoundException, SQLException {
		return new DepartamentoOracleDao(conexao);
	}

	@Override
	public FuncionarioDao getFuncionarioDao(Connection conexao) throws ClassNotFoundException, SQLException {
		return new FuncionarioOracleDao(conexao);
	}

	@Override
	public ReuniaoDao getReuniaoDao(Connection conexao) throws ClassNotFoundException, SQLException {
		return new ReuniaoOracleDao(conexao);
	}

	@Override
	public TarefaDao getTarefaDao(Connection conexao) throws ClassNotFoundException, SQLException {
		return new TarefaOracleDao(conexao);
	}

}
