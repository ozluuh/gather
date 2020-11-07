package br.com.gather.factory;

import java.sql.Connection;
import java.sql.SQLException;

import br.com.gather.dao.DepartamentoDao;
import br.com.gather.dao.FuncionarioDao;
import br.com.gather.dao.ReuniaoDao;
import br.com.gather.dao.TarefaDao;

public abstract class AbstractDaoFactory {

	public static final int ORACLE = 1;
	public static final int MYSQL = 2;

	private static AbstractDaoFactory oracleFactory;
	private static AbstractDaoFactory mysqlFactory;

	public static AbstractDaoFactory getDaoFactory(int fabrica) {
		switch (fabrica) {
		case 1:
			if (oracleFactory == null) {
				oracleFactory = new OracleDaoFactory();
			}
			return oracleFactory;
		case 2:
			if (mysqlFactory == null) {

				mysqlFactory = new MysqlDaoFactory();
			}
			return mysqlFactory;
		default:
			return null;
		}
	}

	public abstract DepartamentoDao getDepartamentoDao(Connection conexao) throws ClassNotFoundException, SQLException;

	public abstract FuncionarioDao getFuncionarioDao(Connection conexao) throws ClassNotFoundException, SQLException;

	public abstract ReuniaoDao getReuniaoDao(Connection conexao) throws ClassNotFoundException, SQLException;

	public abstract TarefaDao getTarefaDao(Connection conexao) throws ClassNotFoundException, SQLException;

}
