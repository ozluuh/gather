package br.com.gather.factory;

import java.sql.Connection;
import java.sql.SQLException;

import br.com.gather.dao.DepartamentoDao;
import br.com.gather.dao.FuncionarioDao;
import br.com.gather.dao.ReuniaoDao;
import br.com.gather.dao.TarefaDao;
import br.com.gather.dao.mysql.DepartamentoMysqlDao;
import br.com.gather.dao.mysql.FuncionarioMysqlDao;
import br.com.gather.dao.mysql.ReuniaoMysqlDao;
import br.com.gather.dao.mysql.TarefaMysqlDao;

public class MysqlDaoFactory extends AbstractDaoFactory {

	@Override
	public DepartamentoDao getDepartamentoDao(Connection conexao) throws ClassNotFoundException, SQLException {
		return new DepartamentoMysqlDao(conexao);
	}

	@Override
	public FuncionarioDao getFuncionarioDao(Connection conexao) throws ClassNotFoundException, SQLException {
		return new FuncionarioMysqlDao(conexao);
	}

	@Override
	public ReuniaoDao getReuniaoDao(Connection conexao) throws ClassNotFoundException, SQLException {
		return new ReuniaoMysqlDao(conexao);
	}

	@Override
	public TarefaDao getTarefaDao(Connection conexao) throws ClassNotFoundException, SQLException {
		return new TarefaMysqlDao(conexao);
	}

}
