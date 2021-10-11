package br.com.gather.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

	private static ConnectionManager instancia;

	private ConnectionManager() {
	}

	public static ConnectionManager getInstance() {
		if (instancia == null) {
			instancia = new ConnectionManager();
		}

		return instancia;
	}

	public Connection getConnection() throws ClassNotFoundException, SQLException {

		Class.forName("oracle.jdbc.driver.OracleDriver");
		String dbUrl = "jdbc:oracle:thin:@oracle.fiap.com.br:1521:orcl";
		String dbUsr = "rm85398";
		String dbPwd = "150496";

		Connection connection = DriverManager.getConnection(dbUrl, dbUsr, dbPwd);
		
		return connection;
	}

}
